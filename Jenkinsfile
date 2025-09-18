pipeline {
    agent any

    environment {
        // Credentials pour le serveur NAS
        NAS_KEY = credentials('NAS_KEY')
        NAS_CONFIG = credentials('nas-config')

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
                    withCredentials([
                            sshUserPrivateKey(credentialsId: 'NAS_KEY', keyFileVariable: 'SSH_KEY'),
                            string(credentialsId: 'nas-config', variable: 'CONFIG_FILE')
                    ]) {
                        sh '''
                            echo "=== CHARGEMENT DES VARIABLES ==="
                            
                            # Créer le fichier .env temporaire
                            echo "$CONFIG_FILE" > deploy.env
                            
                            # Charger les variables depuis le fichier temporaire
                            set -a
                            source deploy.env
                            set +a
                            
                            echo "=== PRÉPARATION DU PACKAGE ==="
                            
                            # Créer le package avec tous les fichiers
                            mkdir -p node/environments/nas
                            mkdir -p node/infrastructure
                            mkdir -p node/scripts
                            mkdir -p node/postgres_home
                            
                            # Copier tous les fichiers nécessaires
                            cp environments/nas/*.yml node/environments/nas/
                            cp environments/nas/.env node/environments/nas/
                            cp infrastructure/*.sh node/infrastructure/
                            cp script/*.sh node/scripts/
                            cp -r postgres_home/* node/postgres_home/ 2>/dev/null || true
                            
                            # Rendre les scripts exécutables
                            chmod +x node/infrastructure/*.sh
                            chmod +x node/scripts/*.sh
                            
                            echo "=== CRÉATION INFRASTRUCTURE SUR LE NAS ==="
                            
                            # Créer la structure sur le NAS
                            ssh -o StrictHostKeyChecking=no -i $SSH_KEY -p ${NAS_PORT_SSH} ${NAS_USER_SERVER}@${NAS_IP_SERVER} "
                                mkdir -p /volume1/docker/keycloak-infrastructure \
                                mkdir -p /volume1/docker/keycloak-infrastructure/environments/nas \
                                mkdir -p /volume1/docker/keycloak-infrastructure/infrastructure \
                                mkdir -p /volume1/docker/keycloak-infrastructure/scripts \
                                mkdir -p /volume1/docker/keycloak-infrastructure/postgres_home
                            "
                            
                            # Transférer tous les fichiers
                            scp -o StrictHostKeyChecking=no -i $SSH_KEY -P ${NAS_PORT_SFTP} -r node/* \
                                ${NAS_USER_SERVER}@${NAS_IP_SERVER}:docker/keycloak-infrastructure/
                            
                            echo "=== VÉRIFICATION INFRASTRUCTURE ==="
                            
                            # Vérifier que l'infrastructure est créée
                            ssh -o StrictHostKeyChecking=no -i $SSH_KEY -p ${NAS_PORT_SSH} ${NAS_USER_SERVER}@${NAS_IP_SERVER} "
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
                    withCredentials([
                            sshUserPrivateKey(credentialsId: 'NAS_KEY', keyFileVariable: 'SSH_KEY'),
                            string(credentialsId: 'nas-config', variable: 'CONFIG_FILE')
                    ]) {
                        sh '''
                            echo "=== CHARGEMENT DES VARIABLES ==="
                            
                            # Créer le fichier .env temporaire
                            echo "$CONFIG_FILE" > deploy.env
                            
                            # Charger les variables depuis le fichier temporaire
                            set -a
                            source deploy.env
                            set +a
                            
                            echo "=== LANCEMENT DU DÉPLOIEMENT ==="
                            
                            # Exécuter le script de déploiement Docker
                            ssh -o StrictHostKeyChecking=no -i $SSH_KEY -p ${NAS_PORT_SSH} ${NAS_USER}@${NAS_HOST} \
                                "set -a && source - && set +a && \
                                 cd /volume1/docker/keycloak-infrastructure && \
                                 ./infrastructure/deploy-nas.sh" < deploy.env
                            
                            # 0 → succès et >0 → échec ou erreur
                            
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
                    withCredentials([
                            sshUserPrivateKey(credentialsId: 'NAS_KEY', keyFileVariable: 'SSH_KEY'),
                            string(credentialsId: 'nas-config', variable: 'CONFIG_FILE')
                    ]) {
                        sh '''
                            echo "=== CHARGEMENT DES VARIABLES ==="
                            
                            # Créer le fichier .env temporaire
                            echo "$CONFIG_FILE" > deploy.env
                            
                            # Charger les variables depuis le fichier temporaire
                            set -a
                            source deploy.env
                            set +a
                            
                            echo "=== VÉRIFICATION DES SERVICES DOCKER ==="
                            
                            ssh -o StrictHostKeyChecking=no -i $SSH_KEY -p ${NAS_PORT_SSH} ${NAS_USER_SERVER}@${NAS_IP_SERVER} "
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