--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT fkdc4897cf864c4e43;
ALTER TABLE ONLY public.policy_config DROP CONSTRAINT fkdc34197cf864c4e43;
ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT fk_user_group_user;
ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5;
ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT fk_supported_locales_realm;
ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT fk_role_attribute_id;
ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT fk_resource_server_uris;
ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT fk_req_act_realm;
ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT fk_r_def_cli_scope_realm;
ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT fk_pmconfig;
ALTER TABLE ONLY public.credential DROP CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0;
ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_pcm_realm;
ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1;
ALTER TABLE ONLY public.web_origins DROP CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT fk_idpmconfig;
ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT fk_idpm_realm;
ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j;
ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j;
ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT fk_group_role_group;
ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT fk_group_attribute_group;
ALTER TABLE ONLY public.user_consent DROP CONSTRAINT fk_grntcsnt_user;
ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT fk_grntcsnt_clsc_usc;
ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8;
ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy;
ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog84sspmt;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog83sspmt;
ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog82sspmt;
ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy;
ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_realm;
ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_fedprv;
ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT fk_fedmapper_cfg;
ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT fk_def_groups_realm;
ALTER TABLE ONLY public.component DROP CONSTRAINT fk_component_realm;
ALTER TABLE ONLY public.component_config DROP CONSTRAINT fk_component_config;
ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT fk_client_init_acc_realm;
ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_cli_scope_mapper;
ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT fk_cl_usr_ses_note;
ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT fk_cl_scope_rm_scope;
ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT fk_cl_scope_attr_scope;
ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l;
ALTER TABLE ONLY public.client_session DROP CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1;
ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT fk_auth_realm;
ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT fk_auth_flow_realm;
ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_realm;
ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_flow;
ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2;
ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw;
ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o;
ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c;
ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd;
ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr;
ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr;
ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT fk_5hg65lybevavkqfki3kponh9v;
ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT fk_33a8sgqw18i532811v7o2dk89;
ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8;
ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f;
ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT fk_11b7sgqw18i532811v7o2dv76;
ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT fk5edfb00ff51d3472;
ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT fk5edfb00ff51c2736;
ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT fk4129723ba992f594;
ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT fk404288b92ef007a6;
ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT fk3c47c64beacca966;
ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT fk2b4ebc52ae5c3b34;
ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT auth_status_constraint;
DROP INDEX public.idx_web_orig_client;
DROP INDEX public.idx_usr_fed_prv_realm;
DROP INDEX public.idx_usr_fed_map_realm;
DROP INDEX public.idx_usr_fed_map_fed_prv;
DROP INDEX public.idx_user_service_account;
DROP INDEX public.idx_user_role_mapping;
DROP INDEX public.idx_user_reqactions;
DROP INDEX public.idx_user_group_mapping;
DROP INDEX public.idx_user_email;
DROP INDEX public.idx_user_credential;
DROP INDEX public.idx_user_consent;
DROP INDEX public.idx_user_attribute_name;
DROP INDEX public.idx_user_attribute;
DROP INDEX public.idx_usconsent_clscope;
DROP INDEX public.idx_us_sess_id_on_cl_sess;
DROP INDEX public.idx_update_time;
DROP INDEX public.idx_scope_policy_policy;
DROP INDEX public.idx_scope_mapping_role;
DROP INDEX public.idx_role_clscope;
DROP INDEX public.idx_role_attribute;
DROP INDEX public.idx_res_srv_scope_res_srv;
DROP INDEX public.idx_res_srv_res_res_srv;
DROP INDEX public.idx_res_serv_pol_res_serv;
DROP INDEX public.idx_res_scope_scope;
DROP INDEX public.idx_res_policy_policy;
DROP INDEX public.idx_req_act_prov_realm;
DROP INDEX public.idx_redir_uri_client;
DROP INDEX public.idx_realm_supp_local_realm;
DROP INDEX public.idx_realm_master_adm_cli;
DROP INDEX public.idx_realm_evt_types_realm;
DROP INDEX public.idx_realm_evt_list_realm;
DROP INDEX public.idx_realm_def_grp_realm;
DROP INDEX public.idx_realm_clscope;
DROP INDEX public.idx_realm_attr_realm;
DROP INDEX public.idx_protocol_mapper_client;
DROP INDEX public.idx_offline_uss_preload;
DROP INDEX public.idx_offline_uss_createdon;
DROP INDEX public.idx_offline_uss_by_usersess;
DROP INDEX public.idx_offline_uss_by_user;
DROP INDEX public.idx_offline_css_preload;
DROP INDEX public.idx_keycloak_role_realm;
DROP INDEX public.idx_keycloak_role_client;
DROP INDEX public.idx_ident_prov_realm;
DROP INDEX public.idx_id_prov_mapp_realm;
DROP INDEX public.idx_group_role_mapp_group;
DROP INDEX public.idx_group_attr_group;
DROP INDEX public.idx_fu_role_mapping_ru;
DROP INDEX public.idx_fu_role_mapping;
DROP INDEX public.idx_fu_required_action_ru;
DROP INDEX public.idx_fu_required_action;
DROP INDEX public.idx_fu_group_membership_ru;
DROP INDEX public.idx_fu_group_membership;
DROP INDEX public.idx_fu_credential_ru;
DROP INDEX public.idx_fu_credential;
DROP INDEX public.idx_fu_consent_ru;
DROP INDEX public.idx_fu_consent;
DROP INDEX public.idx_fu_cnsnt_ext;
DROP INDEX public.idx_fu_attribute;
DROP INDEX public.idx_fedidentity_user;
DROP INDEX public.idx_fedidentity_feduser;
DROP INDEX public.idx_event_time;
DROP INDEX public.idx_defcls_scope;
DROP INDEX public.idx_defcls_realm;
DROP INDEX public.idx_composite_child;
DROP INDEX public.idx_composite;
DROP INDEX public.idx_component_realm;
DROP INDEX public.idx_component_provider_type;
DROP INDEX public.idx_compo_config_compo;
DROP INDEX public.idx_clscope_role;
DROP INDEX public.idx_clscope_protmap;
DROP INDEX public.idx_clscope_cl;
DROP INDEX public.idx_clscope_attrs;
DROP INDEX public.idx_client_session_session;
DROP INDEX public.idx_client_init_acc_realm;
DROP INDEX public.idx_client_id;
DROP INDEX public.idx_client_att_by_name_value;
DROP INDEX public.idx_cl_clscope;
DROP INDEX public.idx_auth_flow_realm;
DROP INDEX public.idx_auth_exec_realm_flow;
DROP INDEX public.idx_auth_exec_flow;
DROP INDEX public.idx_auth_config_realm;
DROP INDEX public.idx_assoc_pol_assoc_pol_id;
DROP INDEX public.idx_admin_event_time;
ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6;
ALTER TABLE ONLY public.realm DROP CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi;
ALTER TABLE ONLY public.user_consent DROP CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt;
ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT uk_frsrst700s9v50bu18ws5ha6;
ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt;
ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6;
ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_dykn684sl8up1crfei6eckhd7;
ALTER TABLE ONLY public.client_scope DROP CONSTRAINT uk_cli_scope;
ALTER TABLE ONLY public.client DROP CONSTRAINT uk_b71cjlbenv945rb6gcon438at;
ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33;
ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT sibling_names;
ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT res_attr_pk;
ALTER TABLE ONLY public.realm_localizations DROP CONSTRAINT realm_localizations_pkey;
ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT r_def_cli_scope_bind;
ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT pk_template_scope;
ALTER TABLE ONLY public.resource_server DROP CONSTRAINT pk_resource_server;
ALTER TABLE ONLY public.client_scope DROP CONSTRAINT pk_cli_template;
ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT pk_cl_tmpl_attr;
ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
ALTER TABLE ONLY public.web_origins DROP CONSTRAINT constraint_web_origins;
ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT constraint_usn_pk;
ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT constraint_user_group;
ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT constraint_user_attribute_pk;
ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT constraint_role_attribute_pk;
ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT constraint_resour_uris_pk;
ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT constraint_required_action;
ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT constraint_req_act_prv_pk;
ALTER TABLE ONLY public.required_action_config DROP CONSTRAINT constraint_req_act_cfg_pk;
ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT constraint_redirect_uris;
ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT constraint_pmconfig;
ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT constraint_pcm;
ALTER TABLE ONLY public.offline_user_session DROP CONSTRAINT constraint_offl_us_ses_pk2;
ALTER TABLE ONLY public.offline_client_session DROP CONSTRAINT constraint_offl_cl_ses_pk3;
ALTER TABLE ONLY public.migration_model DROP CONSTRAINT constraint_migmod;
ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT constraint_idpmconfig;
ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT constraint_idpm;
ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT constraint_group_role;
ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT constraint_group_attribute_pk;
ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT constraint_group;
ALTER TABLE ONLY public.user_consent DROP CONSTRAINT constraint_grntcsnt_pm;
ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT constraint_grntcsnt_clsc_pm;
ALTER TABLE ONLY public.fed_user_consent_cl_scope DROP CONSTRAINT constraint_fgrntcsnt_clsc_pm;
ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT constraint_fedmapperpm;
ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT constraint_fedmapper_cfg_pm;
ALTER TABLE ONLY public.user_entity DROP CONSTRAINT constraint_fb;
ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT constraint_farsrsps;
ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT constraint_farsrsp;
ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT constraint_farsrs;
ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT constraint_farsrpp;
ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT constraint_farsrpap;
ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT constraint_farsrp;
ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT constraint_farsr;
ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT constraint_fapmt;
ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT constraint_f9;
ALTER TABLE ONLY public.credential DROP CONSTRAINT constraint_f;
ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT constraint_e;
ALTER TABLE ONLY public.policy_config DROP CONSTRAINT constraint_dpc;
ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT constraint_d;
ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT constraint_cs_pmp_pk;
ALTER TABLE ONLY public.composite_role DROP CONSTRAINT constraint_composite_role;
ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT constraint_c;
ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT constraint_auth_status_pk;
ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT constraint_auth_pk;
ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT constraint_auth_flow_pk;
ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT constraint_auth_exec_pk;
ALTER TABLE ONLY public.authenticator_config_entry DROP CONSTRAINT constraint_auth_cfg_pk;
ALTER TABLE ONLY public.admin_event_entity DROP CONSTRAINT constraint_admin_event_entity;
ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT constraint_a;
ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT constraint_92;
ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT constraint_9;
ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT constraint_84;
ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT constraint_81;
ALTER TABLE ONLY public.client_session DROP CONSTRAINT constraint_8;
ALTER TABLE ONLY public.client DROP CONSTRAINT constraint_7;
ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT constraint_5e;
ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT constraint_5c;
ALTER TABLE ONLY public.user_session DROP CONSTRAINT constraint_57;
ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT constraint_5;
ALTER TABLE ONLY public.realm DROP CONSTRAINT constraint_4a;
ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT constraint_40;
ALTER TABLE ONLY public.event_entity DROP CONSTRAINT constraint_4;
ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT constraint_3c;
ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT constraint_2b;
ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT constr_realm_supported_locales;
ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT constr_realm_events_listeners;
ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT constr_realm_enabl_event_types;
ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT constr_realm_default_groups;
ALTER TABLE ONLY public.federated_user DROP CONSTRAINT constr_federated_user;
ALTER TABLE ONLY public.fed_user_role_mapping DROP CONSTRAINT constr_fed_user_role;
ALTER TABLE ONLY public.fed_user_group_membership DROP CONSTRAINT constr_fed_user_group;
ALTER TABLE ONLY public.fed_user_credential DROP CONSTRAINT constr_fed_user_cred_pk;
ALTER TABLE ONLY public.fed_user_consent DROP CONSTRAINT constr_fed_user_consent_pk;
ALTER TABLE ONLY public.fed_user_attribute DROP CONSTRAINT constr_fed_user_attr_pk;
ALTER TABLE ONLY public.fed_user_required_action DROP CONSTRAINT constr_fed_required_action;
ALTER TABLE ONLY public.component DROP CONSTRAINT constr_component_pk;
ALTER TABLE ONLY public.component_config DROP CONSTRAINT constr_component_config_pk;
ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT constr_cl_usr_ses_note;
ALTER TABLE ONLY public.broker_link DROP CONSTRAINT constr_broker_link_pk;
ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT con_group_id_def_groups;
ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT cnstr_client_init_acc_pk;
ALTER TABLE ONLY public.client_scope_client DROP CONSTRAINT c_cli_scope_bind;
ALTER TABLE ONLY public.client_auth_flow_bindings DROP CONSTRAINT c_cli_flow_bind;
ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2";
ALTER TABLE ONLY public.username_login_failure DROP CONSTRAINT "CONSTRAINT_17-2";
DROP TABLE public.web_origins;
DROP TABLE public.username_login_failure;
DROP TABLE public.user_session_note;
DROP TABLE public.user_session;
DROP TABLE public.user_role_mapping;
DROP TABLE public.user_required_action;
DROP TABLE public.user_group_membership;
DROP TABLE public.user_federation_provider;
DROP TABLE public.user_federation_mapper_config;
DROP TABLE public.user_federation_mapper;
DROP TABLE public.user_federation_config;
DROP TABLE public.user_entity;
DROP TABLE public.user_consent_client_scope;
DROP TABLE public.user_consent;
DROP TABLE public.user_attribute;
DROP TABLE public.scope_policy;
DROP TABLE public.scope_mapping;
DROP TABLE public.role_attribute;
DROP TABLE public.resource_uris;
DROP TABLE public.resource_server_scope;
DROP TABLE public.resource_server_resource;
DROP TABLE public.resource_server_policy;
DROP TABLE public.resource_server_perm_ticket;
DROP TABLE public.resource_server;
DROP TABLE public.resource_scope;
DROP TABLE public.resource_policy;
DROP TABLE public.resource_attribute;
DROP TABLE public.required_action_provider;
DROP TABLE public.required_action_config;
DROP TABLE public.redirect_uris;
DROP TABLE public.realm_supported_locales;
DROP TABLE public.realm_smtp_config;
DROP TABLE public.realm_required_credential;
DROP TABLE public.realm_localizations;
DROP TABLE public.realm_events_listeners;
DROP TABLE public.realm_enabled_event_types;
DROP TABLE public.realm_default_groups;
DROP TABLE public.realm_attribute;
DROP TABLE public.realm;
DROP TABLE public.protocol_mapper_config;
DROP TABLE public.protocol_mapper;
DROP TABLE public.policy_config;
DROP TABLE public.offline_user_session;
DROP TABLE public.offline_client_session;
DROP TABLE public.migration_model;
DROP TABLE public.keycloak_role;
DROP TABLE public.keycloak_group;
DROP TABLE public.idp_mapper_config;
DROP TABLE public.identity_provider_mapper;
DROP TABLE public.identity_provider_config;
DROP TABLE public.identity_provider;
DROP TABLE public.group_role_mapping;
DROP TABLE public.group_attribute;
DROP TABLE public.federated_user;
DROP TABLE public.federated_identity;
DROP TABLE public.fed_user_role_mapping;
DROP TABLE public.fed_user_required_action;
DROP TABLE public.fed_user_group_membership;
DROP TABLE public.fed_user_credential;
DROP TABLE public.fed_user_consent_cl_scope;
DROP TABLE public.fed_user_consent;
DROP TABLE public.fed_user_attribute;
DROP TABLE public.event_entity;
DROP TABLE public.default_client_scope;
DROP TABLE public.databasechangeloglock;
DROP TABLE public.databasechangelog;
DROP TABLE public.credential;
DROP TABLE public.composite_role;
DROP TABLE public.component_config;
DROP TABLE public.component;
DROP TABLE public.client_user_session_note;
DROP TABLE public.client_session_role;
DROP TABLE public.client_session_prot_mapper;
DROP TABLE public.client_session_note;
DROP TABLE public.client_session_auth_status;
DROP TABLE public.client_session;
DROP TABLE public.client_scope_role_mapping;
DROP TABLE public.client_scope_client;
DROP TABLE public.client_scope_attributes;
DROP TABLE public.client_scope;
DROP TABLE public.client_node_registrations;
DROP TABLE public.client_initial_access;
DROP TABLE public.client_auth_flow_bindings;
DROP TABLE public.client_attributes;
DROP TABLE public.client;
DROP TABLE public.broker_link;
DROP TABLE public.authenticator_config_entry;
DROP TABLE public.authenticator_config;
DROP TABLE public.authentication_flow;
DROP TABLE public.authentication_execution;
DROP TABLE public.associated_policy;
DROP TABLE public.admin_event_entity;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO max_admin;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO max_admin;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO max_admin;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO max_admin;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO max_admin;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO max_admin;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO max_admin;

--
-- Name: client; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO max_admin;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO max_admin;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO max_admin;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO max_admin;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO max_admin;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO max_admin;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO max_admin;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO max_admin;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO max_admin;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO max_admin;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO max_admin;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO max_admin;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO max_admin;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO max_admin;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO max_admin;

--
-- Name: component; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO max_admin;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO max_admin;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO max_admin;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO max_admin;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO max_admin;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO max_admin;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO max_admin;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO max_admin;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO max_admin;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO max_admin;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO max_admin;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO max_admin;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO max_admin;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO max_admin;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO max_admin;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO max_admin;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO max_admin;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO max_admin;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO max_admin;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO max_admin;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO max_admin;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO max_admin;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO max_admin;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO max_admin;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO max_admin;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO max_admin;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO max_admin;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO max_admin;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO max_admin;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO max_admin;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO max_admin;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO max_admin;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO max_admin;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO max_admin;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO max_admin;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO max_admin;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO max_admin;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO max_admin;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO max_admin;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO max_admin;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO max_admin;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO max_admin;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO max_admin;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO max_admin;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO max_admin;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO max_admin;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO max_admin;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO max_admin;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO max_admin;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO max_admin;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO max_admin;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO max_admin;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO max_admin;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO max_admin;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO max_admin;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO max_admin;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO max_admin;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO max_admin;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO max_admin;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO max_admin;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO max_admin;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO max_admin;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO max_admin;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO max_admin;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO max_admin;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO max_admin;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO max_admin;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO max_admin;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO max_admin;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO max_admin;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
2a1b7b84-6b5f-4ccd-b551-599bd459c3d2	\N	auth-cookie	77f2a7e8-ac8b-47fd-b466-46732acc31f5	417e8661-f238-485c-bf0a-b9e4c2309e4a	2	10	f	\N	\N
e674810e-45f3-4b3e-81b3-9c28a7976f8d	\N	auth-spnego	77f2a7e8-ac8b-47fd-b466-46732acc31f5	417e8661-f238-485c-bf0a-b9e4c2309e4a	3	20	f	\N	\N
a50b428e-c25c-4ebe-8dbf-7389b93b043b	\N	identity-provider-redirector	77f2a7e8-ac8b-47fd-b466-46732acc31f5	417e8661-f238-485c-bf0a-b9e4c2309e4a	2	25	f	\N	\N
fe1d7865-fef7-4adf-bbb8-dfdca6d3ca1d	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	417e8661-f238-485c-bf0a-b9e4c2309e4a	2	30	t	f8f813cd-6950-49a8-bc40-4d92bc337e99	\N
7befaa51-feb4-4410-adbb-7202c29474c1	\N	auth-username-password-form	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f8f813cd-6950-49a8-bc40-4d92bc337e99	0	10	f	\N	\N
06561fff-80b1-458b-b302-e29d60e39e43	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f8f813cd-6950-49a8-bc40-4d92bc337e99	1	20	t	865fdea7-cd1b-4970-8ed1-1351f0cfe440	\N
c2a93520-9595-4c89-9314-5ede891f5cd4	\N	conditional-user-configured	77f2a7e8-ac8b-47fd-b466-46732acc31f5	865fdea7-cd1b-4970-8ed1-1351f0cfe440	0	10	f	\N	\N
78e0f7cc-5af9-4dc7-9885-e6c8af6056f6	\N	auth-otp-form	77f2a7e8-ac8b-47fd-b466-46732acc31f5	865fdea7-cd1b-4970-8ed1-1351f0cfe440	0	20	f	\N	\N
a869c03b-8b94-4893-a13e-b86badaf1506	\N	direct-grant-validate-username	77f2a7e8-ac8b-47fd-b466-46732acc31f5	bc87652a-1e4a-41fe-a9cf-caa20ab1130d	0	10	f	\N	\N
969131e2-21e4-45fb-a2bd-2cf7890735e0	\N	direct-grant-validate-password	77f2a7e8-ac8b-47fd-b466-46732acc31f5	bc87652a-1e4a-41fe-a9cf-caa20ab1130d	0	20	f	\N	\N
76ff3d1a-f24a-445d-87a5-11b26e52d6a9	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	bc87652a-1e4a-41fe-a9cf-caa20ab1130d	1	30	t	93f5bcca-145f-4ec0-a237-efcaa85ca405	\N
b95e4d0b-92bc-44a5-b936-d76fa25fd233	\N	conditional-user-configured	77f2a7e8-ac8b-47fd-b466-46732acc31f5	93f5bcca-145f-4ec0-a237-efcaa85ca405	0	10	f	\N	\N
a424ded2-9bb5-4ded-a70e-2009e5b44259	\N	direct-grant-validate-otp	77f2a7e8-ac8b-47fd-b466-46732acc31f5	93f5bcca-145f-4ec0-a237-efcaa85ca405	0	20	f	\N	\N
c7e72499-7032-420d-aa53-044d18c13b37	\N	registration-page-form	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ff104bbd-8ba5-4cd4-be53-71e7394d2a20	0	10	t	0a94c760-ec30-4f15-964e-b788db98bded	\N
9cbead0e-59ff-47f0-b236-9aced882f5dc	\N	registration-user-creation	77f2a7e8-ac8b-47fd-b466-46732acc31f5	0a94c760-ec30-4f15-964e-b788db98bded	0	20	f	\N	\N
4c820e09-488e-47bb-bcad-6b8c3878c6c1	\N	registration-profile-action	77f2a7e8-ac8b-47fd-b466-46732acc31f5	0a94c760-ec30-4f15-964e-b788db98bded	0	40	f	\N	\N
6c0e2d1f-eb59-429a-9eb4-c69bcb6664a6	\N	registration-password-action	77f2a7e8-ac8b-47fd-b466-46732acc31f5	0a94c760-ec30-4f15-964e-b788db98bded	0	50	f	\N	\N
645b497d-0fb1-45e2-afbe-a2193694824e	\N	registration-recaptcha-action	77f2a7e8-ac8b-47fd-b466-46732acc31f5	0a94c760-ec30-4f15-964e-b788db98bded	3	60	f	\N	\N
ca9a6894-e7ad-4740-a144-d8560e5c6ce2	\N	reset-credentials-choose-user	77f2a7e8-ac8b-47fd-b466-46732acc31f5	be99312d-a937-4052-af84-befa735f35b8	0	10	f	\N	\N
2c083c35-7767-4f54-a608-4f470cd0914e	\N	reset-credential-email	77f2a7e8-ac8b-47fd-b466-46732acc31f5	be99312d-a937-4052-af84-befa735f35b8	0	20	f	\N	\N
1305508e-c4f9-4ea9-af60-f37a1dfaa264	\N	reset-password	77f2a7e8-ac8b-47fd-b466-46732acc31f5	be99312d-a937-4052-af84-befa735f35b8	0	30	f	\N	\N
1cc70c42-d9d7-4850-abe8-90d50af1cf37	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	be99312d-a937-4052-af84-befa735f35b8	1	40	t	ba6b725f-7fa5-4f6f-8b57-1da7a57934d1	\N
c9814f4f-c302-4f00-aa5b-549b99afad74	\N	conditional-user-configured	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ba6b725f-7fa5-4f6f-8b57-1da7a57934d1	0	10	f	\N	\N
5f49967f-7568-4a2f-8538-8ca9fc669990	\N	reset-otp	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ba6b725f-7fa5-4f6f-8b57-1da7a57934d1	0	20	f	\N	\N
f344d088-44e7-4091-b9a8-e96b15f9f983	\N	client-secret	77f2a7e8-ac8b-47fd-b466-46732acc31f5	bf977d4e-73e3-44f0-98ff-ba1efc2e6d7a	2	10	f	\N	\N
bf12867f-b021-4642-b0af-cab3cebaa68a	\N	client-jwt	77f2a7e8-ac8b-47fd-b466-46732acc31f5	bf977d4e-73e3-44f0-98ff-ba1efc2e6d7a	2	20	f	\N	\N
ec2f0473-8dfb-44ae-aa7d-3bf83e5d92e0	\N	client-secret-jwt	77f2a7e8-ac8b-47fd-b466-46732acc31f5	bf977d4e-73e3-44f0-98ff-ba1efc2e6d7a	2	30	f	\N	\N
2552c896-2226-4dd4-aab1-36ff1db5d744	\N	client-x509	77f2a7e8-ac8b-47fd-b466-46732acc31f5	bf977d4e-73e3-44f0-98ff-ba1efc2e6d7a	2	40	f	\N	\N
bfb791d8-cc56-4cf9-b171-d2b42c4eb6dd	\N	idp-review-profile	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ea70b24a-cba8-4966-a4c7-2297c8591c3c	0	10	f	\N	a17da31c-5bba-4757-865b-13394926b7bb
148b57ba-d05a-4a30-b1e1-fdeb977212c2	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ea70b24a-cba8-4966-a4c7-2297c8591c3c	0	20	t	65720a55-df81-4d41-bd80-095cdfde7522	\N
b44e82d2-56ee-4dd8-a32d-d5d4a782816e	\N	idp-create-user-if-unique	77f2a7e8-ac8b-47fd-b466-46732acc31f5	65720a55-df81-4d41-bd80-095cdfde7522	2	10	f	\N	d9840046-66d4-4016-96a6-34642225b773
fc93803a-8fa9-46b4-97f6-9eee80f65906	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	65720a55-df81-4d41-bd80-095cdfde7522	2	20	t	6f5ad353-3560-4fe6-8bbf-11c2c79c8f5b	\N
eee79f79-6c1a-4515-aa50-552ebd90d868	\N	idp-confirm-link	77f2a7e8-ac8b-47fd-b466-46732acc31f5	6f5ad353-3560-4fe6-8bbf-11c2c79c8f5b	0	10	f	\N	\N
1b1d2933-f3ac-4447-a4e2-7d28f76ed16e	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	6f5ad353-3560-4fe6-8bbf-11c2c79c8f5b	0	20	t	108a95cd-8400-47b5-be5d-37140ad81217	\N
c8f85650-c213-405f-a439-272770bbe775	\N	idp-email-verification	77f2a7e8-ac8b-47fd-b466-46732acc31f5	108a95cd-8400-47b5-be5d-37140ad81217	2	10	f	\N	\N
c201ab24-68a6-4509-8353-a39569ace1c1	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	108a95cd-8400-47b5-be5d-37140ad81217	2	20	t	7b102e54-86f3-4735-9916-d1d2f63050d8	\N
0857a85e-20db-4a06-bb2e-4121b766ae74	\N	idp-username-password-form	77f2a7e8-ac8b-47fd-b466-46732acc31f5	7b102e54-86f3-4735-9916-d1d2f63050d8	0	10	f	\N	\N
12696dd2-4c1a-4e41-8419-95eb0b4ebedf	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	7b102e54-86f3-4735-9916-d1d2f63050d8	1	20	t	d25492f8-9d0b-4edf-a9f2-a7335c0dbd19	\N
a7627590-4f40-474b-a9c2-2feec3644bc8	\N	conditional-user-configured	77f2a7e8-ac8b-47fd-b466-46732acc31f5	d25492f8-9d0b-4edf-a9f2-a7335c0dbd19	0	10	f	\N	\N
08b1dec7-a671-4d0c-9bee-92c7dda97a7b	\N	auth-otp-form	77f2a7e8-ac8b-47fd-b466-46732acc31f5	d25492f8-9d0b-4edf-a9f2-a7335c0dbd19	0	20	f	\N	\N
72b22125-5a32-4d11-a2b8-cc79b951e587	\N	http-basic-authenticator	77f2a7e8-ac8b-47fd-b466-46732acc31f5	2594178b-a48a-4ff2-86d5-aadaf0914ba2	0	10	f	\N	\N
182e3eaa-12ef-4795-acc2-cf3f6454ee6f	\N	docker-http-basic-authenticator	77f2a7e8-ac8b-47fd-b466-46732acc31f5	16287895-5e08-4df5-b79b-ef310056bc92	0	10	f	\N	\N
ad1f7664-3aa9-4fa7-b456-083bf02e7861	\N	no-cookie-redirect	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f473ed7d-9c07-459b-80e9-4588174d4599	0	10	f	\N	\N
e3a4ce03-df78-4ee6-8de2-b25230181cad	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f473ed7d-9c07-459b-80e9-4588174d4599	0	20	t	4cf28d5b-b3bb-4d36-a478-5adc01653d68	\N
f98ab68f-8d8a-4bf9-9b86-8fd3a2374052	\N	basic-auth	77f2a7e8-ac8b-47fd-b466-46732acc31f5	4cf28d5b-b3bb-4d36-a478-5adc01653d68	0	10	f	\N	\N
7128ecf9-8253-4190-bc5e-e3989fe8bc07	\N	basic-auth-otp	77f2a7e8-ac8b-47fd-b466-46732acc31f5	4cf28d5b-b3bb-4d36-a478-5adc01653d68	3	20	f	\N	\N
aa013a5e-1886-4135-9f75-6339eb9d4941	\N	auth-spnego	77f2a7e8-ac8b-47fd-b466-46732acc31f5	4cf28d5b-b3bb-4d36-a478-5adc01653d68	3	30	f	\N	\N
9256d3d0-43b8-44f7-a6e0-83937eb4dc4b	\N	idp-email-verification	91cb1cd2-e133-4f67-9800-593c809120c8	180c455c-d9cc-4caf-9335-3e3a4da2f11a	2	10	f	\N	\N
b81dd00a-f9f6-412f-8a05-23d783fa1463	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	180c455c-d9cc-4caf-9335-3e3a4da2f11a	2	20	t	fe1a15e0-6764-4864-9703-4a73d4707cd7	\N
15d19e16-3cb9-471f-bf1d-b5e70de4bb17	\N	basic-auth	91cb1cd2-e133-4f67-9800-593c809120c8	67c20226-0e17-4ad5-baae-d900e17ee5df	0	10	f	\N	\N
b6971a9c-056d-46aa-bfcb-aad937a2e3c3	\N	basic-auth-otp	91cb1cd2-e133-4f67-9800-593c809120c8	67c20226-0e17-4ad5-baae-d900e17ee5df	3	20	f	\N	\N
f996e843-beee-4f00-b8cf-653a76af4fe1	\N	auth-spnego	91cb1cd2-e133-4f67-9800-593c809120c8	67c20226-0e17-4ad5-baae-d900e17ee5df	3	30	f	\N	\N
b6d595cf-15e3-46e3-845f-8e7162d679b2	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	2a61cbc9-b42e-4f01-ac04-7a3b08cd20c3	0	10	f	\N	\N
fae01ddb-7a69-4258-b214-6a1b6b0eeb72	\N	auth-otp-form	91cb1cd2-e133-4f67-9800-593c809120c8	2a61cbc9-b42e-4f01-ac04-7a3b08cd20c3	0	20	f	\N	\N
ce123e36-d809-49f1-a62e-4b5cac05625d	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	0db527ce-9167-4342-b777-809d5f01690c	0	10	f	\N	\N
6bbcb7c5-4c7f-4404-a14e-d168c1e2b9a7	\N	direct-grant-validate-otp	91cb1cd2-e133-4f67-9800-593c809120c8	0db527ce-9167-4342-b777-809d5f01690c	0	20	f	\N	\N
b1d504de-df79-41c9-b142-70bbf679b173	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	28f9ae76-4409-4f30-aba0-93d1bfd35510	0	10	f	\N	\N
5acd1da8-b28b-4562-ad8d-43af7d8014ec	\N	auth-otp-form	91cb1cd2-e133-4f67-9800-593c809120c8	28f9ae76-4409-4f30-aba0-93d1bfd35510	0	20	f	\N	\N
eff55e61-42f6-4413-843b-6e0dca23ecae	\N	idp-confirm-link	91cb1cd2-e133-4f67-9800-593c809120c8	0c5efeb2-e514-44e3-9062-74bef406dbbf	0	10	f	\N	\N
d43f406e-7e47-4280-9556-a7eb8efa8ef1	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	0c5efeb2-e514-44e3-9062-74bef406dbbf	0	20	t	180c455c-d9cc-4caf-9335-3e3a4da2f11a	\N
675d8c3c-020e-4acd-b307-240bb2bde1d6	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	437b9434-5364-4e26-b40e-61ca061e63ba	0	10	f	\N	\N
5a4ba018-8684-40ce-969b-978a3e9daddf	\N	reset-otp	91cb1cd2-e133-4f67-9800-593c809120c8	437b9434-5364-4e26-b40e-61ca061e63ba	0	20	f	\N	\N
b993883f-b029-4d27-a777-74906067e1b3	\N	idp-create-user-if-unique	91cb1cd2-e133-4f67-9800-593c809120c8	24568e35-fa59-4e94-82b6-cecdb7a3c2c1	2	10	f	\N	5d7b5658-4693-41a7-9575-ccca78548d2c
780132a7-6b3c-490b-a133-c03a746fdb24	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	24568e35-fa59-4e94-82b6-cecdb7a3c2c1	2	20	t	0c5efeb2-e514-44e3-9062-74bef406dbbf	\N
f3acdc1a-74e3-4893-8a73-6910b0707160	\N	idp-username-password-form	91cb1cd2-e133-4f67-9800-593c809120c8	fe1a15e0-6764-4864-9703-4a73d4707cd7	0	10	f	\N	\N
70fc9ada-bbc0-4096-93bc-9cba1f505c1c	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	fe1a15e0-6764-4864-9703-4a73d4707cd7	1	20	t	28f9ae76-4409-4f30-aba0-93d1bfd35510	\N
737901c1-96a1-4c05-94fb-dce980b6a0d2	\N	auth-cookie	91cb1cd2-e133-4f67-9800-593c809120c8	c5fe27ef-f6cf-4ed0-a7b7-a970c9d85c07	2	10	f	\N	\N
aa6e558b-bfe8-41bb-89c7-95de35fea90b	\N	auth-spnego	91cb1cd2-e133-4f67-9800-593c809120c8	c5fe27ef-f6cf-4ed0-a7b7-a970c9d85c07	3	20	f	\N	\N
a945be85-0207-4c0d-b837-a9a7d6938a9c	\N	identity-provider-redirector	91cb1cd2-e133-4f67-9800-593c809120c8	c5fe27ef-f6cf-4ed0-a7b7-a970c9d85c07	2	25	f	\N	\N
02a0ba80-e0a1-4147-9791-faa257da1c37	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	c5fe27ef-f6cf-4ed0-a7b7-a970c9d85c07	2	30	t	23e37bd9-ee78-405a-9193-ebd627bafbf4	\N
5df57deb-ab01-44c6-96f0-39d54d269207	\N	client-secret	91cb1cd2-e133-4f67-9800-593c809120c8	fdc6a00e-492e-405e-b05c-c5abb2683d7f	2	10	f	\N	\N
c711b4e4-c26f-4a5d-8caf-888fbf9159ba	\N	client-jwt	91cb1cd2-e133-4f67-9800-593c809120c8	fdc6a00e-492e-405e-b05c-c5abb2683d7f	2	20	f	\N	\N
00e4056d-82fb-4476-ac92-fd495f95a797	\N	client-secret-jwt	91cb1cd2-e133-4f67-9800-593c809120c8	fdc6a00e-492e-405e-b05c-c5abb2683d7f	2	30	f	\N	\N
2e65c61d-0d1c-4bf0-9753-8af4239870ac	\N	client-x509	91cb1cd2-e133-4f67-9800-593c809120c8	fdc6a00e-492e-405e-b05c-c5abb2683d7f	2	40	f	\N	\N
8c7bb003-6999-4e93-b46b-46ea8e68c43f	\N	direct-grant-validate-username	91cb1cd2-e133-4f67-9800-593c809120c8	7260a2fe-a2c7-4ef8-b667-384ea105e48c	0	10	f	\N	\N
773d5acc-3c8a-4dff-a50e-0945599c603a	\N	direct-grant-validate-password	91cb1cd2-e133-4f67-9800-593c809120c8	7260a2fe-a2c7-4ef8-b667-384ea105e48c	0	20	f	\N	\N
9b765adb-eeb1-4646-97a6-f27e2f844353	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	7260a2fe-a2c7-4ef8-b667-384ea105e48c	1	30	t	0db527ce-9167-4342-b777-809d5f01690c	\N
c33802f1-20b5-4e18-828b-896d5a0d5707	\N	docker-http-basic-authenticator	91cb1cd2-e133-4f67-9800-593c809120c8	345ad828-cfa2-441f-a3df-e563e5753bc6	0	10	f	\N	\N
49f4ff5a-0b2b-4eb3-992c-555c49dc6ac2	\N	idp-review-profile	91cb1cd2-e133-4f67-9800-593c809120c8	792c2108-f3ec-4bf8-9ab2-b2c403d690a2	0	10	f	\N	4d106d59-7b2e-4e1f-9c70-bb19c5d945ac
fe93baae-4708-404d-8ef6-15abfcc6203d	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	792c2108-f3ec-4bf8-9ab2-b2c403d690a2	0	20	t	24568e35-fa59-4e94-82b6-cecdb7a3c2c1	\N
abf4f8fd-7c09-45e8-97e6-1e145a95a41e	\N	auth-username-password-form	91cb1cd2-e133-4f67-9800-593c809120c8	23e37bd9-ee78-405a-9193-ebd627bafbf4	0	10	f	\N	\N
f2d84555-0b94-4592-8044-7a812933d329	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	23e37bd9-ee78-405a-9193-ebd627bafbf4	1	20	t	2a61cbc9-b42e-4f01-ac04-7a3b08cd20c3	\N
3e68adeb-bf1c-4003-bbe2-a4f4f52ca726	\N	no-cookie-redirect	91cb1cd2-e133-4f67-9800-593c809120c8	1859c8a6-4419-4f80-927a-75d37cf95bea	0	10	f	\N	\N
46a0070d-2ef4-43ae-a7b1-68ab962edcb7	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	1859c8a6-4419-4f80-927a-75d37cf95bea	0	20	t	67c20226-0e17-4ad5-baae-d900e17ee5df	\N
7388b165-c95f-4048-af34-3ac023d4cb1c	\N	registration-page-form	91cb1cd2-e133-4f67-9800-593c809120c8	e407d55b-01d8-4988-9a73-7f1b90fc1c82	0	10	t	ba1b692a-193e-4368-acdc-4604ee9260db	\N
b3c9f4b0-8d71-4020-b79b-3d466c4cadbd	\N	registration-user-creation	91cb1cd2-e133-4f67-9800-593c809120c8	ba1b692a-193e-4368-acdc-4604ee9260db	0	20	f	\N	\N
de702471-9044-4e87-b3a9-d1e9f1e0383b	\N	registration-profile-action	91cb1cd2-e133-4f67-9800-593c809120c8	ba1b692a-193e-4368-acdc-4604ee9260db	0	40	f	\N	\N
0d6234a5-3b36-4503-b1b7-e31178bd0604	\N	registration-password-action	91cb1cd2-e133-4f67-9800-593c809120c8	ba1b692a-193e-4368-acdc-4604ee9260db	0	50	f	\N	\N
0c646e5c-81e7-4920-bede-4ae9a05a1c85	\N	registration-recaptcha-action	91cb1cd2-e133-4f67-9800-593c809120c8	ba1b692a-193e-4368-acdc-4604ee9260db	3	60	f	\N	\N
9cb3ad66-8cf8-4cf9-943d-df43567a8d54	\N	reset-credentials-choose-user	91cb1cd2-e133-4f67-9800-593c809120c8	b9e641e6-c58f-4ff8-a0b7-43dbf66801fd	0	10	f	\N	\N
a7b9fdca-5d6f-479d-b0b9-baabd8e9ff2c	\N	reset-credential-email	91cb1cd2-e133-4f67-9800-593c809120c8	b9e641e6-c58f-4ff8-a0b7-43dbf66801fd	0	20	f	\N	\N
0fbaa400-c62b-4a16-b80a-d0c3197f2605	\N	reset-password	91cb1cd2-e133-4f67-9800-593c809120c8	b9e641e6-c58f-4ff8-a0b7-43dbf66801fd	0	30	f	\N	\N
6c29693d-7d8e-4fb0-8827-77aa9df66efe	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	b9e641e6-c58f-4ff8-a0b7-43dbf66801fd	1	40	t	437b9434-5364-4e26-b40e-61ca061e63ba	\N
7e424d86-0c84-4da4-95cc-9aa9a126e33f	\N	http-basic-authenticator	91cb1cd2-e133-4f67-9800-593c809120c8	d8fb5b90-d16c-48e7-89ff-77c5b5772c8b	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
417e8661-f238-485c-bf0a-b9e4c2309e4a	browser	browser based authentication	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	t	t
f8f813cd-6950-49a8-bc40-4d92bc337e99	forms	Username, password, otp and other auth forms.	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	f	t
865fdea7-cd1b-4970-8ed1-1351f0cfe440	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	f	t
bc87652a-1e4a-41fe-a9cf-caa20ab1130d	direct grant	OpenID Connect Resource Owner Grant	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	t	t
93f5bcca-145f-4ec0-a237-efcaa85ca405	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	f	t
ff104bbd-8ba5-4cd4-be53-71e7394d2a20	registration	registration flow	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	t	t
0a94c760-ec30-4f15-964e-b788db98bded	registration form	registration form	77f2a7e8-ac8b-47fd-b466-46732acc31f5	form-flow	f	t
be99312d-a937-4052-af84-befa735f35b8	reset credentials	Reset credentials for a user if they forgot their password or something	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	t	t
ba6b725f-7fa5-4f6f-8b57-1da7a57934d1	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	f	t
bf977d4e-73e3-44f0-98ff-ba1efc2e6d7a	clients	Base authentication for clients	77f2a7e8-ac8b-47fd-b466-46732acc31f5	client-flow	t	t
ea70b24a-cba8-4966-a4c7-2297c8591c3c	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	t	t
65720a55-df81-4d41-bd80-095cdfde7522	User creation or linking	Flow for the existing/non-existing user alternatives	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	f	t
6f5ad353-3560-4fe6-8bbf-11c2c79c8f5b	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	f	t
108a95cd-8400-47b5-be5d-37140ad81217	Account verification options	Method with which to verity the existing account	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	f	t
7b102e54-86f3-4735-9916-d1d2f63050d8	Verify Existing Account by Re-authentication	Reauthentication of existing account	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	f	t
d25492f8-9d0b-4edf-a9f2-a7335c0dbd19	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	f	t
2594178b-a48a-4ff2-86d5-aadaf0914ba2	saml ecp	SAML ECP Profile Authentication Flow	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	t	t
16287895-5e08-4df5-b79b-ef310056bc92	docker auth	Used by Docker clients to authenticate against the IDP	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	t	t
f473ed7d-9c07-459b-80e9-4588174d4599	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	t	t
4cf28d5b-b3bb-4d36-a478-5adc01653d68	Authentication Options	Authentication options.	77f2a7e8-ac8b-47fd-b466-46732acc31f5	basic-flow	f	t
180c455c-d9cc-4caf-9335-3e3a4da2f11a	Account verification options	Method with which to verity the existing account	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
67c20226-0e17-4ad5-baae-d900e17ee5df	Authentication Options	Authentication options.	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
2a61cbc9-b42e-4f01-ac04-7a3b08cd20c3	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
0db527ce-9167-4342-b777-809d5f01690c	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
28f9ae76-4409-4f30-aba0-93d1bfd35510	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
0c5efeb2-e514-44e3-9062-74bef406dbbf	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
437b9434-5364-4e26-b40e-61ca061e63ba	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
24568e35-fa59-4e94-82b6-cecdb7a3c2c1	User creation or linking	Flow for the existing/non-existing user alternatives	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
fe1a15e0-6764-4864-9703-4a73d4707cd7	Verify Existing Account by Re-authentication	Reauthentication of existing account	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
c5fe27ef-f6cf-4ed0-a7b7-a970c9d85c07	browser	browser based authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
fdc6a00e-492e-405e-b05c-c5abb2683d7f	clients	Base authentication for clients	91cb1cd2-e133-4f67-9800-593c809120c8	client-flow	t	t
7260a2fe-a2c7-4ef8-b667-384ea105e48c	direct grant	OpenID Connect Resource Owner Grant	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
345ad828-cfa2-441f-a3df-e563e5753bc6	docker auth	Used by Docker clients to authenticate against the IDP	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
792c2108-f3ec-4bf8-9ab2-b2c403d690a2	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
23e37bd9-ee78-405a-9193-ebd627bafbf4	forms	Username, password, otp and other auth forms.	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
1859c8a6-4419-4f80-927a-75d37cf95bea	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
e407d55b-01d8-4988-9a73-7f1b90fc1c82	registration	registration flow	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
ba1b692a-193e-4368-acdc-4604ee9260db	registration form	registration form	91cb1cd2-e133-4f67-9800-593c809120c8	form-flow	f	t
b9e641e6-c58f-4ff8-a0b7-43dbf66801fd	reset credentials	Reset credentials for a user if they forgot their password or something	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
d8fb5b90-d16c-48e7-89ff-77c5b5772c8b	saml ecp	SAML ECP Profile Authentication Flow	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
a17da31c-5bba-4757-865b-13394926b7bb	review profile config	77f2a7e8-ac8b-47fd-b466-46732acc31f5
d9840046-66d4-4016-96a6-34642225b773	create unique user config	77f2a7e8-ac8b-47fd-b466-46732acc31f5
5d7b5658-4693-41a7-9575-ccca78548d2c	create unique user config	91cb1cd2-e133-4f67-9800-593c809120c8
4d106d59-7b2e-4e1f-9c70-bb19c5d945ac	review profile config	91cb1cd2-e133-4f67-9800-593c809120c8
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
a17da31c-5bba-4757-865b-13394926b7bb	missing	update.profile.on.first.login
d9840046-66d4-4016-96a6-34642225b773	false	require.password.update.after.registration
5d7b5658-4693-41a7-9575-ccca78548d2c	false	require.password.update.after.registration
4d106d59-7b2e-4e1f-9c70-bb19c5d945ac	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
33aa2816-81f6-4e2e-bea7-18d3423818fe	t	f	master-realm	0	f	\N	\N	t	\N	f	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	77f2a7e8-ac8b-47fd-b466-46732acc31f5	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	77f2a7e8-ac8b-47fd-b466-46732acc31f5	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
32cdc323-2595-496f-b688-3d90887806de	t	f	broker	0	f	\N	\N	t	\N	f	77f2a7e8-ac8b-47fd-b466-46732acc31f5	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	77f2a7e8-ac8b-47fd-b466-46732acc31f5	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
cb62ffa7-39b7-463b-8c6d-d27849641e14	t	f	admin-cli	0	t	\N	\N	f	\N	f	77f2a7e8-ac8b-47fd-b466-46732acc31f5	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	f	ghoverblog-realm	0	f	\N	\N	t	\N	f	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N	0	f	f	ghoverblog Realm	f	client-secret	\N	\N	\N	t	f	f	f
42b5d478-6044-4e3d-aff5-837150682d0c	t	f	account	0	t	\N	/realms/ghoverblog/account/	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
255e96f7-f58d-4d04-b853-009fefecd80d	t	f	account-console	0	t	\N	/realms/ghoverblog/account/	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	t	f	admin-cli	0	t	\N	\N	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
1d288522-1a62-43b1-9932-f23aa8959705	t	f	broker	0	f	\N	\N	t	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
dd60301a-3b36-4b7b-b7f2-538c72209465	t	t	overblog_DEV	0	t	\N	http://localhost:4200/*	f		f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	-1	t	f		f	client-secret	http://localhost:4200/		\N	t	f	t	t
de37e667-e65f-4127-88b0-040889a26d6c	t	f	realm-management	0	f	\N	\N	t	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
85a82e6e-ccb6-4153-8304-3645d119899b	t	f	security-admin-console	0	t	\N	/admin/ghoverblog/console/	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	+	post.logout.redirect.uris
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	+	post.logout.redirect.uris
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	S256	pkce.code.challenge.method
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	+	post.logout.redirect.uris
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	S256	pkce.code.challenge.method
42b5d478-6044-4e3d-aff5-837150682d0c	+	post.logout.redirect.uris
255e96f7-f58d-4d04-b853-009fefecd80d	+	post.logout.redirect.uris
255e96f7-f58d-4d04-b853-009fefecd80d	S256	pkce.code.challenge.method
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	+	post.logout.redirect.uris
1d288522-1a62-43b1-9932-f23aa8959705	+	post.logout.redirect.uris
dd60301a-3b36-4b7b-b7f2-538c72209465	false	oidc.ciba.grant.enabled
dd60301a-3b36-4b7b-b7f2-538c72209465	true	backchannel.logout.session.required
dd60301a-3b36-4b7b-b7f2-538c72209465	keycloak	login_theme
dd60301a-3b36-4b7b-b7f2-538c72209465	http://localhost:4200	post.logout.redirect.uris
dd60301a-3b36-4b7b-b7f2-538c72209465	false	display.on.consent.screen
dd60301a-3b36-4b7b-b7f2-538c72209465	false	oauth2.device.authorization.grant.enabled
dd60301a-3b36-4b7b-b7f2-538c72209465	false	backchannel.logout.revoke.offline.tokens
de37e667-e65f-4127-88b0-040889a26d6c	+	post.logout.redirect.uris
85a82e6e-ccb6-4153-8304-3645d119899b	+	post.logout.redirect.uris
85a82e6e-ccb6-4153-8304-3645d119899b	S256	pkce.code.challenge.method
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
0895b4fd-ea15-4315-bbae-634a5ea7022c	offline_access	77f2a7e8-ac8b-47fd-b466-46732acc31f5	OpenID Connect built-in scope: offline_access	openid-connect
a48345b2-65fd-4c2d-ad37-5a1e92f4948b	role_list	77f2a7e8-ac8b-47fd-b466-46732acc31f5	SAML role list	saml
5f1e0a28-c55e-420d-88ab-aca5f17069c1	profile	77f2a7e8-ac8b-47fd-b466-46732acc31f5	OpenID Connect built-in scope: profile	openid-connect
53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	email	77f2a7e8-ac8b-47fd-b466-46732acc31f5	OpenID Connect built-in scope: email	openid-connect
d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	address	77f2a7e8-ac8b-47fd-b466-46732acc31f5	OpenID Connect built-in scope: address	openid-connect
4c95cac8-c059-4aad-8d23-f57d68810b58	phone	77f2a7e8-ac8b-47fd-b466-46732acc31f5	OpenID Connect built-in scope: phone	openid-connect
001d6de2-5970-45e4-ab8e-e3835c04bdfc	roles	77f2a7e8-ac8b-47fd-b466-46732acc31f5	OpenID Connect scope for add user roles to the access token	openid-connect
f735010e-8af4-4207-9278-bceabf0a2e95	web-origins	77f2a7e8-ac8b-47fd-b466-46732acc31f5	OpenID Connect scope for add allowed web origins to the access token	openid-connect
22adc317-eae5-481e-84d3-05e8a05aa59c	microprofile-jwt	77f2a7e8-ac8b-47fd-b466-46732acc31f5	Microprofile - JWT built-in scope	openid-connect
21e9e9ce-9439-419a-bcfe-a2650346c5b6	acr	77f2a7e8-ac8b-47fd-b466-46732acc31f5	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
dcd0bee6-81c7-41a4-95c7-8ef471f111ef	email	91cb1cd2-e133-4f67-9800-593c809120c8	OpenID Connect built-in scope: email	openid-connect
3f230cc1-3768-41b7-9b22-974aedee8acc	profile	91cb1cd2-e133-4f67-9800-593c809120c8	OpenID Connect built-in scope: profile	openid-connect
0a896f39-565a-4c91-812d-4e7d02b9f019	web-origins	91cb1cd2-e133-4f67-9800-593c809120c8	OpenID Connect scope for add allowed web origins to the access token	openid-connect
ae3a02b3-dab8-4d85-9aa6-00e381d39d88	roles	91cb1cd2-e133-4f67-9800-593c809120c8	OpenID Connect scope for add user roles to the access token	openid-connect
dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	offline_access	91cb1cd2-e133-4f67-9800-593c809120c8	OpenID Connect built-in scope: offline_access	openid-connect
471a4340-ffd4-490b-99d9-4a5750bab7b5	phone	91cb1cd2-e133-4f67-9800-593c809120c8	OpenID Connect built-in scope: phone	openid-connect
3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	microprofile-jwt	91cb1cd2-e133-4f67-9800-593c809120c8	Microprofile - JWT built-in scope	openid-connect
3a253936-dbc8-4764-8c5c-c046055cb129	address	91cb1cd2-e133-4f67-9800-593c809120c8	OpenID Connect built-in scope: address	openid-connect
9cedc1dc-c4ac-40dc-906f-33f5062a44c9	role_list	91cb1cd2-e133-4f67-9800-593c809120c8	SAML role list	saml
07700bf6-988b-451a-822e-cdd0c00e2eba	acr	91cb1cd2-e133-4f67-9800-593c809120c8	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
0895b4fd-ea15-4315-bbae-634a5ea7022c	true	display.on.consent.screen
0895b4fd-ea15-4315-bbae-634a5ea7022c	${offlineAccessScopeConsentText}	consent.screen.text
a48345b2-65fd-4c2d-ad37-5a1e92f4948b	true	display.on.consent.screen
a48345b2-65fd-4c2d-ad37-5a1e92f4948b	${samlRoleListScopeConsentText}	consent.screen.text
5f1e0a28-c55e-420d-88ab-aca5f17069c1	true	display.on.consent.screen
5f1e0a28-c55e-420d-88ab-aca5f17069c1	${profileScopeConsentText}	consent.screen.text
5f1e0a28-c55e-420d-88ab-aca5f17069c1	true	include.in.token.scope
53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	true	display.on.consent.screen
53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	${emailScopeConsentText}	consent.screen.text
53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	true	include.in.token.scope
d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	true	display.on.consent.screen
d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	${addressScopeConsentText}	consent.screen.text
d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	true	include.in.token.scope
4c95cac8-c059-4aad-8d23-f57d68810b58	true	display.on.consent.screen
4c95cac8-c059-4aad-8d23-f57d68810b58	${phoneScopeConsentText}	consent.screen.text
4c95cac8-c059-4aad-8d23-f57d68810b58	true	include.in.token.scope
001d6de2-5970-45e4-ab8e-e3835c04bdfc	true	display.on.consent.screen
001d6de2-5970-45e4-ab8e-e3835c04bdfc	${rolesScopeConsentText}	consent.screen.text
001d6de2-5970-45e4-ab8e-e3835c04bdfc	false	include.in.token.scope
f735010e-8af4-4207-9278-bceabf0a2e95	false	display.on.consent.screen
f735010e-8af4-4207-9278-bceabf0a2e95		consent.screen.text
f735010e-8af4-4207-9278-bceabf0a2e95	false	include.in.token.scope
22adc317-eae5-481e-84d3-05e8a05aa59c	false	display.on.consent.screen
22adc317-eae5-481e-84d3-05e8a05aa59c	true	include.in.token.scope
21e9e9ce-9439-419a-bcfe-a2650346c5b6	false	display.on.consent.screen
21e9e9ce-9439-419a-bcfe-a2650346c5b6	false	include.in.token.scope
dcd0bee6-81c7-41a4-95c7-8ef471f111ef	true	include.in.token.scope
dcd0bee6-81c7-41a4-95c7-8ef471f111ef	true	display.on.consent.screen
dcd0bee6-81c7-41a4-95c7-8ef471f111ef	${emailScopeConsentText}	consent.screen.text
3f230cc1-3768-41b7-9b22-974aedee8acc	true	include.in.token.scope
3f230cc1-3768-41b7-9b22-974aedee8acc	true	display.on.consent.screen
3f230cc1-3768-41b7-9b22-974aedee8acc	${profileScopeConsentText}	consent.screen.text
0a896f39-565a-4c91-812d-4e7d02b9f019	false	include.in.token.scope
0a896f39-565a-4c91-812d-4e7d02b9f019	false	display.on.consent.screen
0a896f39-565a-4c91-812d-4e7d02b9f019		consent.screen.text
ae3a02b3-dab8-4d85-9aa6-00e381d39d88	false	include.in.token.scope
ae3a02b3-dab8-4d85-9aa6-00e381d39d88	true	display.on.consent.screen
ae3a02b3-dab8-4d85-9aa6-00e381d39d88	${rolesScopeConsentText}	consent.screen.text
dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	${offlineAccessScopeConsentText}	consent.screen.text
dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	true	display.on.consent.screen
471a4340-ffd4-490b-99d9-4a5750bab7b5	true	include.in.token.scope
471a4340-ffd4-490b-99d9-4a5750bab7b5	true	display.on.consent.screen
471a4340-ffd4-490b-99d9-4a5750bab7b5	${phoneScopeConsentText}	consent.screen.text
3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	true	include.in.token.scope
3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	false	display.on.consent.screen
3a253936-dbc8-4764-8c5c-c046055cb129	true	include.in.token.scope
3a253936-dbc8-4764-8c5c-c046055cb129	true	display.on.consent.screen
3a253936-dbc8-4764-8c5c-c046055cb129	${addressScopeConsentText}	consent.screen.text
9cedc1dc-c4ac-40dc-906f-33f5062a44c9	${samlRoleListScopeConsentText}	consent.screen.text
9cedc1dc-c4ac-40dc-906f-33f5062a44c9	true	display.on.consent.screen
07700bf6-988b-451a-822e-cdd0c00e2eba	false	include.in.token.scope
07700bf6-988b-451a-822e-cdd0c00e2eba	false	display.on.consent.screen
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	f735010e-8af4-4207-9278-bceabf0a2e95	t
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	21e9e9ce-9439-419a-bcfe-a2650346c5b6	t
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	001d6de2-5970-45e4-ab8e-e3835c04bdfc	t
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	t
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	5f1e0a28-c55e-420d-88ab-aca5f17069c1	t
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	f
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	4c95cac8-c059-4aad-8d23-f57d68810b58	f
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	22adc317-eae5-481e-84d3-05e8a05aa59c	f
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	0895b4fd-ea15-4315-bbae-634a5ea7022c	f
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	f735010e-8af4-4207-9278-bceabf0a2e95	t
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	21e9e9ce-9439-419a-bcfe-a2650346c5b6	t
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	001d6de2-5970-45e4-ab8e-e3835c04bdfc	t
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	t
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	5f1e0a28-c55e-420d-88ab-aca5f17069c1	t
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	f
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	4c95cac8-c059-4aad-8d23-f57d68810b58	f
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	22adc317-eae5-481e-84d3-05e8a05aa59c	f
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	0895b4fd-ea15-4315-bbae-634a5ea7022c	f
cb62ffa7-39b7-463b-8c6d-d27849641e14	f735010e-8af4-4207-9278-bceabf0a2e95	t
cb62ffa7-39b7-463b-8c6d-d27849641e14	21e9e9ce-9439-419a-bcfe-a2650346c5b6	t
cb62ffa7-39b7-463b-8c6d-d27849641e14	001d6de2-5970-45e4-ab8e-e3835c04bdfc	t
cb62ffa7-39b7-463b-8c6d-d27849641e14	53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	t
cb62ffa7-39b7-463b-8c6d-d27849641e14	5f1e0a28-c55e-420d-88ab-aca5f17069c1	t
cb62ffa7-39b7-463b-8c6d-d27849641e14	d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	f
cb62ffa7-39b7-463b-8c6d-d27849641e14	4c95cac8-c059-4aad-8d23-f57d68810b58	f
cb62ffa7-39b7-463b-8c6d-d27849641e14	22adc317-eae5-481e-84d3-05e8a05aa59c	f
cb62ffa7-39b7-463b-8c6d-d27849641e14	0895b4fd-ea15-4315-bbae-634a5ea7022c	f
32cdc323-2595-496f-b688-3d90887806de	f735010e-8af4-4207-9278-bceabf0a2e95	t
32cdc323-2595-496f-b688-3d90887806de	21e9e9ce-9439-419a-bcfe-a2650346c5b6	t
32cdc323-2595-496f-b688-3d90887806de	001d6de2-5970-45e4-ab8e-e3835c04bdfc	t
32cdc323-2595-496f-b688-3d90887806de	53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	t
32cdc323-2595-496f-b688-3d90887806de	5f1e0a28-c55e-420d-88ab-aca5f17069c1	t
32cdc323-2595-496f-b688-3d90887806de	d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	f
32cdc323-2595-496f-b688-3d90887806de	4c95cac8-c059-4aad-8d23-f57d68810b58	f
32cdc323-2595-496f-b688-3d90887806de	22adc317-eae5-481e-84d3-05e8a05aa59c	f
32cdc323-2595-496f-b688-3d90887806de	0895b4fd-ea15-4315-bbae-634a5ea7022c	f
33aa2816-81f6-4e2e-bea7-18d3423818fe	f735010e-8af4-4207-9278-bceabf0a2e95	t
33aa2816-81f6-4e2e-bea7-18d3423818fe	21e9e9ce-9439-419a-bcfe-a2650346c5b6	t
33aa2816-81f6-4e2e-bea7-18d3423818fe	001d6de2-5970-45e4-ab8e-e3835c04bdfc	t
33aa2816-81f6-4e2e-bea7-18d3423818fe	53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	t
33aa2816-81f6-4e2e-bea7-18d3423818fe	5f1e0a28-c55e-420d-88ab-aca5f17069c1	t
33aa2816-81f6-4e2e-bea7-18d3423818fe	d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	f
33aa2816-81f6-4e2e-bea7-18d3423818fe	4c95cac8-c059-4aad-8d23-f57d68810b58	f
33aa2816-81f6-4e2e-bea7-18d3423818fe	22adc317-eae5-481e-84d3-05e8a05aa59c	f
33aa2816-81f6-4e2e-bea7-18d3423818fe	0895b4fd-ea15-4315-bbae-634a5ea7022c	f
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	f735010e-8af4-4207-9278-bceabf0a2e95	t
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	21e9e9ce-9439-419a-bcfe-a2650346c5b6	t
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	001d6de2-5970-45e4-ab8e-e3835c04bdfc	t
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	t
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	5f1e0a28-c55e-420d-88ab-aca5f17069c1	t
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	f
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	4c95cac8-c059-4aad-8d23-f57d68810b58	f
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	22adc317-eae5-481e-84d3-05e8a05aa59c	f
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	0895b4fd-ea15-4315-bbae-634a5ea7022c	f
42b5d478-6044-4e3d-aff5-837150682d0c	0a896f39-565a-4c91-812d-4e7d02b9f019	t
42b5d478-6044-4e3d-aff5-837150682d0c	07700bf6-988b-451a-822e-cdd0c00e2eba	t
42b5d478-6044-4e3d-aff5-837150682d0c	3f230cc1-3768-41b7-9b22-974aedee8acc	t
42b5d478-6044-4e3d-aff5-837150682d0c	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
42b5d478-6044-4e3d-aff5-837150682d0c	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
42b5d478-6044-4e3d-aff5-837150682d0c	3a253936-dbc8-4764-8c5c-c046055cb129	f
42b5d478-6044-4e3d-aff5-837150682d0c	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
42b5d478-6044-4e3d-aff5-837150682d0c	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
42b5d478-6044-4e3d-aff5-837150682d0c	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
255e96f7-f58d-4d04-b853-009fefecd80d	0a896f39-565a-4c91-812d-4e7d02b9f019	t
255e96f7-f58d-4d04-b853-009fefecd80d	07700bf6-988b-451a-822e-cdd0c00e2eba	t
255e96f7-f58d-4d04-b853-009fefecd80d	3f230cc1-3768-41b7-9b22-974aedee8acc	t
255e96f7-f58d-4d04-b853-009fefecd80d	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
255e96f7-f58d-4d04-b853-009fefecd80d	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
255e96f7-f58d-4d04-b853-009fefecd80d	3a253936-dbc8-4764-8c5c-c046055cb129	f
255e96f7-f58d-4d04-b853-009fefecd80d	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
255e96f7-f58d-4d04-b853-009fefecd80d	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
255e96f7-f58d-4d04-b853-009fefecd80d	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	0a896f39-565a-4c91-812d-4e7d02b9f019	t
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	07700bf6-988b-451a-822e-cdd0c00e2eba	t
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	3f230cc1-3768-41b7-9b22-974aedee8acc	t
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	3a253936-dbc8-4764-8c5c-c046055cb129	f
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
1d288522-1a62-43b1-9932-f23aa8959705	0a896f39-565a-4c91-812d-4e7d02b9f019	t
1d288522-1a62-43b1-9932-f23aa8959705	07700bf6-988b-451a-822e-cdd0c00e2eba	t
1d288522-1a62-43b1-9932-f23aa8959705	3f230cc1-3768-41b7-9b22-974aedee8acc	t
1d288522-1a62-43b1-9932-f23aa8959705	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
1d288522-1a62-43b1-9932-f23aa8959705	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
1d288522-1a62-43b1-9932-f23aa8959705	3a253936-dbc8-4764-8c5c-c046055cb129	f
1d288522-1a62-43b1-9932-f23aa8959705	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
1d288522-1a62-43b1-9932-f23aa8959705	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
1d288522-1a62-43b1-9932-f23aa8959705	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
dd60301a-3b36-4b7b-b7f2-538c72209465	0a896f39-565a-4c91-812d-4e7d02b9f019	t
dd60301a-3b36-4b7b-b7f2-538c72209465	07700bf6-988b-451a-822e-cdd0c00e2eba	t
dd60301a-3b36-4b7b-b7f2-538c72209465	3f230cc1-3768-41b7-9b22-974aedee8acc	t
dd60301a-3b36-4b7b-b7f2-538c72209465	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
dd60301a-3b36-4b7b-b7f2-538c72209465	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
dd60301a-3b36-4b7b-b7f2-538c72209465	3a253936-dbc8-4764-8c5c-c046055cb129	f
dd60301a-3b36-4b7b-b7f2-538c72209465	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
dd60301a-3b36-4b7b-b7f2-538c72209465	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
dd60301a-3b36-4b7b-b7f2-538c72209465	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
de37e667-e65f-4127-88b0-040889a26d6c	0a896f39-565a-4c91-812d-4e7d02b9f019	t
de37e667-e65f-4127-88b0-040889a26d6c	07700bf6-988b-451a-822e-cdd0c00e2eba	t
de37e667-e65f-4127-88b0-040889a26d6c	3f230cc1-3768-41b7-9b22-974aedee8acc	t
de37e667-e65f-4127-88b0-040889a26d6c	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
de37e667-e65f-4127-88b0-040889a26d6c	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
de37e667-e65f-4127-88b0-040889a26d6c	3a253936-dbc8-4764-8c5c-c046055cb129	f
de37e667-e65f-4127-88b0-040889a26d6c	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
de37e667-e65f-4127-88b0-040889a26d6c	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
de37e667-e65f-4127-88b0-040889a26d6c	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
85a82e6e-ccb6-4153-8304-3645d119899b	0a896f39-565a-4c91-812d-4e7d02b9f019	t
85a82e6e-ccb6-4153-8304-3645d119899b	07700bf6-988b-451a-822e-cdd0c00e2eba	t
85a82e6e-ccb6-4153-8304-3645d119899b	3f230cc1-3768-41b7-9b22-974aedee8acc	t
85a82e6e-ccb6-4153-8304-3645d119899b	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
85a82e6e-ccb6-4153-8304-3645d119899b	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
85a82e6e-ccb6-4153-8304-3645d119899b	3a253936-dbc8-4764-8c5c-c046055cb129	f
85a82e6e-ccb6-4153-8304-3645d119899b	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
85a82e6e-ccb6-4153-8304-3645d119899b	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
85a82e6e-ccb6-4153-8304-3645d119899b	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
0895b4fd-ea15-4315-bbae-634a5ea7022c	b5b4dfde-6d0d-4459-a820-a7764d20d06f
dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	d110694d-134d-4b14-aec0-530415e26704
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
25b0e450-2e5d-49c4-85b2-02d93efa8cf3	Trusted Hosts	77f2a7e8-ac8b-47fd-b466-46732acc31f5	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	77f2a7e8-ac8b-47fd-b466-46732acc31f5	anonymous
60e3d427-7318-4665-a15c-aa9becbd40e7	Consent Required	77f2a7e8-ac8b-47fd-b466-46732acc31f5	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	77f2a7e8-ac8b-47fd-b466-46732acc31f5	anonymous
f42c6757-0556-4a02-9311-c6a492b1b7e0	Full Scope Disabled	77f2a7e8-ac8b-47fd-b466-46732acc31f5	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	77f2a7e8-ac8b-47fd-b466-46732acc31f5	anonymous
3c216683-9e0d-47d3-97a4-01a005b122f3	Max Clients Limit	77f2a7e8-ac8b-47fd-b466-46732acc31f5	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	77f2a7e8-ac8b-47fd-b466-46732acc31f5	anonymous
4ca608c3-7691-4088-a0ae-bc07cf5b10d3	Allowed Protocol Mapper Types	77f2a7e8-ac8b-47fd-b466-46732acc31f5	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	77f2a7e8-ac8b-47fd-b466-46732acc31f5	anonymous
1e6a8c57-6772-4d89-8f93-87d068695c68	Allowed Client Scopes	77f2a7e8-ac8b-47fd-b466-46732acc31f5	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	77f2a7e8-ac8b-47fd-b466-46732acc31f5	anonymous
fbbb3c68-da1e-488f-b077-33e91e5d4042	Allowed Protocol Mapper Types	77f2a7e8-ac8b-47fd-b466-46732acc31f5	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	77f2a7e8-ac8b-47fd-b466-46732acc31f5	authenticated
7c5ba622-af49-433f-8a63-98087a278665	Allowed Client Scopes	77f2a7e8-ac8b-47fd-b466-46732acc31f5	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	77f2a7e8-ac8b-47fd-b466-46732acc31f5	authenticated
fd3f3adc-048e-4d39-a2f8-83feb6ef5ed0	rsa-generated	77f2a7e8-ac8b-47fd-b466-46732acc31f5	rsa-generated	org.keycloak.keys.KeyProvider	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N
93103a6a-fb9f-4beb-87c3-63a181a6083f	rsa-enc-generated	77f2a7e8-ac8b-47fd-b466-46732acc31f5	rsa-enc-generated	org.keycloak.keys.KeyProvider	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N
a1e44fe3-7dcd-4e32-91bb-0a7174aeb9f1	hmac-generated	77f2a7e8-ac8b-47fd-b466-46732acc31f5	hmac-generated	org.keycloak.keys.KeyProvider	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N
307d2ca9-e80e-4bf1-8902-b7bdc847ed9e	aes-generated	77f2a7e8-ac8b-47fd-b466-46732acc31f5	aes-generated	org.keycloak.keys.KeyProvider	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N
386fa898-2195-4f3d-8fde-939b3877f02e	Allowed Protocol Mapper Types	91cb1cd2-e133-4f67-9800-593c809120c8	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
c75c7476-d846-49e7-ac5d-0362a8351964	Allowed Protocol Mapper Types	91cb1cd2-e133-4f67-9800-593c809120c8	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	authenticated
5c82aadb-b771-4643-93f3-44004ca2276c	Allowed Client Scopes	91cb1cd2-e133-4f67-9800-593c809120c8	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	authenticated
7649d521-543a-44ee-9757-2580f313c03d	Allowed Client Scopes	91cb1cd2-e133-4f67-9800-593c809120c8	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
84ee0ff6-3d90-4a63-86f6-e096b2b3b55e	Consent Required	91cb1cd2-e133-4f67-9800-593c809120c8	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
b740d88a-7249-4761-b7f4-cbd3a9088c9b	Full Scope Disabled	91cb1cd2-e133-4f67-9800-593c809120c8	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
d13b325f-b4d0-4f95-b50a-f854f8dce599	Max Clients Limit	91cb1cd2-e133-4f67-9800-593c809120c8	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
c3a412a6-8bff-4786-843f-9e15a38d0d35	Trusted Hosts	91cb1cd2-e133-4f67-9800-593c809120c8	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
68344544-b0a0-4cdc-a375-c6aaf6da0c01	rsa-generated	91cb1cd2-e133-4f67-9800-593c809120c8	rsa-generated	org.keycloak.keys.KeyProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
2be845c2-1dd4-470c-897c-0c6e77eb3e9c	aes-generated	91cb1cd2-e133-4f67-9800-593c809120c8	aes-generated	org.keycloak.keys.KeyProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
3d7e0de5-7827-4e66-b09c-6b3ee2884e24	hmac-generated	91cb1cd2-e133-4f67-9800-593c809120c8	hmac-generated	org.keycloak.keys.KeyProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
fa662f9f-c916-423c-843b-19d549fcc0ff	rsa-enc-generated	91cb1cd2-e133-4f67-9800-593c809120c8	rsa-enc-generated	org.keycloak.keys.KeyProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
d9a67e6d-6f2b-4c2c-8237-25014a4d77a6	1e6a8c57-6772-4d89-8f93-87d068695c68	allow-default-scopes	true
e0e2d170-03a6-42de-87cd-7401e426e621	4ca608c3-7691-4088-a0ae-bc07cf5b10d3	allowed-protocol-mapper-types	saml-role-list-mapper
b0eb4059-42fc-412a-9d72-3e38ad624d53	4ca608c3-7691-4088-a0ae-bc07cf5b10d3	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
dca99fe9-e4ba-4668-9063-6c577333ce62	4ca608c3-7691-4088-a0ae-bc07cf5b10d3	allowed-protocol-mapper-types	saml-user-attribute-mapper
43fcffaf-e8b4-4e53-a0d6-405a9a43d3c8	4ca608c3-7691-4088-a0ae-bc07cf5b10d3	allowed-protocol-mapper-types	saml-user-property-mapper
c603c162-bf65-4407-98ea-4bc60a6b166b	4ca608c3-7691-4088-a0ae-bc07cf5b10d3	allowed-protocol-mapper-types	oidc-full-name-mapper
50d0bcf8-76ec-4157-b5eb-d5f37b023a3c	4ca608c3-7691-4088-a0ae-bc07cf5b10d3	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
3f2f24bb-2e9e-40bb-8a91-35d0f6780077	4ca608c3-7691-4088-a0ae-bc07cf5b10d3	allowed-protocol-mapper-types	oidc-address-mapper
7c54fed6-e591-49e8-96d9-015e885e8154	4ca608c3-7691-4088-a0ae-bc07cf5b10d3	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
f792b263-80a1-486c-8115-0b52d8990faa	3c216683-9e0d-47d3-97a4-01a005b122f3	max-clients	200
5da86c65-6cd0-4abf-a5a5-680d8de666bd	fbbb3c68-da1e-488f-b077-33e91e5d4042	allowed-protocol-mapper-types	saml-user-attribute-mapper
36743f9c-a8e2-454c-9c4c-0b9a5681ddbf	fbbb3c68-da1e-488f-b077-33e91e5d4042	allowed-protocol-mapper-types	oidc-full-name-mapper
5115b1df-ae64-4b0d-b760-b452ae6cb070	fbbb3c68-da1e-488f-b077-33e91e5d4042	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
4e2ad0b6-f8c0-4c6c-a9e3-a7cc252cc063	fbbb3c68-da1e-488f-b077-33e91e5d4042	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
643445ac-74b0-4370-b040-b445a85362c1	fbbb3c68-da1e-488f-b077-33e91e5d4042	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
2bd9893a-47c1-4d45-910e-736b45922722	fbbb3c68-da1e-488f-b077-33e91e5d4042	allowed-protocol-mapper-types	saml-user-property-mapper
fd02e847-5f5c-4003-8c78-bd5160edfcf5	fbbb3c68-da1e-488f-b077-33e91e5d4042	allowed-protocol-mapper-types	oidc-address-mapper
5d0e3fe2-d533-4da4-b5a7-05c993030b22	fbbb3c68-da1e-488f-b077-33e91e5d4042	allowed-protocol-mapper-types	saml-role-list-mapper
3e1481bf-d9a4-4234-88e2-078a24b5de1f	7c5ba622-af49-433f-8a63-98087a278665	allow-default-scopes	true
e427aaa9-adf8-4058-948c-a76a8d6e0e83	25b0e450-2e5d-49c4-85b2-02d93efa8cf3	client-uris-must-match	true
5574dd16-062a-4851-b048-459154f2e21a	25b0e450-2e5d-49c4-85b2-02d93efa8cf3	host-sending-registration-request-must-match	true
e7a66f21-f8e1-43c3-b6b6-19705b01cc81	fd3f3adc-048e-4d39-a2f8-83feb6ef5ed0	privateKey	MIIEogIBAAKCAQEAmcXSl+hGHuW8dz8UfBMxS5DwKXuHflaHs0hxpZIR4+tzeBlvdpcY7abx0qds0sfUliPQgghV+Y2V2gAE9F3EkBiNr+OtGzweVhyWD3siXB67leG4wziX+J5IcTa0MNL+Igbi0Kg2woPVF0Ap/V1hXDqwYVai0or82m4f6A0AAKXrljf9Ic4rfPZRWL2WeOsL5t0AJq99eE68Zt4YwaMRpKhzW4pxxykoOVWJuQtCjhSqq/qYprLlvYesWk4zNlmazV3Z4HDG/pecw2TTTvHDSoZ5ja4gQKa4l/UK+X99FhB1IHG3ZX+wy0m57Byq5aLlEBrK75UQvQ9JGR/lJ69GTwIDAQABAoIBAA+uWTNC2AJm73Os8UP/2bXjh2IrkIh6ftHHuvMlSgFsmB9bX1RVbzuDm+3H7gnb9UVZofXeBL/InPXuAj4Ai+lyijcGvYyP8mYEpJbajzPxXF7EoHNOrkyyU3UxchRNMpDkvoovBTqLzWtWuzwfotc6vZQyN14cwfvtDAA9cc50SdZYzG2PaMaor4PVPtmMajo0kR+Llw+1IZf53ZAoS85bEeH7Z3+4q+dePCoPjrRPAB45u+515Q10ooip9mzua4nlpcQVRTc9VqWeZZ0jb2soZJ3TEBywKsKH+PrBBpfI/qkpagxnAWVMiBWEXTVHjsnxAQgqN+qVDwWQ6evMcRkCgYEA1ZMvalK0vXSWsbxQ11CjQb5QmnynNuXQODICLol0WP0zQcFXCs3mSGac7/5xb2bIchgtajM5LY5hIztaJE0aU63dwDSffovvFqSZNY5HTfLO3Eim499djJeSK9XGSpbW5Bl/pYEVt4z/6DLUU/CZGEzUf71oYqxzf0bZRvBDlkkCgYEAuFGMLFdz8eOsF9gMs8NXrP9FCoaD5s+FD7xE/Ay2JPMql3XTTTcKfZtqdOgCc6HCC1FHBJN3ir2lInvEWH/c3DN7cKC9UihqE/jyusyiZJfkXQrrNi8iNgrq6YFUDumM44YuB1O4bIsF2EJinwXc/I4QV4YXdKwT2HsqehsPl9cCgYAX1CQmKLQhrzBhBDHA1C5i12kG04GUjm981ZeIua1RgG6Hl5quiep3iXtZC3p8g2s5z5jBkJWAj7ImzChyhGe7jlp/Z1+kLtiuHg85+nXaLI0H5tM3+WPmm8KjQWauS8YODQpA3PYfVIv4zDMEaoOqQmgzGF7dI4B/Ytg7IfNogQKBgCRxi0OhLv2exIIaZ7iLYSSFfIMuQZo7YdXQpdsoMENyCPPViif0QBDBz/S5gvKWAyX1thMDjVlTUflVe2b8MREg5MFKJuS9tOuqB2RD3cACAFcdN5CJFTyWQAhXV+Vy7DZ4a1VrikV733X4+kLzB9Svyi9kBfM9qtbc03M9MoIVAoGAJWNqqQTxkFTSvgvV3a2ZtPxro3zgqklBQxwKp52836zy5JJqW+5SSbWh+5okBF4EYDe3MlaCLmNekix27lrwcEBRb1aJcPuO3MhtGymUA07Hze+LwtyWPQEZjeu50uSlUl1aHkf3eUrVC82VyRSCbWS6zGsNS6L/MUo4eexI0dI=
5294a3ed-fbdf-46e4-a8f0-a1f7f2259f09	fd3f3adc-048e-4d39-a2f8-83feb6ef5ed0	keyUse	SIG
a8d8e782-1f67-4c18-88df-c2a9423ccb61	fd3f3adc-048e-4d39-a2f8-83feb6ef5ed0	certificate	MIICmzCCAYMCBgGIAKTlFzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNTA5MTMxMTI2WhcNMzMwNTA5MTMxMzA2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCZxdKX6EYe5bx3PxR8EzFLkPApe4d+VoezSHGlkhHj63N4GW92lxjtpvHSp2zSx9SWI9CCCFX5jZXaAAT0XcSQGI2v460bPB5WHJYPeyJcHruV4bjDOJf4nkhxNrQw0v4iBuLQqDbCg9UXQCn9XWFcOrBhVqLSivzabh/oDQAApeuWN/0hzit89lFYvZZ46wvm3QAmr314Trxm3hjBoxGkqHNbinHHKSg5VYm5C0KOFKqr+pimsuW9h6xaTjM2WZrNXdngcMb+l5zDZNNO8cNKhnmNriBApriX9Qr5f30WEHUgcbdlf7DLSbnsHKrlouUQGsrvlRC9D0kZH+Unr0ZPAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAD05RgAlHrylFIfOREOrFoEey+Tnt1fatP1PbXigY8M/EMIOTx1NSpt+5rRI6ka7mXvAoNWned5K33/KBw1etsJM3YFeF7w4+dJ+TjPoinoRbkFWWC+hAyJQLy+EhLG23VYodFl2zOwILJ973cLxYoOGOt3LI4AZux7AqXacnQyoo/63La8NO6QPUiYX2lzTUQezO0LI0TcPrzlXQj49N89TGQuIH/UYUb7ZaC1+ykLgp1/TGV8f27+rLNe7KQRJlWN2YPkI1IzmyWONno5lZ3aITrkrAuDJ6oPaX4/Ri6YRB3hxa+KZHUjhlqc2KAdOqGloSDY7BakvDKnVxQvYSgE=
f9d6cce8-1f65-43f3-9668-d3c9b1782b6c	fd3f3adc-048e-4d39-a2f8-83feb6ef5ed0	priority	100
7c0fdfa1-c4e3-4fb9-8e22-acdb52360acb	307d2ca9-e80e-4bf1-8902-b7bdc847ed9e	secret	Fjg3zAhDnjqpHPUBCjcbww
8016c578-3175-49d6-ab91-fa70798a3d1f	307d2ca9-e80e-4bf1-8902-b7bdc847ed9e	priority	100
83e8dc5c-2423-4837-8875-8bf862bd2e9f	307d2ca9-e80e-4bf1-8902-b7bdc847ed9e	kid	78fcf0b3-d2ad-41a0-91dd-2a43a088257f
45e9ef57-9e76-42df-811f-881930ab3e04	93103a6a-fb9f-4beb-87c3-63a181a6083f	priority	100
91ad4a92-dc79-4e1d-900f-176e207bf292	93103a6a-fb9f-4beb-87c3-63a181a6083f	keyUse	ENC
2f180943-471c-43d6-9a5f-fd214ce4f2ba	93103a6a-fb9f-4beb-87c3-63a181a6083f	algorithm	RSA-OAEP
b46ed93b-bbcd-4f60-aaf2-81938ac03e57	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
abfe897f-a195-49f8-837c-4119e08a11af	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-user-attribute-mapper
979d9941-b9c9-44d0-88ac-4dc0b69b8a06	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-full-name-mapper
ea98c47a-8a86-494e-932d-801d73103ef4	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-role-list-mapper
075c045a-6ff5-462a-a573-f292a95d0f8e	5c82aadb-b771-4643-93f3-44004ca2276c	allow-default-scopes	true
33a62c25-2230-493f-b1ab-3a72035c0015	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	kid	6778ddce-5197-49ed-8082-7d624e999a7f
7b4e6693-49d1-40f9-a72e-11a151c9db72	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	priority	100
e3c23fc6-742c-4570-a716-c2d9632adbd9	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	secret	LzqvhjfauWg0IrRv-4_kpw
656426d6-aca7-45b9-bf10-b3fb078b8b7b	93103a6a-fb9f-4beb-87c3-63a181a6083f	privateKey	MIIEogIBAAKCAQEAjp2l/ilOQQ37I8UbOOb6IrpmRhD3NnDR8YmMdWtdOdOv/bhAAUeBQwGFi9zXou1Qs9dDMisRrWCTikr5NNEihQSCscfY6b9A+4jHg2Oi2FB0uk+py0AMeV90lRGpNbHaNuhJrTmiW3P1wbvha37uIgZ/+dde2JfBaG/VVOY65lw/oJeQTbbTXDYoZu/IELdfketwAyO81uO/2NpWIo4wVRJ10O3d/9/znVOMTO2Ct+mTYJs65FcIDnidQl659JPohJklpSjpgHv7vA1d37HFfqJUo2fY/GlmjAyhcGNcaCs7PFFz7PrJz7mQJlcLcdf3AmWtCfKhB8jw3SKHwc0qxwIDAQABAoIBABt46d9udIkamNy4nPhWoiurbYUkwoJltEOLhBegYXqAuT+uTQISFKfkNKYPGijj/y5Nkr+oxUR5PKKgs6XFfZlTF5wIi9PnSCzMGebI/DcgNIQpUWN6SIze4vXOS6KwyoDWOU8ZsZldWqOBvjg3YMcEKoXlw3sErLiiBl3O5dy28dR05BtYnPfTb5KL/q4zMScMFXQdygFddW+/9oE7dxny0rQjwQpd8ZFGpPmjg5ag3NzS8QvmQgsLe5fKNSPpyl6WOIACy6AEoY/WExzChddLxRElHPbT5S+TsG6eI7DywzVrokkWGnAt+Hgc4lYASdEMCGXk5OC4y5d6w+Tn4P0CgYEAxEnUJt4ZVriM0gBs2M/3Eo2GutXcIjLQuJdzAd8rRhFMSUvokshi6tUng4SvOxz5W4AsKk+1wud/0eOyNUzkTMwYIYs78RpPwfpir/UJjwE4V6hr1z5tE91DXmRxwh8R19WWWeeax6IqaSGnGS7F6LYLDAtKeZrouqoLXb0jnHMCgYEAugACahcY3LfE4yP1JV79AZFhuhHo2j1lsh0rOEu91cPxZLiO4wFoQCq6pQTIl2/b0ZnE1VTW2Il2M3tZ4GFXx0Uw7RnuCDrai0j1fwbsAqm1iWrqXNo+9ND6O7CMmgfBEGt9P92Ptkq18PcsygCWI/f67YaItRhsqUBlUXc1F10CgYA8FZFgWGoPNqy8d67Z60bpIfNU67PXsBBeANYOg56+cvsUEK1fiQFmetr+kjYFdUgLLz/Vr9Kml7BzsixRzniv3WWhlvpBQlmZuihNTkefw7LYelCQcaZ4BynhEgQUdOhEVjgQyymA5G3xAoEg30Vrh5X4GNiyQq3svbJ+/i+RawKBgEZIUqE78Q0V87PQloV0iy3YfZENy2sL4C2ZkAdJt4Xa8JAanQNyOK5mdvh8AkAW6H0fGZ1y3WwdJSj251M99Sk7H+236pX5hzMycnF5cBzhe9NdLwm+/iMMBEIhyD87xtwpgb5sPi2ntXBENgxuhE07Gvo959JmVEjwKFjMLqeRAoGABlO4wXgqhfkYT7sLC79/9pI4VN4QmnhdhOI2RMCRyP2mumbWjfEbSCWpoeSrJ8tSL1ymtetTLco3YnOj01vRDwgn3lhtNUxsWvvslvM2PSk/g5AOJzgzhKEuyFeos9XfguOHsH9Y/y4q7E9Xb5sIgny51nHmIw2MDdoUbmMz9rQ=
5b9a56a7-47f7-47da-8247-3705897cb59b	93103a6a-fb9f-4beb-87c3-63a181a6083f	certificate	MIICmzCCAYMCBgGIAKTmpzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNTA5MTMxMTI2WhcNMzMwNTA5MTMxMzA2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCOnaX+KU5BDfsjxRs45voiumZGEPc2cNHxiYx1a10506/9uEABR4FDAYWL3Nei7VCz10MyKxGtYJOKSvk00SKFBIKxx9jpv0D7iMeDY6LYUHS6T6nLQAx5X3SVEak1sdo26EmtOaJbc/XBu+Frfu4iBn/5117Yl8Fob9VU5jrmXD+gl5BNttNcNihm78gQt1+R63ADI7zW47/Y2lYijjBVEnXQ7d3/3/OdU4xM7YK36ZNgmzrkVwgOeJ1CXrn0k+iEmSWlKOmAe/u8DV3fscV+olSjZ9j8aWaMDKFwY1xoKzs8UXPs+snPuZAmVwtx1/cCZa0J8qEHyPDdIofBzSrHAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADdVrmQh654r3Tfjjoy8E5oscbDuviBQmNU3r1d6ZG/x/2NClRXEerQwxa8r7im5K24mEcEnch/wnJkc0Y8z82QM3GaCci38ZAQ5bMKjP5iuBoy7SK9Wu167u0xQs/IWThtk+bpiELsS7u6ZEtqvqOI6RVplTVBUF/Zj45rZ42CY6xXOp5ledhdTjdpJxHCZQdVQFcoi2ypizLXQZMlvJB7Z4w+fDVIA0Mr4SoKWHHr99ap28yI9UU+mc8rIi1w48Wp972aKufMCBCQ526V7KpSmB/XTCpk86q92V7oZcx9HAcI8+ClVQA6AC8v0K0Tge5sBi5uss5L7Vv2nH7rWPjM=
6b9763d0-4838-4182-95b1-bc65d79e8af3	a1e44fe3-7dcd-4e32-91bb-0a7174aeb9f1	kid	e666c3b9-e471-4e23-b8a3-9a29f3c33655
e93c2382-6288-416e-b336-f75ec45dca30	a1e44fe3-7dcd-4e32-91bb-0a7174aeb9f1	algorithm	HS256
9483c3e3-89cd-49b3-889c-65eba821d9a8	a1e44fe3-7dcd-4e32-91bb-0a7174aeb9f1	priority	100
5bb19e12-1139-4681-82a1-f42911c6f7ad	a1e44fe3-7dcd-4e32-91bb-0a7174aeb9f1	secret	6OgDQVFIiOttDweOhESFy3gJ74BMA58ebPXFy2lxx4XkrYyHD9ikb6UrNxaFCZQ_7ozjIKvMWcnd5_UtrS5Gdw
d18a8197-0666-4f21-b3b8-3bad9182336c	68344544-b0a0-4cdc-a375-c6aaf6da0c01	certificate	MIICozCCAYsCBgGIAKTvzzANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApnaG92ZXJibG9nMB4XDTIzMDUwOTEzMTEyOVoXDTMzMDUwOTEzMTMwOVowFTETMBEGA1UEAwwKZ2hvdmVyYmxvZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAN3DzTzeQVwecssMILDtjl16QiGhKdx6TuYk24gn5Bnqh+rFhp5l+sspIVvo1omJ8GilmjjN8tt5wQ2E0fGvswsSk6wymAq6OkwJKkY66cM9UvqmO5UnviGV1RV3ohfwdx6oeYT36EJPoLLa++lrBg5HdAhpmAhRpu0hOsjIz2zUWtKY8J9bVE5QFvMwnJ2kAkxiMzRj5D01mR8ITLFJqGKQnrz2UjtpCqrzzXvepuU8hz8Fm7mjJhjeQBo4Cxs0584QvyOVCWe8kXjoyZXLgjH0HjB7uZUb0e6rNThl8imXl+MtISu9trE2vFlvl7VNR2iocGPV6LoTuFlzJc4rsscCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAXwhH1P5ieSkwCVFdY622tRZhwtG9KLtHyYweIn+DiRYPLG9zQ4qnY0rC07bBYIURk3LTsfRb+mrd1Balyh2Cc+m+51Dy7HW+sD4CdmMuFVGzIJd4fEy6HDWSjP3ajX9lDhOS7KVcsrmjPO6dQZsUetGw4mrwd7lo3I9e65SdY7MH6eNBqwMiITIBMMg96S4gwLYt4Y+2/E+V/tfnI9d26bC3ZSJ+kGXVQ0hEAQDiSVvshYxF/P2ltsHmZXzw1KX89VDVdSO4G1KMV+B7cXmg6hDM/MLlFmO9phnBV5FXB8mnP7W3omtwMTvuhAC9iVynAzVsQSsBiO50BWGqct54Ag==
28574ae0-e973-4f7a-9417-86dd991cffdc	68344544-b0a0-4cdc-a375-c6aaf6da0c01	privateKey	MIIEpAIBAAKCAQEA3cPNPN5BXB5yywwgsO2OXXpCIaEp3HpO5iTbiCfkGeqH6sWGnmX6yykhW+jWiYnwaKWaOM3y23nBDYTR8a+zCxKTrDKYCro6TAkqRjrpwz1S+qY7lSe+IZXVFXeiF/B3Hqh5hPfoQk+gstr76WsGDkd0CGmYCFGm7SE6yMjPbNRa0pjwn1tUTlAW8zCcnaQCTGIzNGPkPTWZHwhMsUmoYpCevPZSO2kKqvPNe96m5TyHPwWbuaMmGN5AGjgLGzTnzhC/I5UJZ7yReOjJlcuCMfQeMHu5lRvR7qs1OGXyKZeX4y0hK722sTa8WW+XtU1HaKhwY9XouhO4WXMlziuyxwIDAQABAoIBAArucGr8L6+ZRqJQpjnic96SvLjIp3YZR1Nb5MBo6vsGDw4ZD4I2V671B5Juv0iHVqTp6Ni8+igsb8I5Vln6BbLZhxL5aXo55M7DsuREWiqIFtOJJy26iEpChv7oZ0KT1WNa/aZ6y+Wc5Dh8x+chIerJReR2RArA76AHv8yO7X6ZP6Rbo0myLycO0vS8/WaB+pA7SySRysxeWM8Q0TOZni2KHpfodIaxW2jKaAqwW54y3yiFx2UzeHjA7CDGv6w0HCVjP4nCGitoTvw2tbsstxH+QaTq99BreAENWYKRfPWsmlpoVhrNIWs9OjO53YhHqo17W1Uvq76IKpcX5KNuERUCgYEA8q8S9+ItpeRahxc2Pv5GdGZqG7jBBs+EwL7NhfvdfMumM6Y2Gj9Y9JBgGTORy/RzRA9zcPqB6Yz9rdzjsaV1zw2FhQ67eLPOqpyiHF/pjoAOgdKDcZLFP6+x42bf1dKneY3RyREeJoA4dcl5GohtImOvYTKJj5GVAtd6pKVKu+sCgYEA6e7h9pKqds33x5peH7FnN2z5SlRL3WBJdNn6pWSRUGLeND/V25LVyzSz5A82XXO9Jjrykx0LoO6Bcoaj/pHvaIMZFK1spi1pxQ+SUe4DDorXz7Qt3zeHUBMz6oeMkSIn8bfDgqXCItgRsftz89Us8iwWWt4rlgqqmdSp9GU/OZUCgYACffvC4ea4GmU3l+xtryzICzkxua75w+3IEO2JX7HBk1HMm/tYP6hJMqZZ++aWYpdAbqwvz9K/tDvyqh8IdvuDuc7SM/mG3snThLJBelaqqPP9L008QFaYNdSs0iSgTH59yBAMcYmOuahaxUviEt6UCNQHOn6hI8yU7+OJh00CKwKBgQDhDWEz/wuhuisbSyYsJVagWuVFne1Sb1Sb5y0cOrEV/de5uoP6drvZf71ktUHfC/63rdQ6taG/VFUSofdZbHo/OIhDfUheYqgz3fQtf+ZO8kIG31eWPGygG6lBguA3q/1zrQ+ZO/CV5vq3GKsHtFlGLiXfi4exFFfmIFLU/SajNQKBgQDiPmC/K4pKlWWTfO9lwbsNO0GNNOfdhuQaOoJE6sj60+ABtul3S2cHZj1BqXJeibQPXCtkQwrS6rNmUgTmHC2SMRMfBHJmA02dMbXnNI7cDD08jaJMbByhvpRu4nOyEZuLs7sH51pAQ/XOoWYCXuHNilbn7ApZ6r8KSNRnZX/8lw==
e9bfecdb-7b22-49d0-b4ae-4874041626ca	68344544-b0a0-4cdc-a375-c6aaf6da0c01	priority	100
9abd02df-380c-4ded-bb1c-934a1d9c3525	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
fed86d61-2ab0-4cae-8f12-57894866813f	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
48ad9bd8-91db-4ed4-885e-49fec262f327	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2dbfa616-d24c-44b0-92db-2b246dbb763f	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-full-name-mapper
de211e75-d183-44b0-9e02-26912313e047	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-user-property-mapper
b15d6a4b-e7dd-4097-8952-e1753304d982	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-user-attribute-mapper
301d92d2-4a10-48f7-b6f9-fecf5deb1ebb	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-address-mapper
255100a4-0080-47fd-af84-ca6c289779a1	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-role-list-mapper
3496b45b-0852-48bf-9732-110c219af4db	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-address-mapper
03998bb0-52b4-4655-be2d-ebd78bfb7fc0	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-user-property-mapper
1026e5cc-df81-470b-af22-303979806d12	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
f01fdb2d-d2d7-4de4-96c7-4b418e486780	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
122af1eb-cc98-4056-9ef0-9d563f58e652	7649d521-543a-44ee-9757-2580f313c03d	allow-default-scopes	true
02f7773e-0309-40f5-b739-6dbb6399115e	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	kid	a54ee060-8e5b-4c48-91d6-29aa2efe1c4f
f1a22051-d4b8-49fe-918c-c44a53c3e40b	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	secret	hc5RVfg3dLt3TeuPvSJoy_Y_h-6Oiq1SmJllmrVAVPkD9P6hU25D_opevPwqbR_X-1VAa7icAsBAfO_zQ21aOg
d5ada217-ccb4-4215-b878-eada27b15b6a	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	priority	100
f0aeec28-cad8-45d6-9594-e841c7e50776	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	algorithm	HS256
6b07435c-0ed2-40b8-862a-9085ca27f872	fa662f9f-c916-423c-843b-19d549fcc0ff	algorithm	RSA-OAEP
88c306d5-0821-4f2a-8f78-21180cc60035	fa662f9f-c916-423c-843b-19d549fcc0ff	certificate	MIICozCCAYsCBgGIAKTyGDANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApnaG92ZXJibG9nMB4XDTIzMDUwOTEzMTEyOVoXDTMzMDUwOTEzMTMwOVowFTETMBEGA1UEAwwKZ2hvdmVyYmxvZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANszeGOYHlh40SQAlGvpnCXKTcpxQaG+DQ7W7D3QW7Flf9/28FEUQyVup0SyRUPKtUYqxwYZ0tsZzbFQ0+XVFRt44OPqbWaqVtYAT8WHSfw/pkjEBUM0FMlrw0+E2XTiERYfDyXb0VSBR5krzlK5LoCZGzW1jd/SByfHvBNkD4TRNL6B1m67NT2YFmDiFrtCffXIpyNBFlVyXHbkO8vCV94fNTUNT9Bd4gWqNn7A5ZqM/BZYftM0n9sdLqDS1QHh+8ql0Wljw4bIAQENesSFjqOlbJ8S0EVTFph0fb9hHsTHtSV1ZiSpEz0zoHMfD3oJ1FndT+qVrsAtjr20Jik4krMCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAcFiLQlepUdYlmQ0zSHaGusa6Vy5TpKSPgmM0F9+FtuHzWdIpGt2xbXdD0LzdDPbq0agrqn31VOi3F8Uo58xapK3FM9CVcR+2uxBj7ZZJ1SeGBUzjsHL3Lm36TkyJk18RY770E0OcGVFCzv33t8v+lA80X2ae3rRZbVhJnhOWB5nonx/3wEymY2t0pEP3/4JjR9ui/1jKi+TYfdfynhfHhW8036aXiVhENZRahkysqJx+eGodaABjna7FP+ixQOQBoolUItERvikOeofuWJ7UvfrW4x4+j1krQkxf1tUTq6Z5Uto4SXu7kLpZmUEVTkS9jqfXx7N+8xipv8/vP8obxA==
369e73ac-e3d1-4213-b34f-fe46bf55b82c	fa662f9f-c916-423c-843b-19d549fcc0ff	privateKey	MIIEogIBAAKCAQEA2zN4Y5geWHjRJACUa+mcJcpNynFBob4NDtbsPdBbsWV/3/bwURRDJW6nRLJFQ8q1RirHBhnS2xnNsVDT5dUVG3jg4+ptZqpW1gBPxYdJ/D+mSMQFQzQUyWvDT4TZdOIRFh8PJdvRVIFHmSvOUrkugJkbNbWN39IHJ8e8E2QPhNE0voHWbrs1PZgWYOIWu0J99cinI0EWVXJcduQ7y8JX3h81NQ1P0F3iBao2fsDlmoz8Flh+0zSf2x0uoNLVAeH7yqXRaWPDhsgBAQ16xIWOo6VsnxLQRVMWmHR9v2EexMe1JXVmJKkTPTOgcx8PegnUWd1P6pWuwC2OvbQmKTiSswIDAQABAoIBAEPhaYu2BNey+lki0NOmMVPGlVZ2wjNbTmHlDp2J04tY+kOaDgudsbl6zdPJPQfkU0SaZK2v+4scL4WUmToYRYQPZ91MsHpVj7SPviRWZAP4lf78rQCFtVY2x/HtGwZGJ7JpBeDcdLOtoUV+ulMFw6/ROgrk4T2Jpeucv9JlbyTarYJvvLCocuQvs293oLrbBQLolPsjcUIj3Kq41rBti/HL6PM7K05EGwGf4CuKtWMwblBjDdt1qR7ImIGCyrcO0xcFW8csrjOONAVXrZaeiThMl18TtHnvZ5ixfMlU8yfCkRGaPBAJeJu5PZBfh5BIq2+WXl2ILrDnRzprCn4lEekCgYEA+iaKyjP05wPoj/W+nAb7fQSrV623J2jDos//UfpFgnC0943EAdGGJlSosTwfhu1gXyRMq1JJLKr+FGN1Kz6Egi86k/saCZ58e/CWHpgdsQ3a4B0dzLSdFskiWMNYbCSU1PwsLFd6xiN3CbpKacAYy8HHx2TvTTgWOc2RRYG8s8UCgYEA4FOoTB0+XusOMo8TLfrn7x6HonzWQVltAk0GrPpXWlyG2jqDyewHtpLVuj8GOB3uv3jfO5mZQ0ZM5muXm9bYzLjq0ecfsRmSlFh1NDVvjKszDz4kwC+l7CF/6hefvlxDdxKG0usyAGSG0xJtI10TIfHin77fWvilUAwy6Td9fBcCgYB6mpNhwY9h/rdof6C5pm5yeuxj39+p8B4a2WkhS9Hvub/oqVINNh1TAiFgJMCrCAM4/niZa44z12cKpSiTVmPpzq4eQ28ikcwfju509kdvNQQ23e5yG3/24AP2j1/yOQe9UA9yeDnTjSRV3zmDlURR8ZsyLlVfeoLiN8/gylKrpQKBgA7U2SK3KEGETvr+xKjclusTXKpckJnffLqTNybGonHh/jR9e+skxNnIWYMn2ZRqPjfAmRnKrPxqsHjnki2Ghez7KONZ4ZmG9E8EjjM2eTqWsxiF5k4imFjFWjyy9SfT184OloVpcXPfMZ7Q8BBPfg1XfcFMEF5mZB+nvtH2jkBfAoGADIHShmfs1846jH3vG4odZm5vMmTVIiKsag3uiY51IxG38yie9tR4Qpi0xvwp+6DCcSISkSdG/cUwCn1MXoywlVKcUuEjIGMXFoF7pBYe/mq0mDK++wDqXhPBcrW+gxSaBAkSSWEBMonX4foh9N1Ct0pV17fLAg1bDbKMy6jbdus=
22f9e5b7-32ca-4961-9ac7-6239188ca7a0	fa662f9f-c916-423c-843b-19d549fcc0ff	priority	100
f6230c7b-1fe9-4f4b-be87-2c80257c0bc3	d13b325f-b4d0-4f95-b50a-f854f8dce599	max-clients	200
99903c6c-cbff-4f22-965f-1d3177e59586	c3a412a6-8bff-4786-843f-9e15a38d0d35	client-uris-must-match	true
08e0037b-8117-40b3-b601-009b44e53b7b	c3a412a6-8bff-4786-843f-9e15a38d0d35	host-sending-registration-request-must-match	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.composite_role (composite, child_role) FROM stdin;
41e5d293-7330-4b1e-851a-0d148dae7e87	e7328a8d-c900-4b1a-b2c8-894dd6770917
41e5d293-7330-4b1e-851a-0d148dae7e87	9379a3f6-3cd6-4849-8da3-5715d6c94078
41e5d293-7330-4b1e-851a-0d148dae7e87	25c2e9d7-4298-417d-9445-75393c6056f3
41e5d293-7330-4b1e-851a-0d148dae7e87	3b0cd575-474e-41e3-859f-6b7bbfff152d
41e5d293-7330-4b1e-851a-0d148dae7e87	5bea445e-16ed-4ebf-a2b2-9213791fd250
41e5d293-7330-4b1e-851a-0d148dae7e87	4b140075-1e64-4abd-a0d6-7edffcdebcd0
41e5d293-7330-4b1e-851a-0d148dae7e87	070d9d81-404f-4cbd-8eeb-ee445d8c6de1
41e5d293-7330-4b1e-851a-0d148dae7e87	792de4fe-1f14-4815-bd19-57a9d29b4d14
41e5d293-7330-4b1e-851a-0d148dae7e87	4bc93e72-22a7-4725-bbef-36160bffe147
41e5d293-7330-4b1e-851a-0d148dae7e87	24f4c3d8-8906-42ae-94c4-ec40ddd58a69
41e5d293-7330-4b1e-851a-0d148dae7e87	caf2d372-2bf6-42df-b932-f5be58e98785
41e5d293-7330-4b1e-851a-0d148dae7e87	f2b9400e-4c3e-4f5c-bc7e-9396de831ba2
41e5d293-7330-4b1e-851a-0d148dae7e87	5491d3ad-a242-4bb8-a4cd-a11898aec141
41e5d293-7330-4b1e-851a-0d148dae7e87	f6b75ca1-8bd1-43bf-922c-0858d10e5938
41e5d293-7330-4b1e-851a-0d148dae7e87	2c47c4af-6bd5-4694-a0e5-64ef2bed9ef6
41e5d293-7330-4b1e-851a-0d148dae7e87	f2ea9bf4-72aa-4228-9753-e801b241227b
41e5d293-7330-4b1e-851a-0d148dae7e87	ea488992-6b13-4085-a17a-f9859ef5f66b
41e5d293-7330-4b1e-851a-0d148dae7e87	c334cff6-fce5-4929-9400-c97e6536e780
5bea445e-16ed-4ebf-a2b2-9213791fd250	f2ea9bf4-72aa-4228-9753-e801b241227b
3b0cd575-474e-41e3-859f-6b7bbfff152d	c334cff6-fce5-4929-9400-c97e6536e780
3b0cd575-474e-41e3-859f-6b7bbfff152d	2c47c4af-6bd5-4694-a0e5-64ef2bed9ef6
3d64fa1c-7e1e-4296-984c-70032d01c2e4	2a4946ab-24e9-4a56-98f5-d075dc16ae17
3d64fa1c-7e1e-4296-984c-70032d01c2e4	760342f2-adbe-435d-ad0d-e15eafb9d43c
760342f2-adbe-435d-ad0d-e15eafb9d43c	53ed5ed4-125b-4d07-ba46-351cd8cd4a11
65517c0d-596c-4527-9046-4e2b83c8e8ad	eaf900a1-57cf-4ba0-a4e1-92e7f896760d
41e5d293-7330-4b1e-851a-0d148dae7e87	e2bf7bff-60c2-4cbb-ba48-7936108dc4e3
3d64fa1c-7e1e-4296-984c-70032d01c2e4	b5b4dfde-6d0d-4459-a820-a7764d20d06f
3d64fa1c-7e1e-4296-984c-70032d01c2e4	f76a7c6c-2353-494e-bfbc-309a545ec998
41e5d293-7330-4b1e-851a-0d148dae7e87	4cf62cfb-474d-4bc8-8629-f039b215dd6b
41e5d293-7330-4b1e-851a-0d148dae7e87	c7ae276c-1432-47de-b4c1-37f29b64bc42
41e5d293-7330-4b1e-851a-0d148dae7e87	ac25a120-df41-48fc-b5bd-f0a61d2fe190
41e5d293-7330-4b1e-851a-0d148dae7e87	4f445361-8613-43bd-98eb-093dea646b98
41e5d293-7330-4b1e-851a-0d148dae7e87	82887720-19bd-49ac-ac16-7775442e58f5
41e5d293-7330-4b1e-851a-0d148dae7e87	103771c1-16e1-4310-a112-88c6a259dc2b
41e5d293-7330-4b1e-851a-0d148dae7e87	a08fc06d-6b17-4505-b9ea-7eafd6a6215e
41e5d293-7330-4b1e-851a-0d148dae7e87	44aed887-eaab-4572-8a63-7ea063352161
41e5d293-7330-4b1e-851a-0d148dae7e87	5f1a294e-1604-4a4c-8438-d70f13c19ff4
41e5d293-7330-4b1e-851a-0d148dae7e87	3ba0ee6b-146a-4382-be77-04ec40ad8de8
41e5d293-7330-4b1e-851a-0d148dae7e87	9350ab71-ec33-4388-bbdd-91cf20ad182d
41e5d293-7330-4b1e-851a-0d148dae7e87	7a5f8fe4-bcd4-4934-869c-c8bc943a038a
41e5d293-7330-4b1e-851a-0d148dae7e87	e61b3a81-6a94-41ee-a540-9069c1b72984
41e5d293-7330-4b1e-851a-0d148dae7e87	dbae6844-904a-46e3-abc4-aaedd3a43b63
41e5d293-7330-4b1e-851a-0d148dae7e87	2a6c8652-b3d4-4b3f-a2b9-83b56a6025c1
41e5d293-7330-4b1e-851a-0d148dae7e87	9e70eaa8-122f-4a33-888e-2d947d7260a0
41e5d293-7330-4b1e-851a-0d148dae7e87	3d3ab792-0710-429b-90ea-6f25f8d460b6
4f445361-8613-43bd-98eb-093dea646b98	2a6c8652-b3d4-4b3f-a2b9-83b56a6025c1
ac25a120-df41-48fc-b5bd-f0a61d2fe190	3d3ab792-0710-429b-90ea-6f25f8d460b6
ac25a120-df41-48fc-b5bd-f0a61d2fe190	dbae6844-904a-46e3-abc4-aaedd3a43b63
c8281036-19c6-4d54-92e1-b3efbf04d387	d110694d-134d-4b14-aec0-530415e26704
c8281036-19c6-4d54-92e1-b3efbf04d387	6964e136-e8ce-49f8-b7b1-d04747ec11cd
c8281036-19c6-4d54-92e1-b3efbf04d387	07efab90-e40e-40e1-bcce-1b973765544c
c8281036-19c6-4d54-92e1-b3efbf04d387	d2d4c3dd-4e66-4dc3-9747-f9bff3068daf
1cd7b4b3-ab87-4bbb-ba61-ab915faf64e3	de1cdcf8-8035-4e2b-a804-a6e439a213ad
1cd7b4b3-ab87-4bbb-ba61-ab915faf64e3	26230398-74d1-438c-bb70-d915a642ccab
fa8231dd-109e-4a0d-b644-78b987ee8124	81b024f0-4bb8-4631-a750-0d038a088319
56b21d06-17c8-4776-8157-71695a4430e4	81b024f0-4bb8-4631-a750-0d038a088319
56b21d06-17c8-4776-8157-71695a4430e4	d7c9043c-37b5-44d8-bbbb-12eb722e8501
56b21d06-17c8-4776-8157-71695a4430e4	4a862d95-ada3-4b81-a8a8-9e1c613d2a5b
56b21d06-17c8-4776-8157-71695a4430e4	22c91643-c266-4ff1-8508-8fba7d92a0fd
56b21d06-17c8-4776-8157-71695a4430e4	3719b41e-1b8c-45f6-939f-63b0e0b7bb25
56b21d06-17c8-4776-8157-71695a4430e4	26230398-74d1-438c-bb70-d915a642ccab
56b21d06-17c8-4776-8157-71695a4430e4	89bc8258-c807-4faf-805f-c24c3ed16c36
56b21d06-17c8-4776-8157-71695a4430e4	b01c247d-343c-4dad-8818-fa3554546641
56b21d06-17c8-4776-8157-71695a4430e4	1cd7b4b3-ab87-4bbb-ba61-ab915faf64e3
56b21d06-17c8-4776-8157-71695a4430e4	ce31c9bf-b048-4b9a-8768-d03af11840f8
56b21d06-17c8-4776-8157-71695a4430e4	fa8231dd-109e-4a0d-b644-78b987ee8124
56b21d06-17c8-4776-8157-71695a4430e4	96797b33-6468-41bc-a8d9-882d4d25cf33
56b21d06-17c8-4776-8157-71695a4430e4	de1cdcf8-8035-4e2b-a804-a6e439a213ad
56b21d06-17c8-4776-8157-71695a4430e4	7e71ec8e-1e58-4b32-a63e-ae6c53c7e202
56b21d06-17c8-4776-8157-71695a4430e4	70b32ee4-03f5-47ae-a3ba-d52585e1ae7f
56b21d06-17c8-4776-8157-71695a4430e4	9db84911-ae8a-40bf-a1bd-acadcbc17489
56b21d06-17c8-4776-8157-71695a4430e4	79a4e0be-a438-46c8-a2c7-84ed4172999a
56b21d06-17c8-4776-8157-71695a4430e4	55cddb9d-c54b-4802-90b5-a30ccff8dcf1
6964e136-e8ce-49f8-b7b1-d04747ec11cd	78ede6e8-6592-42e9-bd30-20e95ef21813
341092a5-fd34-4818-b434-f0a11c401591	0fff7797-988d-4163-b1f0-3be97ce41131
41e5d293-7330-4b1e-851a-0d148dae7e87	50c42523-f735-42e3-bf38-ab9e3851adf2
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
2a47a294-1f75-42c1-ba13-2926d30ae936	\N	password	ac977999-0b94-4f64-b785-547288ea0387	1683637990185	\N	{"value":"Xzg9skYOHIax+UPpBVGNchhHtqxRAYZTd8mwcFytb3mD3s5z9MPh4+WTgB/g8BJoj4WLLdqbhkIxbb+AFbqTMw==","salt":"y9c+1kK+IALqm6DGGeYXlQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-05-09 13:12:58.876717	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	3637978467
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-05-09 13:12:58.890132	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	3637978467
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-05-09 13:12:58.971558	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	3637978467
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-05-09 13:12:58.976592	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	3637978467
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-05-09 13:12:59.081331	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	3637978467
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-05-09 13:12:59.084909	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	3637978467
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-05-09 13:12:59.170488	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	3637978467
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-05-09 13:12:59.174375	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	3637978467
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-05-09 13:12:59.180727	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	3637978467
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-05-09 13:12:59.297603	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	3637978467
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-05-09 13:12:59.364877	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3637978467
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-05-09 13:12:59.367914	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3637978467
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-05-09 13:12:59.395087	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3637978467
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-09 13:12:59.422721	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	3637978467
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-09 13:12:59.42719	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3637978467
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-09 13:12:59.430229	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	3637978467
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-09 13:12:59.432773	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	3637978467
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-05-09 13:12:59.499082	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	3637978467
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-05-09 13:12:59.54086	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	3637978467
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-05-09 13:12:59.546074	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	3637978467
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-09 13:13:00.98389	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	3637978467
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-05-09 13:12:59.548613	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	3637978467
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-05-09 13:12:59.551121	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	3637978467
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-05-09 13:12:59.607402	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	3637978467
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-05-09 13:12:59.613007	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	3637978467
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-05-09 13:12:59.615243	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	3637978467
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-05-09 13:12:59.849504	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	3637978467
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-05-09 13:12:59.914418	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	3637978467
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-05-09 13:12:59.918351	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	3637978467
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-05-09 13:12:59.967896	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	3637978467
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-05-09 13:12:59.981936	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	3637978467
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-05-09 13:13:00.005932	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	3637978467
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-05-09 13:13:00.010967	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	3637978467
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-09 13:13:00.016276	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3637978467
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-09 13:13:00.01843	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	3637978467
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-09 13:13:00.046555	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	3637978467
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-05-09 13:13:00.051218	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	3637978467
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-09 13:13:00.055709	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3637978467
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-05-09 13:13:00.059752	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	3637978467
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-05-09 13:13:00.06343	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	3637978467
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-05-09 13:13:00.065455	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	3637978467
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-05-09 13:13:00.067476	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	3637978467
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-05-09 13:13:00.072155	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	3637978467
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-05-09 13:13:00.974138	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	3637978467
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-05-09 13:13:00.978583	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	3637978467
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-09 13:13:00.988849	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	3637978467
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-09 13:13:00.990939	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	3637978467
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-09 13:13:01.079624	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	3637978467
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-09 13:13:01.083667	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	3637978467
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-05-09 13:13:01.116995	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	3637978467
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-05-09 13:13:01.288877	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	3637978467
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-05-09 13:13:01.292665	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3637978467
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-05-09 13:13:01.300943	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	3637978467
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-05-09 13:13:01.30429	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	3637978467
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-09 13:13:01.310495	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	3637978467
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-09 13:13:01.315739	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	3637978467
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-09 13:13:01.352779	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	3637978467
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-09 13:13:01.601071	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	3637978467
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-05-09 13:13:01.626815	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	3637978467
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-05-09 13:13:01.633627	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	3637978467
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-05-09 13:13:01.643258	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	3637978467
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-05-09 13:13:01.65	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	3637978467
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-05-09 13:13:01.653544	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	3637978467
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-05-09 13:13:01.657018	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	3637978467
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-05-09 13:13:01.660017	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	3637978467
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-05-09 13:13:01.685109	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	3637978467
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-05-09 13:13:01.703087	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	3637978467
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-05-09 13:13:01.707509	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	3637978467
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-05-09 13:13:01.730318	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	3637978467
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-05-09 13:13:01.7357	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	3637978467
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-05-09 13:13:01.739464	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	3637978467
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-09 13:13:01.746361	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3637978467
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-09 13:13:01.753816	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3637978467
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-09 13:13:01.755789	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3637978467
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-09 13:13:01.778382	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	3637978467
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-09 13:13:01.796262	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	3637978467
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-09 13:13:01.79983	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	3637978467
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-09 13:13:01.801879	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	3637978467
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-09 13:13:01.819725	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	3637978467
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-09 13:13:01.822381	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	3637978467
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-09 13:13:01.841906	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	3637978467
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-09 13:13:01.843893	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3637978467
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-09 13:13:01.847951	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3637978467
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-09 13:13:01.850058	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3637978467
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-09 13:13:01.866986	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	3637978467
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-05-09 13:13:01.871957	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	3637978467
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-05-09 13:13:01.880556	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	3637978467
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-05-09 13:13:01.887503	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	3637978467
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-09 13:13:01.893169	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	3637978467
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-09 13:13:01.899781	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	3637978467
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-09 13:13:01.917033	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3637978467
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-09 13:13:01.925633	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	3637978467
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-09 13:13:01.927753	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	3637978467
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-09 13:13:01.935504	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	3637978467
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-09 13:13:01.937712	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	3637978467
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-09 13:13:01.943315	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	3637978467
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-09 13:13:01.988209	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3637978467
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-09 13:13:01.990392	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3637978467
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-09 13:13:01.998397	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3637978467
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-09 13:13:02.015044	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3637978467
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-09 13:13:02.017132	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3637978467
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-09 13:13:02.033672	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	3637978467
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-09 13:13:02.037971	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	3637978467
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-05-09 13:13:02.044096	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	3637978467
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-05-09 13:13:02.060894	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	3637978467
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-05-09 13:13:02.082904	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	3637978467
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-05-09 13:13:02.087119	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	3637978467
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
77f2a7e8-ac8b-47fd-b466-46732acc31f5	0895b4fd-ea15-4315-bbae-634a5ea7022c	f
77f2a7e8-ac8b-47fd-b466-46732acc31f5	a48345b2-65fd-4c2d-ad37-5a1e92f4948b	t
77f2a7e8-ac8b-47fd-b466-46732acc31f5	5f1e0a28-c55e-420d-88ab-aca5f17069c1	t
77f2a7e8-ac8b-47fd-b466-46732acc31f5	53087ed0-16ee-4e3b-b4ca-9ab38fe2df76	t
77f2a7e8-ac8b-47fd-b466-46732acc31f5	d8841f1b-7756-4118-a4f4-4c4a6b9ab90f	f
77f2a7e8-ac8b-47fd-b466-46732acc31f5	4c95cac8-c059-4aad-8d23-f57d68810b58	f
77f2a7e8-ac8b-47fd-b466-46732acc31f5	001d6de2-5970-45e4-ab8e-e3835c04bdfc	t
77f2a7e8-ac8b-47fd-b466-46732acc31f5	f735010e-8af4-4207-9278-bceabf0a2e95	t
77f2a7e8-ac8b-47fd-b466-46732acc31f5	22adc317-eae5-481e-84d3-05e8a05aa59c	f
77f2a7e8-ac8b-47fd-b466-46732acc31f5	21e9e9ce-9439-419a-bcfe-a2650346c5b6	t
91cb1cd2-e133-4f67-9800-593c809120c8	9cedc1dc-c4ac-40dc-906f-33f5062a44c9	t
91cb1cd2-e133-4f67-9800-593c809120c8	3f230cc1-3768-41b7-9b22-974aedee8acc	t
91cb1cd2-e133-4f67-9800-593c809120c8	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
91cb1cd2-e133-4f67-9800-593c809120c8	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
91cb1cd2-e133-4f67-9800-593c809120c8	0a896f39-565a-4c91-812d-4e7d02b9f019	t
91cb1cd2-e133-4f67-9800-593c809120c8	07700bf6-988b-451a-822e-cdd0c00e2eba	t
91cb1cd2-e133-4f67-9800-593c809120c8	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
91cb1cd2-e133-4f67-9800-593c809120c8	3a253936-dbc8-4764-8c5c-c046055cb129	f
91cb1cd2-e133-4f67-9800-593c809120c8	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
91cb1cd2-e133-4f67-9800-593c809120c8	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
3d64fa1c-7e1e-4296-984c-70032d01c2e4	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f	${role_default-roles}	default-roles-master	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N	\N
41e5d293-7330-4b1e-851a-0d148dae7e87	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f	${role_admin}	admin	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N	\N
e7328a8d-c900-4b1a-b2c8-894dd6770917	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f	${role_create-realm}	create-realm	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N	\N
9379a3f6-3cd6-4849-8da3-5715d6c94078	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_create-client}	create-client	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
25c2e9d7-4298-417d-9445-75393c6056f3	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_view-realm}	view-realm	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
3b0cd575-474e-41e3-859f-6b7bbfff152d	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_view-users}	view-users	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
5bea445e-16ed-4ebf-a2b2-9213791fd250	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_view-clients}	view-clients	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
4b140075-1e64-4abd-a0d6-7edffcdebcd0	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_view-events}	view-events	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
070d9d81-404f-4cbd-8eeb-ee445d8c6de1	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_view-identity-providers}	view-identity-providers	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
792de4fe-1f14-4815-bd19-57a9d29b4d14	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_view-authorization}	view-authorization	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
4bc93e72-22a7-4725-bbef-36160bffe147	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_manage-realm}	manage-realm	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
24f4c3d8-8906-42ae-94c4-ec40ddd58a69	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_manage-users}	manage-users	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
caf2d372-2bf6-42df-b932-f5be58e98785	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_manage-clients}	manage-clients	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
f2b9400e-4c3e-4f5c-bc7e-9396de831ba2	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_manage-events}	manage-events	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
5491d3ad-a242-4bb8-a4cd-a11898aec141	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_manage-identity-providers}	manage-identity-providers	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
f6b75ca1-8bd1-43bf-922c-0858d10e5938	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_manage-authorization}	manage-authorization	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
2c47c4af-6bd5-4694-a0e5-64ef2bed9ef6	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_query-users}	query-users	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
f2ea9bf4-72aa-4228-9753-e801b241227b	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_query-clients}	query-clients	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
ea488992-6b13-4085-a17a-f9859ef5f66b	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_query-realms}	query-realms	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
c334cff6-fce5-4929-9400-c97e6536e780	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_query-groups}	query-groups	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
2a4946ab-24e9-4a56-98f5-d075dc16ae17	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	t	${role_view-profile}	view-profile	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	\N
760342f2-adbe-435d-ad0d-e15eafb9d43c	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	t	${role_manage-account}	manage-account	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	\N
53ed5ed4-125b-4d07-ba46-351cd8cd4a11	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	t	${role_manage-account-links}	manage-account-links	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	\N
d364ed10-ccb6-407b-ab83-8dfdbd51416a	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	t	${role_view-applications}	view-applications	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	\N
eaf900a1-57cf-4ba0-a4e1-92e7f896760d	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	t	${role_view-consent}	view-consent	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	\N
65517c0d-596c-4527-9046-4e2b83c8e8ad	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	t	${role_manage-consent}	manage-consent	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	\N
b89cfc09-b955-47a4-a4ee-d713d847ca8d	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	t	${role_delete-account}	delete-account	77f2a7e8-ac8b-47fd-b466-46732acc31f5	ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	\N
b50dd5c4-28cc-40d1-b61d-c93afc9d290b	32cdc323-2595-496f-b688-3d90887806de	t	${role_read-token}	read-token	77f2a7e8-ac8b-47fd-b466-46732acc31f5	32cdc323-2595-496f-b688-3d90887806de	\N
e2bf7bff-60c2-4cbb-ba48-7936108dc4e3	33aa2816-81f6-4e2e-bea7-18d3423818fe	t	${role_impersonation}	impersonation	77f2a7e8-ac8b-47fd-b466-46732acc31f5	33aa2816-81f6-4e2e-bea7-18d3423818fe	\N
b5b4dfde-6d0d-4459-a820-a7764d20d06f	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f	${role_offline-access}	offline_access	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N	\N
f76a7c6c-2353-494e-bfbc-309a545ec998	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f	${role_uma_authorization}	uma_authorization	77f2a7e8-ac8b-47fd-b466-46732acc31f5	\N	\N
c8281036-19c6-4d54-92e1-b3efbf04d387	91cb1cd2-e133-4f67-9800-593c809120c8	f	${role_default-roles}	default-roles-ghoverblog	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
4cf62cfb-474d-4bc8-8629-f039b215dd6b	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_create-client}	create-client	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
c7ae276c-1432-47de-b4c1-37f29b64bc42	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_view-realm}	view-realm	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
ac25a120-df41-48fc-b5bd-f0a61d2fe190	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_view-users}	view-users	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
4f445361-8613-43bd-98eb-093dea646b98	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_view-clients}	view-clients	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
82887720-19bd-49ac-ac16-7775442e58f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_view-events}	view-events	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
103771c1-16e1-4310-a112-88c6a259dc2b	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_view-identity-providers}	view-identity-providers	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
a08fc06d-6b17-4505-b9ea-7eafd6a6215e	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_view-authorization}	view-authorization	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
44aed887-eaab-4572-8a63-7ea063352161	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_manage-realm}	manage-realm	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
5f1a294e-1604-4a4c-8438-d70f13c19ff4	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_manage-users}	manage-users	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
3ba0ee6b-146a-4382-be77-04ec40ad8de8	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_manage-clients}	manage-clients	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
9350ab71-ec33-4388-bbdd-91cf20ad182d	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_manage-events}	manage-events	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
7a5f8fe4-bcd4-4934-869c-c8bc943a038a	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_manage-identity-providers}	manage-identity-providers	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
e61b3a81-6a94-41ee-a540-9069c1b72984	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_manage-authorization}	manage-authorization	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
dbae6844-904a-46e3-abc4-aaedd3a43b63	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_query-users}	query-users	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
2a6c8652-b3d4-4b3f-a2b9-83b56a6025c1	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_query-clients}	query-clients	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
9e70eaa8-122f-4a33-888e-2d947d7260a0	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_query-realms}	query-realms	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
3d3ab792-0710-429b-90ea-6f25f8d460b6	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_query-groups}	query-groups	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
d110694d-134d-4b14-aec0-530415e26704	91cb1cd2-e133-4f67-9800-593c809120c8	f	${role_offline-access}	offline_access	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
d2d4c3dd-4e66-4dc3-9747-f9bff3068daf	91cb1cd2-e133-4f67-9800-593c809120c8	f	${role_uma_authorization}	uma_authorization	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
81b024f0-4bb8-4631-a750-0d038a088319	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_query-clients}	query-clients	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
d7c9043c-37b5-44d8-bbbb-12eb722e8501	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_view-identity-providers}	view-identity-providers	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
4a862d95-ada3-4b81-a8a8-9e1c613d2a5b	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_manage-clients}	manage-clients	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
22c91643-c266-4ff1-8508-8fba7d92a0fd	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_manage-identity-providers}	manage-identity-providers	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
3719b41e-1b8c-45f6-939f-63b0e0b7bb25	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_create-client}	create-client	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
89bc8258-c807-4faf-805f-c24c3ed16c36	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_impersonation}	impersonation	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
26230398-74d1-438c-bb70-d915a642ccab	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_query-groups}	query-groups	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
b01c247d-343c-4dad-8818-fa3554546641	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_manage-authorization}	manage-authorization	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
1cd7b4b3-ab87-4bbb-ba61-ab915faf64e3	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_view-users}	view-users	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
ce31c9bf-b048-4b9a-8768-d03af11840f8	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_view-events}	view-events	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
fa8231dd-109e-4a0d-b644-78b987ee8124	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_view-clients}	view-clients	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
96797b33-6468-41bc-a8d9-882d4d25cf33	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_view-authorization}	view-authorization	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
de1cdcf8-8035-4e2b-a804-a6e439a213ad	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_query-users}	query-users	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
7e71ec8e-1e58-4b32-a63e-ae6c53c7e202	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_manage-realm}	manage-realm	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
70b32ee4-03f5-47ae-a3ba-d52585e1ae7f	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_manage-events}	manage-events	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
9db84911-ae8a-40bf-a1bd-acadcbc17489	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_query-realms}	query-realms	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
56b21d06-17c8-4776-8157-71695a4430e4	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_realm-admin}	realm-admin	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
79a4e0be-a438-46c8-a2c7-84ed4172999a	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_view-realm}	view-realm	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
55cddb9d-c54b-4802-90b5-a30ccff8dcf1	de37e667-e65f-4127-88b0-040889a26d6c	t	${role_manage-users}	manage-users	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
5793fa89-49dc-4721-8773-e43d680419fa	1d288522-1a62-43b1-9932-f23aa8959705	t	${role_read-token}	read-token	91cb1cd2-e133-4f67-9800-593c809120c8	1d288522-1a62-43b1-9932-f23aa8959705	\N
6964e136-e8ce-49f8-b7b1-d04747ec11cd	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_manage-account}	manage-account	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
eb2ebb12-0d08-4426-994f-7b03e6ead65f	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_delete-account}	delete-account	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
341092a5-fd34-4818-b434-f0a11c401591	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_manage-consent}	manage-consent	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
0fff7797-988d-4163-b1f0-3be97ce41131	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_view-consent}	view-consent	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
07efab90-e40e-40e1-bcce-1b973765544c	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_view-profile}	view-profile	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
3f90d07f-83b7-40b4-b2a4-302981edfb4a	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_view-applications}	view-applications	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
78ede6e8-6592-42e9-bd30-20e95ef21813	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_manage-account-links}	manage-account-links	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
50c42523-f735-42e3-bf38-ab9e3851adf2	eff1bfeb-b178-464b-81ff-9c3dba05bbea	t	${role_impersonation}	impersonation	77f2a7e8-ac8b-47fd-b466-46732acc31f5	eff1bfeb-b178-464b-81ff-9c3dba05bbea	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.migration_model (id, version, update_time) FROM stdin;
nf8bj	19.0.3	1683637985
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
ea17d799-b632-4122-ad8d-f3130a4e4677	audience resolve	openid-connect	oidc-audience-resolve-mapper	38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	\N
3d93245c-0d94-4aa7-af70-2bce5ff1ba1a	locale	openid-connect	oidc-usermodel-attribute-mapper	f71b8573-da03-4833-a1b4-a0e8cb4cd56d	\N
6b4bc147-afa0-4a93-a252-7efbf5f739ef	role list	saml	saml-role-list-mapper	\N	a48345b2-65fd-4c2d-ad37-5a1e92f4948b
4b0e402c-0fdd-475f-923e-a4fb92d8bd7b	full name	openid-connect	oidc-full-name-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
6699b9a3-f6b2-4661-a006-b20d0672a43c	family name	openid-connect	oidc-usermodel-property-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
bb7cd388-28d3-43f0-9e40-4b458badaad1	given name	openid-connect	oidc-usermodel-property-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
65133844-fb9f-4549-a973-6ff6f65589dc	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
d08d1bfe-78be-4ff4-9744-0457e834169f	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
0a5ae1a2-cb12-469c-8fc4-ae174d97d46a	username	openid-connect	oidc-usermodel-property-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
66ad9f86-6d9f-4c73-b4de-69142e5b4f19	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
4510c225-1fc5-4656-a729-3ad2b62cd868	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
c3807569-88ed-489d-b0fd-2349ed326999	website	openid-connect	oidc-usermodel-attribute-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
afeb6894-ccd1-49d3-a2a0-63fe74a904bb	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
211fd9a2-2302-4ff7-baab-b6a81e96d5c0	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
bb591b9b-4d3b-4090-87f9-fd72f0b71dd9	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
ebe85859-54b3-4ce4-99b2-755fc950e41c	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
f92ffa19-843b-44bd-8176-38b7eeb1c40c	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	5f1e0a28-c55e-420d-88ab-aca5f17069c1
3b81f253-d32d-453a-95dd-30971a4d9cfb	email	openid-connect	oidc-usermodel-property-mapper	\N	53087ed0-16ee-4e3b-b4ca-9ab38fe2df76
5a6bd69b-a7cc-45e9-827b-975d59ef64a5	email verified	openid-connect	oidc-usermodel-property-mapper	\N	53087ed0-16ee-4e3b-b4ca-9ab38fe2df76
a8a49e41-3fea-4f5a-b061-788fc52ac867	address	openid-connect	oidc-address-mapper	\N	d8841f1b-7756-4118-a4f4-4c4a6b9ab90f
718e46e8-63c9-4a57-bac3-d2a09d8f1382	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	4c95cac8-c059-4aad-8d23-f57d68810b58
8172b93a-befc-45e3-b288-5e9905aea4b6	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	4c95cac8-c059-4aad-8d23-f57d68810b58
2d137772-922a-496a-abe8-b261fea5315a	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	001d6de2-5970-45e4-ab8e-e3835c04bdfc
302625d0-9b67-451a-a2bd-adb48fe5647f	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	001d6de2-5970-45e4-ab8e-e3835c04bdfc
454fc8cd-3f3f-4027-a0e0-4051fc46abd0	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	001d6de2-5970-45e4-ab8e-e3835c04bdfc
1c45bed6-2b73-48f5-b554-f09f4f700b4b	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	f735010e-8af4-4207-9278-bceabf0a2e95
0fe69e70-ee95-4245-9650-6392d1824e67	upn	openid-connect	oidc-usermodel-property-mapper	\N	22adc317-eae5-481e-84d3-05e8a05aa59c
5c173a6b-681c-4371-ba09-f7b7211d64ae	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	22adc317-eae5-481e-84d3-05e8a05aa59c
af894033-d494-4105-b2c3-463eacad959c	acr loa level	openid-connect	oidc-acr-mapper	\N	21e9e9ce-9439-419a-bcfe-a2650346c5b6
81e7bde4-77ac-422c-b21a-b5865236f0b9	email	openid-connect	oidc-usermodel-property-mapper	\N	dcd0bee6-81c7-41a4-95c7-8ef471f111ef
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	email verified	openid-connect	oidc-usermodel-property-mapper	\N	dcd0bee6-81c7-41a4-95c7-8ef471f111ef
45db5704-a0b9-451d-83d2-e599c12042f5	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
5dfdd04e-e987-4437-8791-7309d7eae9c6	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
45cc72c7-984a-4eb3-b32d-eb9142c9f8a9	full name	openid-connect	oidc-full-name-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	given name	openid-connect	oidc-usermodel-property-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
96260702-ab50-4f7c-b56d-b87675242d01	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
77fb9f07-3604-44b2-892f-d13902c23e0b	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
d7fee141-2abf-4572-bcf3-bf085e0a762c	username	openid-connect	oidc-usermodel-property-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
ebc56ceb-9d1d-4236-b00c-a58813330a40	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
acc46178-8cfd-43d1-8a0f-788eb8886f4a	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
abe0b621-7d97-416e-a432-1a63a830fa7d	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
34392d29-3859-4c47-8794-3882417dea95	website	openid-connect	oidc-usermodel-attribute-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
7c51c33a-339c-419b-b61c-8900928a17b8	family name	openid-connect	oidc-usermodel-property-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
1c7d25a8-1890-433a-b034-5d5e472ef3d7	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	3f230cc1-3768-41b7-9b22-974aedee8acc
133f2702-fd3b-4a97-818a-931823113e0c	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	0a896f39-565a-4c91-812d-4e7d02b9f019
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	ae3a02b3-dab8-4d85-9aa6-00e381d39d88
ea513ef6-9146-43b6-8209-d21b13b4da96	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	ae3a02b3-dab8-4d85-9aa6-00e381d39d88
0f7f8815-c367-4a55-a33c-f4619e611afc	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	ae3a02b3-dab8-4d85-9aa6-00e381d39d88
556081f7-86b7-4de1-a9ae-7f28a5314208	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	471a4340-ffd4-490b-99d9-4a5750bab7b5
17399230-4b7f-4e18-bbdb-cb910dc11d51	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	471a4340-ffd4-490b-99d9-4a5750bab7b5
966f1722-36a5-4fe0-a964-82bbde99d73b	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9
6882646c-0578-47b0-aa19-05b248698fff	upn	openid-connect	oidc-usermodel-property-mapper	\N	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9
8f6da58f-6f79-4d82-ac49-7d5b1f203905	address	openid-connect	oidc-address-mapper	\N	3a253936-dbc8-4764-8c5c-c046055cb129
629e3a5f-5f05-4847-abbe-ebf931a609be	role list	saml	saml-role-list-mapper	\N	9cedc1dc-c4ac-40dc-906f-33f5062a44c9
92f7fa1b-054a-4c1b-80c5-244e7dfd2634	acr loa level	openid-connect	oidc-acr-mapper	\N	07700bf6-988b-451a-822e-cdd0c00e2eba
cc887f3a-b426-4e44-b755-03a12c43dbc8	audience resolve	openid-connect	oidc-audience-resolve-mapper	255e96f7-f58d-4d04-b853-009fefecd80d	\N
3832b8ab-16c2-4cce-8bf3-c442e9513785	locale	openid-connect	oidc-usermodel-attribute-mapper	85a82e6e-ccb6-4153-8304-3645d119899b	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
3d93245c-0d94-4aa7-af70-2bce5ff1ba1a	true	userinfo.token.claim
3d93245c-0d94-4aa7-af70-2bce5ff1ba1a	locale	user.attribute
3d93245c-0d94-4aa7-af70-2bce5ff1ba1a	true	id.token.claim
3d93245c-0d94-4aa7-af70-2bce5ff1ba1a	true	access.token.claim
3d93245c-0d94-4aa7-af70-2bce5ff1ba1a	locale	claim.name
3d93245c-0d94-4aa7-af70-2bce5ff1ba1a	String	jsonType.label
6b4bc147-afa0-4a93-a252-7efbf5f739ef	false	single
6b4bc147-afa0-4a93-a252-7efbf5f739ef	Basic	attribute.nameformat
6b4bc147-afa0-4a93-a252-7efbf5f739ef	Role	attribute.name
4b0e402c-0fdd-475f-923e-a4fb92d8bd7b	true	userinfo.token.claim
4b0e402c-0fdd-475f-923e-a4fb92d8bd7b	true	id.token.claim
4b0e402c-0fdd-475f-923e-a4fb92d8bd7b	true	access.token.claim
6699b9a3-f6b2-4661-a006-b20d0672a43c	true	userinfo.token.claim
6699b9a3-f6b2-4661-a006-b20d0672a43c	lastName	user.attribute
6699b9a3-f6b2-4661-a006-b20d0672a43c	true	id.token.claim
6699b9a3-f6b2-4661-a006-b20d0672a43c	true	access.token.claim
6699b9a3-f6b2-4661-a006-b20d0672a43c	family_name	claim.name
6699b9a3-f6b2-4661-a006-b20d0672a43c	String	jsonType.label
bb7cd388-28d3-43f0-9e40-4b458badaad1	true	userinfo.token.claim
bb7cd388-28d3-43f0-9e40-4b458badaad1	firstName	user.attribute
bb7cd388-28d3-43f0-9e40-4b458badaad1	true	id.token.claim
bb7cd388-28d3-43f0-9e40-4b458badaad1	true	access.token.claim
bb7cd388-28d3-43f0-9e40-4b458badaad1	given_name	claim.name
bb7cd388-28d3-43f0-9e40-4b458badaad1	String	jsonType.label
65133844-fb9f-4549-a973-6ff6f65589dc	true	userinfo.token.claim
65133844-fb9f-4549-a973-6ff6f65589dc	middleName	user.attribute
65133844-fb9f-4549-a973-6ff6f65589dc	true	id.token.claim
65133844-fb9f-4549-a973-6ff6f65589dc	true	access.token.claim
65133844-fb9f-4549-a973-6ff6f65589dc	middle_name	claim.name
65133844-fb9f-4549-a973-6ff6f65589dc	String	jsonType.label
d08d1bfe-78be-4ff4-9744-0457e834169f	true	userinfo.token.claim
d08d1bfe-78be-4ff4-9744-0457e834169f	nickname	user.attribute
d08d1bfe-78be-4ff4-9744-0457e834169f	true	id.token.claim
d08d1bfe-78be-4ff4-9744-0457e834169f	true	access.token.claim
d08d1bfe-78be-4ff4-9744-0457e834169f	nickname	claim.name
d08d1bfe-78be-4ff4-9744-0457e834169f	String	jsonType.label
0a5ae1a2-cb12-469c-8fc4-ae174d97d46a	true	userinfo.token.claim
0a5ae1a2-cb12-469c-8fc4-ae174d97d46a	username	user.attribute
0a5ae1a2-cb12-469c-8fc4-ae174d97d46a	true	id.token.claim
0a5ae1a2-cb12-469c-8fc4-ae174d97d46a	true	access.token.claim
0a5ae1a2-cb12-469c-8fc4-ae174d97d46a	preferred_username	claim.name
0a5ae1a2-cb12-469c-8fc4-ae174d97d46a	String	jsonType.label
66ad9f86-6d9f-4c73-b4de-69142e5b4f19	true	userinfo.token.claim
66ad9f86-6d9f-4c73-b4de-69142e5b4f19	profile	user.attribute
66ad9f86-6d9f-4c73-b4de-69142e5b4f19	true	id.token.claim
66ad9f86-6d9f-4c73-b4de-69142e5b4f19	true	access.token.claim
66ad9f86-6d9f-4c73-b4de-69142e5b4f19	profile	claim.name
66ad9f86-6d9f-4c73-b4de-69142e5b4f19	String	jsonType.label
4510c225-1fc5-4656-a729-3ad2b62cd868	true	userinfo.token.claim
4510c225-1fc5-4656-a729-3ad2b62cd868	picture	user.attribute
4510c225-1fc5-4656-a729-3ad2b62cd868	true	id.token.claim
4510c225-1fc5-4656-a729-3ad2b62cd868	true	access.token.claim
4510c225-1fc5-4656-a729-3ad2b62cd868	picture	claim.name
4510c225-1fc5-4656-a729-3ad2b62cd868	String	jsonType.label
c3807569-88ed-489d-b0fd-2349ed326999	true	userinfo.token.claim
c3807569-88ed-489d-b0fd-2349ed326999	website	user.attribute
c3807569-88ed-489d-b0fd-2349ed326999	true	id.token.claim
c3807569-88ed-489d-b0fd-2349ed326999	true	access.token.claim
c3807569-88ed-489d-b0fd-2349ed326999	website	claim.name
c3807569-88ed-489d-b0fd-2349ed326999	String	jsonType.label
afeb6894-ccd1-49d3-a2a0-63fe74a904bb	true	userinfo.token.claim
afeb6894-ccd1-49d3-a2a0-63fe74a904bb	gender	user.attribute
afeb6894-ccd1-49d3-a2a0-63fe74a904bb	true	id.token.claim
afeb6894-ccd1-49d3-a2a0-63fe74a904bb	true	access.token.claim
afeb6894-ccd1-49d3-a2a0-63fe74a904bb	gender	claim.name
afeb6894-ccd1-49d3-a2a0-63fe74a904bb	String	jsonType.label
211fd9a2-2302-4ff7-baab-b6a81e96d5c0	true	userinfo.token.claim
211fd9a2-2302-4ff7-baab-b6a81e96d5c0	birthdate	user.attribute
211fd9a2-2302-4ff7-baab-b6a81e96d5c0	true	id.token.claim
211fd9a2-2302-4ff7-baab-b6a81e96d5c0	true	access.token.claim
211fd9a2-2302-4ff7-baab-b6a81e96d5c0	birthdate	claim.name
211fd9a2-2302-4ff7-baab-b6a81e96d5c0	String	jsonType.label
bb591b9b-4d3b-4090-87f9-fd72f0b71dd9	true	userinfo.token.claim
bb591b9b-4d3b-4090-87f9-fd72f0b71dd9	zoneinfo	user.attribute
bb591b9b-4d3b-4090-87f9-fd72f0b71dd9	true	id.token.claim
bb591b9b-4d3b-4090-87f9-fd72f0b71dd9	true	access.token.claim
bb591b9b-4d3b-4090-87f9-fd72f0b71dd9	zoneinfo	claim.name
bb591b9b-4d3b-4090-87f9-fd72f0b71dd9	String	jsonType.label
ebe85859-54b3-4ce4-99b2-755fc950e41c	true	userinfo.token.claim
ebe85859-54b3-4ce4-99b2-755fc950e41c	locale	user.attribute
ebe85859-54b3-4ce4-99b2-755fc950e41c	true	id.token.claim
ebe85859-54b3-4ce4-99b2-755fc950e41c	true	access.token.claim
ebe85859-54b3-4ce4-99b2-755fc950e41c	locale	claim.name
ebe85859-54b3-4ce4-99b2-755fc950e41c	String	jsonType.label
f92ffa19-843b-44bd-8176-38b7eeb1c40c	true	userinfo.token.claim
f92ffa19-843b-44bd-8176-38b7eeb1c40c	updatedAt	user.attribute
f92ffa19-843b-44bd-8176-38b7eeb1c40c	true	id.token.claim
f92ffa19-843b-44bd-8176-38b7eeb1c40c	true	access.token.claim
f92ffa19-843b-44bd-8176-38b7eeb1c40c	updated_at	claim.name
f92ffa19-843b-44bd-8176-38b7eeb1c40c	long	jsonType.label
3b81f253-d32d-453a-95dd-30971a4d9cfb	true	userinfo.token.claim
3b81f253-d32d-453a-95dd-30971a4d9cfb	email	user.attribute
3b81f253-d32d-453a-95dd-30971a4d9cfb	true	id.token.claim
3b81f253-d32d-453a-95dd-30971a4d9cfb	true	access.token.claim
3b81f253-d32d-453a-95dd-30971a4d9cfb	email	claim.name
3b81f253-d32d-453a-95dd-30971a4d9cfb	String	jsonType.label
5a6bd69b-a7cc-45e9-827b-975d59ef64a5	true	userinfo.token.claim
5a6bd69b-a7cc-45e9-827b-975d59ef64a5	emailVerified	user.attribute
5a6bd69b-a7cc-45e9-827b-975d59ef64a5	true	id.token.claim
5a6bd69b-a7cc-45e9-827b-975d59ef64a5	true	access.token.claim
5a6bd69b-a7cc-45e9-827b-975d59ef64a5	email_verified	claim.name
5a6bd69b-a7cc-45e9-827b-975d59ef64a5	boolean	jsonType.label
a8a49e41-3fea-4f5a-b061-788fc52ac867	formatted	user.attribute.formatted
a8a49e41-3fea-4f5a-b061-788fc52ac867	country	user.attribute.country
a8a49e41-3fea-4f5a-b061-788fc52ac867	postal_code	user.attribute.postal_code
a8a49e41-3fea-4f5a-b061-788fc52ac867	true	userinfo.token.claim
a8a49e41-3fea-4f5a-b061-788fc52ac867	street	user.attribute.street
a8a49e41-3fea-4f5a-b061-788fc52ac867	true	id.token.claim
a8a49e41-3fea-4f5a-b061-788fc52ac867	region	user.attribute.region
a8a49e41-3fea-4f5a-b061-788fc52ac867	true	access.token.claim
a8a49e41-3fea-4f5a-b061-788fc52ac867	locality	user.attribute.locality
718e46e8-63c9-4a57-bac3-d2a09d8f1382	true	userinfo.token.claim
718e46e8-63c9-4a57-bac3-d2a09d8f1382	phoneNumber	user.attribute
718e46e8-63c9-4a57-bac3-d2a09d8f1382	true	id.token.claim
718e46e8-63c9-4a57-bac3-d2a09d8f1382	true	access.token.claim
718e46e8-63c9-4a57-bac3-d2a09d8f1382	phone_number	claim.name
718e46e8-63c9-4a57-bac3-d2a09d8f1382	String	jsonType.label
8172b93a-befc-45e3-b288-5e9905aea4b6	true	userinfo.token.claim
8172b93a-befc-45e3-b288-5e9905aea4b6	phoneNumberVerified	user.attribute
8172b93a-befc-45e3-b288-5e9905aea4b6	true	id.token.claim
8172b93a-befc-45e3-b288-5e9905aea4b6	true	access.token.claim
8172b93a-befc-45e3-b288-5e9905aea4b6	phone_number_verified	claim.name
8172b93a-befc-45e3-b288-5e9905aea4b6	boolean	jsonType.label
2d137772-922a-496a-abe8-b261fea5315a	true	multivalued
2d137772-922a-496a-abe8-b261fea5315a	foo	user.attribute
2d137772-922a-496a-abe8-b261fea5315a	true	access.token.claim
2d137772-922a-496a-abe8-b261fea5315a	realm_access.roles	claim.name
2d137772-922a-496a-abe8-b261fea5315a	String	jsonType.label
302625d0-9b67-451a-a2bd-adb48fe5647f	true	multivalued
302625d0-9b67-451a-a2bd-adb48fe5647f	foo	user.attribute
302625d0-9b67-451a-a2bd-adb48fe5647f	true	access.token.claim
302625d0-9b67-451a-a2bd-adb48fe5647f	resource_access.${client_id}.roles	claim.name
302625d0-9b67-451a-a2bd-adb48fe5647f	String	jsonType.label
0fe69e70-ee95-4245-9650-6392d1824e67	true	userinfo.token.claim
0fe69e70-ee95-4245-9650-6392d1824e67	username	user.attribute
0fe69e70-ee95-4245-9650-6392d1824e67	true	id.token.claim
0fe69e70-ee95-4245-9650-6392d1824e67	true	access.token.claim
0fe69e70-ee95-4245-9650-6392d1824e67	upn	claim.name
0fe69e70-ee95-4245-9650-6392d1824e67	String	jsonType.label
5c173a6b-681c-4371-ba09-f7b7211d64ae	true	multivalued
5c173a6b-681c-4371-ba09-f7b7211d64ae	foo	user.attribute
5c173a6b-681c-4371-ba09-f7b7211d64ae	true	id.token.claim
5c173a6b-681c-4371-ba09-f7b7211d64ae	true	access.token.claim
5c173a6b-681c-4371-ba09-f7b7211d64ae	groups	claim.name
5c173a6b-681c-4371-ba09-f7b7211d64ae	String	jsonType.label
af894033-d494-4105-b2c3-463eacad959c	true	id.token.claim
af894033-d494-4105-b2c3-463eacad959c	true	access.token.claim
81e7bde4-77ac-422c-b21a-b5865236f0b9	true	userinfo.token.claim
81e7bde4-77ac-422c-b21a-b5865236f0b9	email	user.attribute
81e7bde4-77ac-422c-b21a-b5865236f0b9	true	id.token.claim
81e7bde4-77ac-422c-b21a-b5865236f0b9	true	access.token.claim
81e7bde4-77ac-422c-b21a-b5865236f0b9	email	claim.name
81e7bde4-77ac-422c-b21a-b5865236f0b9	String	jsonType.label
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	true	userinfo.token.claim
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	emailVerified	user.attribute
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	true	id.token.claim
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	true	access.token.claim
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	email_verified	claim.name
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	boolean	jsonType.label
45db5704-a0b9-451d-83d2-e599c12042f5	true	userinfo.token.claim
45db5704-a0b9-451d-83d2-e599c12042f5	middleName	user.attribute
45db5704-a0b9-451d-83d2-e599c12042f5	true	id.token.claim
45db5704-a0b9-451d-83d2-e599c12042f5	true	access.token.claim
45db5704-a0b9-451d-83d2-e599c12042f5	middle_name	claim.name
45db5704-a0b9-451d-83d2-e599c12042f5	String	jsonType.label
5dfdd04e-e987-4437-8791-7309d7eae9c6	true	userinfo.token.claim
5dfdd04e-e987-4437-8791-7309d7eae9c6	nickname	user.attribute
5dfdd04e-e987-4437-8791-7309d7eae9c6	true	id.token.claim
5dfdd04e-e987-4437-8791-7309d7eae9c6	true	access.token.claim
5dfdd04e-e987-4437-8791-7309d7eae9c6	nickname	claim.name
5dfdd04e-e987-4437-8791-7309d7eae9c6	String	jsonType.label
45cc72c7-984a-4eb3-b32d-eb9142c9f8a9	true	id.token.claim
45cc72c7-984a-4eb3-b32d-eb9142c9f8a9	true	access.token.claim
45cc72c7-984a-4eb3-b32d-eb9142c9f8a9	true	userinfo.token.claim
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	true	userinfo.token.claim
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	firstName	user.attribute
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	true	id.token.claim
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	true	access.token.claim
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	given_name	claim.name
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	String	jsonType.label
96260702-ab50-4f7c-b56d-b87675242d01	true	userinfo.token.claim
96260702-ab50-4f7c-b56d-b87675242d01	profile	user.attribute
96260702-ab50-4f7c-b56d-b87675242d01	true	id.token.claim
96260702-ab50-4f7c-b56d-b87675242d01	true	access.token.claim
96260702-ab50-4f7c-b56d-b87675242d01	profile	claim.name
96260702-ab50-4f7c-b56d-b87675242d01	String	jsonType.label
77fb9f07-3604-44b2-892f-d13902c23e0b	true	userinfo.token.claim
77fb9f07-3604-44b2-892f-d13902c23e0b	updatedAt	user.attribute
77fb9f07-3604-44b2-892f-d13902c23e0b	true	id.token.claim
77fb9f07-3604-44b2-892f-d13902c23e0b	true	access.token.claim
77fb9f07-3604-44b2-892f-d13902c23e0b	updated_at	claim.name
77fb9f07-3604-44b2-892f-d13902c23e0b	long	jsonType.label
d7fee141-2abf-4572-bcf3-bf085e0a762c	true	userinfo.token.claim
d7fee141-2abf-4572-bcf3-bf085e0a762c	username	user.attribute
d7fee141-2abf-4572-bcf3-bf085e0a762c	true	id.token.claim
d7fee141-2abf-4572-bcf3-bf085e0a762c	true	access.token.claim
d7fee141-2abf-4572-bcf3-bf085e0a762c	preferred_username	claim.name
d7fee141-2abf-4572-bcf3-bf085e0a762c	String	jsonType.label
ebc56ceb-9d1d-4236-b00c-a58813330a40	true	userinfo.token.claim
ebc56ceb-9d1d-4236-b00c-a58813330a40	gender	user.attribute
ebc56ceb-9d1d-4236-b00c-a58813330a40	true	id.token.claim
ebc56ceb-9d1d-4236-b00c-a58813330a40	true	access.token.claim
ebc56ceb-9d1d-4236-b00c-a58813330a40	gender	claim.name
ebc56ceb-9d1d-4236-b00c-a58813330a40	String	jsonType.label
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	true	userinfo.token.claim
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	picture	user.attribute
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	true	id.token.claim
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	true	access.token.claim
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	picture	claim.name
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	String	jsonType.label
acc46178-8cfd-43d1-8a0f-788eb8886f4a	true	userinfo.token.claim
acc46178-8cfd-43d1-8a0f-788eb8886f4a	zoneinfo	user.attribute
acc46178-8cfd-43d1-8a0f-788eb8886f4a	true	id.token.claim
acc46178-8cfd-43d1-8a0f-788eb8886f4a	true	access.token.claim
acc46178-8cfd-43d1-8a0f-788eb8886f4a	zoneinfo	claim.name
acc46178-8cfd-43d1-8a0f-788eb8886f4a	String	jsonType.label
abe0b621-7d97-416e-a432-1a63a830fa7d	true	userinfo.token.claim
abe0b621-7d97-416e-a432-1a63a830fa7d	birthdate	user.attribute
abe0b621-7d97-416e-a432-1a63a830fa7d	true	id.token.claim
abe0b621-7d97-416e-a432-1a63a830fa7d	true	access.token.claim
abe0b621-7d97-416e-a432-1a63a830fa7d	birthdate	claim.name
abe0b621-7d97-416e-a432-1a63a830fa7d	String	jsonType.label
34392d29-3859-4c47-8794-3882417dea95	true	userinfo.token.claim
34392d29-3859-4c47-8794-3882417dea95	website	user.attribute
34392d29-3859-4c47-8794-3882417dea95	true	id.token.claim
34392d29-3859-4c47-8794-3882417dea95	true	access.token.claim
34392d29-3859-4c47-8794-3882417dea95	website	claim.name
34392d29-3859-4c47-8794-3882417dea95	String	jsonType.label
7c51c33a-339c-419b-b61c-8900928a17b8	true	userinfo.token.claim
7c51c33a-339c-419b-b61c-8900928a17b8	lastName	user.attribute
7c51c33a-339c-419b-b61c-8900928a17b8	true	id.token.claim
7c51c33a-339c-419b-b61c-8900928a17b8	true	access.token.claim
7c51c33a-339c-419b-b61c-8900928a17b8	family_name	claim.name
7c51c33a-339c-419b-b61c-8900928a17b8	String	jsonType.label
1c7d25a8-1890-433a-b034-5d5e472ef3d7	true	userinfo.token.claim
1c7d25a8-1890-433a-b034-5d5e472ef3d7	locale	user.attribute
1c7d25a8-1890-433a-b034-5d5e472ef3d7	true	id.token.claim
1c7d25a8-1890-433a-b034-5d5e472ef3d7	true	access.token.claim
1c7d25a8-1890-433a-b034-5d5e472ef3d7	locale	claim.name
1c7d25a8-1890-433a-b034-5d5e472ef3d7	String	jsonType.label
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	foo	user.attribute
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	true	access.token.claim
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	resource_access.${client_id}.roles	claim.name
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	String	jsonType.label
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	true	multivalued
ea513ef6-9146-43b6-8209-d21b13b4da96	foo	user.attribute
ea513ef6-9146-43b6-8209-d21b13b4da96	true	access.token.claim
ea513ef6-9146-43b6-8209-d21b13b4da96	realm_access.roles	claim.name
ea513ef6-9146-43b6-8209-d21b13b4da96	String	jsonType.label
ea513ef6-9146-43b6-8209-d21b13b4da96	true	multivalued
556081f7-86b7-4de1-a9ae-7f28a5314208	true	userinfo.token.claim
556081f7-86b7-4de1-a9ae-7f28a5314208	phoneNumber	user.attribute
556081f7-86b7-4de1-a9ae-7f28a5314208	true	id.token.claim
556081f7-86b7-4de1-a9ae-7f28a5314208	true	access.token.claim
556081f7-86b7-4de1-a9ae-7f28a5314208	phone_number	claim.name
556081f7-86b7-4de1-a9ae-7f28a5314208	String	jsonType.label
17399230-4b7f-4e18-bbdb-cb910dc11d51	true	userinfo.token.claim
17399230-4b7f-4e18-bbdb-cb910dc11d51	phoneNumberVerified	user.attribute
17399230-4b7f-4e18-bbdb-cb910dc11d51	true	id.token.claim
17399230-4b7f-4e18-bbdb-cb910dc11d51	true	access.token.claim
17399230-4b7f-4e18-bbdb-cb910dc11d51	phone_number_verified	claim.name
17399230-4b7f-4e18-bbdb-cb910dc11d51	boolean	jsonType.label
966f1722-36a5-4fe0-a964-82bbde99d73b	true	multivalued
966f1722-36a5-4fe0-a964-82bbde99d73b	true	userinfo.token.claim
966f1722-36a5-4fe0-a964-82bbde99d73b	foo	user.attribute
966f1722-36a5-4fe0-a964-82bbde99d73b	true	id.token.claim
966f1722-36a5-4fe0-a964-82bbde99d73b	true	access.token.claim
966f1722-36a5-4fe0-a964-82bbde99d73b	groups	claim.name
966f1722-36a5-4fe0-a964-82bbde99d73b	String	jsonType.label
6882646c-0578-47b0-aa19-05b248698fff	true	userinfo.token.claim
6882646c-0578-47b0-aa19-05b248698fff	username	user.attribute
6882646c-0578-47b0-aa19-05b248698fff	true	id.token.claim
6882646c-0578-47b0-aa19-05b248698fff	true	access.token.claim
6882646c-0578-47b0-aa19-05b248698fff	upn	claim.name
6882646c-0578-47b0-aa19-05b248698fff	String	jsonType.label
8f6da58f-6f79-4d82-ac49-7d5b1f203905	formatted	user.attribute.formatted
8f6da58f-6f79-4d82-ac49-7d5b1f203905	country	user.attribute.country
8f6da58f-6f79-4d82-ac49-7d5b1f203905	postal_code	user.attribute.postal_code
8f6da58f-6f79-4d82-ac49-7d5b1f203905	true	userinfo.token.claim
8f6da58f-6f79-4d82-ac49-7d5b1f203905	street	user.attribute.street
8f6da58f-6f79-4d82-ac49-7d5b1f203905	true	id.token.claim
8f6da58f-6f79-4d82-ac49-7d5b1f203905	region	user.attribute.region
8f6da58f-6f79-4d82-ac49-7d5b1f203905	true	access.token.claim
8f6da58f-6f79-4d82-ac49-7d5b1f203905	locality	user.attribute.locality
629e3a5f-5f05-4847-abbe-ebf931a609be	false	single
629e3a5f-5f05-4847-abbe-ebf931a609be	Basic	attribute.nameformat
629e3a5f-5f05-4847-abbe-ebf931a609be	Role	attribute.name
92f7fa1b-054a-4c1b-80c5-244e7dfd2634	true	id.token.claim
92f7fa1b-054a-4c1b-80c5-244e7dfd2634	true	access.token.claim
92f7fa1b-054a-4c1b-80c5-244e7dfd2634	true	userinfo.token.claim
3832b8ab-16c2-4cce-8bf3-c442e9513785	true	userinfo.token.claim
3832b8ab-16c2-4cce-8bf3-c442e9513785	locale	user.attribute
3832b8ab-16c2-4cce-8bf3-c442e9513785	true	id.token.claim
3832b8ab-16c2-4cce-8bf3-c442e9513785	true	access.token.claim
3832b8ab-16c2-4cce-8bf3-c442e9513785	locale	claim.name
3832b8ab-16c2-4cce-8bf3-c442e9513785	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
77f2a7e8-ac8b-47fd-b466-46732acc31f5	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	33aa2816-81f6-4e2e-bea7-18d3423818fe	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	417e8661-f238-485c-bf0a-b9e4c2309e4a	ff104bbd-8ba5-4cd4-be53-71e7394d2a20	bc87652a-1e4a-41fe-a9cf-caa20ab1130d	be99312d-a937-4052-af84-befa735f35b8	bf977d4e-73e3-44f0-98ff-ba1efc2e6d7a	2592000	f	900	t	f	16287895-5e08-4df5-b79b-ef310056bc92	0	f	0	0	3d64fa1c-7e1e-4296-984c-70032d01c2e4
91cb1cd2-e133-4f67-9800-593c809120c8	60	300	300	\N	\N	\N	t	f	0	\N	ghoverblog	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	eff1bfeb-b178-464b-81ff-9c3dba05bbea	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	c5fe27ef-f6cf-4ed0-a7b7-a970c9d85c07	e407d55b-01d8-4988-9a73-7f1b90fc1c82	7260a2fe-a2c7-4ef8-b667-384ea105e48c	b9e641e6-c58f-4ff8-a0b7-43dbf66801fd	fdc6a00e-492e-405e-b05c-c5abb2683d7f	2592000	f	900	t	f	345ad828-cfa2-441f-a3df-e563e5753bc6	0	f	0	0	c8281036-19c6-4d54-92e1-b3efbf04d387
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	77f2a7e8-ac8b-47fd-b466-46732acc31f5	
_browser_header.xContentTypeOptions	77f2a7e8-ac8b-47fd-b466-46732acc31f5	nosniff
_browser_header.xRobotsTag	77f2a7e8-ac8b-47fd-b466-46732acc31f5	none
_browser_header.xFrameOptions	77f2a7e8-ac8b-47fd-b466-46732acc31f5	SAMEORIGIN
_browser_header.contentSecurityPolicy	77f2a7e8-ac8b-47fd-b466-46732acc31f5	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	77f2a7e8-ac8b-47fd-b466-46732acc31f5	1; mode=block
_browser_header.strictTransportSecurity	77f2a7e8-ac8b-47fd-b466-46732acc31f5	max-age=31536000; includeSubDomains
bruteForceProtected	77f2a7e8-ac8b-47fd-b466-46732acc31f5	false
permanentLockout	77f2a7e8-ac8b-47fd-b466-46732acc31f5	false
maxFailureWaitSeconds	77f2a7e8-ac8b-47fd-b466-46732acc31f5	900
minimumQuickLoginWaitSeconds	77f2a7e8-ac8b-47fd-b466-46732acc31f5	60
waitIncrementSeconds	77f2a7e8-ac8b-47fd-b466-46732acc31f5	60
quickLoginCheckMilliSeconds	77f2a7e8-ac8b-47fd-b466-46732acc31f5	1000
maxDeltaTimeSeconds	77f2a7e8-ac8b-47fd-b466-46732acc31f5	43200
failureFactor	77f2a7e8-ac8b-47fd-b466-46732acc31f5	30
displayName	77f2a7e8-ac8b-47fd-b466-46732acc31f5	Keycloak
displayNameHtml	77f2a7e8-ac8b-47fd-b466-46732acc31f5	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	77f2a7e8-ac8b-47fd-b466-46732acc31f5	RS256
offlineSessionMaxLifespanEnabled	77f2a7e8-ac8b-47fd-b466-46732acc31f5	false
offlineSessionMaxLifespan	77f2a7e8-ac8b-47fd-b466-46732acc31f5	5184000
_browser_header.contentSecurityPolicyReportOnly	91cb1cd2-e133-4f67-9800-593c809120c8	
_browser_header.xContentTypeOptions	91cb1cd2-e133-4f67-9800-593c809120c8	nosniff
_browser_header.xRobotsTag	91cb1cd2-e133-4f67-9800-593c809120c8	none
_browser_header.xFrameOptions	91cb1cd2-e133-4f67-9800-593c809120c8	SAMEORIGIN
_browser_header.contentSecurityPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	91cb1cd2-e133-4f67-9800-593c809120c8	1; mode=block
_browser_header.strictTransportSecurity	91cb1cd2-e133-4f67-9800-593c809120c8	max-age=31536000; includeSubDomains
bruteForceProtected	91cb1cd2-e133-4f67-9800-593c809120c8	false
permanentLockout	91cb1cd2-e133-4f67-9800-593c809120c8	false
maxFailureWaitSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	900
minimumQuickLoginWaitSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	60
waitIncrementSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	60
quickLoginCheckMilliSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	1000
maxDeltaTimeSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	43200
failureFactor	91cb1cd2-e133-4f67-9800-593c809120c8	30
defaultSignatureAlgorithm	91cb1cd2-e133-4f67-9800-593c809120c8	RS256
offlineSessionMaxLifespanEnabled	91cb1cd2-e133-4f67-9800-593c809120c8	false
offlineSessionMaxLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	5184000
clientSessionIdleTimeout	91cb1cd2-e133-4f67-9800-593c809120c8	0
clientSessionMaxLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	0
clientOfflineSessionIdleTimeout	91cb1cd2-e133-4f67-9800-593c809120c8	0
clientOfflineSessionMaxLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	0
actionTokenGeneratedByAdminLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	43200
actionTokenGeneratedByUserLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	300
oauth2DeviceCodeLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	600
oauth2DevicePollingInterval	91cb1cd2-e133-4f67-9800-593c809120c8	5
webAuthnPolicyRpEntityName	91cb1cd2-e133-4f67-9800-593c809120c8	keycloak
webAuthnPolicySignatureAlgorithms	91cb1cd2-e133-4f67-9800-593c809120c8	ES256
webAuthnPolicyRpId	91cb1cd2-e133-4f67-9800-593c809120c8	
webAuthnPolicyAttestationConveyancePreference	91cb1cd2-e133-4f67-9800-593c809120c8	not specified
webAuthnPolicyAuthenticatorAttachment	91cb1cd2-e133-4f67-9800-593c809120c8	not specified
webAuthnPolicyRequireResidentKey	91cb1cd2-e133-4f67-9800-593c809120c8	not specified
webAuthnPolicyUserVerificationRequirement	91cb1cd2-e133-4f67-9800-593c809120c8	not specified
webAuthnPolicyCreateTimeout	91cb1cd2-e133-4f67-9800-593c809120c8	0
webAuthnPolicyAvoidSameAuthenticatorRegister	91cb1cd2-e133-4f67-9800-593c809120c8	false
webAuthnPolicyRpEntityNamePasswordless	91cb1cd2-e133-4f67-9800-593c809120c8	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	91cb1cd2-e133-4f67-9800-593c809120c8	ES256
webAuthnPolicyRpIdPasswordless	91cb1cd2-e133-4f67-9800-593c809120c8	
webAuthnPolicyAttestationConveyancePreferencePasswordless	91cb1cd2-e133-4f67-9800-593c809120c8	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	91cb1cd2-e133-4f67-9800-593c809120c8	not specified
webAuthnPolicyRequireResidentKeyPasswordless	91cb1cd2-e133-4f67-9800-593c809120c8	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	91cb1cd2-e133-4f67-9800-593c809120c8	not specified
webAuthnPolicyCreateTimeoutPasswordless	91cb1cd2-e133-4f67-9800-593c809120c8	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	91cb1cd2-e133-4f67-9800-593c809120c8	false
cibaBackchannelTokenDeliveryMode	91cb1cd2-e133-4f67-9800-593c809120c8	poll
cibaExpiresIn	91cb1cd2-e133-4f67-9800-593c809120c8	120
cibaInterval	91cb1cd2-e133-4f67-9800-593c809120c8	5
cibaAuthRequestedUserHint	91cb1cd2-e133-4f67-9800-593c809120c8	login_hint
parRequestUriLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	60
client-policies.profiles	91cb1cd2-e133-4f67-9800-593c809120c8	{"profiles":[]}
client-policies.policies	91cb1cd2-e133-4f67-9800-593c809120c8	{"policies":[]}
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
77f2a7e8-ac8b-47fd-b466-46732acc31f5	jboss-logging
91cb1cd2-e133-4f67-9800-593c809120c8	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	77f2a7e8-ac8b-47fd-b466-46732acc31f5
password	password	t	t	91cb1cd2-e133-4f67-9800-593c809120c8
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.redirect_uris (client_id, value) FROM stdin;
ef98e5d1-a292-4e62-858b-2fa84ff9f7cc	/realms/master/account/*
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	/realms/master/account/*
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	/admin/master/console/*
42b5d478-6044-4e3d-aff5-837150682d0c	/realms/ghoverblog/account/*
255e96f7-f58d-4d04-b853-009fefecd80d	/realms/ghoverblog/account/*
85a82e6e-ccb6-4153-8304-3645d119899b	/admin/ghoverblog/console/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
5eef5032-1619-41c4-8b5d-faaf46ecb374	VERIFY_EMAIL	Verify Email	77f2a7e8-ac8b-47fd-b466-46732acc31f5	t	f	VERIFY_EMAIL	50
36c3b22e-d888-4ea2-abf4-de664f7dec30	UPDATE_PROFILE	Update Profile	77f2a7e8-ac8b-47fd-b466-46732acc31f5	t	f	UPDATE_PROFILE	40
637171a9-42a1-45f4-b2a3-fa393bf2a729	CONFIGURE_TOTP	Configure OTP	77f2a7e8-ac8b-47fd-b466-46732acc31f5	t	f	CONFIGURE_TOTP	10
16418d78-1cc8-40f2-9c50-5ca677944f21	UPDATE_PASSWORD	Update Password	77f2a7e8-ac8b-47fd-b466-46732acc31f5	t	f	UPDATE_PASSWORD	30
df3bcdc1-31fe-4820-8ab9-606f63201922	terms_and_conditions	Terms and Conditions	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f	f	terms_and_conditions	20
64676cf1-7c72-44cf-b934-5aa8ceb837f8	update_user_locale	Update User Locale	77f2a7e8-ac8b-47fd-b466-46732acc31f5	t	f	update_user_locale	1000
7bf814da-110e-4a28-86e5-5d967a97e97a	delete_account	Delete Account	77f2a7e8-ac8b-47fd-b466-46732acc31f5	f	f	delete_account	60
fc3261db-54dd-46c3-bde9-90f5bd93cd15	webauthn-register	Webauthn Register	77f2a7e8-ac8b-47fd-b466-46732acc31f5	t	f	webauthn-register	70
65c14a85-ab61-4f0d-bd9e-36110fcd99fa	webauthn-register-passwordless	Webauthn Register Passwordless	77f2a7e8-ac8b-47fd-b466-46732acc31f5	t	f	webauthn-register-passwordless	80
e8bc46b5-9375-4041-b73d-f8bdfa730cbd	CONFIGURE_TOTP	Configure OTP	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	CONFIGURE_TOTP	10
84db619c-4b2b-485d-8592-091d624bc44c	terms_and_conditions	Terms and Conditions	91cb1cd2-e133-4f67-9800-593c809120c8	f	f	terms_and_conditions	20
2dcfbbaf-8d41-452e-8467-2ab755b3c768	UPDATE_PASSWORD	Update Password	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	UPDATE_PASSWORD	30
918d14c7-05da-4cea-a5cc-0f3f6aaba1ba	UPDATE_PROFILE	Update Profile	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	UPDATE_PROFILE	40
b1ace507-80fa-4555-a111-33987ad97ad0	VERIFY_EMAIL	Verify Email	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	VERIFY_EMAIL	50
d87ae2d3-6459-4684-b828-fae4d465f1a1	delete_account	Delete Account	91cb1cd2-e133-4f67-9800-593c809120c8	f	f	delete_account	60
e25e7dea-592d-4169-9622-1bbb745d6bba	webauthn-register	Webauthn Register	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	webauthn-register	70
f05cc576-6cf1-4b8d-b01a-c3e03af6851a	webauthn-register-passwordless	Webauthn Register Passwordless	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	webauthn-register-passwordless	80
67d78f7e-f0e0-42c4-b4fa-66339adf16f6	update_user_locale	Update User Locale	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
38b5fe58-57ed-411d-9bd0-62bcfe9ebf84	760342f2-adbe-435d-ad0d-e15eafb9d43c
255e96f7-f58d-4d04-b853-009fefecd80d	6964e136-e8ce-49f8-b7b1-d04747ec11cd
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
ac977999-0b94-4f64-b785-547288ea0387	\N	08c78b71-95ee-4bee-a768-15a997d8700d	f	t	\N	\N	\N	77f2a7e8-ac8b-47fd-b466-46732acc31f5	maxime	1683637990159	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
3d64fa1c-7e1e-4296-984c-70032d01c2e4	ac977999-0b94-4f64-b785-547288ea0387
41e5d293-7330-4b1e-851a-0d148dae7e87	ac977999-0b94-4f64-b785-547288ea0387
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.web_origins (client_id, value) FROM stdin;
f71b8573-da03-4833-a1b4-a0e8cb4cd56d	+
dd60301a-3b36-4b7b-b7f2-538c72209465	*
85a82e6e-ccb6-4153-8304-3645d119899b	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

