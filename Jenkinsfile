pipeline {
    agent any

    environment {
        // Credentials pour le serveur NAS
        NAS_KEY = credentials('NAS_KEY')
        NAS_SERVER = "${IP_NAS}"  // Référence secret Jenkins

        // Variables pour traçabilité
        GIT_TAG = sh(script: "git describe --tags --always", returnStdout: true).trim()
        BUILD_TAG = "${GIT_TAG}-${BUILD_NUMBER}"
    }

    stages {
        // ========================================
        // STAGE 1 : Création infrastructure (dossiers + fichiers)
        // ========================================
        stage('Setup Infrastructure') {
            when { branch 'nas' }
            steps {
                echo "Création de l'infrastructure sur le serveur NAS..."
                script {
                    withCredentials([sshUserPrivateKey(
                            credentialsId: 'NAS_KEY',
                            keyFileVariable: 'SSH_KEY',
                            usernameVariable: 'SSH_USER'
                    )]) {
                        sh '''
                            echo "=== PRÉPARATION DU PACKAGE ==="
                            
                            # Créer le package avec tous les fichiers
                            mkdir -p deployment-package/environments/nas
                            mkdir -p deployment-package/infrastructure
                            mkdir -p deployment-package/scripts
                            mkdir -p deployment-package/postgres_home
                            
                            # Copier tous les fichiers nécessaires
                            cp environments/nas/*.yml deployment-package/environments/nas/
                            cp environments/nas/.env deployment-package/environments/nas/
                            cp infrastructure/*.sh deployment-package/infrastructure/
                            cp scripts/*.sh deployment-package/scripts/
                            cp -r postgres_home/* deployment-package/postgres_home/ 2>/dev/null || true
                            
                            # Rendre les scripts exécutables
                            chmod +x deployment-package/infrastructure/*.sh
                            chmod +x deployment-package/scripts/*.sh
                            
                            echo "=== CRÉATION INFRASTRUCTURE SUR LE NAS ==="
                            
                            # Créer la structure sur le NAS
                            ssh -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_USER@${NAS_SERVER} "
                                mkdir -p /volume1/docker/keycloak-infrastructure
                            "
                            
                            # Transférer tous les fichiers
                            scp -o StrictHostKeyChecking=no -i $SSH_KEY -r deployment-package/* \
                                $SSH_USER@${NAS_SERVER}:/volume1/docker/keycloak-infrastructure/
                            
                            echo "=== VÉRIFICATION INFRASTRUCTURE ==="
                            
                            # Vérifier que l'infrastructure est créée
                            ssh -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_USER@${NAS_SERVER} "
                                echo 'Infrastructure créée:'
                                ls -la /volume1/docker/keycloak-infrastructure/
                                echo 'Scripts disponibles:'
                                ls -la /volume1/docker/keycloak-infrastructure/infrastructure/
                            "
                            
                            echo "=== INFRASTRUCTURE CRÉÉE ==="
                        '''
                    }
                }
            }
        }

        // ========================================
        // STAGE 2 : Déploiement (Docker stacks)
        // ========================================
        stage('Deploy Services') {
            when { branch 'nas' }
            steps {
                echo "Déploiement des services Docker..."
                script {
                    withCredentials([sshUserPrivateKey(
                            credentialsId: 'NAS_KEY',
                            keyFileVariable: 'SSH_KEY',
                            usernameVariable: 'SSH_USER'
                    )]) {
                        sh '''
                            echo "=== LANCEMENT DU DÉPLOIEMENT ==="
                            
                            # Exécuter le script de déploiement Docker
                            ssh -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_USER@${NAS_SERVER} \
                                "cd /volume1/docker/keycloak-infrastructure && ./infrastructure/deploy-infra.sh"
                            
                            DEPLOY_STATUS=$?
                            
                            if [ $DEPLOY_STATUS -eq 0 ]; then
                                echo "=== DÉPLOIEMENT TERMINÉ ==="
                            else
                                echo "=== ÉCHEC DU DÉPLOIEMENT (code: $DEPLOY_STATUS) ==="
                                exit 1
                            fi
                        '''
                    }
                }
            }
        }

        // ========================================
        // STAGE 3 : Vérification des services Docker
        // ========================================
        stage('Verify Services') {
            when { branch 'nas' }
            steps {
                echo "Vérification que les services Docker sont en cours d'exécution..."
                script {
                    withCredentials([sshUserPrivateKey(
                            credentialsId: 'NAS_KEY',
                            keyFileVariable: 'SSH_KEY',
                            usernameVariable: 'SSH_USER'
                    )]) {
                        sh '''
                            echo "=== VÉRIFICATION DES SERVICES DOCKER ==="
                            
                            ssh -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_USER@${NAS_SERVER} "
                                echo '--- Stacks déployées ---'
                                docker stack ls
                                
                                echo '--- Services actifs ---'
                                docker service ls
                                
                                echo '--- État des services PostgreSQL ---'
                                docker service ps postgres-nas-stack_postgres-shared --no-trunc || echo 'Service PostgreSQL non trouvé'
                                
                                echo '--- État des services Keycloak ---'
                                docker service ps keycloak-nas-stack_keycloak --no-trunc || echo 'Service Keycloak non trouvé'
                                
                                echo '--- Tests de connectivité ---'
                                
                                # Test PostgreSQL
                                if docker ps -q -f name=postgres-shared > /dev/null; then
                                    echo 'PostgreSQL container trouvé'
                                else
                                    echo 'PostgreSQL container non trouvé'
                                fi
                                
                                # Test Keycloak (port local)
                                if curl -f http://localhost:8999/health >/dev/null 2>&1; then
                                    echo 'Keycloak local accessible'
                                else
                                    echo 'Keycloak local non accessible'
                                fi
                            "
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            // Nettoyage du workspace
            cleanWs()
        }

        success {
            script {
                if (env.BRANCH_NAME == 'nas') {
                    echo "Déploiement NAS réussi - Version ${BUILD_TAG}"
                }
            }
        }

        failure {
            script {
                if (env.BRANCH_NAME == 'nas') {
                    echo "Échec du déploiement NAS - Version ${BUILD_TAG}"
                }
            }
        }

        unstable {
            echo "Build instable - vérifiez les warnings"
        }
    }
}