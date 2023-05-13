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
f15648d3-a900-409d-9156-cf61cf1c18f6	\N	auth-cookie	f7fa1af8-0135-4dab-a875-ad354a83a603	a6a50dfb-33f5-46ad-8ab6-da86ed4414ae	2	10	f	\N	\N
b705268f-adf3-4f6b-b5ec-8ab51c736ffb	\N	auth-spnego	f7fa1af8-0135-4dab-a875-ad354a83a603	a6a50dfb-33f5-46ad-8ab6-da86ed4414ae	3	20	f	\N	\N
ffc11b6a-0a79-4257-bc95-4b426eb3eb84	\N	identity-provider-redirector	f7fa1af8-0135-4dab-a875-ad354a83a603	a6a50dfb-33f5-46ad-8ab6-da86ed4414ae	2	25	f	\N	\N
7fe02afe-5fc2-4ae4-bfa2-593536055948	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	a6a50dfb-33f5-46ad-8ab6-da86ed4414ae	2	30	t	1b1bf1d8-29ce-4cd4-a15a-64b66d351910	\N
bb453288-4d74-4398-a6d9-3a28407d2b98	\N	auth-username-password-form	f7fa1af8-0135-4dab-a875-ad354a83a603	1b1bf1d8-29ce-4cd4-a15a-64b66d351910	0	10	f	\N	\N
5a643cdb-0336-474e-94f5-518a2bc660f2	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	1b1bf1d8-29ce-4cd4-a15a-64b66d351910	1	20	t	40fc88ea-acc6-473a-8d65-b1974b2e7727	\N
a1824771-6499-4961-b5fc-53258d79bfa6	\N	conditional-user-configured	f7fa1af8-0135-4dab-a875-ad354a83a603	40fc88ea-acc6-473a-8d65-b1974b2e7727	0	10	f	\N	\N
8ec4fd52-5876-4455-bafe-ff8ef1e181df	\N	auth-otp-form	f7fa1af8-0135-4dab-a875-ad354a83a603	40fc88ea-acc6-473a-8d65-b1974b2e7727	0	20	f	\N	\N
9c91bda0-4658-46a2-9a72-3901dd506903	\N	direct-grant-validate-username	f7fa1af8-0135-4dab-a875-ad354a83a603	e06cea99-b01a-4f7b-b002-2bd368cb3ad0	0	10	f	\N	\N
5380abac-d763-4cb6-ae40-fbb8cd228a95	\N	direct-grant-validate-password	f7fa1af8-0135-4dab-a875-ad354a83a603	e06cea99-b01a-4f7b-b002-2bd368cb3ad0	0	20	f	\N	\N
6a83a5e8-def3-49b3-8dc6-287d17f429f4	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	e06cea99-b01a-4f7b-b002-2bd368cb3ad0	1	30	t	20df7c83-ad8e-471c-a48b-dcd6ed087154	\N
2042d264-6dd7-4d0e-a713-0b84cbc6166f	\N	conditional-user-configured	f7fa1af8-0135-4dab-a875-ad354a83a603	20df7c83-ad8e-471c-a48b-dcd6ed087154	0	10	f	\N	\N
3cfc6941-3ce1-4bec-b6b1-c958ad541f01	\N	direct-grant-validate-otp	f7fa1af8-0135-4dab-a875-ad354a83a603	20df7c83-ad8e-471c-a48b-dcd6ed087154	0	20	f	\N	\N
e7f21bae-8326-42f3-9eda-9678cf8c56bf	\N	registration-page-form	f7fa1af8-0135-4dab-a875-ad354a83a603	1654fb73-250a-4b9a-9497-7ef570c7758b	0	10	t	03ef1887-a24a-4d4b-b678-49d1e3d1f0e2	\N
fdcd0270-5c57-4818-b9cf-de192784f4c6	\N	registration-user-creation	f7fa1af8-0135-4dab-a875-ad354a83a603	03ef1887-a24a-4d4b-b678-49d1e3d1f0e2	0	20	f	\N	\N
bddcae67-87b3-4a62-bbe8-2ce8b93f6eeb	\N	registration-profile-action	f7fa1af8-0135-4dab-a875-ad354a83a603	03ef1887-a24a-4d4b-b678-49d1e3d1f0e2	0	40	f	\N	\N
48014ab4-61ad-4f58-a7db-21273a5db18d	\N	registration-password-action	f7fa1af8-0135-4dab-a875-ad354a83a603	03ef1887-a24a-4d4b-b678-49d1e3d1f0e2	0	50	f	\N	\N
6907da41-89ba-4997-96a4-b3f4da64ce10	\N	registration-recaptcha-action	f7fa1af8-0135-4dab-a875-ad354a83a603	03ef1887-a24a-4d4b-b678-49d1e3d1f0e2	3	60	f	\N	\N
d9d831a0-6405-478f-a918-e2ec19e0872a	\N	reset-credentials-choose-user	f7fa1af8-0135-4dab-a875-ad354a83a603	9d76aa71-91c1-48c7-b671-5aa59108d2d5	0	10	f	\N	\N
0fa7c82f-e638-4973-b216-45034e5bfb99	\N	reset-credential-email	f7fa1af8-0135-4dab-a875-ad354a83a603	9d76aa71-91c1-48c7-b671-5aa59108d2d5	0	20	f	\N	\N
68f9680f-9f97-49aa-8d9e-2f1bacdd54cc	\N	reset-password	f7fa1af8-0135-4dab-a875-ad354a83a603	9d76aa71-91c1-48c7-b671-5aa59108d2d5	0	30	f	\N	\N
7391ebcf-ca90-45a6-95e5-648f263e77cb	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	9d76aa71-91c1-48c7-b671-5aa59108d2d5	1	40	t	c74b99ad-7fc8-44b8-ad55-04aa7236de0d	\N
a67757f5-f5ed-42df-86f1-e8646eb35b76	\N	conditional-user-configured	f7fa1af8-0135-4dab-a875-ad354a83a603	c74b99ad-7fc8-44b8-ad55-04aa7236de0d	0	10	f	\N	\N
430dcd19-7cb1-4178-a41f-361e04527015	\N	reset-otp	f7fa1af8-0135-4dab-a875-ad354a83a603	c74b99ad-7fc8-44b8-ad55-04aa7236de0d	0	20	f	\N	\N
ff1117b4-86b2-4fb5-9c33-1d412058b4c9	\N	client-secret	f7fa1af8-0135-4dab-a875-ad354a83a603	a8f7cfd9-739d-4801-b977-bdcd85796eb7	2	10	f	\N	\N
6575ac24-0e96-4246-906c-f0e65ed3cda6	\N	client-jwt	f7fa1af8-0135-4dab-a875-ad354a83a603	a8f7cfd9-739d-4801-b977-bdcd85796eb7	2	20	f	\N	\N
82f321a8-b5f5-424c-a3af-4cc1b46b69e5	\N	client-secret-jwt	f7fa1af8-0135-4dab-a875-ad354a83a603	a8f7cfd9-739d-4801-b977-bdcd85796eb7	2	30	f	\N	\N
96fada0f-b06a-4c4d-bf14-08702872499c	\N	client-x509	f7fa1af8-0135-4dab-a875-ad354a83a603	a8f7cfd9-739d-4801-b977-bdcd85796eb7	2	40	f	\N	\N
1eb9c482-ee3d-4b2e-a846-c19fc3ebfb0c	\N	idp-review-profile	f7fa1af8-0135-4dab-a875-ad354a83a603	d74fa892-fcb1-42d3-ba6e-bbada92899cd	0	10	f	\N	4099a3b1-f4fd-4798-a4cc-87b4bfe5fc02
47a9fd92-f665-4970-bc56-709a756f2e69	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	d74fa892-fcb1-42d3-ba6e-bbada92899cd	0	20	t	7ab903bf-484e-4eda-917c-99647ea300af	\N
31103d96-e298-4e28-95ec-1e21cb03cf4b	\N	idp-create-user-if-unique	f7fa1af8-0135-4dab-a875-ad354a83a603	7ab903bf-484e-4eda-917c-99647ea300af	2	10	f	\N	c94f118f-0b63-4704-8206-5aee2cc5dd7e
b1b01068-6e9e-4bd7-a8c0-d466418f29ee	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	7ab903bf-484e-4eda-917c-99647ea300af	2	20	t	8d2a709e-bc33-469c-83fc-e63b62df3bb9	\N
1cc14f7e-c8e7-424d-860f-171cdc78a6d8	\N	idp-confirm-link	f7fa1af8-0135-4dab-a875-ad354a83a603	8d2a709e-bc33-469c-83fc-e63b62df3bb9	0	10	f	\N	\N
dec5281b-24f3-4497-ba35-3106a24781b4	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	8d2a709e-bc33-469c-83fc-e63b62df3bb9	0	20	t	6df46a3a-9af2-4c1d-8b12-7e73940e9c71	\N
f696273f-2890-4d2e-b760-4b6cd41e885b	\N	idp-email-verification	f7fa1af8-0135-4dab-a875-ad354a83a603	6df46a3a-9af2-4c1d-8b12-7e73940e9c71	2	10	f	\N	\N
f4f9aea3-866c-4859-a2b2-fd18c8717db7	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	6df46a3a-9af2-4c1d-8b12-7e73940e9c71	2	20	t	3b9ae187-7f49-4fc3-9ca1-0adaab9e34c7	\N
f5a1741f-5caa-4bb4-80af-bf0dad622a60	\N	idp-username-password-form	f7fa1af8-0135-4dab-a875-ad354a83a603	3b9ae187-7f49-4fc3-9ca1-0adaab9e34c7	0	10	f	\N	\N
cd6b299e-341e-4ce6-a7d4-1de444f74776	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	3b9ae187-7f49-4fc3-9ca1-0adaab9e34c7	1	20	t	62cc0d6d-a5a0-4db3-a856-e0f97bcbc395	\N
ed8ab410-1d5a-4390-ade1-b0cc713e83a4	\N	conditional-user-configured	f7fa1af8-0135-4dab-a875-ad354a83a603	62cc0d6d-a5a0-4db3-a856-e0f97bcbc395	0	10	f	\N	\N
290814df-4127-4dd6-8644-3f7ac9669c6a	\N	auth-otp-form	f7fa1af8-0135-4dab-a875-ad354a83a603	62cc0d6d-a5a0-4db3-a856-e0f97bcbc395	0	20	f	\N	\N
92fbc527-06d3-4dc5-9375-ae89a113dac4	\N	http-basic-authenticator	f7fa1af8-0135-4dab-a875-ad354a83a603	dc53c658-15d0-4389-b3ce-d308bc7fe56d	0	10	f	\N	\N
99303047-0766-496b-adf5-2ca967656f03	\N	docker-http-basic-authenticator	f7fa1af8-0135-4dab-a875-ad354a83a603	e41420fc-353a-4fa9-8e97-2bbbc9059144	0	10	f	\N	\N
83754bd1-cd00-43f1-9a75-f1fe0ace4a0c	\N	no-cookie-redirect	f7fa1af8-0135-4dab-a875-ad354a83a603	e1a208d9-37e5-4e50-9c0f-14eed0d44e8e	0	10	f	\N	\N
66711c80-c2a4-4227-a902-519d419dcfb6	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	e1a208d9-37e5-4e50-9c0f-14eed0d44e8e	0	20	t	738137e2-c9c1-4646-8a04-9cc547103aba	\N
4b0417c1-3c8c-4383-9fd8-391c54785e78	\N	basic-auth	f7fa1af8-0135-4dab-a875-ad354a83a603	738137e2-c9c1-4646-8a04-9cc547103aba	0	10	f	\N	\N
59a1096b-1548-44d0-8c6d-020b924a14c1	\N	basic-auth-otp	f7fa1af8-0135-4dab-a875-ad354a83a603	738137e2-c9c1-4646-8a04-9cc547103aba	3	20	f	\N	\N
40516319-51f0-44cb-b2e1-37aa60e68478	\N	auth-spnego	f7fa1af8-0135-4dab-a875-ad354a83a603	738137e2-c9c1-4646-8a04-9cc547103aba	3	30	f	\N	\N
d45435d2-8582-499f-9156-797fe1aaa8cb	\N	idp-email-verification	91cb1cd2-e133-4f67-9800-593c809120c8	9036de02-a221-4900-a484-a04a3d890355	2	10	f	\N	\N
0b7c7e18-2a6b-493a-bbfb-0ba50e4805a3	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	9036de02-a221-4900-a484-a04a3d890355	2	20	t	a99d41d8-7c71-46f8-8c5e-ef9dae961c29	\N
b5784988-f218-4c8c-ad12-18596d31e734	\N	basic-auth	91cb1cd2-e133-4f67-9800-593c809120c8	19930b72-ee8f-4d8e-bbfe-f18f187650e8	0	10	f	\N	\N
3b668993-1451-44e6-a225-796d2d379f32	\N	basic-auth-otp	91cb1cd2-e133-4f67-9800-593c809120c8	19930b72-ee8f-4d8e-bbfe-f18f187650e8	3	20	f	\N	\N
a83327a9-4c38-4d6f-b47f-96415ddfbb23	\N	auth-spnego	91cb1cd2-e133-4f67-9800-593c809120c8	19930b72-ee8f-4d8e-bbfe-f18f187650e8	3	30	f	\N	\N
4c4508d3-d65b-44f7-8421-8f25142accc0	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	fc35cf87-77bb-47b6-bae5-831c2047bfcb	0	10	f	\N	\N
6b2783e4-23f1-4203-aa75-c9879fc9650a	\N	auth-otp-form	91cb1cd2-e133-4f67-9800-593c809120c8	fc35cf87-77bb-47b6-bae5-831c2047bfcb	0	20	f	\N	\N
8c761e63-17bb-4cf4-9e06-db8d1bcdbdd9	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	4108b95d-ffd8-46ce-95f9-f33d37cba7f5	0	10	f	\N	\N
b5ed7aad-0865-417a-98d0-1a2544c028e0	\N	direct-grant-validate-otp	91cb1cd2-e133-4f67-9800-593c809120c8	4108b95d-ffd8-46ce-95f9-f33d37cba7f5	0	20	f	\N	\N
6b7cecec-e13e-44e9-a267-f7806d9d3914	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	ab591c8e-cd07-4297-a799-762dc875a3da	0	10	f	\N	\N
6b0ed47f-8090-4c01-8e15-084911bc9852	\N	auth-otp-form	91cb1cd2-e133-4f67-9800-593c809120c8	ab591c8e-cd07-4297-a799-762dc875a3da	0	20	f	\N	\N
1d9479da-b2c9-4509-9f22-314fe8fbdd02	\N	idp-confirm-link	91cb1cd2-e133-4f67-9800-593c809120c8	4425deee-5996-4bbf-a320-1777e28b7f3d	0	10	f	\N	\N
198d7898-8394-450e-bd59-9f4668dadace	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	4425deee-5996-4bbf-a320-1777e28b7f3d	0	20	t	9036de02-a221-4900-a484-a04a3d890355	\N
8e362552-690d-455d-9de3-6350713a4a45	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	30f4815f-ac79-45ad-a518-cfb05f0fd9fd	0	10	f	\N	\N
7abf5223-f998-428a-9217-78e3b937a3bd	\N	reset-otp	91cb1cd2-e133-4f67-9800-593c809120c8	30f4815f-ac79-45ad-a518-cfb05f0fd9fd	0	20	f	\N	\N
468bf52e-74cb-43da-9ff7-5d5eda1851c6	\N	idp-create-user-if-unique	91cb1cd2-e133-4f67-9800-593c809120c8	167c49be-6bff-415d-9fc2-830f19be429e	2	10	f	\N	3f515c34-2fc4-49c3-b559-4e64f768dae5
181fb4b2-5521-4f48-bb54-06e686fbe609	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	167c49be-6bff-415d-9fc2-830f19be429e	2	20	t	4425deee-5996-4bbf-a320-1777e28b7f3d	\N
422f0053-c70e-43c5-8809-f29850d332e3	\N	idp-username-password-form	91cb1cd2-e133-4f67-9800-593c809120c8	a99d41d8-7c71-46f8-8c5e-ef9dae961c29	0	10	f	\N	\N
b2f66178-deab-4572-9100-b3ebf5ea96a3	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	a99d41d8-7c71-46f8-8c5e-ef9dae961c29	1	20	t	ab591c8e-cd07-4297-a799-762dc875a3da	\N
ec285857-e8c9-45f9-b028-b1d27b22eef6	\N	auth-cookie	91cb1cd2-e133-4f67-9800-593c809120c8	786001e8-171b-4eeb-bf95-b8ce0d76d9e0	2	10	f	\N	\N
7738ce46-7d19-4319-b8e0-1d862b41091b	\N	auth-spnego	91cb1cd2-e133-4f67-9800-593c809120c8	786001e8-171b-4eeb-bf95-b8ce0d76d9e0	3	20	f	\N	\N
765c5da0-1444-4c22-b285-b2910aa53606	\N	identity-provider-redirector	91cb1cd2-e133-4f67-9800-593c809120c8	786001e8-171b-4eeb-bf95-b8ce0d76d9e0	2	25	f	\N	\N
d5f3e902-b099-41ad-8112-2d7075921f7d	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	786001e8-171b-4eeb-bf95-b8ce0d76d9e0	2	30	t	b6376c85-4d66-4f85-906b-d5327270780b	\N
f2cb272b-64d7-4e37-9892-d4eb7352de3b	\N	client-secret	91cb1cd2-e133-4f67-9800-593c809120c8	bc4764bb-0aa1-4737-bc60-f2ef8565be07	2	10	f	\N	\N
0d64a2fd-84bf-4ed1-9b60-270bd1e6d0db	\N	client-jwt	91cb1cd2-e133-4f67-9800-593c809120c8	bc4764bb-0aa1-4737-bc60-f2ef8565be07	2	20	f	\N	\N
f2d6319e-9e80-4ba7-bac0-c5adbb196634	\N	client-secret-jwt	91cb1cd2-e133-4f67-9800-593c809120c8	bc4764bb-0aa1-4737-bc60-f2ef8565be07	2	30	f	\N	\N
579ef088-6020-494b-9b35-bf204fd95497	\N	client-x509	91cb1cd2-e133-4f67-9800-593c809120c8	bc4764bb-0aa1-4737-bc60-f2ef8565be07	2	40	f	\N	\N
3a782fdf-1d4e-4a42-aec6-2a8aac994818	\N	direct-grant-validate-username	91cb1cd2-e133-4f67-9800-593c809120c8	430f1ef7-9222-4072-87b0-1c337f4099b7	0	10	f	\N	\N
9d6883de-3699-44c8-9887-6fb1c4e0fa5d	\N	direct-grant-validate-password	91cb1cd2-e133-4f67-9800-593c809120c8	430f1ef7-9222-4072-87b0-1c337f4099b7	0	20	f	\N	\N
70bf0bf1-0c4a-4e46-b241-8a6a38b32961	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	430f1ef7-9222-4072-87b0-1c337f4099b7	1	30	t	4108b95d-ffd8-46ce-95f9-f33d37cba7f5	\N
2e134d79-33b1-4924-bfb8-17ef7e7c9a8f	\N	docker-http-basic-authenticator	91cb1cd2-e133-4f67-9800-593c809120c8	a5c13395-074a-40a7-8c21-1893ad105755	0	10	f	\N	\N
8ff02d86-0df6-4386-a202-8f502cb4a788	\N	idp-review-profile	91cb1cd2-e133-4f67-9800-593c809120c8	27e45d53-f033-4b8f-8ed8-4298e2f566d3	0	10	f	\N	a50449bd-1c2c-44e2-a43e-cc8192bab237
628c8f11-3b2f-4b80-a25f-31b0b712f91a	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	27e45d53-f033-4b8f-8ed8-4298e2f566d3	0	20	t	167c49be-6bff-415d-9fc2-830f19be429e	\N
024b07f2-5f55-48c5-b434-5fb5a065039b	\N	auth-username-password-form	91cb1cd2-e133-4f67-9800-593c809120c8	b6376c85-4d66-4f85-906b-d5327270780b	0	10	f	\N	\N
efb53707-8d91-4511-b6fa-8cba8b72fd63	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	b6376c85-4d66-4f85-906b-d5327270780b	1	20	t	fc35cf87-77bb-47b6-bae5-831c2047bfcb	\N
ae0568ee-c54a-4fcf-8324-d00ae818ba98	\N	no-cookie-redirect	91cb1cd2-e133-4f67-9800-593c809120c8	bcb945ec-44b9-4004-8aad-b69a3a93455f	0	10	f	\N	\N
c5a78cfc-164e-4868-b158-ea13704d6d53	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	bcb945ec-44b9-4004-8aad-b69a3a93455f	0	20	t	19930b72-ee8f-4d8e-bbfe-f18f187650e8	\N
eff9392f-6a62-4ea9-938a-dd7aea002d73	\N	registration-page-form	91cb1cd2-e133-4f67-9800-593c809120c8	90c6c90f-add0-495f-aa8b-0d2f26bba0c2	0	10	t	dc1c2577-6eb9-42e0-b9b3-93c1a1b2a85b	\N
5f05e207-9355-47e3-941c-df03b0f81c09	\N	registration-user-creation	91cb1cd2-e133-4f67-9800-593c809120c8	dc1c2577-6eb9-42e0-b9b3-93c1a1b2a85b	0	20	f	\N	\N
d93384d8-5686-4de6-ae14-f4a965bcb1a1	\N	registration-profile-action	91cb1cd2-e133-4f67-9800-593c809120c8	dc1c2577-6eb9-42e0-b9b3-93c1a1b2a85b	0	40	f	\N	\N
eb85934d-7510-4f57-ac15-68c41baf85e7	\N	registration-password-action	91cb1cd2-e133-4f67-9800-593c809120c8	dc1c2577-6eb9-42e0-b9b3-93c1a1b2a85b	0	50	f	\N	\N
c59f9e0c-a856-4b21-b011-6f3a2e85b6ce	\N	registration-recaptcha-action	91cb1cd2-e133-4f67-9800-593c809120c8	dc1c2577-6eb9-42e0-b9b3-93c1a1b2a85b	3	60	f	\N	\N
7ae5be1d-8036-4928-9f31-886018826fff	\N	reset-credentials-choose-user	91cb1cd2-e133-4f67-9800-593c809120c8	7d5fd13a-c31d-4651-963b-e898d32f6c8f	0	10	f	\N	\N
244c2456-ea2d-4dbd-b68a-f37325d07c5b	\N	reset-credential-email	91cb1cd2-e133-4f67-9800-593c809120c8	7d5fd13a-c31d-4651-963b-e898d32f6c8f	0	20	f	\N	\N
3dcbe34b-d1d8-4d74-ba1b-8790cb9ca95b	\N	reset-password	91cb1cd2-e133-4f67-9800-593c809120c8	7d5fd13a-c31d-4651-963b-e898d32f6c8f	0	30	f	\N	\N
225b04c9-e803-4317-9e0c-fc8cb9caa575	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	7d5fd13a-c31d-4651-963b-e898d32f6c8f	1	40	t	30f4815f-ac79-45ad-a518-cfb05f0fd9fd	\N
9d4aade9-6b60-4d06-8c36-7e1038f3c2a8	\N	http-basic-authenticator	91cb1cd2-e133-4f67-9800-593c809120c8	800321e7-b44f-4e70-8240-2a2ab63a835c	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
a6a50dfb-33f5-46ad-8ab6-da86ed4414ae	browser	browser based authentication	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	t	t
1b1bf1d8-29ce-4cd4-a15a-64b66d351910	forms	Username, password, otp and other auth forms.	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	f	t
40fc88ea-acc6-473a-8d65-b1974b2e7727	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	f	t
e06cea99-b01a-4f7b-b002-2bd368cb3ad0	direct grant	OpenID Connect Resource Owner Grant	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	t	t
20df7c83-ad8e-471c-a48b-dcd6ed087154	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	f	t
1654fb73-250a-4b9a-9497-7ef570c7758b	registration	registration flow	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	t	t
03ef1887-a24a-4d4b-b678-49d1e3d1f0e2	registration form	registration form	f7fa1af8-0135-4dab-a875-ad354a83a603	form-flow	f	t
9d76aa71-91c1-48c7-b671-5aa59108d2d5	reset credentials	Reset credentials for a user if they forgot their password or something	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	t	t
c74b99ad-7fc8-44b8-ad55-04aa7236de0d	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	f	t
a8f7cfd9-739d-4801-b977-bdcd85796eb7	clients	Base authentication for clients	f7fa1af8-0135-4dab-a875-ad354a83a603	client-flow	t	t
d74fa892-fcb1-42d3-ba6e-bbada92899cd	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	t	t
7ab903bf-484e-4eda-917c-99647ea300af	User creation or linking	Flow for the existing/non-existing user alternatives	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	f	t
8d2a709e-bc33-469c-83fc-e63b62df3bb9	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	f	t
6df46a3a-9af2-4c1d-8b12-7e73940e9c71	Account verification options	Method with which to verity the existing account	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	f	t
3b9ae187-7f49-4fc3-9ca1-0adaab9e34c7	Verify Existing Account by Re-authentication	Reauthentication of existing account	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	f	t
62cc0d6d-a5a0-4db3-a856-e0f97bcbc395	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	f	t
dc53c658-15d0-4389-b3ce-d308bc7fe56d	saml ecp	SAML ECP Profile Authentication Flow	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	t	t
e41420fc-353a-4fa9-8e97-2bbbc9059144	docker auth	Used by Docker clients to authenticate against the IDP	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	t	t
e1a208d9-37e5-4e50-9c0f-14eed0d44e8e	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	t	t
738137e2-c9c1-4646-8a04-9cc547103aba	Authentication Options	Authentication options.	f7fa1af8-0135-4dab-a875-ad354a83a603	basic-flow	f	t
9036de02-a221-4900-a484-a04a3d890355	Account verification options	Method with which to verity the existing account	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
19930b72-ee8f-4d8e-bbfe-f18f187650e8	Authentication Options	Authentication options.	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
fc35cf87-77bb-47b6-bae5-831c2047bfcb	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
4108b95d-ffd8-46ce-95f9-f33d37cba7f5	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
ab591c8e-cd07-4297-a799-762dc875a3da	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
4425deee-5996-4bbf-a320-1777e28b7f3d	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
30f4815f-ac79-45ad-a518-cfb05f0fd9fd	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
167c49be-6bff-415d-9fc2-830f19be429e	User creation or linking	Flow for the existing/non-existing user alternatives	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
a99d41d8-7c71-46f8-8c5e-ef9dae961c29	Verify Existing Account by Re-authentication	Reauthentication of existing account	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
786001e8-171b-4eeb-bf95-b8ce0d76d9e0	browser	browser based authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
bc4764bb-0aa1-4737-bc60-f2ef8565be07	clients	Base authentication for clients	91cb1cd2-e133-4f67-9800-593c809120c8	client-flow	t	t
430f1ef7-9222-4072-87b0-1c337f4099b7	direct grant	OpenID Connect Resource Owner Grant	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
a5c13395-074a-40a7-8c21-1893ad105755	docker auth	Used by Docker clients to authenticate against the IDP	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
27e45d53-f033-4b8f-8ed8-4298e2f566d3	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
b6376c85-4d66-4f85-906b-d5327270780b	forms	Username, password, otp and other auth forms.	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
bcb945ec-44b9-4004-8aad-b69a3a93455f	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
90c6c90f-add0-495f-aa8b-0d2f26bba0c2	registration	registration flow	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
dc1c2577-6eb9-42e0-b9b3-93c1a1b2a85b	registration form	registration form	91cb1cd2-e133-4f67-9800-593c809120c8	form-flow	f	t
7d5fd13a-c31d-4651-963b-e898d32f6c8f	reset credentials	Reset credentials for a user if they forgot their password or something	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
800321e7-b44f-4e70-8240-2a2ab63a835c	saml ecp	SAML ECP Profile Authentication Flow	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
4099a3b1-f4fd-4798-a4cc-87b4bfe5fc02	review profile config	f7fa1af8-0135-4dab-a875-ad354a83a603
c94f118f-0b63-4704-8206-5aee2cc5dd7e	create unique user config	f7fa1af8-0135-4dab-a875-ad354a83a603
3f515c34-2fc4-49c3-b559-4e64f768dae5	create unique user config	91cb1cd2-e133-4f67-9800-593c809120c8
a50449bd-1c2c-44e2-a43e-cc8192bab237	review profile config	91cb1cd2-e133-4f67-9800-593c809120c8
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
4099a3b1-f4fd-4798-a4cc-87b4bfe5fc02	missing	update.profile.on.first.login
c94f118f-0b63-4704-8206-5aee2cc5dd7e	false	require.password.update.after.registration
3f515c34-2fc4-49c3-b559-4e64f768dae5	false	require.password.update.after.registration
a50449bd-1c2c-44e2-a43e-cc8192bab237	missing	update.profile.on.first.login
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
57c1a74e-6513-4f6e-8f21-48da831a4544	t	f	master-realm	0	f	\N	\N	t	\N	f	f7fa1af8-0135-4dab-a875-ad354a83a603	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
98ab4eba-add2-4e45-a92b-831786b305ec	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	f7fa1af8-0135-4dab-a875-ad354a83a603	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
4b7d60e2-c119-4859-9cc7-768ce8da0668	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	f7fa1af8-0135-4dab-a875-ad354a83a603	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
49c49de9-ceea-4994-8385-309620791cd7	t	f	broker	0	f	\N	\N	t	\N	f	f7fa1af8-0135-4dab-a875-ad354a83a603	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
b2270e37-d812-46a2-a1b3-9d53b13acc3c	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	f7fa1af8-0135-4dab-a875-ad354a83a603	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
c328abcf-a99b-45fb-8f91-b2794a63518b	t	f	admin-cli	0	t	\N	\N	f	\N	f	f7fa1af8-0135-4dab-a875-ad354a83a603	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
cb809b06-ff99-4320-bf9f-87e0791b1520	t	f	ghoverblog-realm	0	f	\N	\N	t	\N	f	f7fa1af8-0135-4dab-a875-ad354a83a603	\N	0	f	f	ghoverblog Realm	f	client-secret	\N	\N	\N	t	f	f	f
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
98ab4eba-add2-4e45-a92b-831786b305ec	+	post.logout.redirect.uris
4b7d60e2-c119-4859-9cc7-768ce8da0668	+	post.logout.redirect.uris
4b7d60e2-c119-4859-9cc7-768ce8da0668	S256	pkce.code.challenge.method
b2270e37-d812-46a2-a1b3-9d53b13acc3c	+	post.logout.redirect.uris
b2270e37-d812-46a2-a1b3-9d53b13acc3c	S256	pkce.code.challenge.method
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
3bd57512-e485-4295-9e1c-393fb152859c	offline_access	f7fa1af8-0135-4dab-a875-ad354a83a603	OpenID Connect built-in scope: offline_access	openid-connect
612172ee-dfdb-4866-b83d-5351090ee831	role_list	f7fa1af8-0135-4dab-a875-ad354a83a603	SAML role list	saml
2f448585-39f6-4e0e-8b8f-460fdab3f2d8	profile	f7fa1af8-0135-4dab-a875-ad354a83a603	OpenID Connect built-in scope: profile	openid-connect
108a2f51-fc63-4267-938f-91496e00a445	email	f7fa1af8-0135-4dab-a875-ad354a83a603	OpenID Connect built-in scope: email	openid-connect
e3fda235-2841-4b9b-a386-9c5bfbcf10b9	address	f7fa1af8-0135-4dab-a875-ad354a83a603	OpenID Connect built-in scope: address	openid-connect
4cbfceb3-4fdd-48c5-9209-19e2694571e4	phone	f7fa1af8-0135-4dab-a875-ad354a83a603	OpenID Connect built-in scope: phone	openid-connect
ba84a1f4-1a56-46f9-953f-9999697253bb	roles	f7fa1af8-0135-4dab-a875-ad354a83a603	OpenID Connect scope for add user roles to the access token	openid-connect
bf3d62c4-a6cb-4381-b2e8-e2cd440df44b	web-origins	f7fa1af8-0135-4dab-a875-ad354a83a603	OpenID Connect scope for add allowed web origins to the access token	openid-connect
15e8e2db-e052-4e2f-b8b8-3e750795a7ef	microprofile-jwt	f7fa1af8-0135-4dab-a875-ad354a83a603	Microprofile - JWT built-in scope	openid-connect
f115fbf5-5848-47d7-b8f4-852ba7286fef	acr	f7fa1af8-0135-4dab-a875-ad354a83a603	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
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
3bd57512-e485-4295-9e1c-393fb152859c	true	display.on.consent.screen
3bd57512-e485-4295-9e1c-393fb152859c	${offlineAccessScopeConsentText}	consent.screen.text
612172ee-dfdb-4866-b83d-5351090ee831	true	display.on.consent.screen
612172ee-dfdb-4866-b83d-5351090ee831	${samlRoleListScopeConsentText}	consent.screen.text
2f448585-39f6-4e0e-8b8f-460fdab3f2d8	true	display.on.consent.screen
2f448585-39f6-4e0e-8b8f-460fdab3f2d8	${profileScopeConsentText}	consent.screen.text
2f448585-39f6-4e0e-8b8f-460fdab3f2d8	true	include.in.token.scope
108a2f51-fc63-4267-938f-91496e00a445	true	display.on.consent.screen
108a2f51-fc63-4267-938f-91496e00a445	${emailScopeConsentText}	consent.screen.text
108a2f51-fc63-4267-938f-91496e00a445	true	include.in.token.scope
e3fda235-2841-4b9b-a386-9c5bfbcf10b9	true	display.on.consent.screen
e3fda235-2841-4b9b-a386-9c5bfbcf10b9	${addressScopeConsentText}	consent.screen.text
e3fda235-2841-4b9b-a386-9c5bfbcf10b9	true	include.in.token.scope
4cbfceb3-4fdd-48c5-9209-19e2694571e4	true	display.on.consent.screen
4cbfceb3-4fdd-48c5-9209-19e2694571e4	${phoneScopeConsentText}	consent.screen.text
4cbfceb3-4fdd-48c5-9209-19e2694571e4	true	include.in.token.scope
ba84a1f4-1a56-46f9-953f-9999697253bb	true	display.on.consent.screen
ba84a1f4-1a56-46f9-953f-9999697253bb	${rolesScopeConsentText}	consent.screen.text
ba84a1f4-1a56-46f9-953f-9999697253bb	false	include.in.token.scope
bf3d62c4-a6cb-4381-b2e8-e2cd440df44b	false	display.on.consent.screen
bf3d62c4-a6cb-4381-b2e8-e2cd440df44b		consent.screen.text
bf3d62c4-a6cb-4381-b2e8-e2cd440df44b	false	include.in.token.scope
15e8e2db-e052-4e2f-b8b8-3e750795a7ef	false	display.on.consent.screen
15e8e2db-e052-4e2f-b8b8-3e750795a7ef	true	include.in.token.scope
f115fbf5-5848-47d7-b8f4-852ba7286fef	false	display.on.consent.screen
f115fbf5-5848-47d7-b8f4-852ba7286fef	false	include.in.token.scope
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
98ab4eba-add2-4e45-a92b-831786b305ec	108a2f51-fc63-4267-938f-91496e00a445	t
98ab4eba-add2-4e45-a92b-831786b305ec	bf3d62c4-a6cb-4381-b2e8-e2cd440df44b	t
98ab4eba-add2-4e45-a92b-831786b305ec	2f448585-39f6-4e0e-8b8f-460fdab3f2d8	t
98ab4eba-add2-4e45-a92b-831786b305ec	ba84a1f4-1a56-46f9-953f-9999697253bb	t
98ab4eba-add2-4e45-a92b-831786b305ec	f115fbf5-5848-47d7-b8f4-852ba7286fef	t
98ab4eba-add2-4e45-a92b-831786b305ec	e3fda235-2841-4b9b-a386-9c5bfbcf10b9	f
98ab4eba-add2-4e45-a92b-831786b305ec	4cbfceb3-4fdd-48c5-9209-19e2694571e4	f
98ab4eba-add2-4e45-a92b-831786b305ec	3bd57512-e485-4295-9e1c-393fb152859c	f
98ab4eba-add2-4e45-a92b-831786b305ec	15e8e2db-e052-4e2f-b8b8-3e750795a7ef	f
4b7d60e2-c119-4859-9cc7-768ce8da0668	108a2f51-fc63-4267-938f-91496e00a445	t
4b7d60e2-c119-4859-9cc7-768ce8da0668	bf3d62c4-a6cb-4381-b2e8-e2cd440df44b	t
4b7d60e2-c119-4859-9cc7-768ce8da0668	2f448585-39f6-4e0e-8b8f-460fdab3f2d8	t
4b7d60e2-c119-4859-9cc7-768ce8da0668	ba84a1f4-1a56-46f9-953f-9999697253bb	t
4b7d60e2-c119-4859-9cc7-768ce8da0668	f115fbf5-5848-47d7-b8f4-852ba7286fef	t
4b7d60e2-c119-4859-9cc7-768ce8da0668	e3fda235-2841-4b9b-a386-9c5bfbcf10b9	f
4b7d60e2-c119-4859-9cc7-768ce8da0668	4cbfceb3-4fdd-48c5-9209-19e2694571e4	f
4b7d60e2-c119-4859-9cc7-768ce8da0668	3bd57512-e485-4295-9e1c-393fb152859c	f
4b7d60e2-c119-4859-9cc7-768ce8da0668	15e8e2db-e052-4e2f-b8b8-3e750795a7ef	f
c328abcf-a99b-45fb-8f91-b2794a63518b	108a2f51-fc63-4267-938f-91496e00a445	t
c328abcf-a99b-45fb-8f91-b2794a63518b	bf3d62c4-a6cb-4381-b2e8-e2cd440df44b	t
c328abcf-a99b-45fb-8f91-b2794a63518b	2f448585-39f6-4e0e-8b8f-460fdab3f2d8	t
c328abcf-a99b-45fb-8f91-b2794a63518b	ba84a1f4-1a56-46f9-953f-9999697253bb	t
c328abcf-a99b-45fb-8f91-b2794a63518b	f115fbf5-5848-47d7-b8f4-852ba7286fef	t
c328abcf-a99b-45fb-8f91-b2794a63518b	e3fda235-2841-4b9b-a386-9c5bfbcf10b9	f
c328abcf-a99b-45fb-8f91-b2794a63518b	4cbfceb3-4fdd-48c5-9209-19e2694571e4	f
c328abcf-a99b-45fb-8f91-b2794a63518b	3bd57512-e485-4295-9e1c-393fb152859c	f
c328abcf-a99b-45fb-8f91-b2794a63518b	15e8e2db-e052-4e2f-b8b8-3e750795a7ef	f
49c49de9-ceea-4994-8385-309620791cd7	108a2f51-fc63-4267-938f-91496e00a445	t
49c49de9-ceea-4994-8385-309620791cd7	bf3d62c4-a6cb-4381-b2e8-e2cd440df44b	t
49c49de9-ceea-4994-8385-309620791cd7	2f448585-39f6-4e0e-8b8f-460fdab3f2d8	t
49c49de9-ceea-4994-8385-309620791cd7	ba84a1f4-1a56-46f9-953f-9999697253bb	t
49c49de9-ceea-4994-8385-309620791cd7	f115fbf5-5848-47d7-b8f4-852ba7286fef	t
49c49de9-ceea-4994-8385-309620791cd7	e3fda235-2841-4b9b-a386-9c5bfbcf10b9	f
49c49de9-ceea-4994-8385-309620791cd7	4cbfceb3-4fdd-48c5-9209-19e2694571e4	f
49c49de9-ceea-4994-8385-309620791cd7	3bd57512-e485-4295-9e1c-393fb152859c	f
49c49de9-ceea-4994-8385-309620791cd7	15e8e2db-e052-4e2f-b8b8-3e750795a7ef	f
57c1a74e-6513-4f6e-8f21-48da831a4544	108a2f51-fc63-4267-938f-91496e00a445	t
57c1a74e-6513-4f6e-8f21-48da831a4544	bf3d62c4-a6cb-4381-b2e8-e2cd440df44b	t
57c1a74e-6513-4f6e-8f21-48da831a4544	2f448585-39f6-4e0e-8b8f-460fdab3f2d8	t
57c1a74e-6513-4f6e-8f21-48da831a4544	ba84a1f4-1a56-46f9-953f-9999697253bb	t
57c1a74e-6513-4f6e-8f21-48da831a4544	f115fbf5-5848-47d7-b8f4-852ba7286fef	t
57c1a74e-6513-4f6e-8f21-48da831a4544	e3fda235-2841-4b9b-a386-9c5bfbcf10b9	f
57c1a74e-6513-4f6e-8f21-48da831a4544	4cbfceb3-4fdd-48c5-9209-19e2694571e4	f
57c1a74e-6513-4f6e-8f21-48da831a4544	3bd57512-e485-4295-9e1c-393fb152859c	f
57c1a74e-6513-4f6e-8f21-48da831a4544	15e8e2db-e052-4e2f-b8b8-3e750795a7ef	f
b2270e37-d812-46a2-a1b3-9d53b13acc3c	108a2f51-fc63-4267-938f-91496e00a445	t
b2270e37-d812-46a2-a1b3-9d53b13acc3c	bf3d62c4-a6cb-4381-b2e8-e2cd440df44b	t
b2270e37-d812-46a2-a1b3-9d53b13acc3c	2f448585-39f6-4e0e-8b8f-460fdab3f2d8	t
b2270e37-d812-46a2-a1b3-9d53b13acc3c	ba84a1f4-1a56-46f9-953f-9999697253bb	t
b2270e37-d812-46a2-a1b3-9d53b13acc3c	f115fbf5-5848-47d7-b8f4-852ba7286fef	t
b2270e37-d812-46a2-a1b3-9d53b13acc3c	e3fda235-2841-4b9b-a386-9c5bfbcf10b9	f
b2270e37-d812-46a2-a1b3-9d53b13acc3c	4cbfceb3-4fdd-48c5-9209-19e2694571e4	f
b2270e37-d812-46a2-a1b3-9d53b13acc3c	3bd57512-e485-4295-9e1c-393fb152859c	f
b2270e37-d812-46a2-a1b3-9d53b13acc3c	15e8e2db-e052-4e2f-b8b8-3e750795a7ef	f
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
3bd57512-e485-4295-9e1c-393fb152859c	2a9f7dbc-6bbf-4e5b-8aad-72cbc249f16f
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
a5560d42-e6cd-48d9-b9d6-4d35ca2a8bf5	Trusted Hosts	f7fa1af8-0135-4dab-a875-ad354a83a603	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f7fa1af8-0135-4dab-a875-ad354a83a603	anonymous
218055d2-3254-4278-bae2-8477604170d1	Consent Required	f7fa1af8-0135-4dab-a875-ad354a83a603	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f7fa1af8-0135-4dab-a875-ad354a83a603	anonymous
f697afef-7770-4f1f-9b33-0c79b3173c81	Full Scope Disabled	f7fa1af8-0135-4dab-a875-ad354a83a603	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f7fa1af8-0135-4dab-a875-ad354a83a603	anonymous
af105380-6c8d-4fac-bcfe-57a2e0727e7f	Max Clients Limit	f7fa1af8-0135-4dab-a875-ad354a83a603	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f7fa1af8-0135-4dab-a875-ad354a83a603	anonymous
4ec79684-3aaf-407a-bd0e-fa5cb15b3385	Allowed Protocol Mapper Types	f7fa1af8-0135-4dab-a875-ad354a83a603	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f7fa1af8-0135-4dab-a875-ad354a83a603	anonymous
faf6b1da-349a-4ffe-bae6-cdc6772b6d26	Allowed Client Scopes	f7fa1af8-0135-4dab-a875-ad354a83a603	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f7fa1af8-0135-4dab-a875-ad354a83a603	anonymous
f1a1f0f3-ee84-4062-b776-bd486cc1647f	Allowed Protocol Mapper Types	f7fa1af8-0135-4dab-a875-ad354a83a603	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f7fa1af8-0135-4dab-a875-ad354a83a603	authenticated
cf4b7112-7ad8-4e94-8957-22f88e9abf1f	Allowed Client Scopes	f7fa1af8-0135-4dab-a875-ad354a83a603	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f7fa1af8-0135-4dab-a875-ad354a83a603	authenticated
9e1fcedf-6852-42cc-bb96-5df3dca0fbdf	rsa-generated	f7fa1af8-0135-4dab-a875-ad354a83a603	rsa-generated	org.keycloak.keys.KeyProvider	f7fa1af8-0135-4dab-a875-ad354a83a603	\N
804387a7-8ff6-400d-82ce-fa420e284120	rsa-enc-generated	f7fa1af8-0135-4dab-a875-ad354a83a603	rsa-enc-generated	org.keycloak.keys.KeyProvider	f7fa1af8-0135-4dab-a875-ad354a83a603	\N
b27eaf56-56c8-4f8f-9543-9a0de6676f67	hmac-generated	f7fa1af8-0135-4dab-a875-ad354a83a603	hmac-generated	org.keycloak.keys.KeyProvider	f7fa1af8-0135-4dab-a875-ad354a83a603	\N
e4928c1e-ef2b-4d70-861a-207592eadb6a	aes-generated	f7fa1af8-0135-4dab-a875-ad354a83a603	aes-generated	org.keycloak.keys.KeyProvider	f7fa1af8-0135-4dab-a875-ad354a83a603	\N
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
5bd78f86-25f1-4a8c-9d18-4599346573af	af105380-6c8d-4fac-bcfe-57a2e0727e7f	max-clients	200
575a7096-d4d9-4a25-af1c-1b60968ce603	faf6b1da-349a-4ffe-bae6-cdc6772b6d26	allow-default-scopes	true
eccedfb0-04b2-4cee-be80-bc788273eb09	f1a1f0f3-ee84-4062-b776-bd486cc1647f	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
83075625-e7d4-4b0e-a735-86a41f869294	f1a1f0f3-ee84-4062-b776-bd486cc1647f	allowed-protocol-mapper-types	saml-user-property-mapper
ef6a2471-b797-4fcd-aef7-ebe77e27b0fd	f1a1f0f3-ee84-4062-b776-bd486cc1647f	allowed-protocol-mapper-types	saml-user-attribute-mapper
f17d808e-7209-4004-90fe-f1b597277ab7	f1a1f0f3-ee84-4062-b776-bd486cc1647f	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
017a7847-cad3-4eb1-91bc-26f76e732a9d	f1a1f0f3-ee84-4062-b776-bd486cc1647f	allowed-protocol-mapper-types	oidc-full-name-mapper
563a3d3d-a3a2-4847-8215-f7e4d3e55e88	f1a1f0f3-ee84-4062-b776-bd486cc1647f	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
449203c8-cfc6-4069-87f7-f32502a5f73f	f1a1f0f3-ee84-4062-b776-bd486cc1647f	allowed-protocol-mapper-types	oidc-address-mapper
a18d196c-fbf4-4cd0-a076-c166a710d3bc	f1a1f0f3-ee84-4062-b776-bd486cc1647f	allowed-protocol-mapper-types	saml-role-list-mapper
47a551c9-c220-4212-9c7e-b360e8e0f99e	a5560d42-e6cd-48d9-b9d6-4d35ca2a8bf5	host-sending-registration-request-must-match	true
c6e8ccfe-dd6a-498c-9227-e9f585ea4930	a5560d42-e6cd-48d9-b9d6-4d35ca2a8bf5	client-uris-must-match	true
d4068e60-9725-47e2-a0d6-5bd7722e349e	cf4b7112-7ad8-4e94-8957-22f88e9abf1f	allow-default-scopes	true
291835c4-e787-4efb-b191-62fbb266cfba	4ec79684-3aaf-407a-bd0e-fa5cb15b3385	allowed-protocol-mapper-types	saml-user-property-mapper
3b6842cd-b3ac-472d-830e-de26de65f02b	4ec79684-3aaf-407a-bd0e-fa5cb15b3385	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
186f5df0-97f5-4fef-b249-db5b78c96e20	4ec79684-3aaf-407a-bd0e-fa5cb15b3385	allowed-protocol-mapper-types	oidc-address-mapper
91bfee1d-2f94-4f21-aad2-1b6cabfe9cfd	4ec79684-3aaf-407a-bd0e-fa5cb15b3385	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
7fbfd186-195a-4b3a-85f4-2f1adac446e6	4ec79684-3aaf-407a-bd0e-fa5cb15b3385	allowed-protocol-mapper-types	saml-user-attribute-mapper
efce8045-3a86-4faf-8945-01dde9ae5989	4ec79684-3aaf-407a-bd0e-fa5cb15b3385	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
83c08ce3-3e23-41e0-92d9-bd5bdaf697dd	4ec79684-3aaf-407a-bd0e-fa5cb15b3385	allowed-protocol-mapper-types	saml-role-list-mapper
7908c231-08e1-4c3a-b9cd-527ace453175	4ec79684-3aaf-407a-bd0e-fa5cb15b3385	allowed-protocol-mapper-types	oidc-full-name-mapper
e6fe4016-2aff-4668-aa38-b243d8ec90d0	b27eaf56-56c8-4f8f-9543-9a0de6676f67	kid	4566bd24-8aae-4dd1-a45d-df9ea30838ce
d02000df-3b01-493c-aede-ec20f2455a4d	b27eaf56-56c8-4f8f-9543-9a0de6676f67	secret	XtEJAvIM3HZM0lJ4LmuIBpIATpItiYPCyKhXNwWZjn5-CXD61NXjv7GwKt0tMuDHInilXMzuxHro53z98_wW7Q
f8a983b9-f0db-4ec9-913b-1f8fc686721f	b27eaf56-56c8-4f8f-9543-9a0de6676f67	algorithm	HS256
48f9716f-da12-4a11-8690-0ea08c33c342	b27eaf56-56c8-4f8f-9543-9a0de6676f67	priority	100
73ffae72-8593-47e5-a08c-03fd0820552e	9e1fcedf-6852-42cc-bb96-5df3dca0fbdf	keyUse	SIG
c17d6208-c252-4bb8-9b72-903ea0ff4307	9e1fcedf-6852-42cc-bb96-5df3dca0fbdf	privateKey	MIIEpAIBAAKCAQEAos7u4T4fghDvsOlCJk/YB9Sgch2+TT6fhx/XAtMy4kMRLS178DOhnv8ntcrrbOjQPS3KQWYd0Q9BHkrIv14AF97gweW5+bJGsOpZX4k4lOVKXuhxDH5T+e5xkCWb6eomZdcSeFc4aqyrzTISFxFK5ivHppaGSjvxIPXZ+rXHJpeh1FgS3kQE7ISozOfuacYJgBYGud3l92pKsfhgzS4IXB007d4vkA2U4y6s+oNjJn4BiAJRpkbWKHHNGn2ZUfAHtaI3dQxzpDW/SLizWRF8AqEgLFiW9f/pLlpI3UTvsNDOHtBcut88GPwctmgwcEZL2IPY3dpxNUqPEFAOMwS1PwIDAQABAoIBABrHpwttyIkAeCzFcZgTshk3pFyg/9h84Ii9eASC8O++0Gh5/tT36THaDpIcmrUDZp1plsdDIMxukeuFqZewwpsqkhXSz9B+vpoDMkhArgnv3VfXLCE99lo6Gnv3c7n6Re6ifetFjYYeePP7tHYO5h8OPHzubZBwY61kQ0K1+9gg/dF0lcxzMQot/tdDUhjwUINM6hLmPBU3bi6/u2hzNK+5q2cqdraaLawfPkRS7N4Y5JafyDkukxopuLRAs92Y0CGYzDpcC91cM2ZEaspX21T5h30bP18kbxATjlJBjOuy+t+S0Hxamw+FWGrk67QBE7fmsIrOpBC0A9z1uu1i2YECgYEA0dY4BeAQXY6xpTFChtKq9zBsK+UY1yGDtnsHEL4jXfLTT3tt5+8hCStpMbBpzRaN9mzHWxvfwLABIaKXg7kfUJaZdAN9RDL0ql/oaZ0h53cxcWvK2wyopL7UTfaW4Dx/vioULb/arfo3eed8Nk0yh4YRf8KK/5WZ8S+kTqn18zECgYEAxqAfTvyojU51bIr4reCSQBsZiADu4McwTlg9KLpwFrnhPLlB4TQLIFLemO/UmDkG31O9splwk4Fx1irT8DYCQmpW/hKoNcX8AWCyPu9DUoGhu1LGPf31X+A3FLIO4B6K2cAqRr967XC8RztGQGh/NT4oDgdJZCaTJ/iSGnZls28CgYBZDulSHQn1G0XsTZ7lp+3l4chXTPGhBNlpDoguI/TQv+nNdx5rbMOBp8oKy8vrvmHcL8jgs1Dg8BJa2y4hOuW+h1xzr7NvyYyr7u6uPIGSQrVaZRyAobvFyDRFLp5UZ3j0FdngnOfMJUF8XLIMPfFvMYilx8TEuxLOGaFLvbjkUQKBgQCHLU5heT5U/QKZXnMkEuQ10LutfcUVITrU9uSYpVnHfbW2l/YoCD1SQFPSDdbHynfM4bcGp7qgCMaqlPcsUfVzsd+GhrgH8LgzT9W/UyKkMikZzZmxcvbdy0BxS0UobmDdFRUwlPxaQBFDASosh3GbkLO96GOgT0hzOY5liBJq7QKBgQCnwrBQHhfNdqOACrVc8KL6cf/T1EmdRzZJ2jICAm/YNMX/pXowpwmsEfKaI2FHju8ZoCZm/q9It5f1tqTmsjpouzl0sLd78ZErJ1fBTVYOroEOkU9E1Fya189jwNeSyx1UxfJ6JpSDpik3uT5KGk9yyfxujDW6m4FbeW/1sRXNVg==
e333649c-1594-4688-906b-5faa6ff1c5f1	9e1fcedf-6852-42cc-bb96-5df3dca0fbdf	priority	100
1b8fcb16-ed48-48f7-8276-3260e78599e9	9e1fcedf-6852-42cc-bb96-5df3dca0fbdf	certificate	MIICmzCCAYMCBgGIFM2YgDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNTEzMTEwODE4WhcNMzMwNTEzMTEwOTU4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCizu7hPh+CEO+w6UImT9gH1KByHb5NPp+HH9cC0zLiQxEtLXvwM6Ge/ye1yuts6NA9LcpBZh3RD0EeSsi/XgAX3uDB5bn5skaw6llfiTiU5Upe6HEMflP57nGQJZvp6iZl1xJ4VzhqrKvNMhIXEUrmK8emloZKO/Eg9dn6tccml6HUWBLeRATshKjM5+5pxgmAFga53eX3akqx+GDNLghcHTTt3i+QDZTjLqz6g2MmfgGIAlGmRtYocc0afZlR8Ae1ojd1DHOkNb9IuLNZEXwCoSAsWJb1/+kuWkjdRO+w0M4e0Fy63zwY/By2aDBwRkvYg9jd2nE1So8QUA4zBLU/AgMBAAEwDQYJKoZIhvcNAQELBQADggEBADl10kyuqneNyeYKaXK0Nh29YYIwI2Ka32vpxXs3YPkuQ8r3iYSAzYjd+wIOsgXtTNfsYScHQXknfadovixQyrcMt0MsAplch6/cc/3YmZ4+tTYhVYlZyx5JHLDgC3LaNbB8OqDDyn/is69+Lh1XyQP+tGzlw4FY1sw0d45lLkHReArrDGfa4omu60aoSRdJuOeO351YZtJCZzS8Uztxkgm2uUncnhIrzBfvwg4XPiyaqsh+4LH0iKU0fNBYK6mlnoWUYwbkZ1M12y9RVm5/DUi7FS0EK/st1AGg8IuMzBovDbXPgUcqMxWclqScdaXUEC50EARW+nLQngwKuHCSYJE=
b5d531f5-714f-4889-96dd-504623b598e6	e4928c1e-ef2b-4d70-861a-207592eadb6a	priority	100
dd8c8006-d02f-4a99-b885-477df265378a	e4928c1e-ef2b-4d70-861a-207592eadb6a	kid	bdd8f6c2-3025-40fc-b8c2-5d291cda8e11
b9cfde91-643d-480d-8b98-38f8ed3f17bb	e4928c1e-ef2b-4d70-861a-207592eadb6a	secret	XtX8TAXc5OhIfrvYwQHsHA
4958655e-4204-4e0b-bec7-4dbc65eec28b	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
392ea1c6-6704-4f98-ba45-daabf310b8b1	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-user-attribute-mapper
1b138819-0871-42f6-831f-5651f6a1c562	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-full-name-mapper
e49c2d93-20b3-42ff-83e8-2568669db21b	5c82aadb-b771-4643-93f3-44004ca2276c	allow-default-scopes	true
2518dc23-69f9-420f-be6d-d096e79e0f63	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	secret	UkkiwEEcWIBAlsb-ItTn9w
1b03d502-5b07-4d0c-82d8-d79f91b935e0	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	kid	b3b1f408-2cfb-4380-914a-753edec9bb88
b94073a0-f823-4144-9417-49653d09f082	804387a7-8ff6-400d-82ce-fa420e284120	certificate	MIICmzCCAYMCBgGIFM2ZIDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNTEzMTEwODE4WhcNMzMwNTEzMTEwOTU4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCswZj+6aIdVPE7R5Q7PpoZpzm51s0elcgvCV+xvZCk0GQXRuubAxjBCx+uZvgDaZIPgiJFuoyRoHKttbTEdTruwXQ7BHqlNYTtF1YF6JKumgzZ9YklELtZQlLIGM50VGqt7EX/NYScX3FF2ezHc185ZN7iXFoht8dAoBmBuq8ed/x2/eKVO4O6dl07/pW984NTn2aEeJ+qj4u0wWBzkPxBBN+uYRUK1SmJ81Ku/7lJJQnwtmxCd7/SFnc2JH2iOe1Kq5YFjXXcUqL0b/oRg1TZi6KdUnIZMtCcrb81pKxrSsFt4z2IE+lJdekjVmmSteLyjO0+FtnnIVDl8a5x1WXdAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACL/5p9T00IiZrWIRSW2nUyX0B2AonM5eScuYm0Z9McL0gadmaLmQu/x6hmhYNHSiE+2HHh3raXLSjg8KOv8ccX2EaqexVZzYHsQeT7qcfOvYOGM2LR1RU6NC/P0n0X3G71TRoJtR3K0cb4cJ5CZKQyyyvvFPdGEUlZaCRJ68wCmctZUOcZzXa3jK4VJx6tUJq2lXVMHoAtrBNKzhsBDp6A/ZycBc+QtTuUzUPrvxM8ovRpdS4vr5jeKER36KpnDlDkCeizV09tUuVK4ixUNPVtN4WgOWFouBHfPZZHRAUJrm/mXRAFPAFEcxVOsO57mqBYi4f6GCCPuA19ADLeN3xM=
af4c43a0-ccc7-4ec6-8f9d-123d3bec7369	804387a7-8ff6-400d-82ce-fa420e284120	keyUse	ENC
f0016096-a022-4ea2-a770-edb7cf03a2eb	804387a7-8ff6-400d-82ce-fa420e284120	algorithm	RSA-OAEP
2fb39bf9-b89f-4cb4-9790-bbfa64f417ea	804387a7-8ff6-400d-82ce-fa420e284120	privateKey	MIIEowIBAAKCAQEArMGY/umiHVTxO0eUOz6aGac5udbNHpXILwlfsb2QpNBkF0brmwMYwQsfrmb4A2mSD4IiRbqMkaByrbW0xHU67sF0OwR6pTWE7RdWBeiSrpoM2fWJJRC7WUJSyBjOdFRqrexF/zWEnF9xRdnsx3NfOWTe4lxaIbfHQKAZgbqvHnf8dv3ilTuDunZdO/6VvfODU59mhHifqo+LtMFgc5D8QQTfrmEVCtUpifNSrv+5SSUJ8LZsQne/0hZ3NiR9ojntSquWBY113FKi9G/6EYNU2YuinVJyGTLQnK2/NaSsa0rBbeM9iBPpSXXpI1ZpkrXi8oztPhbZ5yFQ5fGucdVl3QIDAQABAoIBAAZKOuSrzgQXt9F1juSZ/Wi0tCnbiSFgHmdJW0DF9afCkfpfpywVhfJgEiRlSbTExGrTIqX7n6ryYWqIufmzM6pGGedyMiL6GrUP4J5wyYfDl8yHH5oIDMI4Y3o3SQERonFjBRNrN+us9UYFTr/eUq0XdUle8nCALVLhjBGIogqlD/BaPst/B1DbUjkgb+Ed4n2HJ7uaLNE6tOZk3Om2YAKaJJXqE6QJxTvgcHgpQyJc1KCiPweg0T8k081u6qBTJfs/97tVWzuIDPBod2dAjNVdt9miHA4E07KWk7Qyj+7Hf/vuiCwqsay+isOhq6cTTSk0DdzpVybvkP/osLzWl+MCgYEA8oeplzh72hzuqcEuJmWWytsLRLfD1X7ZvBw16MeUDZYWPHKcRY+Om1dxvCKwIuvzxEjr0TBuiAOUJeR6ANX2Nz7sEEaBSQ0oyFnHiMYPYfvD1Z+LUG7RxZ865ATiYI0x/9xcuxBMMV3Pw6BZ4CBonOzPd8TR1SLfg8rFCC18C+8CgYEAtlnhG6qDdcXxp4XmqQFOzD0b9nJdPGLMapOCjDoJzO3Ta7USqGG3LPILiZLdvn49czOmqmPSTS2uStqcFkdvHF74lQmwy/8bf687KD71jsdDUPfGMwzBF+1O/d4jiUmRWh4DcyP8qaiARiS5xm32NEi8AOBd2SlQYYmjxheBDvMCgYBv60DMouksjvtn5NjKKUk71XdOv8qkZARQdWg/QpJE7sTWIkGRLB0v/Ftk6VEE3IPCSbBg+YuYQqaEEfpnFlWnyuae4BpbPrJaOmwE5vlESy1lEFn2xR0SqFdB0CszSRUQsH0uaefvRA5ThVTUQ8Bi4jkfWPlH9O7WX6UrD+pViwKBgCSWAelIG9ocXfDLl8ze2011EVAv/+7mr7bOY8n4txCrwtiAWv73pAXbhl8S3XSj5XZgrZbQMliTyr1wARMjP/LER0G30QYM6BqFMOxRPXlpF2N+YwDJFVDUpx2eXSjlXsli7jRCyyXLDfmE0tUyKMyyry3J1mqEtIDtWbOb8aPrAoGBAJfw9S1bBMgF1kha1wrnMfgOaiKuVU12F6O3W2GmVisl7NRmTpWpGIWBEy36w1RN6ZA7jJpDP6wQhQLGrIL9h3ynAauFl7fB4g6wdZE5ouGeOobW5VNvLH+8USABbMQbM/HvPC691ZmAPHu7Zm/MmYZ/RtrGnIFrqZq1kkpHdmSp
bf69800c-2fda-4907-bfcd-df6bacfcaf8f	804387a7-8ff6-400d-82ce-fa420e284120	priority	100
55164a1e-ed50-4e13-a2ab-dc1a0d02ae7e	68344544-b0a0-4cdc-a375-c6aaf6da0c01	certificate	MIICozCCAYsCBgGIFM2hnzANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApnaG92ZXJibG9nMB4XDTIzMDUxMzExMDgyMFoXDTMzMDUxMzExMTAwMFowFTETMBEGA1UEAwwKZ2hvdmVyYmxvZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAPP00M/HWoQExllEEhVPRCRHEZv8+W38a83s4Rt1fwIUx8765fZysnoc1XYnjnwOxiA9jq7WMxGPYBo1TahF3fLP4A3nfsWFs98CbevMqd3KTrYQG1y2U2h97seWcDVdSqt5gAGJ8nCOjK14h/+5VS7kU4PYMwyLaDqaZXrIWLSjC6rwNLi5H8g1nbXQz8SDohOSDz/OPSC4FxtsdOiEm4UToakoAZvSPCKgWVjk7FMmYAz7Uw0UNBoGQtjBgUd4bBomgxRbVB8fmZYV16dtArLToHDLZlvc+OT1VWrJgF9727gAflxYBRdpFTQk5pv1mdmE4RPhYd1pzp/eMR028GcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAMsWZfP+r0XaiBWkcsdQH3btPXYHVGcLZbEWXeNSYTVoJddZau3BJbMiMmexiilk2tu/Lct2JuwgiHA8SfOYMcH6DEofwvTE6OJTxnRZW631HBrZmQZFM8KhTq8A4pgi4mGwhRCB/IGUn0qRvNLmkGiUVMmROWrkd2whArgpOSFxt0nrJ9s2Hqlx85PogtY/4Gvz+0p02yvAVQ8aOATGV8ZhcTe49OjYbYUim69Jea0I+OxRrDHHiGle6YkjXrD9sujgTsKlmfDnJa2iU6qe+f6aq6OhlpepWi29lYgvDu3hlTqU9eSfvsyCESLMJHyxFLn/9Gdl/e4NwaSsYNxzy3g==
e6ad063b-1b79-4855-b681-0b7a53ba8509	68344544-b0a0-4cdc-a375-c6aaf6da0c01	priority	100
34c214c6-0e4f-48a2-b192-12eef0e80aaf	68344544-b0a0-4cdc-a375-c6aaf6da0c01	privateKey	MIIEpQIBAAKCAQEA8/TQz8dahATGWUQSFU9EJEcRm/z5bfxrzezhG3V/AhTHzvrl9nKyehzVdieOfA7GID2OrtYzEY9gGjVNqEXd8s/gDed+xYWz3wJt68yp3cpOthAbXLZTaH3ux5ZwNV1Kq3mAAYnycI6MrXiH/7lVLuRTg9gzDItoOppleshYtKMLqvA0uLkfyDWdtdDPxIOiE5IPP849ILgXG2x06ISbhROhqSgBm9I8IqBZWOTsUyZgDPtTDRQ0GgZC2MGBR3hsGiaDFFtUHx+ZlhXXp20CstOgcMtmW9z45PVVasmAX3vbuAB+XFgFF2kVNCTmm/WZ2YThE+Fh3WnOn94xHTbwZwIDAQABAoIBABEUFno1TpTncKtXJJzxS6fugcEV2LBmd3WXG7s8YoPWyJYo4mh6Zxw9YIRBCKyOrDgdlxuOS0zzaJrtGF6rZXpWKy1OA4X4cjsuhFt5nHq2awQ75G59JSGvj0PRuFFEErImc1uoOJzAngCW645vfxMlUONuA0ThjY5suKX72JnsnSrV0b8eG9m8RO1PIjYWSmHWZS3R9+lFdDyLKig64OQpzLhBMd98jjZi+H1uKvtPm8l7af4aYK5zBFN9RyvzEDWU6tnZ35hduR/gKwFxsVVwnG0cQFPfNJ5XZeDB5Xl0RUvnei/xEywwNkYMVMCXp6t0E0naxlfqcrs2ffSSTIECgYEA+xzzcmMv2tMCuM0FCP/kDsV6xoRkW3BwOkGWsir2VyGpyBlQHqI+is2bvZ4vQNkhJSD7bEPxSkXLSgEiUocvCyINHZoSV3u6z4fs/qBqCDisKGVAS1xAqXUCtgX09JOL0BDSzag8LcTtrNDedDkGmKTAspAHFs4kUoQvwI6seBECgYEA+LQ1o+2JjNV/vxoeKSCMzRq2soM3kSi6RoguN4DKPjFEwDoH+iYUYQraQ8UNIz9mXlkvP07OnXObAzFBS0BGBaXm7lzIkkY/4S2Or2yGSGtQp7Y/I+tThc8/1Z7fW5+mBA4GvQLvst8gboLSrXsD+FQG/Gmfzl51xP+22xI1mPcCgYEA3Fdg/sQt35M8Vi//9Q+ka5m4y6yr6thUgam/s4KjOX1eXyhm9xpiSqVzvQSqbfqYbN3t/+f2N7faU4t/NG9ORjSQ0aK56W22VBfvStYzdBdWaPO/YOEIFCmKQXIkqN821VGNx8uRUo/0BaoZKF5JfXNDauuabNZhZM58oDgQ+iECgYEAmnCF8tMaHJuj5Y8ZdZ6h8OgK1dXIFts8uXntgUf3zyEXOWuP8pXdB9oOahEetGm1bxdg0KZmhb35X8Uhb9Js6Sr5ucFiR/tZxcJdna/9v1Ds2AjDMtH6nthxIn2y5BnCpTf0lUESingmkpmorFP8xiOf5vTMaQGdjoThDy9Cm0cCgYEAhDC3UgUCy1HfR+pUevy3RZXO01pcfkmPIEDJ9aS7hyJSTrZ+hu6DrjDQk+U1URqV/I6OBGR2jKbSGfKSRZe6ljcl7avFcg8aXGGAEnCS2fqjCdYxq/htTBAMYJ5WkBhfSkkP3FQafqLhKLEfhJj/pof9x2ukGfk+LtobX0gR+Mk=
c00140f9-9b61-4995-ae21-a0a880943e5d	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
286a542e-0729-439e-af36-066559522fcf	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-address-mapper
84a4aa6d-145a-4731-a75b-e147ce2a8ed6	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
a7bda4f0-7435-48d0-80d9-c115d98df599	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-user-property-mapper
e4b77200-b35c-488a-8de6-0e29b69f2eba	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-full-name-mapper
8e438c93-3b2c-4f28-85d2-d4d1eee0b957	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-role-list-mapper
45c653f0-a114-4d22-86f3-93846e68a4d8	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
e0d86d73-4729-400f-a1e9-66371305cc02	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-user-attribute-mapper
66821ca8-19ee-4925-a907-6f6428855389	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
02eb4a72-c9d1-4d35-8d49-4bbbb61900ca	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-address-mapper
86036488-ba59-4caf-8159-cd32e22856ce	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
e7b665df-4c5f-4136-b685-1b625d9ccf23	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-role-list-mapper
49e1101e-e1fe-4d4c-a7bf-19c4df324f71	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-user-property-mapper
df722a51-654b-482a-baf7-0d972b221186	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	priority	100
d7c75dfd-0c6d-4e15-9c72-f7504e3335f6	7649d521-543a-44ee-9757-2580f313c03d	allow-default-scopes	true
1a57e9f2-574f-465f-84e6-671f18605dfc	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	algorithm	HS256
b5f2f595-2209-4a99-99c9-250e888667bf	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	priority	100
ba16f179-ecfa-44ed-99c5-fe3267ab8a96	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	secret	juYLtyU9BtiROBbMYHu4aueuAe7nKMkENGHDG20ewcpFprHhbfy5s3F4pRIQ9QW76otmzga8x9DRj3Wn3gqd2w
d23a56a3-1276-4027-a0b6-cd279ec4b502	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	kid	305c65c2-9bc3-4761-8616-eed5b47c2697
9e7ec32e-5b46-4c8b-9521-a3ecac245325	fa662f9f-c916-423c-843b-19d549fcc0ff	priority	100
6313c996-c0c0-4fb8-ac3d-8b5074ce4968	fa662f9f-c916-423c-843b-19d549fcc0ff	algorithm	RSA-OAEP
b7bf1ce8-0091-4251-944b-ddca32b9a46e	fa662f9f-c916-423c-843b-19d549fcc0ff	certificate	MIICozCCAYsCBgGIFM2j6TANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApnaG92ZXJibG9nMB4XDTIzMDUxMzExMDgyMVoXDTMzMDUxMzExMTAwMVowFTETMBEGA1UEAwwKZ2hvdmVyYmxvZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKnjaOsfMn0bP1cAZSOf/lRiRc+uVUb6CJ2wtogiHEpcaIK3TXmLcGglUlDoGEUv18xn+G+gcoEaO4rVuecG3RFnOgcerGjtMQll73IVHxUBxswQXs9DGXo78Qq+/gqojz8fdWWcuNOv7ozeXIO7lZ8/lW8kdjVCU4jbsJmizQiDLaf2TQI+Fy37KCdjpV2i6GX5eAEQ9or7Np6L0sfjB9Vl/GoaENW5Abkd83cgItfC21vGD4/Qzj6RuNsE8dGcRG7vyEEjf8N8G5S3ro060pO2tdzLFd/Cmt4yAw4pH+/DnawaaZeUy1bXapOZPnr7gHJqVt3EqgHsNH1D+XgeLOUCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAJlxSLaMVIPkjt5x1ex3Tgq9KThZ3hGJvO+aoivIMu+znDw0MN8qABqUQbJBrOfmTdPbl5fFSlbERpcg+kCqjjwOEjOzzH2CFFPWz8/0GDWxy1WwT6WuWM68mJD8RGsGmTKL4PpysXIFekY1Ce39g1o87AVRC6MhERFGnrDJVZCzLGfK7sfCRWGdf6eNkvSEH+dVZyBw4/4TQzB3muV25D41u6KWU+AxSjIA6Q9ESebDUdpoD+ZBu/7pobOkHDSREarpRKK8Xn+sZKV8UJ0hq90cVEIb4oNl0fz7CXxOZRlBw9bfx6LYHd3vw+8rN49/DcOhyDB3JzwO7QXlkbyRz+Q==
790fe04c-37b5-44a1-843b-b8903cf8ec5d	fa662f9f-c916-423c-843b-19d549fcc0ff	privateKey	MIIEowIBAAKCAQEAqeNo6x8yfRs/VwBlI5/+VGJFz65VRvoInbC2iCIcSlxogrdNeYtwaCVSUOgYRS/XzGf4b6BygRo7itW55wbdEWc6Bx6saO0xCWXvchUfFQHGzBBez0MZejvxCr7+CqiPPx91ZZy406/ujN5cg7uVnz+VbyR2NUJTiNuwmaLNCIMtp/ZNAj4XLfsoJ2OlXaLoZfl4ARD2ivs2novSx+MH1WX8ahoQ1bkBuR3zdyAi18LbW8YPj9DOPpG42wTx0ZxEbu/IQSN/w3wblLeujTrSk7a13MsV38Ka3jIDDikf78OdrBppl5TLVtdqk5k+evuAcmpW3cSqAew0fUP5eB4s5QIDAQABAoIBAAZoSwv5Hn6c8TffDjF4ho9YsIDbdqBpbDtET7IVNUNxtkhd0Ph5U5k99RuTkVzEp+sv7a0KHF91pZLAKlWGCv7tyYC8vaxsa7nKxCvlk4lHip+mK2k+Qt77FUV+PBcbUeHD1jnpngfv3fumpE8cm1FJBOIO+j1afcuO25uDyh9cwW06RuYpDOsznssUQZEsQzMY7rVnupvRpsP7g/DIvX8PsQdTAYFCCtpugetaq8K8pQgPVC9FSD+MZC8rV+6bVnZDaoA3snVDI0MwuQivU2NgUtc49S9zS+rr3W/F8iRt95g4kcZmDc7XiBEnBjCwW1yAIZ0zeHOxkCP0/uxIjdECgYEA4IEiNDFHmeJMvUtx4Vosr5gv2IBALpaUEcZJQFDV60B/TfKnO0tbRGO+1PSL5a5riKoI9bku/7fdxCaS5A9yOUUlJwW6pRgmiL8nS2h8mqLHETvMCipa3VjUuyKYw3Y3rrcuOx4VbdelWey0UDtHnhiglQ9GhKOADDAqsgNx2zUCgYEAwbjKMV5x9oZFrrP2DHfkfFiix0Pe8WC8h2dqvU/opte8fkDChficpaT606SeUztEwZIwqPz7fyg02dkUphBU92WQcpyQX7xIs9A0rawFO/xBT8zNL6gzrxojych3OnBeio07T0in6uGUAA/GkzA9a59COTBVA0BVcOBCEoc9kPECgYBhAatj3f9QUOZTzOuyMiKo5RuXcyNIfiwQ2hsAvW0Rr9bSOY1lI5SWIntszRY98nXooYApnRDf0fTzMq+596qlcGkzSVhyydKst9wky0s8DiXyHmJ16gNFLYMOMU7M9qHszp4dUUx1H/8EsjDfkh3KBF4uymDwIy3LFmz8alyiGQKBgF/W8zk/d3Q2c6z93YHHouOd2lJpEpgqersmf9lO+lPosZloopQzLhSJLYqdi7KzxM1bbPV9y1LaamNIkX2i4NZQigkZyheDCBjlrdoqG6DUqN84/F5SgddkQEZpBguEYlF7k9cio+iBV348T8qr+AcRkGrIrZZhMqQYXrfZ7qyRAoGBAKRyUyOYg/RE2pjFFEIJhetR4FLHxX21aS6mwD1vo4vS1PvbGMsWFu1GZPVfrWLAADpn66Ff2C/0j3Zec0v1bqSv12XUk+B+Nx+hIVkX/l0Hccq68WBKygMKjKQm1voctydcvVTIxZAbzc+WTnL82QiRjzy8Ve4p94GblVYV0xlm
097feee1-a539-48be-8b19-1eb3eda2dfbe	d13b325f-b4d0-4f95-b50a-f854f8dce599	max-clients	200
6b2b3ff9-15d1-4176-a7fb-d8ebfb3510fc	c3a412a6-8bff-4786-843f-9e15a38d0d35	client-uris-must-match	true
41662c35-37d1-4d4a-94ac-c7cd3bf37f73	c3a412a6-8bff-4786-843f-9e15a38d0d35	host-sending-registration-request-must-match	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.composite_role (composite, child_role) FROM stdin;
fb6eb550-73ee-4601-9295-6a3e6576f591	65e8fd69-6c29-4f5e-98b2-ea8b61149c11
fb6eb550-73ee-4601-9295-6a3e6576f591	c96521ba-638e-4f0f-b061-b147b6bcbfbb
fb6eb550-73ee-4601-9295-6a3e6576f591	2b2ed86b-7a6b-403d-8b93-2eae0e5fd657
fb6eb550-73ee-4601-9295-6a3e6576f591	2445e793-2ab1-4123-819a-e1b7a1bee22e
fb6eb550-73ee-4601-9295-6a3e6576f591	5223b7c6-7b7f-4ec4-a155-70d8507a29ba
fb6eb550-73ee-4601-9295-6a3e6576f591	44334ce6-5214-41ac-b43b-aea69f9ea06f
fb6eb550-73ee-4601-9295-6a3e6576f591	835eaf92-38ca-4d4d-a33f-c10769c9da7f
fb6eb550-73ee-4601-9295-6a3e6576f591	c9141c93-1d60-4de5-8e91-ce124e991adb
fb6eb550-73ee-4601-9295-6a3e6576f591	b7f9f60d-5978-4f77-be65-f0eab2c55a00
fb6eb550-73ee-4601-9295-6a3e6576f591	b7a9272d-3121-4f5c-b237-d21e144f6d4a
fb6eb550-73ee-4601-9295-6a3e6576f591	fecb6f67-2d70-40ef-8d6b-1d3f0d7bf759
fb6eb550-73ee-4601-9295-6a3e6576f591	cac57030-a4ab-405c-95ef-25ba8f4af909
fb6eb550-73ee-4601-9295-6a3e6576f591	2acb9d63-c9c9-482a-8689-dc28f2dee594
fb6eb550-73ee-4601-9295-6a3e6576f591	eb4fd444-0040-439c-ab08-bd2f8c3bc9e3
fb6eb550-73ee-4601-9295-6a3e6576f591	c25b35fc-5ca6-4c03-8eb5-020ab5fcb8ee
fb6eb550-73ee-4601-9295-6a3e6576f591	539e0905-6125-44f4-a070-20efa2b75cde
fb6eb550-73ee-4601-9295-6a3e6576f591	a54b74e7-6bdb-4566-85b7-175050487a26
fb6eb550-73ee-4601-9295-6a3e6576f591	e32186a7-cc31-4173-9095-4442912c1efb
5223b7c6-7b7f-4ec4-a155-70d8507a29ba	539e0905-6125-44f4-a070-20efa2b75cde
2445e793-2ab1-4123-819a-e1b7a1bee22e	e32186a7-cc31-4173-9095-4442912c1efb
2445e793-2ab1-4123-819a-e1b7a1bee22e	c25b35fc-5ca6-4c03-8eb5-020ab5fcb8ee
268fca4c-7de0-4c8c-835d-2af03b3fc9d9	ba6085bb-de86-4b61-937c-f48f2f633e09
268fca4c-7de0-4c8c-835d-2af03b3fc9d9	8b7e6f42-6473-4ad8-9db6-e132a5b3cec6
8b7e6f42-6473-4ad8-9db6-e132a5b3cec6	20998d87-1de4-4396-997b-57eab211230d
8711094d-8d89-4b48-9c3e-e60b0bd35b41	a1c5aa13-17eb-40be-b1b4-4e52dfaa4213
fb6eb550-73ee-4601-9295-6a3e6576f591	aed10ddb-a498-4caa-b5d0-4efc538c6c7a
268fca4c-7de0-4c8c-835d-2af03b3fc9d9	2a9f7dbc-6bbf-4e5b-8aad-72cbc249f16f
268fca4c-7de0-4c8c-835d-2af03b3fc9d9	040ff5cd-1696-44eb-9818-caced0d18f88
fb6eb550-73ee-4601-9295-6a3e6576f591	28ae30ed-331c-407c-ab8e-e1c0045ba431
fb6eb550-73ee-4601-9295-6a3e6576f591	fcc8ed10-8a31-4fc3-adf3-25190df795a6
fb6eb550-73ee-4601-9295-6a3e6576f591	2bd3c139-310b-4614-82da-a90df218c06d
fb6eb550-73ee-4601-9295-6a3e6576f591	5c01d5c0-ce15-42a4-ac80-24cb70df46dc
fb6eb550-73ee-4601-9295-6a3e6576f591	58c3bf54-c6f8-42ce-aacf-40a68259a999
fb6eb550-73ee-4601-9295-6a3e6576f591	b3a5f03c-96e5-4f3f-b6a4-678f7ce969f8
fb6eb550-73ee-4601-9295-6a3e6576f591	af77ed22-e649-4473-b36d-6628e51ea569
fb6eb550-73ee-4601-9295-6a3e6576f591	6fb99e27-941d-41e3-941f-83ca36b6852d
fb6eb550-73ee-4601-9295-6a3e6576f591	99d1b72a-7911-47b8-86bc-014ae9c79c0c
fb6eb550-73ee-4601-9295-6a3e6576f591	b5b1e8af-9149-4e46-998b-64e9a8ec16fb
fb6eb550-73ee-4601-9295-6a3e6576f591	8c6139dc-dbd1-4fec-b6dc-8ef86fa293ba
fb6eb550-73ee-4601-9295-6a3e6576f591	bb4f36f1-5e50-4a94-9a22-50005be1a79c
fb6eb550-73ee-4601-9295-6a3e6576f591	12c66d75-20ce-472f-9f37-5288d68c5f35
fb6eb550-73ee-4601-9295-6a3e6576f591	2dc1b2ee-5f39-4e7c-a8c3-8da5bb0622f6
fb6eb550-73ee-4601-9295-6a3e6576f591	e0537f33-0022-40e8-9556-3aac58d72233
fb6eb550-73ee-4601-9295-6a3e6576f591	ac27f495-6ceb-4df5-8c3a-86c4348ec12a
fb6eb550-73ee-4601-9295-6a3e6576f591	3cd2f718-28b7-4485-8d17-d70e002cc2de
5c01d5c0-ce15-42a4-ac80-24cb70df46dc	e0537f33-0022-40e8-9556-3aac58d72233
2bd3c139-310b-4614-82da-a90df218c06d	2dc1b2ee-5f39-4e7c-a8c3-8da5bb0622f6
2bd3c139-310b-4614-82da-a90df218c06d	3cd2f718-28b7-4485-8d17-d70e002cc2de
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
fb6eb550-73ee-4601-9295-6a3e6576f591	a3c624b3-db28-468d-838d-d7911e6027c3
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
a8c43473-c8e0-4046-a670-50ffc311d7dc	\N	password	af1d8119-bd29-473c-892a-56391c5f1af5	1683976201522	\N	{"value":"lY1h7CaG9x5p2Mlklug7e5DUau6hpRuGJ7NrhJFmeqKLglC4x39h4pJuQ4O47Bf+fguYsZfc6X3/p7+nCkcfTg==","salt":"4DvmXm4WlIyCixa7rK2cIg==","additionalParameters":{}}	{"hashIterations":100000,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-05-13 11:09:51.093698	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	3976190775
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-05-13 11:09:51.103746	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	3976190775
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-05-13 11:09:51.148033	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	3976190775
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-05-13 11:09:51.151928	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	3976190775
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-05-13 11:09:51.25806	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	3976190775
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-05-13 11:09:51.2612	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	3976190775
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-05-13 11:09:51.34415	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	3976190775
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-05-13 11:09:51.347322	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	3976190775
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-05-13 11:09:51.352444	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	3976190775
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-05-13 11:09:51.431746	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	3976190775
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-05-13 11:09:51.482813	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3976190775
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-05-13 11:09:51.485698	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3976190775
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-05-13 11:09:51.50681	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3976190775
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-13 11:09:51.524128	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	3976190775
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-13 11:09:51.5264	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3976190775
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-13 11:09:51.528396	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	3976190775
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-13 11:09:51.530336	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	3976190775
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-05-13 11:09:51.569365	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	3976190775
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-05-13 11:09:51.609041	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	3976190775
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-05-13 11:09:51.622865	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	3976190775
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-13 11:09:52.806943	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	3976190775
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-05-13 11:09:51.630912	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	3976190775
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-05-13 11:09:51.633411	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	3976190775
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-05-13 11:09:51.683408	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	3976190775
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-05-13 11:09:51.688382	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	3976190775
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-05-13 11:09:51.690313	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	3976190775
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-05-13 11:09:51.888555	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	3976190775
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-05-13 11:09:51.948619	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	3976190775
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-05-13 11:09:51.951973	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	3976190775
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-05-13 11:09:52.007074	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	3976190775
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-05-13 11:09:52.019543	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	3976190775
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-05-13 11:09:52.039211	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	3976190775
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-05-13 11:09:52.044838	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	3976190775
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-13 11:09:52.049548	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3976190775
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-13 11:09:52.051993	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	3976190775
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-13 11:09:52.078105	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	3976190775
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-05-13 11:09:52.08238	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	3976190775
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-13 11:09:52.086753	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3976190775
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-05-13 11:09:52.090069	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	3976190775
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-05-13 11:09:52.093192	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	3976190775
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-05-13 11:09:52.095101	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	3976190775
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-05-13 11:09:52.096815	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	3976190775
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-05-13 11:09:52.102992	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	3976190775
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-05-13 11:09:52.797517	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	3976190775
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-05-13 11:09:52.801741	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	3976190775
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-13 11:09:52.812164	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	3976190775
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-13 11:09:52.81425	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	3976190775
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-13 11:09:52.892006	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	3976190775
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-13 11:09:52.895751	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	3976190775
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-05-13 11:09:52.929043	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	3976190775
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-05-13 11:09:53.114415	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	3976190775
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-05-13 11:09:53.118005	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3976190775
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-05-13 11:09:53.121021	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	3976190775
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-05-13 11:09:53.123769	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	3976190775
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-13 11:09:53.129259	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	3976190775
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-13 11:09:53.134256	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	3976190775
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-13 11:09:53.168037	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	3976190775
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-13 11:09:53.399106	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	3976190775
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-05-13 11:09:53.423018	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	3976190775
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-05-13 11:09:53.42897	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	3976190775
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-05-13 11:09:53.437932	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	3976190775
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-05-13 11:09:53.442604	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	3976190775
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-05-13 11:09:53.445788	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	3976190775
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-05-13 11:09:53.449772	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	3976190775
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-05-13 11:09:53.453508	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	3976190775
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-05-13 11:09:53.485148	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	3976190775
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-05-13 11:09:53.507719	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	3976190775
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-05-13 11:09:53.512528	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	3976190775
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-05-13 11:09:53.540812	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	3976190775
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-05-13 11:09:53.547071	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	3976190775
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-05-13 11:09:53.551162	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	3976190775
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-13 11:09:53.558346	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3976190775
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-13 11:09:53.566194	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3976190775
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-13 11:09:53.568146	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3976190775
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-13 11:09:53.597997	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	3976190775
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-13 11:09:53.618137	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	3976190775
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-13 11:09:53.622314	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	3976190775
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-13 11:09:53.624575	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	3976190775
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-13 11:09:53.644878	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	3976190775
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-13 11:09:53.647461	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	3976190775
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-13 11:09:53.665423	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	3976190775
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-13 11:09:53.667393	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3976190775
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-13 11:09:53.671329	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3976190775
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-13 11:09:53.673306	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3976190775
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-13 11:09:53.68956	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	3976190775
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-05-13 11:09:53.694292	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	3976190775
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-05-13 11:09:53.702216	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	3976190775
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-05-13 11:09:53.709086	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	3976190775
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-13 11:09:53.714569	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	3976190775
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-13 11:09:53.720893	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	3976190775
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-13 11:09:53.737583	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3976190775
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-13 11:09:53.746404	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	3976190775
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-13 11:09:53.748382	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	3976190775
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-13 11:09:53.75549	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	3976190775
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-13 11:09:53.757702	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	3976190775
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-13 11:09:53.763494	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	3976190775
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-13 11:09:53.855683	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3976190775
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-13 11:09:53.85771	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3976190775
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-13 11:09:53.865593	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3976190775
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-13 11:09:53.878918	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3976190775
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-13 11:09:53.880793	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3976190775
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-13 11:09:53.893016	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	3976190775
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-13 11:09:53.89657	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	3976190775
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-05-13 11:09:53.902059	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	3976190775
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-05-13 11:09:53.913998	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	3976190775
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-05-13 11:09:53.925951	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	3976190775
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-05-13 11:09:53.929305	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	3976190775
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
f7fa1af8-0135-4dab-a875-ad354a83a603	3bd57512-e485-4295-9e1c-393fb152859c	f
f7fa1af8-0135-4dab-a875-ad354a83a603	612172ee-dfdb-4866-b83d-5351090ee831	t
f7fa1af8-0135-4dab-a875-ad354a83a603	2f448585-39f6-4e0e-8b8f-460fdab3f2d8	t
f7fa1af8-0135-4dab-a875-ad354a83a603	108a2f51-fc63-4267-938f-91496e00a445	t
f7fa1af8-0135-4dab-a875-ad354a83a603	e3fda235-2841-4b9b-a386-9c5bfbcf10b9	f
f7fa1af8-0135-4dab-a875-ad354a83a603	4cbfceb3-4fdd-48c5-9209-19e2694571e4	f
f7fa1af8-0135-4dab-a875-ad354a83a603	ba84a1f4-1a56-46f9-953f-9999697253bb	t
f7fa1af8-0135-4dab-a875-ad354a83a603	bf3d62c4-a6cb-4381-b2e8-e2cd440df44b	t
f7fa1af8-0135-4dab-a875-ad354a83a603	15e8e2db-e052-4e2f-b8b8-3e750795a7ef	f
f7fa1af8-0135-4dab-a875-ad354a83a603	f115fbf5-5848-47d7-b8f4-852ba7286fef	t
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
268fca4c-7de0-4c8c-835d-2af03b3fc9d9	f7fa1af8-0135-4dab-a875-ad354a83a603	f	${role_default-roles}	default-roles-master	f7fa1af8-0135-4dab-a875-ad354a83a603	\N	\N
fb6eb550-73ee-4601-9295-6a3e6576f591	f7fa1af8-0135-4dab-a875-ad354a83a603	f	${role_admin}	admin	f7fa1af8-0135-4dab-a875-ad354a83a603	\N	\N
65e8fd69-6c29-4f5e-98b2-ea8b61149c11	f7fa1af8-0135-4dab-a875-ad354a83a603	f	${role_create-realm}	create-realm	f7fa1af8-0135-4dab-a875-ad354a83a603	\N	\N
c96521ba-638e-4f0f-b061-b147b6bcbfbb	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_create-client}	create-client	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
2b2ed86b-7a6b-403d-8b93-2eae0e5fd657	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_view-realm}	view-realm	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
2445e793-2ab1-4123-819a-e1b7a1bee22e	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_view-users}	view-users	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
5223b7c6-7b7f-4ec4-a155-70d8507a29ba	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_view-clients}	view-clients	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
44334ce6-5214-41ac-b43b-aea69f9ea06f	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_view-events}	view-events	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
835eaf92-38ca-4d4d-a33f-c10769c9da7f	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_view-identity-providers}	view-identity-providers	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
c9141c93-1d60-4de5-8e91-ce124e991adb	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_view-authorization}	view-authorization	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
b7f9f60d-5978-4f77-be65-f0eab2c55a00	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_manage-realm}	manage-realm	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
b7a9272d-3121-4f5c-b237-d21e144f6d4a	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_manage-users}	manage-users	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
fecb6f67-2d70-40ef-8d6b-1d3f0d7bf759	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_manage-clients}	manage-clients	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
cac57030-a4ab-405c-95ef-25ba8f4af909	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_manage-events}	manage-events	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
2acb9d63-c9c9-482a-8689-dc28f2dee594	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_manage-identity-providers}	manage-identity-providers	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
eb4fd444-0040-439c-ab08-bd2f8c3bc9e3	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_manage-authorization}	manage-authorization	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
c25b35fc-5ca6-4c03-8eb5-020ab5fcb8ee	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_query-users}	query-users	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
539e0905-6125-44f4-a070-20efa2b75cde	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_query-clients}	query-clients	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
a54b74e7-6bdb-4566-85b7-175050487a26	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_query-realms}	query-realms	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
e32186a7-cc31-4173-9095-4442912c1efb	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_query-groups}	query-groups	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
ba6085bb-de86-4b61-937c-f48f2f633e09	98ab4eba-add2-4e45-a92b-831786b305ec	t	${role_view-profile}	view-profile	f7fa1af8-0135-4dab-a875-ad354a83a603	98ab4eba-add2-4e45-a92b-831786b305ec	\N
8b7e6f42-6473-4ad8-9db6-e132a5b3cec6	98ab4eba-add2-4e45-a92b-831786b305ec	t	${role_manage-account}	manage-account	f7fa1af8-0135-4dab-a875-ad354a83a603	98ab4eba-add2-4e45-a92b-831786b305ec	\N
20998d87-1de4-4396-997b-57eab211230d	98ab4eba-add2-4e45-a92b-831786b305ec	t	${role_manage-account-links}	manage-account-links	f7fa1af8-0135-4dab-a875-ad354a83a603	98ab4eba-add2-4e45-a92b-831786b305ec	\N
8ecf4eaa-84f4-408a-9a48-c8420cbdae99	98ab4eba-add2-4e45-a92b-831786b305ec	t	${role_view-applications}	view-applications	f7fa1af8-0135-4dab-a875-ad354a83a603	98ab4eba-add2-4e45-a92b-831786b305ec	\N
a1c5aa13-17eb-40be-b1b4-4e52dfaa4213	98ab4eba-add2-4e45-a92b-831786b305ec	t	${role_view-consent}	view-consent	f7fa1af8-0135-4dab-a875-ad354a83a603	98ab4eba-add2-4e45-a92b-831786b305ec	\N
8711094d-8d89-4b48-9c3e-e60b0bd35b41	98ab4eba-add2-4e45-a92b-831786b305ec	t	${role_manage-consent}	manage-consent	f7fa1af8-0135-4dab-a875-ad354a83a603	98ab4eba-add2-4e45-a92b-831786b305ec	\N
cf6d83da-f5b1-4877-889e-570cd4c19682	98ab4eba-add2-4e45-a92b-831786b305ec	t	${role_delete-account}	delete-account	f7fa1af8-0135-4dab-a875-ad354a83a603	98ab4eba-add2-4e45-a92b-831786b305ec	\N
f71ebd76-12da-40ea-a426-b73104703520	49c49de9-ceea-4994-8385-309620791cd7	t	${role_read-token}	read-token	f7fa1af8-0135-4dab-a875-ad354a83a603	49c49de9-ceea-4994-8385-309620791cd7	\N
aed10ddb-a498-4caa-b5d0-4efc538c6c7a	57c1a74e-6513-4f6e-8f21-48da831a4544	t	${role_impersonation}	impersonation	f7fa1af8-0135-4dab-a875-ad354a83a603	57c1a74e-6513-4f6e-8f21-48da831a4544	\N
2a9f7dbc-6bbf-4e5b-8aad-72cbc249f16f	f7fa1af8-0135-4dab-a875-ad354a83a603	f	${role_offline-access}	offline_access	f7fa1af8-0135-4dab-a875-ad354a83a603	\N	\N
040ff5cd-1696-44eb-9818-caced0d18f88	f7fa1af8-0135-4dab-a875-ad354a83a603	f	${role_uma_authorization}	uma_authorization	f7fa1af8-0135-4dab-a875-ad354a83a603	\N	\N
c8281036-19c6-4d54-92e1-b3efbf04d387	91cb1cd2-e133-4f67-9800-593c809120c8	f	${role_default-roles}	default-roles-ghoverblog	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
28ae30ed-331c-407c-ab8e-e1c0045ba431	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_create-client}	create-client	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
fcc8ed10-8a31-4fc3-adf3-25190df795a6	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_view-realm}	view-realm	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
2bd3c139-310b-4614-82da-a90df218c06d	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_view-users}	view-users	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
5c01d5c0-ce15-42a4-ac80-24cb70df46dc	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_view-clients}	view-clients	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
58c3bf54-c6f8-42ce-aacf-40a68259a999	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_view-events}	view-events	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
b3a5f03c-96e5-4f3f-b6a4-678f7ce969f8	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_view-identity-providers}	view-identity-providers	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
af77ed22-e649-4473-b36d-6628e51ea569	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_view-authorization}	view-authorization	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
6fb99e27-941d-41e3-941f-83ca36b6852d	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_manage-realm}	manage-realm	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
99d1b72a-7911-47b8-86bc-014ae9c79c0c	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_manage-users}	manage-users	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
b5b1e8af-9149-4e46-998b-64e9a8ec16fb	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_manage-clients}	manage-clients	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
8c6139dc-dbd1-4fec-b6dc-8ef86fa293ba	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_manage-events}	manage-events	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
bb4f36f1-5e50-4a94-9a22-50005be1a79c	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_manage-identity-providers}	manage-identity-providers	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
12c66d75-20ce-472f-9f37-5288d68c5f35	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_manage-authorization}	manage-authorization	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
2dc1b2ee-5f39-4e7c-a8c3-8da5bb0622f6	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_query-users}	query-users	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
e0537f33-0022-40e8-9556-3aac58d72233	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_query-clients}	query-clients	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
ac27f495-6ceb-4df5-8c3a-86c4348ec12a	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_query-realms}	query-realms	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
3cd2f718-28b7-4485-8d17-d70e002cc2de	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_query-groups}	query-groups	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
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
a3c624b3-db28-468d-838d-d7911e6027c3	cb809b06-ff99-4320-bf9f-87e0791b1520	t	${role_impersonation}	impersonation	f7fa1af8-0135-4dab-a875-ad354a83a603	cb809b06-ff99-4320-bf9f-87e0791b1520	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.migration_model (id, version, update_time) FROM stdin;
12buj	19.0.3	1683976196
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
16328298-8c18-44ea-8ec0-454403ae20cc	audience resolve	openid-connect	oidc-audience-resolve-mapper	4b7d60e2-c119-4859-9cc7-768ce8da0668	\N
5effc191-8e10-45d2-9740-10f075f65ec1	locale	openid-connect	oidc-usermodel-attribute-mapper	b2270e37-d812-46a2-a1b3-9d53b13acc3c	\N
191ca230-dd51-4ce2-8fe9-7cfb7c5d5e54	role list	saml	saml-role-list-mapper	\N	612172ee-dfdb-4866-b83d-5351090ee831
5f7c2271-9412-479d-bec1-04469e6cfd7b	full name	openid-connect	oidc-full-name-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
f805236b-6651-4e07-aaa5-3ceb97d8788b	family name	openid-connect	oidc-usermodel-property-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
0ca64dd9-d4da-4f08-a391-383829ad74e8	given name	openid-connect	oidc-usermodel-property-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
0eb79930-0e93-426f-a54f-e998b42902d1	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
f4685ede-08ac-4d52-8b66-4e44614d240d	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
79b6aa7f-50aa-45b7-9490-0fd0bbb6f560	username	openid-connect	oidc-usermodel-property-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
ebc4307e-a36e-4ae3-b782-bae8d2947b60	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
ae3f761b-1a08-4a1a-badc-947b7e83a8a3	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
26ca01ec-b14a-4a43-a20f-3a53f89d1958	website	openid-connect	oidc-usermodel-attribute-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
1f82c96d-faab-4cc9-b51d-d56e56b1cb30	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
41e7257f-d701-49bd-8a20-ad68a996c88a	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
350549eb-0ce5-44df-bef2-fc9a1552f907	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
3b4e65e2-40fd-4f83-995c-8d0ef746a46e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
6babc582-03fb-4265-b590-906de5e51b55	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	2f448585-39f6-4e0e-8b8f-460fdab3f2d8
915ccc66-0f4b-4cf6-9ed1-53f911f10e11	email	openid-connect	oidc-usermodel-property-mapper	\N	108a2f51-fc63-4267-938f-91496e00a445
bd767002-3684-4728-9977-68b895530496	email verified	openid-connect	oidc-usermodel-property-mapper	\N	108a2f51-fc63-4267-938f-91496e00a445
a8f2dfe2-4498-4479-b7b6-7d95a896701b	address	openid-connect	oidc-address-mapper	\N	e3fda235-2841-4b9b-a386-9c5bfbcf10b9
8c98d366-afaa-44e8-8983-1a407ef9cc94	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	4cbfceb3-4fdd-48c5-9209-19e2694571e4
94e590d3-6031-455e-ac7e-b119c732523a	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	4cbfceb3-4fdd-48c5-9209-19e2694571e4
9c076ef8-df47-4e1b-9b4b-5969f1eec401	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	ba84a1f4-1a56-46f9-953f-9999697253bb
b3cb5fef-085b-49cb-b462-4243496ae249	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	ba84a1f4-1a56-46f9-953f-9999697253bb
0a409f8d-bb09-4698-92fb-64f198c72c10	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	ba84a1f4-1a56-46f9-953f-9999697253bb
d57416f6-cf1d-410d-9c8b-887fb2161a92	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	bf3d62c4-a6cb-4381-b2e8-e2cd440df44b
9151e617-ff7d-43b1-bf40-dd634e979268	upn	openid-connect	oidc-usermodel-property-mapper	\N	15e8e2db-e052-4e2f-b8b8-3e750795a7ef
64f8dcf6-daa2-4504-869d-b9f5f9bc920b	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	15e8e2db-e052-4e2f-b8b8-3e750795a7ef
a86e23e7-122c-4cc1-ba84-7234d960d69c	acr loa level	openid-connect	oidc-acr-mapper	\N	f115fbf5-5848-47d7-b8f4-852ba7286fef
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
5effc191-8e10-45d2-9740-10f075f65ec1	true	userinfo.token.claim
5effc191-8e10-45d2-9740-10f075f65ec1	locale	user.attribute
5effc191-8e10-45d2-9740-10f075f65ec1	true	id.token.claim
5effc191-8e10-45d2-9740-10f075f65ec1	true	access.token.claim
5effc191-8e10-45d2-9740-10f075f65ec1	locale	claim.name
5effc191-8e10-45d2-9740-10f075f65ec1	String	jsonType.label
191ca230-dd51-4ce2-8fe9-7cfb7c5d5e54	false	single
191ca230-dd51-4ce2-8fe9-7cfb7c5d5e54	Basic	attribute.nameformat
191ca230-dd51-4ce2-8fe9-7cfb7c5d5e54	Role	attribute.name
5f7c2271-9412-479d-bec1-04469e6cfd7b	true	userinfo.token.claim
5f7c2271-9412-479d-bec1-04469e6cfd7b	true	id.token.claim
5f7c2271-9412-479d-bec1-04469e6cfd7b	true	access.token.claim
f805236b-6651-4e07-aaa5-3ceb97d8788b	true	userinfo.token.claim
f805236b-6651-4e07-aaa5-3ceb97d8788b	lastName	user.attribute
f805236b-6651-4e07-aaa5-3ceb97d8788b	true	id.token.claim
f805236b-6651-4e07-aaa5-3ceb97d8788b	true	access.token.claim
f805236b-6651-4e07-aaa5-3ceb97d8788b	family_name	claim.name
f805236b-6651-4e07-aaa5-3ceb97d8788b	String	jsonType.label
0ca64dd9-d4da-4f08-a391-383829ad74e8	true	userinfo.token.claim
0ca64dd9-d4da-4f08-a391-383829ad74e8	firstName	user.attribute
0ca64dd9-d4da-4f08-a391-383829ad74e8	true	id.token.claim
0ca64dd9-d4da-4f08-a391-383829ad74e8	true	access.token.claim
0ca64dd9-d4da-4f08-a391-383829ad74e8	given_name	claim.name
0ca64dd9-d4da-4f08-a391-383829ad74e8	String	jsonType.label
0eb79930-0e93-426f-a54f-e998b42902d1	true	userinfo.token.claim
0eb79930-0e93-426f-a54f-e998b42902d1	middleName	user.attribute
0eb79930-0e93-426f-a54f-e998b42902d1	true	id.token.claim
0eb79930-0e93-426f-a54f-e998b42902d1	true	access.token.claim
0eb79930-0e93-426f-a54f-e998b42902d1	middle_name	claim.name
0eb79930-0e93-426f-a54f-e998b42902d1	String	jsonType.label
f4685ede-08ac-4d52-8b66-4e44614d240d	true	userinfo.token.claim
f4685ede-08ac-4d52-8b66-4e44614d240d	nickname	user.attribute
f4685ede-08ac-4d52-8b66-4e44614d240d	true	id.token.claim
f4685ede-08ac-4d52-8b66-4e44614d240d	true	access.token.claim
f4685ede-08ac-4d52-8b66-4e44614d240d	nickname	claim.name
f4685ede-08ac-4d52-8b66-4e44614d240d	String	jsonType.label
79b6aa7f-50aa-45b7-9490-0fd0bbb6f560	true	userinfo.token.claim
79b6aa7f-50aa-45b7-9490-0fd0bbb6f560	username	user.attribute
79b6aa7f-50aa-45b7-9490-0fd0bbb6f560	true	id.token.claim
79b6aa7f-50aa-45b7-9490-0fd0bbb6f560	true	access.token.claim
79b6aa7f-50aa-45b7-9490-0fd0bbb6f560	preferred_username	claim.name
79b6aa7f-50aa-45b7-9490-0fd0bbb6f560	String	jsonType.label
ebc4307e-a36e-4ae3-b782-bae8d2947b60	true	userinfo.token.claim
ebc4307e-a36e-4ae3-b782-bae8d2947b60	profile	user.attribute
ebc4307e-a36e-4ae3-b782-bae8d2947b60	true	id.token.claim
ebc4307e-a36e-4ae3-b782-bae8d2947b60	true	access.token.claim
ebc4307e-a36e-4ae3-b782-bae8d2947b60	profile	claim.name
ebc4307e-a36e-4ae3-b782-bae8d2947b60	String	jsonType.label
ae3f761b-1a08-4a1a-badc-947b7e83a8a3	true	userinfo.token.claim
ae3f761b-1a08-4a1a-badc-947b7e83a8a3	picture	user.attribute
ae3f761b-1a08-4a1a-badc-947b7e83a8a3	true	id.token.claim
ae3f761b-1a08-4a1a-badc-947b7e83a8a3	true	access.token.claim
ae3f761b-1a08-4a1a-badc-947b7e83a8a3	picture	claim.name
ae3f761b-1a08-4a1a-badc-947b7e83a8a3	String	jsonType.label
26ca01ec-b14a-4a43-a20f-3a53f89d1958	true	userinfo.token.claim
26ca01ec-b14a-4a43-a20f-3a53f89d1958	website	user.attribute
26ca01ec-b14a-4a43-a20f-3a53f89d1958	true	id.token.claim
26ca01ec-b14a-4a43-a20f-3a53f89d1958	true	access.token.claim
26ca01ec-b14a-4a43-a20f-3a53f89d1958	website	claim.name
26ca01ec-b14a-4a43-a20f-3a53f89d1958	String	jsonType.label
1f82c96d-faab-4cc9-b51d-d56e56b1cb30	true	userinfo.token.claim
1f82c96d-faab-4cc9-b51d-d56e56b1cb30	gender	user.attribute
1f82c96d-faab-4cc9-b51d-d56e56b1cb30	true	id.token.claim
1f82c96d-faab-4cc9-b51d-d56e56b1cb30	true	access.token.claim
1f82c96d-faab-4cc9-b51d-d56e56b1cb30	gender	claim.name
1f82c96d-faab-4cc9-b51d-d56e56b1cb30	String	jsonType.label
41e7257f-d701-49bd-8a20-ad68a996c88a	true	userinfo.token.claim
41e7257f-d701-49bd-8a20-ad68a996c88a	birthdate	user.attribute
41e7257f-d701-49bd-8a20-ad68a996c88a	true	id.token.claim
41e7257f-d701-49bd-8a20-ad68a996c88a	true	access.token.claim
41e7257f-d701-49bd-8a20-ad68a996c88a	birthdate	claim.name
41e7257f-d701-49bd-8a20-ad68a996c88a	String	jsonType.label
350549eb-0ce5-44df-bef2-fc9a1552f907	true	userinfo.token.claim
350549eb-0ce5-44df-bef2-fc9a1552f907	zoneinfo	user.attribute
350549eb-0ce5-44df-bef2-fc9a1552f907	true	id.token.claim
350549eb-0ce5-44df-bef2-fc9a1552f907	true	access.token.claim
350549eb-0ce5-44df-bef2-fc9a1552f907	zoneinfo	claim.name
350549eb-0ce5-44df-bef2-fc9a1552f907	String	jsonType.label
3b4e65e2-40fd-4f83-995c-8d0ef746a46e	true	userinfo.token.claim
3b4e65e2-40fd-4f83-995c-8d0ef746a46e	locale	user.attribute
3b4e65e2-40fd-4f83-995c-8d0ef746a46e	true	id.token.claim
3b4e65e2-40fd-4f83-995c-8d0ef746a46e	true	access.token.claim
3b4e65e2-40fd-4f83-995c-8d0ef746a46e	locale	claim.name
3b4e65e2-40fd-4f83-995c-8d0ef746a46e	String	jsonType.label
6babc582-03fb-4265-b590-906de5e51b55	true	userinfo.token.claim
6babc582-03fb-4265-b590-906de5e51b55	updatedAt	user.attribute
6babc582-03fb-4265-b590-906de5e51b55	true	id.token.claim
6babc582-03fb-4265-b590-906de5e51b55	true	access.token.claim
6babc582-03fb-4265-b590-906de5e51b55	updated_at	claim.name
6babc582-03fb-4265-b590-906de5e51b55	long	jsonType.label
915ccc66-0f4b-4cf6-9ed1-53f911f10e11	true	userinfo.token.claim
915ccc66-0f4b-4cf6-9ed1-53f911f10e11	email	user.attribute
915ccc66-0f4b-4cf6-9ed1-53f911f10e11	true	id.token.claim
915ccc66-0f4b-4cf6-9ed1-53f911f10e11	true	access.token.claim
915ccc66-0f4b-4cf6-9ed1-53f911f10e11	email	claim.name
915ccc66-0f4b-4cf6-9ed1-53f911f10e11	String	jsonType.label
bd767002-3684-4728-9977-68b895530496	true	userinfo.token.claim
bd767002-3684-4728-9977-68b895530496	emailVerified	user.attribute
bd767002-3684-4728-9977-68b895530496	true	id.token.claim
bd767002-3684-4728-9977-68b895530496	true	access.token.claim
bd767002-3684-4728-9977-68b895530496	email_verified	claim.name
bd767002-3684-4728-9977-68b895530496	boolean	jsonType.label
a8f2dfe2-4498-4479-b7b6-7d95a896701b	formatted	user.attribute.formatted
a8f2dfe2-4498-4479-b7b6-7d95a896701b	country	user.attribute.country
a8f2dfe2-4498-4479-b7b6-7d95a896701b	postal_code	user.attribute.postal_code
a8f2dfe2-4498-4479-b7b6-7d95a896701b	true	userinfo.token.claim
a8f2dfe2-4498-4479-b7b6-7d95a896701b	street	user.attribute.street
a8f2dfe2-4498-4479-b7b6-7d95a896701b	true	id.token.claim
a8f2dfe2-4498-4479-b7b6-7d95a896701b	region	user.attribute.region
a8f2dfe2-4498-4479-b7b6-7d95a896701b	true	access.token.claim
a8f2dfe2-4498-4479-b7b6-7d95a896701b	locality	user.attribute.locality
8c98d366-afaa-44e8-8983-1a407ef9cc94	true	userinfo.token.claim
8c98d366-afaa-44e8-8983-1a407ef9cc94	phoneNumber	user.attribute
8c98d366-afaa-44e8-8983-1a407ef9cc94	true	id.token.claim
8c98d366-afaa-44e8-8983-1a407ef9cc94	true	access.token.claim
8c98d366-afaa-44e8-8983-1a407ef9cc94	phone_number	claim.name
8c98d366-afaa-44e8-8983-1a407ef9cc94	String	jsonType.label
94e590d3-6031-455e-ac7e-b119c732523a	true	userinfo.token.claim
94e590d3-6031-455e-ac7e-b119c732523a	phoneNumberVerified	user.attribute
94e590d3-6031-455e-ac7e-b119c732523a	true	id.token.claim
94e590d3-6031-455e-ac7e-b119c732523a	true	access.token.claim
94e590d3-6031-455e-ac7e-b119c732523a	phone_number_verified	claim.name
94e590d3-6031-455e-ac7e-b119c732523a	boolean	jsonType.label
9c076ef8-df47-4e1b-9b4b-5969f1eec401	true	multivalued
9c076ef8-df47-4e1b-9b4b-5969f1eec401	foo	user.attribute
9c076ef8-df47-4e1b-9b4b-5969f1eec401	true	access.token.claim
9c076ef8-df47-4e1b-9b4b-5969f1eec401	realm_access.roles	claim.name
9c076ef8-df47-4e1b-9b4b-5969f1eec401	String	jsonType.label
b3cb5fef-085b-49cb-b462-4243496ae249	true	multivalued
b3cb5fef-085b-49cb-b462-4243496ae249	foo	user.attribute
b3cb5fef-085b-49cb-b462-4243496ae249	true	access.token.claim
b3cb5fef-085b-49cb-b462-4243496ae249	resource_access.${client_id}.roles	claim.name
b3cb5fef-085b-49cb-b462-4243496ae249	String	jsonType.label
9151e617-ff7d-43b1-bf40-dd634e979268	true	userinfo.token.claim
9151e617-ff7d-43b1-bf40-dd634e979268	username	user.attribute
9151e617-ff7d-43b1-bf40-dd634e979268	true	id.token.claim
9151e617-ff7d-43b1-bf40-dd634e979268	true	access.token.claim
9151e617-ff7d-43b1-bf40-dd634e979268	upn	claim.name
9151e617-ff7d-43b1-bf40-dd634e979268	String	jsonType.label
64f8dcf6-daa2-4504-869d-b9f5f9bc920b	true	multivalued
64f8dcf6-daa2-4504-869d-b9f5f9bc920b	foo	user.attribute
64f8dcf6-daa2-4504-869d-b9f5f9bc920b	true	id.token.claim
64f8dcf6-daa2-4504-869d-b9f5f9bc920b	true	access.token.claim
64f8dcf6-daa2-4504-869d-b9f5f9bc920b	groups	claim.name
64f8dcf6-daa2-4504-869d-b9f5f9bc920b	String	jsonType.label
a86e23e7-122c-4cc1-ba84-7234d960d69c	true	id.token.claim
a86e23e7-122c-4cc1-ba84-7234d960d69c	true	access.token.claim
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
f7fa1af8-0135-4dab-a875-ad354a83a603	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	57c1a74e-6513-4f6e-8f21-48da831a4544	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	a6a50dfb-33f5-46ad-8ab6-da86ed4414ae	1654fb73-250a-4b9a-9497-7ef570c7758b	e06cea99-b01a-4f7b-b002-2bd368cb3ad0	9d76aa71-91c1-48c7-b671-5aa59108d2d5	a8f7cfd9-739d-4801-b977-bdcd85796eb7	2592000	f	900	t	f	e41420fc-353a-4fa9-8e97-2bbbc9059144	0	f	0	0	268fca4c-7de0-4c8c-835d-2af03b3fc9d9
91cb1cd2-e133-4f67-9800-593c809120c8	60	300	300	\N	\N	\N	t	f	0	\N	ghoverblog	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	cb809b06-ff99-4320-bf9f-87e0791b1520	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	786001e8-171b-4eeb-bf95-b8ce0d76d9e0	90c6c90f-add0-495f-aa8b-0d2f26bba0c2	430f1ef7-9222-4072-87b0-1c337f4099b7	7d5fd13a-c31d-4651-963b-e898d32f6c8f	bc4764bb-0aa1-4737-bc60-f2ef8565be07	2592000	f	900	t	f	a5c13395-074a-40a7-8c21-1893ad105755	0	f	0	0	c8281036-19c6-4d54-92e1-b3efbf04d387
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	f7fa1af8-0135-4dab-a875-ad354a83a603	
_browser_header.xContentTypeOptions	f7fa1af8-0135-4dab-a875-ad354a83a603	nosniff
_browser_header.xRobotsTag	f7fa1af8-0135-4dab-a875-ad354a83a603	none
_browser_header.xFrameOptions	f7fa1af8-0135-4dab-a875-ad354a83a603	SAMEORIGIN
_browser_header.contentSecurityPolicy	f7fa1af8-0135-4dab-a875-ad354a83a603	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	f7fa1af8-0135-4dab-a875-ad354a83a603	1; mode=block
_browser_header.strictTransportSecurity	f7fa1af8-0135-4dab-a875-ad354a83a603	max-age=31536000; includeSubDomains
bruteForceProtected	f7fa1af8-0135-4dab-a875-ad354a83a603	false
permanentLockout	f7fa1af8-0135-4dab-a875-ad354a83a603	false
maxFailureWaitSeconds	f7fa1af8-0135-4dab-a875-ad354a83a603	900
minimumQuickLoginWaitSeconds	f7fa1af8-0135-4dab-a875-ad354a83a603	60
waitIncrementSeconds	f7fa1af8-0135-4dab-a875-ad354a83a603	60
quickLoginCheckMilliSeconds	f7fa1af8-0135-4dab-a875-ad354a83a603	1000
maxDeltaTimeSeconds	f7fa1af8-0135-4dab-a875-ad354a83a603	43200
failureFactor	f7fa1af8-0135-4dab-a875-ad354a83a603	30
displayName	f7fa1af8-0135-4dab-a875-ad354a83a603	Keycloak
displayNameHtml	f7fa1af8-0135-4dab-a875-ad354a83a603	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	f7fa1af8-0135-4dab-a875-ad354a83a603	RS256
offlineSessionMaxLifespanEnabled	f7fa1af8-0135-4dab-a875-ad354a83a603	false
offlineSessionMaxLifespan	f7fa1af8-0135-4dab-a875-ad354a83a603	5184000
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
f7fa1af8-0135-4dab-a875-ad354a83a603	jboss-logging
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
password	password	t	t	f7fa1af8-0135-4dab-a875-ad354a83a603
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
98ab4eba-add2-4e45-a92b-831786b305ec	/realms/master/account/*
4b7d60e2-c119-4859-9cc7-768ce8da0668	/realms/master/account/*
b2270e37-d812-46a2-a1b3-9d53b13acc3c	/admin/master/console/*
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
a601b75e-7f65-471f-862b-0b05c82280fc	VERIFY_EMAIL	Verify Email	f7fa1af8-0135-4dab-a875-ad354a83a603	t	f	VERIFY_EMAIL	50
d2ac9a3b-e6f1-42ce-a2de-40b5c789b187	UPDATE_PROFILE	Update Profile	f7fa1af8-0135-4dab-a875-ad354a83a603	t	f	UPDATE_PROFILE	40
23cf957c-9b1e-4233-9804-cb7c769aa5d0	CONFIGURE_TOTP	Configure OTP	f7fa1af8-0135-4dab-a875-ad354a83a603	t	f	CONFIGURE_TOTP	10
581fc0b3-372e-42d8-8e85-748068ee29eb	UPDATE_PASSWORD	Update Password	f7fa1af8-0135-4dab-a875-ad354a83a603	t	f	UPDATE_PASSWORD	30
59b9f7d7-37f7-4069-9de6-2ad9c6dfae15	terms_and_conditions	Terms and Conditions	f7fa1af8-0135-4dab-a875-ad354a83a603	f	f	terms_and_conditions	20
0c0d0d23-503a-40fa-8e83-a3e46765037c	update_user_locale	Update User Locale	f7fa1af8-0135-4dab-a875-ad354a83a603	t	f	update_user_locale	1000
65bfbaaf-ec27-4525-9f6e-8e56623d4f92	delete_account	Delete Account	f7fa1af8-0135-4dab-a875-ad354a83a603	f	f	delete_account	60
a06821e8-fc79-4c94-84b4-f639b9b77f91	webauthn-register	Webauthn Register	f7fa1af8-0135-4dab-a875-ad354a83a603	t	f	webauthn-register	70
8397a69b-ed81-47c5-a4b3-41187bbb505c	webauthn-register-passwordless	Webauthn Register Passwordless	f7fa1af8-0135-4dab-a875-ad354a83a603	t	f	webauthn-register-passwordless	80
a6b48d82-ced4-4fe0-af23-9367822f330e	CONFIGURE_TOTP	Configure OTP	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	CONFIGURE_TOTP	10
3768d29d-cd34-4ecc-b29c-d8d6f064d02a	terms_and_conditions	Terms and Conditions	91cb1cd2-e133-4f67-9800-593c809120c8	f	f	terms_and_conditions	20
59e89c94-91de-4613-b8ab-fd6c268e3935	UPDATE_PASSWORD	Update Password	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	UPDATE_PASSWORD	30
05bc6579-9ab9-43b8-91ae-dd84934bb0d1	UPDATE_PROFILE	Update Profile	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	UPDATE_PROFILE	40
80c860ed-cc09-4346-81a6-912b6a572938	VERIFY_EMAIL	Verify Email	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	VERIFY_EMAIL	50
25c465cc-80de-441c-876e-1a8dfd156197	delete_account	Delete Account	91cb1cd2-e133-4f67-9800-593c809120c8	f	f	delete_account	60
94fcbbc1-d422-4fed-8a17-d2eaf11ee8a6	webauthn-register	Webauthn Register	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	webauthn-register	70
b0b4edbd-35a6-45c4-9c3e-0b1ccdd64ea9	webauthn-register-passwordless	Webauthn Register Passwordless	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	webauthn-register-passwordless	80
84a87129-f6ee-4ecc-a1d9-9948655157ff	update_user_locale	Update User Locale	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	update_user_locale	1000
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
4b7d60e2-c119-4859-9cc7-768ce8da0668	8b7e6f42-6473-4ad8-9db6-e132a5b3cec6
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
af1d8119-bd29-473c-892a-56391c5f1af5	\N	36204ca1-a1c5-46f3-ad11-dca00d0ae7fa	f	t	\N	\N	\N	f7fa1af8-0135-4dab-a875-ad354a83a603	maxime	1683976201493	\N	0
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
268fca4c-7de0-4c8c-835d-2af03b3fc9d9	af1d8119-bd29-473c-892a-56391c5f1af5
fb6eb550-73ee-4601-9295-6a3e6576f591	af1d8119-bd29-473c-892a-56391c5f1af5
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
b2270e37-d812-46a2-a1b3-9d53b13acc3c	+
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

