--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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

--
-- Name: kc_sh; Type: SCHEMA; Schema: -; Owner: max_admin
--

CREATE SCHEMA kc_sh;


ALTER SCHEMA kc_sh OWNER TO max_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.admin_event_entity (
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


ALTER TABLE kc_sh.admin_event_entity OWNER TO max_admin;

--
-- Name: associated_policy; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.associated_policy OWNER TO max_admin;

--
-- Name: authentication_execution; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.authentication_execution (
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


ALTER TABLE kc_sh.authentication_execution OWNER TO max_admin;

--
-- Name: authentication_flow; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE kc_sh.authentication_flow OWNER TO max_admin;

--
-- Name: authenticator_config; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE kc_sh.authenticator_config OWNER TO max_admin;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.authenticator_config_entry OWNER TO max_admin;

--
-- Name: broker_link; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE kc_sh.broker_link OWNER TO max_admin;

--
-- Name: client; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client (
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


ALTER TABLE kc_sh.client OWNER TO max_admin;

--
-- Name: client_attributes; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.client_attributes OWNER TO max_admin;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.client_auth_flow_bindings OWNER TO max_admin;

--
-- Name: client_initial_access; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE kc_sh.client_initial_access OWNER TO max_admin;

--
-- Name: client_node_registrations; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.client_node_registrations OWNER TO max_admin;

--
-- Name: client_scope; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE kc_sh.client_scope OWNER TO max_admin;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.client_scope_attributes OWNER TO max_admin;

--
-- Name: client_scope_client; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE kc_sh.client_scope_client OWNER TO max_admin;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.client_scope_role_mapping OWNER TO max_admin;

--
-- Name: client_session; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_session (
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


ALTER TABLE kc_sh.client_session OWNER TO max_admin;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE kc_sh.client_session_auth_status OWNER TO max_admin;

--
-- Name: client_session_note; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE kc_sh.client_session_note OWNER TO max_admin;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE kc_sh.client_session_prot_mapper OWNER TO max_admin;

--
-- Name: client_session_role; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE kc_sh.client_session_role OWNER TO max_admin;

--
-- Name: client_user_session_note; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE kc_sh.client_user_session_note OWNER TO max_admin;

--
-- Name: component; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE kc_sh.component OWNER TO max_admin;

--
-- Name: component_config; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE kc_sh.component_config OWNER TO max_admin;

--
-- Name: composite_role; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE kc_sh.composite_role OWNER TO max_admin;

--
-- Name: credential; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.credential (
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


ALTER TABLE kc_sh.credential OWNER TO max_admin;

--
-- Name: databasechangelog; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.databasechangelog (
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


ALTER TABLE kc_sh.databasechangelog OWNER TO max_admin;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE kc_sh.databasechangeloglock OWNER TO max_admin;

--
-- Name: default_client_scope; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE kc_sh.default_client_scope OWNER TO max_admin;

--
-- Name: event_entity; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.event_entity (
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


ALTER TABLE kc_sh.event_entity OWNER TO max_admin;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE kc_sh.fed_user_attribute OWNER TO max_admin;

--
-- Name: fed_user_consent; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.fed_user_consent (
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


ALTER TABLE kc_sh.fed_user_consent OWNER TO max_admin;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.fed_user_consent_cl_scope OWNER TO max_admin;

--
-- Name: fed_user_credential; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.fed_user_credential (
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


ALTER TABLE kc_sh.fed_user_credential OWNER TO max_admin;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE kc_sh.fed_user_group_membership OWNER TO max_admin;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE kc_sh.fed_user_required_action OWNER TO max_admin;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE kc_sh.fed_user_role_mapping OWNER TO max_admin;

--
-- Name: federated_identity; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.federated_identity OWNER TO max_admin;

--
-- Name: federated_user; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.federated_user OWNER TO max_admin;

--
-- Name: group_attribute; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.group_attribute OWNER TO max_admin;

--
-- Name: group_role_mapping; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.group_role_mapping OWNER TO max_admin;

--
-- Name: identity_provider; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.identity_provider (
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


ALTER TABLE kc_sh.identity_provider OWNER TO max_admin;

--
-- Name: identity_provider_config; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.identity_provider_config OWNER TO max_admin;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.identity_provider_mapper OWNER TO max_admin;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.idp_mapper_config OWNER TO max_admin;

--
-- Name: keycloak_group; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE kc_sh.keycloak_group OWNER TO max_admin;

--
-- Name: keycloak_role; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE kc_sh.keycloak_role OWNER TO max_admin;

--
-- Name: migration_model; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE kc_sh.migration_model OWNER TO max_admin;

--
-- Name: offline_client_session; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE kc_sh.offline_client_session OWNER TO max_admin;

--
-- Name: offline_user_session; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE kc_sh.offline_user_session OWNER TO max_admin;

--
-- Name: policy_config; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE kc_sh.policy_config OWNER TO max_admin;

--
-- Name: protocol_mapper; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE kc_sh.protocol_mapper OWNER TO max_admin;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.protocol_mapper_config OWNER TO max_admin;

--
-- Name: realm; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.realm (
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


ALTER TABLE kc_sh.realm OWNER TO max_admin;

--
-- Name: realm_attribute; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE kc_sh.realm_attribute OWNER TO max_admin;

--
-- Name: realm_default_groups; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.realm_default_groups OWNER TO max_admin;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE kc_sh.realm_enabled_event_types OWNER TO max_admin;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE kc_sh.realm_events_listeners OWNER TO max_admin;

--
-- Name: realm_localizations; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE kc_sh.realm_localizations OWNER TO max_admin;

--
-- Name: realm_required_credential; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.realm_required_credential OWNER TO max_admin;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.realm_smtp_config OWNER TO max_admin;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE kc_sh.realm_supported_locales OWNER TO max_admin;

--
-- Name: redirect_uris; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE kc_sh.redirect_uris OWNER TO max_admin;

--
-- Name: required_action_config; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.required_action_config OWNER TO max_admin;

--
-- Name: required_action_provider; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE kc_sh.required_action_provider OWNER TO max_admin;

--
-- Name: resource_attribute; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.resource_attribute OWNER TO max_admin;

--
-- Name: resource_policy; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.resource_policy OWNER TO max_admin;

--
-- Name: resource_scope; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.resource_scope OWNER TO max_admin;

--
-- Name: resource_server; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE kc_sh.resource_server OWNER TO max_admin;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.resource_server_perm_ticket (
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


ALTER TABLE kc_sh.resource_server_perm_ticket OWNER TO max_admin;

--
-- Name: resource_server_policy; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE kc_sh.resource_server_policy OWNER TO max_admin;

--
-- Name: resource_server_resource; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE kc_sh.resource_server_resource OWNER TO max_admin;

--
-- Name: resource_server_scope; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE kc_sh.resource_server_scope OWNER TO max_admin;

--
-- Name: resource_uris; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE kc_sh.resource_uris OWNER TO max_admin;

--
-- Name: role_attribute; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE kc_sh.role_attribute OWNER TO max_admin;

--
-- Name: scope_mapping; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.scope_mapping OWNER TO max_admin;

--
-- Name: scope_policy; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.scope_policy OWNER TO max_admin;

--
-- Name: user_attribute; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE kc_sh.user_attribute OWNER TO max_admin;

--
-- Name: user_consent; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE kc_sh.user_consent OWNER TO max_admin;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.user_consent_client_scope OWNER TO max_admin;

--
-- Name: user_entity; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_entity (
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


ALTER TABLE kc_sh.user_entity OWNER TO max_admin;

--
-- Name: user_federation_config; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.user_federation_config OWNER TO max_admin;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.user_federation_mapper OWNER TO max_admin;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE kc_sh.user_federation_mapper_config OWNER TO max_admin;

--
-- Name: user_federation_provider; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE kc_sh.user_federation_provider OWNER TO max_admin;

--
-- Name: user_group_membership; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.user_group_membership OWNER TO max_admin;

--
-- Name: user_required_action; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE kc_sh.user_required_action OWNER TO max_admin;

--
-- Name: user_role_mapping; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE kc_sh.user_role_mapping OWNER TO max_admin;

--
-- Name: user_session; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_session (
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


ALTER TABLE kc_sh.user_session OWNER TO max_admin;

--
-- Name: user_session_note; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE kc_sh.user_session_note OWNER TO max_admin;

--
-- Name: username_login_failure; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE kc_sh.username_login_failure OWNER TO max_admin;

--
-- Name: web_origins; Type: TABLE; Schema: kc_sh; Owner: max_admin
--

CREATE TABLE kc_sh.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE kc_sh.web_origins OWNER TO max_admin;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
c3960cdc-78a5-48e7-9e09-c0fcd1835d56	\N	auth-cookie	8c7aaac8-4834-4bc1-b139-b904b076efc0	34573abd-eadf-423a-8fc0-5f127befbff9	2	10	f	\N	\N
9c567e35-19e9-4fa1-b013-7d0dd45a14bc	\N	auth-spnego	8c7aaac8-4834-4bc1-b139-b904b076efc0	34573abd-eadf-423a-8fc0-5f127befbff9	3	20	f	\N	\N
c308aa99-dfac-40d2-9d43-620111912589	\N	identity-provider-redirector	8c7aaac8-4834-4bc1-b139-b904b076efc0	34573abd-eadf-423a-8fc0-5f127befbff9	2	25	f	\N	\N
d20814ac-ce0b-4044-a6f2-21d7d224f660	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	34573abd-eadf-423a-8fc0-5f127befbff9	2	30	t	7e2312bd-6cef-40f2-9e03-2d7f375ccdb8	\N
2f144781-2125-4c25-a3da-06a2f605c4e9	\N	auth-username-password-form	8c7aaac8-4834-4bc1-b139-b904b076efc0	7e2312bd-6cef-40f2-9e03-2d7f375ccdb8	0	10	f	\N	\N
0df42276-516f-48f4-be21-65d39f23d80b	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	7e2312bd-6cef-40f2-9e03-2d7f375ccdb8	1	20	t	47cb2fe4-c3f5-4987-80cd-01960b3a56a7	\N
353ed83a-9246-4319-8187-61796df3b2fc	\N	conditional-user-configured	8c7aaac8-4834-4bc1-b139-b904b076efc0	47cb2fe4-c3f5-4987-80cd-01960b3a56a7	0	10	f	\N	\N
d2522a31-9a40-4c3b-a358-7ab879433461	\N	auth-otp-form	8c7aaac8-4834-4bc1-b139-b904b076efc0	47cb2fe4-c3f5-4987-80cd-01960b3a56a7	0	20	f	\N	\N
4a0631bd-9762-4697-92bd-4452fbb11795	\N	direct-grant-validate-username	8c7aaac8-4834-4bc1-b139-b904b076efc0	3a01df8d-8cf7-4ee1-bd8f-f82fe15405b9	0	10	f	\N	\N
633b8e8c-47c2-486f-a262-fc13de05112b	\N	direct-grant-validate-password	8c7aaac8-4834-4bc1-b139-b904b076efc0	3a01df8d-8cf7-4ee1-bd8f-f82fe15405b9	0	20	f	\N	\N
bf3d1fe9-9635-46ae-a7b6-7b953f7e74ba	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	3a01df8d-8cf7-4ee1-bd8f-f82fe15405b9	1	30	t	62b2828e-b81d-423a-8383-a317e4fc8cfe	\N
f7476133-5621-4db1-8f37-b2820c5c461d	\N	conditional-user-configured	8c7aaac8-4834-4bc1-b139-b904b076efc0	62b2828e-b81d-423a-8383-a317e4fc8cfe	0	10	f	\N	\N
de08d156-f972-4f62-866f-1f5c81ad5abe	\N	direct-grant-validate-otp	8c7aaac8-4834-4bc1-b139-b904b076efc0	62b2828e-b81d-423a-8383-a317e4fc8cfe	0	20	f	\N	\N
9735047b-53ad-4e74-96c7-b4c0c6e5973f	\N	registration-page-form	8c7aaac8-4834-4bc1-b139-b904b076efc0	78961e85-753e-4adf-bd8d-9d2287157467	0	10	t	c6139b1d-d179-40b9-ace6-e384d751adf6	\N
eaa198d4-d60f-4cbc-8b11-70c2d85231be	\N	registration-user-creation	8c7aaac8-4834-4bc1-b139-b904b076efc0	c6139b1d-d179-40b9-ace6-e384d751adf6	0	20	f	\N	\N
b403cbc1-4df3-48c2-b8b9-43b375963add	\N	registration-profile-action	8c7aaac8-4834-4bc1-b139-b904b076efc0	c6139b1d-d179-40b9-ace6-e384d751adf6	0	40	f	\N	\N
681f3f9c-1cb1-409e-9019-2d72f9613c3c	\N	registration-password-action	8c7aaac8-4834-4bc1-b139-b904b076efc0	c6139b1d-d179-40b9-ace6-e384d751adf6	0	50	f	\N	\N
b91093e5-5f66-4b46-9a3f-f8f965797d08	\N	registration-recaptcha-action	8c7aaac8-4834-4bc1-b139-b904b076efc0	c6139b1d-d179-40b9-ace6-e384d751adf6	3	60	f	\N	\N
08b84e28-e85d-4ccf-b944-84e7df0871d3	\N	reset-credentials-choose-user	8c7aaac8-4834-4bc1-b139-b904b076efc0	ec7f78d2-ef09-4d2a-85af-e9c0c01a6f1a	0	10	f	\N	\N
67a72605-4419-40cc-9435-85523c64ef62	\N	reset-credential-email	8c7aaac8-4834-4bc1-b139-b904b076efc0	ec7f78d2-ef09-4d2a-85af-e9c0c01a6f1a	0	20	f	\N	\N
8229ec7e-1ac0-4b51-9741-37e0d465df98	\N	reset-password	8c7aaac8-4834-4bc1-b139-b904b076efc0	ec7f78d2-ef09-4d2a-85af-e9c0c01a6f1a	0	30	f	\N	\N
74e45003-c690-4748-8654-4f5c444e7312	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	ec7f78d2-ef09-4d2a-85af-e9c0c01a6f1a	1	40	t	921b6f28-8e91-4284-bd86-9a72019b3903	\N
ab950dda-770e-4cc1-960c-741d6a69e054	\N	conditional-user-configured	8c7aaac8-4834-4bc1-b139-b904b076efc0	921b6f28-8e91-4284-bd86-9a72019b3903	0	10	f	\N	\N
86efec0f-3239-4f02-bfee-7c7fb35a2e37	\N	reset-otp	8c7aaac8-4834-4bc1-b139-b904b076efc0	921b6f28-8e91-4284-bd86-9a72019b3903	0	20	f	\N	\N
06f32ed6-ff24-405f-9635-1e18beaf3597	\N	client-secret	8c7aaac8-4834-4bc1-b139-b904b076efc0	4cda879b-ac12-48df-bbbe-cb22c6376c3f	2	10	f	\N	\N
f2a45694-cb95-4276-9bcd-17d12a30661f	\N	client-jwt	8c7aaac8-4834-4bc1-b139-b904b076efc0	4cda879b-ac12-48df-bbbe-cb22c6376c3f	2	20	f	\N	\N
0812bcaf-fb9e-4b8c-a9a1-1a33f24d8063	\N	client-secret-jwt	8c7aaac8-4834-4bc1-b139-b904b076efc0	4cda879b-ac12-48df-bbbe-cb22c6376c3f	2	30	f	\N	\N
b8ae9e7e-b8e5-449f-b6b3-e3521fcc0277	\N	client-x509	8c7aaac8-4834-4bc1-b139-b904b076efc0	4cda879b-ac12-48df-bbbe-cb22c6376c3f	2	40	f	\N	\N
401d6516-737f-4f85-9402-2e4f466ebe9b	\N	idp-review-profile	8c7aaac8-4834-4bc1-b139-b904b076efc0	6fbd77a8-3364-498a-8c88-40717787c7ff	0	10	f	\N	d3142f8e-6000-492b-8ce6-c9940a140c94
2a832262-105b-45d3-ab97-fefb4aec9cb4	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	6fbd77a8-3364-498a-8c88-40717787c7ff	0	20	t	6770ea38-49ca-4ace-8260-ed0b3a67f856	\N
902d02f7-1fe7-42ea-8d05-e508662ce41b	\N	idp-create-user-if-unique	8c7aaac8-4834-4bc1-b139-b904b076efc0	6770ea38-49ca-4ace-8260-ed0b3a67f856	2	10	f	\N	109984b1-6904-441d-ae04-a3fb477e528a
03ca9c43-1b42-4010-978f-b58758a2703b	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	6770ea38-49ca-4ace-8260-ed0b3a67f856	2	20	t	1bd61689-9cbf-46ca-aeca-0ad709f63b0b	\N
c0a06a92-bc3e-4f02-80d2-141301447e7f	\N	idp-confirm-link	8c7aaac8-4834-4bc1-b139-b904b076efc0	1bd61689-9cbf-46ca-aeca-0ad709f63b0b	0	10	f	\N	\N
d92e4fd7-4b90-404c-aec3-73fb368cc0f8	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	1bd61689-9cbf-46ca-aeca-0ad709f63b0b	0	20	t	ce999185-d2ae-42e6-a088-ee73a876451d	\N
b57a6aca-47f2-4e1b-971b-dbcefa7f5cb5	\N	idp-email-verification	8c7aaac8-4834-4bc1-b139-b904b076efc0	ce999185-d2ae-42e6-a088-ee73a876451d	2	10	f	\N	\N
0ebf69b8-ac5d-4665-b898-cd586bb7aed1	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	ce999185-d2ae-42e6-a088-ee73a876451d	2	20	t	983beafe-10ac-460d-939b-ff8ee134a5dc	\N
47d83578-dfe3-4307-9090-d8b64f8e7bcf	\N	idp-username-password-form	8c7aaac8-4834-4bc1-b139-b904b076efc0	983beafe-10ac-460d-939b-ff8ee134a5dc	0	10	f	\N	\N
95af0e4f-f3ea-463a-b82f-d1f00398f347	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	983beafe-10ac-460d-939b-ff8ee134a5dc	1	20	t	432155d8-fb40-47dd-bb38-bf11816abe91	\N
c50eb239-7592-4c6c-a8e4-07cc33e4f40e	\N	conditional-user-configured	8c7aaac8-4834-4bc1-b139-b904b076efc0	432155d8-fb40-47dd-bb38-bf11816abe91	0	10	f	\N	\N
e3a78a78-426d-4f7e-af15-11e5b6c899a7	\N	auth-otp-form	8c7aaac8-4834-4bc1-b139-b904b076efc0	432155d8-fb40-47dd-bb38-bf11816abe91	0	20	f	\N	\N
4d636fe7-d673-46b9-82bb-00492fe06126	\N	http-basic-authenticator	8c7aaac8-4834-4bc1-b139-b904b076efc0	ac51139e-7272-43a6-885e-d8fa23659c32	0	10	f	\N	\N
fae539c0-0b2f-43fd-bc04-dd4c1344b833	\N	docker-http-basic-authenticator	8c7aaac8-4834-4bc1-b139-b904b076efc0	1d8a8069-184c-4dab-8706-b7cfdc6b0dce	0	10	f	\N	\N
30db9d6f-d596-4d53-8946-b4907dcc13bc	\N	no-cookie-redirect	8c7aaac8-4834-4bc1-b139-b904b076efc0	80a34b8c-4cf1-48e0-960f-83823c5997e9	0	10	f	\N	\N
41840c30-696d-4f3b-86b2-018b8bfabe6c	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	80a34b8c-4cf1-48e0-960f-83823c5997e9	0	20	t	c980d4b0-82ba-4e01-9782-82ff3bfe17ed	\N
b7ff3447-13eb-4883-bbb6-72e49a437fce	\N	basic-auth	8c7aaac8-4834-4bc1-b139-b904b076efc0	c980d4b0-82ba-4e01-9782-82ff3bfe17ed	0	10	f	\N	\N
3f53b0ab-52d7-4c76-b5a8-e32198b5c763	\N	basic-auth-otp	8c7aaac8-4834-4bc1-b139-b904b076efc0	c980d4b0-82ba-4e01-9782-82ff3bfe17ed	3	20	f	\N	\N
49e9b1fe-7391-419e-8e2e-c2bd5dc168ec	\N	auth-spnego	8c7aaac8-4834-4bc1-b139-b904b076efc0	c980d4b0-82ba-4e01-9782-82ff3bfe17ed	3	30	f	\N	\N
bed7d72c-10bd-40ca-98a5-7c93b3b546ba	\N	idp-email-verification	91cb1cd2-e133-4f67-9800-593c809120c8	1fc4ddf9-a0da-4845-bd06-b894b620d397	2	10	f	\N	\N
8e1bcef0-480e-4765-b986-15577ee92440	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	1fc4ddf9-a0da-4845-bd06-b894b620d397	2	20	t	6a7d693b-4378-4279-83b5-d4dc34cc07b4	\N
55d3baf6-2c51-4382-b6c1-c275cdbf70f1	\N	basic-auth	91cb1cd2-e133-4f67-9800-593c809120c8	41c46922-e64f-4d6a-b2cc-aa3b515c8133	0	10	f	\N	\N
62c43558-8d50-4dd8-83c2-ae611822cbaf	\N	basic-auth-otp	91cb1cd2-e133-4f67-9800-593c809120c8	41c46922-e64f-4d6a-b2cc-aa3b515c8133	3	20	f	\N	\N
2babbf19-e677-4ec4-849b-e367c724f3ec	\N	auth-spnego	91cb1cd2-e133-4f67-9800-593c809120c8	41c46922-e64f-4d6a-b2cc-aa3b515c8133	3	30	f	\N	\N
5c03cc34-7e0e-472f-9494-ee1b846d41ec	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	1cdb2bfa-645d-4b9c-8e82-8a0748424264	0	10	f	\N	\N
84859132-67f9-4a14-877f-53742a116a18	\N	auth-otp-form	91cb1cd2-e133-4f67-9800-593c809120c8	1cdb2bfa-645d-4b9c-8e82-8a0748424264	0	20	f	\N	\N
15632679-d17e-49c4-91a3-c0c5f42e28fd	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	e90bc83d-70cd-433a-b039-a423e910df15	0	10	f	\N	\N
a0e7827a-6e06-4c83-ba58-0794af82f887	\N	direct-grant-validate-otp	91cb1cd2-e133-4f67-9800-593c809120c8	e90bc83d-70cd-433a-b039-a423e910df15	0	20	f	\N	\N
f714769a-240c-4c44-8bfa-e73a8cc2e260	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	3945574b-5c33-4d33-9cce-4c12a7e6c24c	0	10	f	\N	\N
e90666a1-7237-46af-853a-d016df5affbc	\N	auth-otp-form	91cb1cd2-e133-4f67-9800-593c809120c8	3945574b-5c33-4d33-9cce-4c12a7e6c24c	0	20	f	\N	\N
4c57bab4-662a-420f-a331-81320807e49e	\N	idp-confirm-link	91cb1cd2-e133-4f67-9800-593c809120c8	bf40da7f-adcf-435e-882b-309ce7c72dfa	0	10	f	\N	\N
acc73734-4588-48a5-8389-e3a2c4b77263	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	bf40da7f-adcf-435e-882b-309ce7c72dfa	0	20	t	1fc4ddf9-a0da-4845-bd06-b894b620d397	\N
f4d500d7-4fff-4faa-bdc5-76800fbde7fc	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	db5526e7-88aa-4faf-b358-450bbd4e1fa0	0	10	f	\N	\N
2e08e4c6-d30a-44d3-8058-5aed62a1d933	\N	reset-otp	91cb1cd2-e133-4f67-9800-593c809120c8	db5526e7-88aa-4faf-b358-450bbd4e1fa0	0	20	f	\N	\N
8c201082-5ab4-40c8-a9ba-729cb7c83902	\N	idp-create-user-if-unique	91cb1cd2-e133-4f67-9800-593c809120c8	8fc2cec3-e309-43cd-89f6-2f1f81a1132e	2	10	f	\N	58874d7f-eebc-427a-95e4-1be8461414e5
3ff9c2e5-4a17-41a1-baef-f85438091c38	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	8fc2cec3-e309-43cd-89f6-2f1f81a1132e	2	20	t	bf40da7f-adcf-435e-882b-309ce7c72dfa	\N
c4cd3ea9-8494-4217-8a47-d00d9570eeaf	\N	idp-username-password-form	91cb1cd2-e133-4f67-9800-593c809120c8	6a7d693b-4378-4279-83b5-d4dc34cc07b4	0	10	f	\N	\N
1c9112cf-bd59-47f2-921e-52fb96bad9fc	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	6a7d693b-4378-4279-83b5-d4dc34cc07b4	1	20	t	3945574b-5c33-4d33-9cce-4c12a7e6c24c	\N
dfe44d0a-bd5a-4f63-9c0f-9f245e2f3a14	\N	auth-cookie	91cb1cd2-e133-4f67-9800-593c809120c8	e62459b7-7fed-46ef-b152-3290716681b1	2	10	f	\N	\N
3ad8e34a-e901-4041-a378-6dfca7f42393	\N	auth-spnego	91cb1cd2-e133-4f67-9800-593c809120c8	e62459b7-7fed-46ef-b152-3290716681b1	3	20	f	\N	\N
2c6aa98c-a4f8-45af-a827-7646db172cab	\N	identity-provider-redirector	91cb1cd2-e133-4f67-9800-593c809120c8	e62459b7-7fed-46ef-b152-3290716681b1	2	25	f	\N	\N
62825a35-27e5-40da-867a-1bc3a7f7cabe	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	e62459b7-7fed-46ef-b152-3290716681b1	2	30	t	0e63afa7-104b-49af-8467-dad2c2eaea75	\N
756b9b44-5e9b-465e-9019-758fe966d430	\N	client-secret	91cb1cd2-e133-4f67-9800-593c809120c8	2519192b-9e5e-4557-a798-c843d62f5591	2	10	f	\N	\N
90012cb7-941f-4425-90de-8ff92ad02101	\N	client-jwt	91cb1cd2-e133-4f67-9800-593c809120c8	2519192b-9e5e-4557-a798-c843d62f5591	2	20	f	\N	\N
9036e2ee-56de-4e30-a9fe-8c97e0a25c51	\N	client-secret-jwt	91cb1cd2-e133-4f67-9800-593c809120c8	2519192b-9e5e-4557-a798-c843d62f5591	2	30	f	\N	\N
832d6bf4-5327-4e9a-9a99-55ed23867d3a	\N	client-x509	91cb1cd2-e133-4f67-9800-593c809120c8	2519192b-9e5e-4557-a798-c843d62f5591	2	40	f	\N	\N
ec64037f-bbfc-4bd0-9337-329f41a340de	\N	direct-grant-validate-username	91cb1cd2-e133-4f67-9800-593c809120c8	8aaa788b-b8c4-48c1-afa9-6f205d1a7f58	0	10	f	\N	\N
e70ee9c7-4acb-402e-9239-1b4479b2577b	\N	direct-grant-validate-password	91cb1cd2-e133-4f67-9800-593c809120c8	8aaa788b-b8c4-48c1-afa9-6f205d1a7f58	0	20	f	\N	\N
afc4c2a9-6211-4fbf-855e-d9b41f0d1583	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	8aaa788b-b8c4-48c1-afa9-6f205d1a7f58	1	30	t	e90bc83d-70cd-433a-b039-a423e910df15	\N
b7ffaf4a-e792-4246-9096-3e43f110f22b	\N	docker-http-basic-authenticator	91cb1cd2-e133-4f67-9800-593c809120c8	4e3245cb-5649-479e-be4b-823051d465bf	0	10	f	\N	\N
98057124-6cdb-4917-b225-127bb55bc7ef	\N	idp-review-profile	91cb1cd2-e133-4f67-9800-593c809120c8	a87217ca-2672-4d1b-8c18-1932c91dc1da	0	10	f	\N	14c75fca-1049-4355-8f24-daea1356076f
36049e4e-fe51-4cec-a0d3-1d662a301beb	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	a87217ca-2672-4d1b-8c18-1932c91dc1da	0	20	t	8fc2cec3-e309-43cd-89f6-2f1f81a1132e	\N
22d26c13-0bd8-410f-9ca5-a4a2a2e53690	\N	auth-username-password-form	91cb1cd2-e133-4f67-9800-593c809120c8	0e63afa7-104b-49af-8467-dad2c2eaea75	0	10	f	\N	\N
e38b90bb-7469-4c63-8be2-6dfac3321753	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	0e63afa7-104b-49af-8467-dad2c2eaea75	1	20	t	1cdb2bfa-645d-4b9c-8e82-8a0748424264	\N
054f6e0f-3899-4be6-9603-4ea20db66977	\N	no-cookie-redirect	91cb1cd2-e133-4f67-9800-593c809120c8	93eeb0a3-31df-4985-a4a1-5cc8d2672201	0	10	f	\N	\N
3463de73-daa5-4555-93d3-92e982c957bb	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	93eeb0a3-31df-4985-a4a1-5cc8d2672201	0	20	t	41c46922-e64f-4d6a-b2cc-aa3b515c8133	\N
a5a0adad-bf79-409b-8b05-2a66ee518ac9	\N	registration-page-form	91cb1cd2-e133-4f67-9800-593c809120c8	b122081f-baaa-4ee0-8bd3-de56d0f0a677	0	10	t	10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	\N
a7272471-31d2-4a34-acc4-24da99cfd7a1	\N	registration-user-creation	91cb1cd2-e133-4f67-9800-593c809120c8	10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	0	20	f	\N	\N
eef0c8d4-8706-4c82-97ca-f5963a216a0c	\N	registration-profile-action	91cb1cd2-e133-4f67-9800-593c809120c8	10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	0	40	f	\N	\N
f1571d64-39a2-43ba-a010-f7adfebf2268	\N	registration-password-action	91cb1cd2-e133-4f67-9800-593c809120c8	10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	0	50	f	\N	\N
e05eea28-d4f6-44ec-94fa-16a316b4088c	\N	registration-recaptcha-action	91cb1cd2-e133-4f67-9800-593c809120c8	10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	3	60	f	\N	\N
5ede6083-7d27-455d-8da4-0d221502ded5	\N	reset-credentials-choose-user	91cb1cd2-e133-4f67-9800-593c809120c8	c37a4bd8-d911-4bcb-8c37-15d04669a61c	0	10	f	\N	\N
2a8dc593-27b5-4676-a09c-eaf411c31f5d	\N	reset-credential-email	91cb1cd2-e133-4f67-9800-593c809120c8	c37a4bd8-d911-4bcb-8c37-15d04669a61c	0	20	f	\N	\N
dcc0195a-dde0-42c5-bf70-be9ca9f94790	\N	reset-password	91cb1cd2-e133-4f67-9800-593c809120c8	c37a4bd8-d911-4bcb-8c37-15d04669a61c	0	30	f	\N	\N
a982307e-5214-4277-9426-7a2534167aed	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	c37a4bd8-d911-4bcb-8c37-15d04669a61c	1	40	t	db5526e7-88aa-4faf-b358-450bbd4e1fa0	\N
c5217050-7357-4b2a-9825-d3b7a5a89ceb	\N	http-basic-authenticator	91cb1cd2-e133-4f67-9800-593c809120c8	1f90b2dc-b4b0-40ed-abed-fa316b7a11b3	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
34573abd-eadf-423a-8fc0-5f127befbff9	browser	browser based authentication	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	t	t
7e2312bd-6cef-40f2-9e03-2d7f375ccdb8	forms	Username, password, otp and other auth forms.	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	f	t
47cb2fe4-c3f5-4987-80cd-01960b3a56a7	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	f	t
3a01df8d-8cf7-4ee1-bd8f-f82fe15405b9	direct grant	OpenID Connect Resource Owner Grant	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	t	t
62b2828e-b81d-423a-8383-a317e4fc8cfe	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	f	t
78961e85-753e-4adf-bd8d-9d2287157467	registration	registration flow	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	t	t
c6139b1d-d179-40b9-ace6-e384d751adf6	registration form	registration form	8c7aaac8-4834-4bc1-b139-b904b076efc0	form-flow	f	t
ec7f78d2-ef09-4d2a-85af-e9c0c01a6f1a	reset credentials	Reset credentials for a user if they forgot their password or something	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	t	t
921b6f28-8e91-4284-bd86-9a72019b3903	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	f	t
4cda879b-ac12-48df-bbbe-cb22c6376c3f	clients	Base authentication for clients	8c7aaac8-4834-4bc1-b139-b904b076efc0	client-flow	t	t
6fbd77a8-3364-498a-8c88-40717787c7ff	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	t	t
6770ea38-49ca-4ace-8260-ed0b3a67f856	User creation or linking	Flow for the existing/non-existing user alternatives	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	f	t
1bd61689-9cbf-46ca-aeca-0ad709f63b0b	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	f	t
ce999185-d2ae-42e6-a088-ee73a876451d	Account verification options	Method with which to verity the existing account	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	f	t
983beafe-10ac-460d-939b-ff8ee134a5dc	Verify Existing Account by Re-authentication	Reauthentication of existing account	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	f	t
432155d8-fb40-47dd-bb38-bf11816abe91	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	f	t
ac51139e-7272-43a6-885e-d8fa23659c32	saml ecp	SAML ECP Profile Authentication Flow	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	t	t
1d8a8069-184c-4dab-8706-b7cfdc6b0dce	docker auth	Used by Docker clients to authenticate against the IDP	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	t	t
80a34b8c-4cf1-48e0-960f-83823c5997e9	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	t	t
c980d4b0-82ba-4e01-9782-82ff3bfe17ed	Authentication Options	Authentication options.	8c7aaac8-4834-4bc1-b139-b904b076efc0	basic-flow	f	t
1fc4ddf9-a0da-4845-bd06-b894b620d397	Account verification options	Method with which to verity the existing account	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
41c46922-e64f-4d6a-b2cc-aa3b515c8133	Authentication Options	Authentication options.	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
1cdb2bfa-645d-4b9c-8e82-8a0748424264	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
e90bc83d-70cd-433a-b039-a423e910df15	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
3945574b-5c33-4d33-9cce-4c12a7e6c24c	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
bf40da7f-adcf-435e-882b-309ce7c72dfa	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
db5526e7-88aa-4faf-b358-450bbd4e1fa0	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
8fc2cec3-e309-43cd-89f6-2f1f81a1132e	User creation or linking	Flow for the existing/non-existing user alternatives	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
6a7d693b-4378-4279-83b5-d4dc34cc07b4	Verify Existing Account by Re-authentication	Reauthentication of existing account	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
e62459b7-7fed-46ef-b152-3290716681b1	browser	browser based authentication	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
2519192b-9e5e-4557-a798-c843d62f5591	clients	Base authentication for clients	91cb1cd2-e133-4f67-9800-593c809120c8	client-flow	t	t
8aaa788b-b8c4-48c1-afa9-6f205d1a7f58	direct grant	OpenID Connect Resource Owner Grant	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
4e3245cb-5649-479e-be4b-823051d465bf	docker auth	Used by Docker clients to authenticate against the IDP	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
a87217ca-2672-4d1b-8c18-1932c91dc1da	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
0e63afa7-104b-49af-8467-dad2c2eaea75	forms	Username, password, otp and other auth forms.	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
93eeb0a3-31df-4985-a4a1-5cc8d2672201	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
b122081f-baaa-4ee0-8bd3-de56d0f0a677	registration	registration flow	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	registration form	registration form	91cb1cd2-e133-4f67-9800-593c809120c8	form-flow	f	t
c37a4bd8-d911-4bcb-8c37-15d04669a61c	reset credentials	Reset credentials for a user if they forgot their password or something	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
1f90b2dc-b4b0-40ed-abed-fa316b7a11b3	saml ecp	SAML ECP Profile Authentication Flow	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.authenticator_config (id, alias, realm_id) FROM stdin;
d3142f8e-6000-492b-8ce6-c9940a140c94	review profile config	8c7aaac8-4834-4bc1-b139-b904b076efc0
109984b1-6904-441d-ae04-a3fb477e528a	create unique user config	8c7aaac8-4834-4bc1-b139-b904b076efc0
58874d7f-eebc-427a-95e4-1be8461414e5	create unique user config	91cb1cd2-e133-4f67-9800-593c809120c8
14c75fca-1049-4355-8f24-daea1356076f	review profile config	91cb1cd2-e133-4f67-9800-593c809120c8
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
d3142f8e-6000-492b-8ce6-c9940a140c94	missing	update.profile.on.first.login
109984b1-6904-441d-ae04-a3fb477e528a	false	require.password.update.after.registration
58874d7f-eebc-427a-95e4-1be8461414e5	false	require.password.update.after.registration
14c75fca-1049-4355-8f24-daea1356076f	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	f	master-realm	0	f	\N	\N	t	\N	f	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
668f6aba-213e-4775-b8ce-08d98a479eae	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	8c7aaac8-4834-4bc1-b139-b904b076efc0	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
69dec60d-c5b1-492d-89b4-574261eaed96	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	8c7aaac8-4834-4bc1-b139-b904b076efc0	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
31d4cc1e-32f9-45fa-84a3-e6d75450c87d	t	f	broker	0	f	\N	\N	t	\N	f	8c7aaac8-4834-4bc1-b139-b904b076efc0	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
d5c9db67-31c6-4309-8a06-296c4e5aeb36	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	8c7aaac8-4834-4bc1-b139-b904b076efc0	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
9d17254e-dd73-4903-96cc-2ccb9ba8d99d	t	f	admin-cli	0	t	\N	\N	f	\N	f	8c7aaac8-4834-4bc1-b139-b904b076efc0	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
6e28b55a-cc17-4c70-a96f-f829402fefc7	t	f	ghoverblog-realm	0	f	\N	\N	t	\N	f	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N	0	f	f	ghoverblog Realm	f	client-secret	\N	\N	\N	t	f	f	f
42b5d478-6044-4e3d-aff5-837150682d0c	t	f	account	0	t	\N	/realms/ghoverblog/account/	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
255e96f7-f58d-4d04-b853-009fefecd80d	t	f	account-console	0	t	\N	/realms/ghoverblog/account/	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	t	f	admin-cli	0	t	\N	\N	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
1d288522-1a62-43b1-9932-f23aa8959705	t	f	broker	0	f	\N	\N	t	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
dd60301a-3b36-4b7b-b7f2-538c72209465	t	t	overblog_DEV	0	t	\N	http://localhost:4200/*	f		f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	-1	t	f		f	client-secret	http://localhost:4200/		\N	t	f	t	t
de37e667-e65f-4127-88b0-040889a26d6c	t	f	realm-management	0	f	\N	\N	t	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
85a82e6e-ccb6-4153-8304-3645d119899b	t	f	security-admin-console	0	t	\N	/admin/ghoverblog/console/	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_attributes (client_id, value, name) FROM stdin;
668f6aba-213e-4775-b8ce-08d98a479eae	+	post.logout.redirect.uris
69dec60d-c5b1-492d-89b4-574261eaed96	+	post.logout.redirect.uris
69dec60d-c5b1-492d-89b4-574261eaed96	S256	pkce.code.challenge.method
d5c9db67-31c6-4309-8a06-296c4e5aeb36	+	post.logout.redirect.uris
d5c9db67-31c6-4309-8a06-296c4e5aeb36	S256	pkce.code.challenge.method
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
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_scope (id, name, realm_id, description, protocol) FROM stdin;
f8a96911-f83b-418f-ae62-9e549e706238	offline_access	8c7aaac8-4834-4bc1-b139-b904b076efc0	OpenID Connect built-in scope: offline_access	openid-connect
c63386ab-6583-4e53-a1e9-e3b3177e8e9f	role_list	8c7aaac8-4834-4bc1-b139-b904b076efc0	SAML role list	saml
87f45f5e-93c9-4930-9c05-288f18aea3d9	profile	8c7aaac8-4834-4bc1-b139-b904b076efc0	OpenID Connect built-in scope: profile	openid-connect
73543a1f-a869-4a85-98ce-a72f39e85660	email	8c7aaac8-4834-4bc1-b139-b904b076efc0	OpenID Connect built-in scope: email	openid-connect
8e98d761-e0f6-4e89-a50b-f6c612cea8c1	address	8c7aaac8-4834-4bc1-b139-b904b076efc0	OpenID Connect built-in scope: address	openid-connect
f8861c37-9273-438d-b004-8d56bc5a8735	phone	8c7aaac8-4834-4bc1-b139-b904b076efc0	OpenID Connect built-in scope: phone	openid-connect
2596c46c-972e-4b1d-9b7f-b4137f706f48	roles	8c7aaac8-4834-4bc1-b139-b904b076efc0	OpenID Connect scope for add user roles to the access token	openid-connect
0efbf1f1-e032-4c4b-a144-ede05950d142	web-origins	8c7aaac8-4834-4bc1-b139-b904b076efc0	OpenID Connect scope for add allowed web origins to the access token	openid-connect
2f676434-c963-49bb-a42e-b3dc19aa9b13	microprofile-jwt	8c7aaac8-4834-4bc1-b139-b904b076efc0	Microprofile - JWT built-in scope	openid-connect
0e5560e3-3ec9-4d87-9869-fa438367136c	acr	8c7aaac8-4834-4bc1-b139-b904b076efc0	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
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
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_scope_attributes (scope_id, value, name) FROM stdin;
f8a96911-f83b-418f-ae62-9e549e706238	true	display.on.consent.screen
f8a96911-f83b-418f-ae62-9e549e706238	${offlineAccessScopeConsentText}	consent.screen.text
c63386ab-6583-4e53-a1e9-e3b3177e8e9f	true	display.on.consent.screen
c63386ab-6583-4e53-a1e9-e3b3177e8e9f	${samlRoleListScopeConsentText}	consent.screen.text
87f45f5e-93c9-4930-9c05-288f18aea3d9	true	display.on.consent.screen
87f45f5e-93c9-4930-9c05-288f18aea3d9	${profileScopeConsentText}	consent.screen.text
87f45f5e-93c9-4930-9c05-288f18aea3d9	true	include.in.token.scope
73543a1f-a869-4a85-98ce-a72f39e85660	true	display.on.consent.screen
73543a1f-a869-4a85-98ce-a72f39e85660	${emailScopeConsentText}	consent.screen.text
73543a1f-a869-4a85-98ce-a72f39e85660	true	include.in.token.scope
8e98d761-e0f6-4e89-a50b-f6c612cea8c1	true	display.on.consent.screen
8e98d761-e0f6-4e89-a50b-f6c612cea8c1	${addressScopeConsentText}	consent.screen.text
8e98d761-e0f6-4e89-a50b-f6c612cea8c1	true	include.in.token.scope
f8861c37-9273-438d-b004-8d56bc5a8735	true	display.on.consent.screen
f8861c37-9273-438d-b004-8d56bc5a8735	${phoneScopeConsentText}	consent.screen.text
f8861c37-9273-438d-b004-8d56bc5a8735	true	include.in.token.scope
2596c46c-972e-4b1d-9b7f-b4137f706f48	true	display.on.consent.screen
2596c46c-972e-4b1d-9b7f-b4137f706f48	${rolesScopeConsentText}	consent.screen.text
2596c46c-972e-4b1d-9b7f-b4137f706f48	false	include.in.token.scope
0efbf1f1-e032-4c4b-a144-ede05950d142	false	display.on.consent.screen
0efbf1f1-e032-4c4b-a144-ede05950d142		consent.screen.text
0efbf1f1-e032-4c4b-a144-ede05950d142	false	include.in.token.scope
2f676434-c963-49bb-a42e-b3dc19aa9b13	false	display.on.consent.screen
2f676434-c963-49bb-a42e-b3dc19aa9b13	true	include.in.token.scope
0e5560e3-3ec9-4d87-9869-fa438367136c	false	display.on.consent.screen
0e5560e3-3ec9-4d87-9869-fa438367136c	false	include.in.token.scope
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
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
668f6aba-213e-4775-b8ce-08d98a479eae	0e5560e3-3ec9-4d87-9869-fa438367136c	t
668f6aba-213e-4775-b8ce-08d98a479eae	2596c46c-972e-4b1d-9b7f-b4137f706f48	t
668f6aba-213e-4775-b8ce-08d98a479eae	0efbf1f1-e032-4c4b-a144-ede05950d142	t
668f6aba-213e-4775-b8ce-08d98a479eae	87f45f5e-93c9-4930-9c05-288f18aea3d9	t
668f6aba-213e-4775-b8ce-08d98a479eae	73543a1f-a869-4a85-98ce-a72f39e85660	t
668f6aba-213e-4775-b8ce-08d98a479eae	f8a96911-f83b-418f-ae62-9e549e706238	f
668f6aba-213e-4775-b8ce-08d98a479eae	f8861c37-9273-438d-b004-8d56bc5a8735	f
668f6aba-213e-4775-b8ce-08d98a479eae	2f676434-c963-49bb-a42e-b3dc19aa9b13	f
668f6aba-213e-4775-b8ce-08d98a479eae	8e98d761-e0f6-4e89-a50b-f6c612cea8c1	f
69dec60d-c5b1-492d-89b4-574261eaed96	0e5560e3-3ec9-4d87-9869-fa438367136c	t
69dec60d-c5b1-492d-89b4-574261eaed96	2596c46c-972e-4b1d-9b7f-b4137f706f48	t
69dec60d-c5b1-492d-89b4-574261eaed96	0efbf1f1-e032-4c4b-a144-ede05950d142	t
69dec60d-c5b1-492d-89b4-574261eaed96	87f45f5e-93c9-4930-9c05-288f18aea3d9	t
69dec60d-c5b1-492d-89b4-574261eaed96	73543a1f-a869-4a85-98ce-a72f39e85660	t
69dec60d-c5b1-492d-89b4-574261eaed96	f8a96911-f83b-418f-ae62-9e549e706238	f
69dec60d-c5b1-492d-89b4-574261eaed96	f8861c37-9273-438d-b004-8d56bc5a8735	f
69dec60d-c5b1-492d-89b4-574261eaed96	2f676434-c963-49bb-a42e-b3dc19aa9b13	f
69dec60d-c5b1-492d-89b4-574261eaed96	8e98d761-e0f6-4e89-a50b-f6c612cea8c1	f
9d17254e-dd73-4903-96cc-2ccb9ba8d99d	0e5560e3-3ec9-4d87-9869-fa438367136c	t
9d17254e-dd73-4903-96cc-2ccb9ba8d99d	2596c46c-972e-4b1d-9b7f-b4137f706f48	t
9d17254e-dd73-4903-96cc-2ccb9ba8d99d	0efbf1f1-e032-4c4b-a144-ede05950d142	t
9d17254e-dd73-4903-96cc-2ccb9ba8d99d	87f45f5e-93c9-4930-9c05-288f18aea3d9	t
9d17254e-dd73-4903-96cc-2ccb9ba8d99d	73543a1f-a869-4a85-98ce-a72f39e85660	t
9d17254e-dd73-4903-96cc-2ccb9ba8d99d	f8a96911-f83b-418f-ae62-9e549e706238	f
9d17254e-dd73-4903-96cc-2ccb9ba8d99d	f8861c37-9273-438d-b004-8d56bc5a8735	f
9d17254e-dd73-4903-96cc-2ccb9ba8d99d	2f676434-c963-49bb-a42e-b3dc19aa9b13	f
9d17254e-dd73-4903-96cc-2ccb9ba8d99d	8e98d761-e0f6-4e89-a50b-f6c612cea8c1	f
31d4cc1e-32f9-45fa-84a3-e6d75450c87d	0e5560e3-3ec9-4d87-9869-fa438367136c	t
31d4cc1e-32f9-45fa-84a3-e6d75450c87d	2596c46c-972e-4b1d-9b7f-b4137f706f48	t
31d4cc1e-32f9-45fa-84a3-e6d75450c87d	0efbf1f1-e032-4c4b-a144-ede05950d142	t
31d4cc1e-32f9-45fa-84a3-e6d75450c87d	87f45f5e-93c9-4930-9c05-288f18aea3d9	t
31d4cc1e-32f9-45fa-84a3-e6d75450c87d	73543a1f-a869-4a85-98ce-a72f39e85660	t
31d4cc1e-32f9-45fa-84a3-e6d75450c87d	f8a96911-f83b-418f-ae62-9e549e706238	f
31d4cc1e-32f9-45fa-84a3-e6d75450c87d	f8861c37-9273-438d-b004-8d56bc5a8735	f
31d4cc1e-32f9-45fa-84a3-e6d75450c87d	2f676434-c963-49bb-a42e-b3dc19aa9b13	f
31d4cc1e-32f9-45fa-84a3-e6d75450c87d	8e98d761-e0f6-4e89-a50b-f6c612cea8c1	f
b24b4acb-89a0-4821-a4c0-82bdd5a8e467	0e5560e3-3ec9-4d87-9869-fa438367136c	t
b24b4acb-89a0-4821-a4c0-82bdd5a8e467	2596c46c-972e-4b1d-9b7f-b4137f706f48	t
b24b4acb-89a0-4821-a4c0-82bdd5a8e467	0efbf1f1-e032-4c4b-a144-ede05950d142	t
b24b4acb-89a0-4821-a4c0-82bdd5a8e467	87f45f5e-93c9-4930-9c05-288f18aea3d9	t
b24b4acb-89a0-4821-a4c0-82bdd5a8e467	73543a1f-a869-4a85-98ce-a72f39e85660	t
b24b4acb-89a0-4821-a4c0-82bdd5a8e467	f8a96911-f83b-418f-ae62-9e549e706238	f
b24b4acb-89a0-4821-a4c0-82bdd5a8e467	f8861c37-9273-438d-b004-8d56bc5a8735	f
b24b4acb-89a0-4821-a4c0-82bdd5a8e467	2f676434-c963-49bb-a42e-b3dc19aa9b13	f
b24b4acb-89a0-4821-a4c0-82bdd5a8e467	8e98d761-e0f6-4e89-a50b-f6c612cea8c1	f
d5c9db67-31c6-4309-8a06-296c4e5aeb36	0e5560e3-3ec9-4d87-9869-fa438367136c	t
d5c9db67-31c6-4309-8a06-296c4e5aeb36	2596c46c-972e-4b1d-9b7f-b4137f706f48	t
d5c9db67-31c6-4309-8a06-296c4e5aeb36	0efbf1f1-e032-4c4b-a144-ede05950d142	t
d5c9db67-31c6-4309-8a06-296c4e5aeb36	87f45f5e-93c9-4930-9c05-288f18aea3d9	t
d5c9db67-31c6-4309-8a06-296c4e5aeb36	73543a1f-a869-4a85-98ce-a72f39e85660	t
d5c9db67-31c6-4309-8a06-296c4e5aeb36	f8a96911-f83b-418f-ae62-9e549e706238	f
d5c9db67-31c6-4309-8a06-296c4e5aeb36	f8861c37-9273-438d-b004-8d56bc5a8735	f
d5c9db67-31c6-4309-8a06-296c4e5aeb36	2f676434-c963-49bb-a42e-b3dc19aa9b13	f
d5c9db67-31c6-4309-8a06-296c4e5aeb36	8e98d761-e0f6-4e89-a50b-f6c612cea8c1	f
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
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_scope_role_mapping (scope_id, role_id) FROM stdin;
f8a96911-f83b-418f-ae62-9e549e706238	a08231ff-e586-45e2-83cb-f7eafccd9d2d
dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	d110694d-134d-4b14-aec0-530415e26704
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
e0a28c52-e949-47c5-8282-c250c3912a1b	Trusted Hosts	8c7aaac8-4834-4bc1-b139-b904b076efc0	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8c7aaac8-4834-4bc1-b139-b904b076efc0	anonymous
579915ad-6815-47b7-b352-5c8f126ce3e8	Consent Required	8c7aaac8-4834-4bc1-b139-b904b076efc0	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8c7aaac8-4834-4bc1-b139-b904b076efc0	anonymous
e44d1dfc-c1bb-4f45-955b-ee99a0e53c96	Full Scope Disabled	8c7aaac8-4834-4bc1-b139-b904b076efc0	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8c7aaac8-4834-4bc1-b139-b904b076efc0	anonymous
7a7bb3fb-1e28-434d-bb5f-e679c3d3f873	Max Clients Limit	8c7aaac8-4834-4bc1-b139-b904b076efc0	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8c7aaac8-4834-4bc1-b139-b904b076efc0	anonymous
c357be37-2cda-45e0-9192-0e967e5ca64c	Allowed Protocol Mapper Types	8c7aaac8-4834-4bc1-b139-b904b076efc0	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8c7aaac8-4834-4bc1-b139-b904b076efc0	anonymous
ee043aaf-b7ec-4827-86dd-09bb9ee136c7	Allowed Client Scopes	8c7aaac8-4834-4bc1-b139-b904b076efc0	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8c7aaac8-4834-4bc1-b139-b904b076efc0	anonymous
e7f32bb7-c88c-4d67-b3bb-c9d2f19bb65c	Allowed Protocol Mapper Types	8c7aaac8-4834-4bc1-b139-b904b076efc0	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8c7aaac8-4834-4bc1-b139-b904b076efc0	authenticated
c47a45c1-1949-4792-a6a6-f9f5b50e9443	Allowed Client Scopes	8c7aaac8-4834-4bc1-b139-b904b076efc0	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8c7aaac8-4834-4bc1-b139-b904b076efc0	authenticated
5694c7d9-cd9d-4a82-91e9-70f7922cd5b8	rsa-generated	8c7aaac8-4834-4bc1-b139-b904b076efc0	rsa-generated	org.keycloak.keys.KeyProvider	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N
74983f64-fb39-4c67-9ccb-0f50c41cf4d8	rsa-enc-generated	8c7aaac8-4834-4bc1-b139-b904b076efc0	rsa-enc-generated	org.keycloak.keys.KeyProvider	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N
e0d13443-80f7-47ff-b2b3-61b4a771cd6c	hmac-generated	8c7aaac8-4834-4bc1-b139-b904b076efc0	hmac-generated	org.keycloak.keys.KeyProvider	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N
58dff49f-e773-4f69-9624-232c4e1eed1b	aes-generated	8c7aaac8-4834-4bc1-b139-b904b076efc0	aes-generated	org.keycloak.keys.KeyProvider	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N
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
860c0462-c6eb-4446-aaac-5e12be31ee24	\N	91cb1cd2-e133-4f67-9800-593c809120c8	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.component_config (id, component_id, name, value) FROM stdin;
1a74c346-2614-44a3-afa6-ee6cf77a9751	c47a45c1-1949-4792-a6a6-f9f5b50e9443	allow-default-scopes	true
f007cf64-04dd-4f1b-829e-b023f25540fb	ee043aaf-b7ec-4827-86dd-09bb9ee136c7	allow-default-scopes	true
629d3ba2-2c8c-4bf1-af28-3bf6b7a6d092	c357be37-2cda-45e0-9192-0e967e5ca64c	allowed-protocol-mapper-types	oidc-full-name-mapper
9bb4db5b-9758-4824-afbc-f7f5071cb558	c357be37-2cda-45e0-9192-0e967e5ca64c	allowed-protocol-mapper-types	saml-user-property-mapper
127355f2-9741-495d-b213-4885422c36c7	c357be37-2cda-45e0-9192-0e967e5ca64c	allowed-protocol-mapper-types	saml-user-attribute-mapper
b27dbabc-1bb3-44b9-a269-2ba6c94625f1	c357be37-2cda-45e0-9192-0e967e5ca64c	allowed-protocol-mapper-types	oidc-address-mapper
11830f6d-80cf-466e-a13c-9899ac4d8ad3	c357be37-2cda-45e0-9192-0e967e5ca64c	allowed-protocol-mapper-types	saml-role-list-mapper
49b7ab31-6c89-4545-b9a9-3c4cb8354361	c357be37-2cda-45e0-9192-0e967e5ca64c	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
2891300f-6a98-4fee-9318-8c0eddf39d51	c357be37-2cda-45e0-9192-0e967e5ca64c	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
c6243ac6-b593-4525-beaf-fcbe88bc3d2d	c357be37-2cda-45e0-9192-0e967e5ca64c	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
2e9b3ab7-8dca-461e-ba57-440cf96d3f32	e0a28c52-e949-47c5-8282-c250c3912a1b	host-sending-registration-request-must-match	true
9ec11768-7be6-40f7-ad6c-9e8c1f3150eb	e0a28c52-e949-47c5-8282-c250c3912a1b	client-uris-must-match	true
b932406d-59f1-4704-8f95-24dd76e848c9	e7f32bb7-c88c-4d67-b3bb-c9d2f19bb65c	allowed-protocol-mapper-types	saml-user-property-mapper
1b9844c4-210d-42a9-81c4-cdee1aed408a	e7f32bb7-c88c-4d67-b3bb-c9d2f19bb65c	allowed-protocol-mapper-types	saml-role-list-mapper
90195a3e-8c33-4bdf-aa40-4a9343f9b908	e7f32bb7-c88c-4d67-b3bb-c9d2f19bb65c	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
a0ee5359-ebf2-4855-9023-74b3ebe9593b	e7f32bb7-c88c-4d67-b3bb-c9d2f19bb65c	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
ae80df9e-d1d9-446c-b51b-fb60ad191a47	e7f32bb7-c88c-4d67-b3bb-c9d2f19bb65c	allowed-protocol-mapper-types	oidc-full-name-mapper
ad93509e-ad53-4c9a-b2e5-fc86bc532e70	e7f32bb7-c88c-4d67-b3bb-c9d2f19bb65c	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
46ff2d75-01fb-4365-8524-b85e3f9f9ea9	e7f32bb7-c88c-4d67-b3bb-c9d2f19bb65c	allowed-protocol-mapper-types	oidc-address-mapper
a0aa7a7c-f679-43ae-94e7-6610107b9047	e7f32bb7-c88c-4d67-b3bb-c9d2f19bb65c	allowed-protocol-mapper-types	saml-user-attribute-mapper
a7dc6e51-5afd-49df-9388-674e63b50264	7a7bb3fb-1e28-434d-bb5f-e679c3d3f873	max-clients	200
a52125b6-6e02-488a-b3e0-5b14aeb7934d	e0d13443-80f7-47ff-b2b3-61b4a771cd6c	algorithm	HS256
4b587dae-de57-4df1-9a82-59a98b0c82dd	e0d13443-80f7-47ff-b2b3-61b4a771cd6c	priority	100
5f224226-6391-4c75-9386-f4ba7bd53506	e0d13443-80f7-47ff-b2b3-61b4a771cd6c	kid	69a49a0a-dfc1-4383-8d26-6821164fe26a
2a080c32-ddc0-43c5-a0a1-3ec06292da69	e0d13443-80f7-47ff-b2b3-61b4a771cd6c	secret	QaImgeC1sUXdOay37p6wXJX7VD_KCb729vfqF9FEByvGzI6YBNre5B9KeWsPLmQR9xZ_BA_q1L5jcrgZ4qfPpg
df2ac59c-09e1-4251-828f-85e4c6ef6953	5694c7d9-cd9d-4a82-91e9-70f7922cd5b8	keyUse	SIG
57bbf98c-9d8e-4ab1-b79e-3eff8722ec56	5694c7d9-cd9d-4a82-91e9-70f7922cd5b8	privateKey	MIIEowIBAAKCAQEAjHGKc0/8AIqrbfN8cNgDRgz8rQA2MZtrkzL0k01uSMu+egKmlWp54a2h5l5Rxe2f+YWOeOMH/aUdKzIU45+ByaHqCUN11ngmvgHDTZH+6WQDBR2t1+zLQeVZysuKFi5AFJ2D3rQ867wLPky/JpUGauKXsdP9+XUyoEelAu4A836uI9BoEol6eWcPd8RQHiehKWgRDH2q2LDT3BhPDJ8cV9BUhDpIM3PB5D0XhEzrHqFVZigkt3KeDDVzZuUzUR2zKIDKtPPG9bCeK7eES/U0f9s1TpJSxfa4CRKhiV5cVnOFO1j2d0gfKvYLtwyA5C5chCn+U92jFLYu3c9adxIvuwIDAQABAoIBADpsu3N4GTYieeluKt0Ix+fa3DyeA22Eoe5k+sDSq+fltnIsax9qYZTENj9PCoaj8XKMoHXiwH7Asw82sOD2iLgYPvOmmD1l03wk4JoC+8Ac5nK444qZi/74Se/m16WdjPPmiSba5SMOIcFDjRugUECjzgZg0d12Z16tH1TGLSgd88eVG5ln1b7GGFVDnAFI11+YCzQmeeDrl1FbCgG0GSp0ZN+cc9cYft8Xd3aRj7RS4lOQfPB3vEX1eu6ncX8Q/ECwdgdQ8b4Hvvo92pvjT4MGQvPUp6SR0e7QU5Bzoq9DE7cyOafjSRCZ6mAsoZVxACI6epqlYHtH+LNuyb0UiQkCgYEAwd5aHjljN39G/pqM+kFg8IEFNwXdm64NNjpdDXDW+NSoYd+6byetbq7Yu+vYI2Q7/4S8TBLc/Ofqu8GadMtnVWOqtoLFuQODu0Cbi13od5yQzFkXXioVvqyQu1R0kJ+BGIoyI4Tlt18YpMFEB3QQdeDZK38ITC3Yb2aaBHWCTzkCgYEAuXQDZbeYcNJqx6S5AuUOAlcymC62pqPJg/98V0crPrulEHz3EQJOfMppDV0ctKFXyNYQ5W1251Q6tW2sIl+yoEojHHJ0IV1Ldt/QmzBVWupwPyBUcEj9hOhCO4jG2tjqvm/6MNbpBzCkO3rFegFfSB3QhunPeWwOj6mxZJliQpMCgYA4APefi4xx1762hgb7tC9AysSq5HLkKh9+7tU6sMIpF6WcwHim65taQgAyKStC7g22/q02fKyCEqzomED6RFgRfr0uBBECJVXEniFQ3UvuYbgikAoEFbw6XLdipj8WGD2+zQ023YlOs5X24i24yXqH0vBpdET9XLENXWJYr2l5YQKBgQCfTyOj+2U+deM4gS5VaELyi8lwpaBN4iE3/P7pUr+5ciRH17G9sMePt6kqy7PfD0KDyjBVhgVAj0CnngDivmaJ/2XOCBvulWBAS9+9kHWiVgX6lGE02968j3BmCAca9IAi+7pmvhcMECLk3YBKYGdjYglB/BQ4cDTKALHcg06/dQKBgFL1DhRfsUHkvvPy0fE1cH7l/2c2bz0DWJAN0nzwK0M4ns7cdYTRLUIC6A1k3IXFs1QhNXVCvFlaNeMYoRmjg7MQOY79+Su6pdXhKUJPkjKsWR7j3SD7I0zh049pCrbZhPU5FHSXMtHH97Pn9SBWvjKEeNCHKCeYrmKyFhyYr+5H
dedfbf31-2fe6-4631-82f7-b0e94ae1c853	5694c7d9-cd9d-4a82-91e9-70f7922cd5b8	priority	100
d2d33f8e-adc1-49d0-8cd3-47040313b013	5694c7d9-cd9d-4a82-91e9-70f7922cd5b8	certificate	MIICmzCCAYMCBgGITdLfdDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNTI0MTI1MjI1WhcNMzMwNTI0MTI1NDA1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCMcYpzT/wAiqtt83xw2ANGDPytADYxm2uTMvSTTW5Iy756AqaVannhraHmXlHF7Z/5hY544wf9pR0rMhTjn4HJoeoJQ3XWeCa+AcNNkf7pZAMFHa3X7MtB5VnKy4oWLkAUnYPetDzrvAs+TL8mlQZq4pex0/35dTKgR6UC7gDzfq4j0GgSiXp5Zw93xFAeJ6EpaBEMfarYsNPcGE8MnxxX0FSEOkgzc8HkPReETOseoVVmKCS3cp4MNXNm5TNRHbMogMq088b1sJ4rt4RL9TR/2zVOklLF9rgJEqGJXlxWc4U7WPZ3SB8q9gu3DIDkLlyEKf5T3aMUti7dz1p3Ei+7AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEeZYugpV1JLDXNGzj+2MfxLSTgd/klWyJTknUym0Hq0PjAbH/SGw2ZIYJUJMeovVW5L8Qy0lRQEbapTe/+6TyR+eEA/JAtfbSrXN+2b+WxuiniEOJgDC9vrSieSJBmyyq1qgJZqagQwdfgYwW7m1oP542PIuV2R9EuAZ7q9bJX/k8HNXYM5g5GKwyDsFjCDBFrhZISb0eMD0CwO/Jy9Y6FudMszFotLx06kvuxl+ldoKO7esP8ged+KJ49o5dnJMns/q09K8dBuIE6FtL2tjBkqxu0WaMY6WkYDeU9DsgudLMRp/ztydVab1+/F6kqUTXIrXTKfUIqJF9EA8QWqMJ0=
1319620d-8f00-4056-8681-c48872dacde3	58dff49f-e773-4f69-9624-232c4e1eed1b	secret	n1Wp4IuXreoCE55FfxA-Zg
fb943f9c-e052-4d96-b4d6-d86380fd6bcc	58dff49f-e773-4f69-9624-232c4e1eed1b	kid	0c613f2a-ca44-4c8d-b07b-fd9ce98784c2
c32bc314-3143-42e8-b2fc-36281a839eda	58dff49f-e773-4f69-9624-232c4e1eed1b	priority	100
bcbe58bb-c690-4739-af76-19e766399dbd	74983f64-fb39-4c67-9ccb-0f50c41cf4d8	priority	100
1aab5b00-65d9-4559-9119-d3dcb9414d8d	74983f64-fb39-4c67-9ccb-0f50c41cf4d8	keyUse	ENC
c0134648-1d98-40b5-b4e9-183add1a22e3	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-full-name-mapper
93386de2-7c03-4ea0-9bab-f101799ba27c	5c82aadb-b771-4643-93f3-44004ca2276c	allow-default-scopes	true
76f5c5b0-183b-4980-9d95-7210abceeda4	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	secret	sXZLl8X23921u7tww4OiZw
55401976-e3be-412e-8b73-c6aada8d9bd9	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	kid	4ddfb1fa-6809-4327-83df-2e1d131a3a9b
f5eb617c-01ed-4eaf-9b3d-3e70b209ac8e	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	priority	100
a979aacc-8d39-4c0e-971c-b2c4cb45f9b4	74983f64-fb39-4c67-9ccb-0f50c41cf4d8	privateKey	MIIEogIBAAKCAQEAjLZC51oi7p/1vef7smdMPlIVFw5YCi22S8X96ImNDQpDWflDu/YbijiP8R9h5rpotZVVSzSudb0xuGBPoRin12NcKoEKX+OYukhprmpDQzOlXYpcKGMcNRhwjZfPzPqY6diF15ODHszGjRG6BHXnq5DcfblLUACancnDQQu7BhowSJi5UEXOiHq+si4X2LQZ7jQcNu3fwdhbBOAU06GisKDDsvj0ACz6zA7iorshHUXaH8ZoNAIaOvh0kbv4qDt+OqV82msMyZI1k9Uo0iP2RbQTveHQhUK07aqSkufIuRWqPAMDNMSiHSyDXmkzn0nrP7OpzNDtKNMG4PrmPJnLawIDAQABAoIBAAS2rEoRRLGU8lDMLNCjLQ/fYC1XeJg8+nxACEtQ7WkrxemqBiWfzviBkrFjcDwyVDt5hxPY7gAHQX/pSE0EIKKkzqTJkavmNRh0ZPVQ+POzs40NHa9WFpgqKRAxwVPDa9V6G9bP7kRKyjZ6iuUryRRJIcZJPcv3fKQoWJTdAxcwZ6sJ6zfuoMGlHSPEgOPw/XYfkZy6IfturVvdcriWPe87Vnn7U/10ORal+5spX07bBpQymJfLWX5FroigHvTvC61n7OPxOzjdJYmjSUCXE3wxd6I6QgbeLZTYE0Ny+MApqnj/gOzuQaLwYMK3NKMuuTJDyQ42MA33RedltG/o46ECgYEAxaffcPAXlJ+GOLhIouYXMXBzGHHvslejqeIQuoVgl24ov/myRGSzAdm013EmGew0KVmQHI/u4i8BtgMy8h9VfsQELCHkJwcgK6m0fsy845jri3jhIuUO5S00co5z0W4k2/usg65qrqdCOUSVQ72ck7nmLLW2uBS12lhZMrQRcCECgYEAtj9aUvaCJ6daMuWwgYPBiPMcHAPKvqlOcgUsBcBPoEPT+op658nlRf/DCatTQWL9N2yTva5tPc4By4GbW2MO7FyY99inx2ep1vKrQmC4P+E4uyWfTe7OiJehN2t3iFkPZmIGMj7F/66NceD+Lv0hRB3p9Dt/dc3VxiWs9PAiugsCgYA+4FhEJRxbOyQHhxgUOf3GzG7Qp+4IXbjCoheQPj2r7m8oItaCy0XmoMrWfjgQpwMw5Dzj2SW07h8tN3dNbopT+Scaou1hPPMO8L1qWNb9z/eeNqXn49YJMYgtqQNO7Crtj/IhMareRHbcoOSa2AanN8vxDR1DEdOH0fMOHhouAQKBgDJXZ6TZEPTRJno+tjXgZjplJROb/IoUDGY0hYeFKrmTYt+nFvIl894VGxP1rka2iEmiBWF06BoVaKuFPpvMzhd+MIbt4tKTEPgeCi6Itvx2Qwx3BP0rBQP4FoFPfzI7n6RhWWLRsjHBTrLxOmVSaLj/Jlvff4LT+8QDLjZuirknAoGATPqjLskGRgsnTYcOSgD1R0/9O82LqSPl0xnlDC1+dRbn7nf8Liv+8BkI8wynEzTVKfNlqwhEN5SLvPSqLhf154zMhFj92kfN1LLUA9rfGLnCgeIzNGwuATYwy84O+vE+6ZSjbiYttXXy3OgunVRi5DNZk4a5jvtKt8yoXOeFrwM=
418dd2cf-6e9f-4a51-9e7f-81241940fa74	74983f64-fb39-4c67-9ccb-0f50c41cf4d8	certificate	MIICmzCCAYMCBgGITdLhUzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNTI0MTI1MjI1WhcNMzMwNTI0MTI1NDA1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCMtkLnWiLun/W95/uyZ0w+UhUXDlgKLbZLxf3oiY0NCkNZ+UO79huKOI/xH2Hmumi1lVVLNK51vTG4YE+hGKfXY1wqgQpf45i6SGmuakNDM6VdilwoYxw1GHCNl8/M+pjp2IXXk4MezMaNEboEdeerkNx9uUtQAJqdycNBC7sGGjBImLlQRc6Ier6yLhfYtBnuNBw27d/B2FsE4BTToaKwoMOy+PQALPrMDuKiuyEdRdofxmg0Aho6+HSRu/ioO346pXzaawzJkjWT1SjSI/ZFtBO94dCFQrTtqpKS58i5Fao8AwM0xKIdLINeaTOfSes/s6nM0O0o0wbg+uY8mctrAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABsfyanLodzbJaMyaltFumc4aYx0vP2Rq4DNbUKGCKu4pjdarar7KR6fTZ5f1P9IOzgj8fwsgm7bMSuop5vHrqd4XKk3aQj/p7G+sAOEvPDsCXgwXrS09OpqFzj3cM7k7kIaana8acUCu/j5FsVfqltvNKBcpkvhT4gBhOQYLTJMwzxIaXIrqQyLyjbjPtmkjqScKrbO0Qh1J3gfDpR0asGJJgPorLkKSoAddpgQk5cPNTZLAK6xFMVmWwFyCHyX6I+gLMrWgGzeVOMyo+y9o7EqSj/buXuItTXSP2GHgLqHmwhnbYpeSAfs7pRp0v9MmctMS88uXVpPR+cPyd+tQ9w=
36c5e9fd-b17c-49b8-8aaa-35f78a8d123a	74983f64-fb39-4c67-9ccb-0f50c41cf4d8	algorithm	RSA-OAEP
4db3c04f-2daf-4d57-8965-1c7ddf0648f1	68344544-b0a0-4cdc-a375-c6aaf6da0c01	priority	100
b088c712-eea1-4c7c-8178-2cff3231bb49	68344544-b0a0-4cdc-a375-c6aaf6da0c01	privateKey	MIIEowIBAAKCAQEAr7RK3XE0TJp5SkgpsYY5Fr+4fS+k3OhdSV93nkWrpxipJjS2urbQ8FIkFAH7/amHbHYjSOdPyNnX75ch0dcoMsJ0VnLa+cThf+vWKZ+S3+nbxEceKUgEPpfpQ3Q1fCmslK9TFygxJNCoy6RmyPvd3GG1XVxOUMebfKsjnfKrXSHY1kPWEbrKB+7nsm4d09FSnV9Vbb8g7JYz2fJWYPhK+SiTdJvnmVcPZgqgEuN77DsdfazdV+9Z9NtMoGx7xJFKvN5gWMvBI3SExDlTvg3hNW/mvBxn9ZriToUr4T4FB5xqRpgoMsLZC51iutt7RP46qwy5ux9hPCh/HmOALGmfmQIDAQABAoIBAE/VUfzazmIOABVFw5fzPiY9d2R+DOEIvTY05+NkkZFLTbPb2LjujvHayKTEoAwKBsu7w92AqEpA3PHyT/4Jzix+GSEcb610DOe0Lutbo38UwXOlwqkMHU2ZdXXeK90eDFnEbbMEYovxOPjKWp9wfUaAqMjiQ31FrLrRAc5m8ADQubbnuR0lgLHyKr8+HmI2FAXX6ukjrlThHNYS3xdCkk46UQxRg/E4iDxg33mlIfnOnnUxkJIYz+5UvCnncbC0hXYXjJmZZBTCMijg3gaYunRxvmDTQxRLmWYfkkYroN9OYZARhdhDXRkCEW098uSclcPRferSBA6MCwn+t0kTJc8CgYEA7d6jsvN08xPweb5FNzZaOiE6C2gXUkUUBMrq6rr6XrR2Lc9JLCEktDzsrStPuIXuBzaqIwCjEfLkBUaeTGkEEprZn9oATCQKX4pz//9Wmk5mI46ldiq8VH/NGSxivLrPYMWDalifRyub6KBcEPssfEIyyUxrI3h568girzTYgc8CgYEAvRirRBW+VWdnB1kjWsjpNQlcr8f3XFewdLGOJxtgDuYwHULqfYM0m+FcQwiehGeonRyNv86v1MMr28zJTRBIQZjpeMFsHRqhcmn++LKgUE1LaU6pPhzYbUUWoQ0A4I0CrO94pjHacswxPRq9UCgu8RCCeYB4dUeSyxSFm5o2KhcCgYB0xRK/Slxi56rpWMpJrFjmqGECMHsiW97T63ke+eLmkthg7J0TGMIX6MCW0eg0wSp0SBWFUU68BOyC2oPjJrplF7c1jaMPvbGJ7UG8rfApl8r0MZZwR9Jj+MkKTou58krTSqKUliS6n2HN9Mq9W1AfP7AGuYjuxLm1UW4VbG/MaQKBgQCFScU3CaiO5IL/7/n2vRV89+toUChw47KSnrEXqbks515U0d0duYU0t0ZkTcgGhlaY4A6ee97+ts/Mb+4YrvhvnIw9PQGrBiF013gM70QHNmSIhxTOnmCDrSZFQTg0D9Ep+uZtJ0jWkE3Ix3dX7+seqsd9Q2wlJt023nFK/Alf4wKBgD06OYAVlssROTS2KwXruxjRrItKjnO33HA3TyBta+EgoWOUIRTI2EMvEyNhMs/X4SHZ7/tqXcU8TI3huxjCM993yuqxpxvWggx70VDmLVozgQdipudUq6I1aoDxKyiHisvGeQVq+7SNzmTQJDDOcegsY5O3gFAh9KKnpdTDlhjk
5dab8170-8696-4262-a604-db0c33892c58	68344544-b0a0-4cdc-a375-c6aaf6da0c01	certificate	MIICozCCAYsCBgGITdLqIzANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApnaG92ZXJibG9nMB4XDTIzMDUyNDEyNTIyOFoXDTMzMDUyNDEyNTQwOFowFTETMBEGA1UEAwwKZ2hvdmVyYmxvZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAK+0St1xNEyaeUpIKbGGORa/uH0vpNzoXUlfd55Fq6cYqSY0trq20PBSJBQB+/2ph2x2I0jnT8jZ1++XIdHXKDLCdFZy2vnE4X/r1imfkt/p28RHHilIBD6X6UN0NXwprJSvUxcoMSTQqMukZsj73dxhtV1cTlDHm3yrI53yq10h2NZD1hG6ygfu57JuHdPRUp1fVW2/IOyWM9nyVmD4Svkok3Sb55lXD2YKoBLje+w7HX2s3VfvWfTbTKBse8SRSrzeYFjLwSN0hMQ5U74N4TVv5rwcZ/Wa4k6FK+E+BQecakaYKDLC2QudYrrbe0T+OqsMubsfYTwofx5jgCxpn5kCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAFAMWeWWslHY01yv2KzjhSPpCl20A9SWvMvpW3GXBMGapQhqcmwHElW1GY/kkJo+6H7AKm2rHp3DO6OhzBM08mIGqUuL58IU+MQeo9i2qqZ+wFSICzGGEPKV+WdmAo4uPjothICeCFspJJnRQumczxm5Fd+kiJdD8cmcpe6j+quiGSS0PTz6jEQ5d+UV+zIU+LUmjo7YKZ3q2xAOZeLJaaS+fGFVaU6vFpGSMAgKOb9syOkcUW2iQELcxKR2KNNNe28lu6Gb7ibiFDIq7FD4qVPCQ8WyVQYBHYGv32Uf7ORfCvvI/ETKlmLm4DSYZCvMbjzXn2iP9RUVZwNJpS+095w==
19a5910e-a29a-4f2b-bead-f3bb97a2f258	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-user-attribute-mapper
2660cb9c-686c-4239-b12e-ec1e65265d3b	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-role-list-mapper
0dc11156-5b59-48d9-ac93-0f1b486f9c57	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-full-name-mapper
813533cc-8463-4fd8-956d-590810cdd8f6	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d382e650-63e8-4e2b-b35e-fd180ffcffab	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-address-mapper
a17c12cc-d62b-4e85-98f7-75c57ea9e915	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
c2ad69dc-ffc9-48ae-ab35-17f8abffef26	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-user-property-mapper
595bce19-2406-4b80-9ef4-6222951a872b	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
6660aa17-0907-4ca5-8765-b720b4bb6472	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-user-property-mapper
aac22337-87da-41ae-9671-245d79e793b3	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-role-list-mapper
29f5b278-0280-4656-b082-579527d3a10c	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
06b0e042-d397-4634-b08b-39c48908ba37	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-address-mapper
45140096-ab8e-4c3e-8dad-5fafb291989b	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-user-attribute-mapper
fa2f10fa-2bb5-421e-9ae6-03adf1cc2d94	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
a55d79cc-c36c-4591-b7c9-b7b8920581bb	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
484d1b81-038f-42c9-89d6-235a7cf7c5e1	7649d521-543a-44ee-9757-2580f313c03d	allow-default-scopes	true
8f71564f-2761-4b80-a5e0-ecda76d02946	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	secret	3VLc9jJAmLbdRtm_1MyplBJH9VaHhFKS6bD9YRZXBy2wa3D8po3EywKLNSMurqetDUoryDLHuZ6RXYcJz-LrJA
abb6756e-cc44-4569-a48c-45bad6a67cea	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	algorithm	HS256
5597b58a-4384-41c9-9a17-4aba6542f1d2	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	kid	698cc4e3-ff5c-46a7-bef3-e08359084ef8
690458ef-a37c-4b41-a2db-a0ff1f0bcce4	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	priority	100
055634c3-012e-4f6b-8490-5ee8dd16ffab	fa662f9f-c916-423c-843b-19d549fcc0ff	certificate	MIICozCCAYsCBgGITdLqpTANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApnaG92ZXJibG9nMB4XDTIzMDUyNDEyNTIyOFoXDTMzMDUyNDEyNTQwOFowFTETMBEGA1UEAwwKZ2hvdmVyYmxvZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAM/Uph28zN1MKEGuH4+/yFmVh5RGyye4FjdbyQkoeRmNle4vEIS6ZhE8jwUPYLLxPUJZ8xkdo4XfxUc/lgKLL7LRrLA+IkMizisVHneFmyJX60v28kmUi51WxEH1ZaeXOSlRMEojDqAHMaJIJ6PWkjtarioxwjgqcYS80Qaru1lOGrskxRfxXgI+2aHWBic7YXYTTx0isV+ICoQWPXptoo721ED5KidIhNPOb4Plum0I62WMJXJfgqO3h7B/Z3bouDYsQAIixVYftTv6prrTuz/x3uKRhfYks72sQtEobQqR+FZ1hMiRMOMtdD6I4SzU1Mw15mjgGNqSWYYt9dI6zG8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAfGm+VPiZs54s9gL9C6iPQZNsQ/HV8Klpcs/v6YrZ3NCX0URlzGCTQUeHv2KhynRug6RD/0TDIg+jbSGIzJMuhhwFo3wk51W23Tpg6ri1j3o0ndE6kYUK4ij1d6CueoYH2hpX8sjzCSRSGNzjxNOFwM2pM2KhD9rClVdUTTQ0Oj/W8VjEO0mC+8Ua2Kv2YBElDdVSWMNSgcOhaAoWVOy9wmn3xNQs5MS1ySsq97y2fkR/nshBjdyVglutU+k6q36RLMkqmTzyxnN6vEhbwWkp+cty8Es4JpCxwpx7QFuIndXb+gOE64emWi+Q+nzaSjcvuLquzKBFdYp7+gvAQS/5ow==
2f56c91c-3abf-4080-8715-deaae308d68d	fa662f9f-c916-423c-843b-19d549fcc0ff	algorithm	RSA-OAEP
795933ae-4198-45fd-af7e-6de7e60d42c1	fa662f9f-c916-423c-843b-19d549fcc0ff	privateKey	MIIEowIBAAKCAQEAz9SmHbzM3UwoQa4fj7/IWZWHlEbLJ7gWN1vJCSh5GY2V7i8QhLpmETyPBQ9gsvE9QlnzGR2jhd/FRz+WAosvstGssD4iQyLOKxUed4WbIlfrS/bySZSLnVbEQfVlp5c5KVEwSiMOoAcxokgno9aSO1quKjHCOCpxhLzRBqu7WU4auyTFF/FeAj7ZodYGJzthdhNPHSKxX4gKhBY9em2ijvbUQPkqJ0iE085vg+W6bQjrZYwlcl+Co7eHsH9ndui4NixAAiLFVh+1O/qmutO7P/He4pGF9iSzvaxC0ShtCpH4VnWEyJEw4y10PojhLNTUzDXmaOAY2pJZhi310jrMbwIDAQABAoIBAENkHfV4mimMH2Wk06EmPA4oeY0wI4IepD2RKrAoipQpoBta8Y1Ib/5Y17t5UA7WQNn6FuTnAnZPqEXBLaBnh7EBYnDHxQ5mA9pef8Gb9kD9p1O7oLcRTvBXCU6mBy9/zs5CAFmZ4o0rqAGKSihLVKGgdudBuUvDH4o+O71hBGAhaGxtV1xH7QODpr5LrLLVCWF4DS3KYI/+/7cv6FVC4YRdazYY8NHvKaP0ZKjpdfPa4MoqNA1AjEepIRzwzwubBz9COREr6SlFqoQvdDOhBRRXXdfrO3nIuj1xuK8L0IYEPfnnZqQLnMcs8MCajzCWNfCeWNz/Waa2TNDuCPJ19aECgYEA+Py2VG3MO2FOTRsRyZRfsbX5QVNY6Vj33ZXQc6DkKkWnYx4i9U+qpJq0qnWFlnOMlbdPcVvI+Ju3oHQRCHCDUqWRIiFVGHM8Jz7PnhiALv3CydHb8z86VjmE6XHz2tp6r3MfiBn3CzJ3wSCSZmYnx0f/Z58YCqki4XN7leFjl38CgYEA1a8u8hKVrp2bV0sq4oUg2tvT3PpOBgMr3isl6D2zdF5ItoqwDmEagIAN2S6idUXEH795yeMLwdcS6lTHLZfeXo/5Tecan9NgBYQZ6TdBJPScdlNA0FHwePrrqD46ZQolt2zFD6l0iksHWgbUbTjV9NK9kRg/7y9Hmc//RN3IwxECgYEA4rha3m5MdhWY0yU/ASsWKB/no9BdOb5FlYQBmAh9OvDKBrs+Ydn1LIWi1UTGK8Vz0jBlKnfFfHturbCCggjRy8PvcACiF+12bNYI/5CXyDJR2Kw7eDeuyyz9FgUpY7Nl27UclTXvekauPTGHna6PsiqhKp33ql1w4ZHiiwv9P8kCgYA7nyusI39cP2GOk8ydc6PdLSUKLVUD3HKrBMMI795Yg84qELxa5sEsRY6XoKl3q0Wzzgs/R3iKV2ZRt+HzWMKVA/r9v5PwMFxEbb2FEwO8OfxGD6iv94zvVKPYR7SnaJNpgJHjctavl4uvlORErW0VaI+4IloEdN63jg+duXxA4QKBgC/KjLpOP5G7D+cvEZ1azwXifxUjLX6Y0cf/qlU4Y9oA74fch53NKVgIYoo2Xf4zsZNtHTgz5Zhhh7I6fER9L+ESNIdkBmZqDJyErcQ0D61+4Q+pYjtmqFiQhgEJkhhnW7+jRgCyE3X7FgYnt+T3QnnVfTYMmwmtTr6FQV/7TSQa
ac54e15f-6395-40a0-bac9-fdc2a544ef09	fa662f9f-c916-423c-843b-19d549fcc0ff	priority	100
cb31fb80-436b-4d7f-ada2-d72174918fb7	d13b325f-b4d0-4f95-b50a-f854f8dce599	max-clients	200
2d1e9b37-7705-4c69-bf86-db4d275e44d3	c3a412a6-8bff-4786-843f-9e15a38d0d35	client-uris-must-match	true
b4543d08-5d95-4bb1-bdc9-288f7ca2c042	c3a412a6-8bff-4786-843f-9e15a38d0d35	host-sending-registration-request-must-match	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.composite_role (composite, child_role) FROM stdin;
e4a29918-1207-4149-bbac-7d0d8bdcbb60	f567b46e-425e-40ad-82e0-ff587ca10772
e4a29918-1207-4149-bbac-7d0d8bdcbb60	113976e0-bfc3-4dc7-afe8-0821bdcf0ea9
e4a29918-1207-4149-bbac-7d0d8bdcbb60	95f76c5c-787d-4313-b88b-6ffad83afdd8
e4a29918-1207-4149-bbac-7d0d8bdcbb60	82c08e9c-f4c8-499c-a271-799364d21571
e4a29918-1207-4149-bbac-7d0d8bdcbb60	b2a3b011-2e9c-452c-b196-d87179bc414b
e4a29918-1207-4149-bbac-7d0d8bdcbb60	ba56f276-7a73-4117-9b35-0aa1e4fb2303
e4a29918-1207-4149-bbac-7d0d8bdcbb60	f76985d5-3143-46fb-9b30-aeb9e8878466
e4a29918-1207-4149-bbac-7d0d8bdcbb60	8b401364-ad0a-4667-b956-6ef7ad1f4326
e4a29918-1207-4149-bbac-7d0d8bdcbb60	138b8724-6fc8-40ca-ab34-d7cd0b536997
e4a29918-1207-4149-bbac-7d0d8bdcbb60	10bd1f3d-1909-40f2-91eb-3663f86ab72b
e4a29918-1207-4149-bbac-7d0d8bdcbb60	a8bcd0e8-5bf9-4af1-bbaa-7edacdc0197b
e4a29918-1207-4149-bbac-7d0d8bdcbb60	2508f456-077e-47cc-b03d-8daa815cf03a
e4a29918-1207-4149-bbac-7d0d8bdcbb60	3a5e5066-d6d6-42ed-a922-cbd7f4ff6d30
e4a29918-1207-4149-bbac-7d0d8bdcbb60	150d959d-949b-4897-bfc0-2079a330266b
e4a29918-1207-4149-bbac-7d0d8bdcbb60	cf4c4d0c-96a5-41a6-b754-bdbc52a5fdb1
e4a29918-1207-4149-bbac-7d0d8bdcbb60	9492fd4c-2aa1-4cb5-ab95-dacc6d9e5b85
e4a29918-1207-4149-bbac-7d0d8bdcbb60	d4d636ab-ba0d-4822-b5a3-4d3c32615085
e4a29918-1207-4149-bbac-7d0d8bdcbb60	ad5c04c4-9df3-4765-b740-9399ae68c155
b2a3b011-2e9c-452c-b196-d87179bc414b	9492fd4c-2aa1-4cb5-ab95-dacc6d9e5b85
82c08e9c-f4c8-499c-a271-799364d21571	cf4c4d0c-96a5-41a6-b754-bdbc52a5fdb1
82c08e9c-f4c8-499c-a271-799364d21571	ad5c04c4-9df3-4765-b740-9399ae68c155
8945eff9-ebe4-492b-8429-2b6ccc139aad	001ae7ac-cfcd-442b-80ab-4749c9505c15
8945eff9-ebe4-492b-8429-2b6ccc139aad	d5c543dd-4ccd-4ab2-bee5-7a2d234c5321
d5c543dd-4ccd-4ab2-bee5-7a2d234c5321	638c1fdc-4b2e-4fc9-ae83-294e0b15f553
450b8f3c-9d45-40ad-850f-06b94c736bc4	a9df5345-c3c2-48bb-99b8-7a74407bebd1
e4a29918-1207-4149-bbac-7d0d8bdcbb60	f985dd38-12ff-470c-b4c6-744b39d5cd32
8945eff9-ebe4-492b-8429-2b6ccc139aad	a08231ff-e586-45e2-83cb-f7eafccd9d2d
8945eff9-ebe4-492b-8429-2b6ccc139aad	967ff481-2eba-407c-9a8e-4444556154ac
e4a29918-1207-4149-bbac-7d0d8bdcbb60	9c30d8f9-ce73-4685-a5ae-579c8207bfb8
e4a29918-1207-4149-bbac-7d0d8bdcbb60	3e0f58dd-0365-49eb-94df-1cb2d91edd7b
e4a29918-1207-4149-bbac-7d0d8bdcbb60	a17222fc-f8fc-4779-bd40-c265e237a49e
e4a29918-1207-4149-bbac-7d0d8bdcbb60	98fb112c-d691-43ae-9c2a-2e07e1ce9bd9
e4a29918-1207-4149-bbac-7d0d8bdcbb60	b6ecca21-98f1-42d2-a5d9-dccdffecd574
e4a29918-1207-4149-bbac-7d0d8bdcbb60	d3e281c3-7635-438d-8063-4fff9395e9b4
e4a29918-1207-4149-bbac-7d0d8bdcbb60	eb5ee7e6-d99c-49b1-ad73-c2ab56768af7
e4a29918-1207-4149-bbac-7d0d8bdcbb60	0420ea5f-c3f5-4f58-bbdb-3951f1f8f7de
e4a29918-1207-4149-bbac-7d0d8bdcbb60	79be78a6-2348-493b-b4fb-dd4525fc6185
e4a29918-1207-4149-bbac-7d0d8bdcbb60	b714d690-5b0e-438b-82f4-ef97a289ea4c
e4a29918-1207-4149-bbac-7d0d8bdcbb60	a3046ab9-9fd4-457c-8239-4125c51ea273
e4a29918-1207-4149-bbac-7d0d8bdcbb60	90772378-1b0c-474d-9706-ee0f48cd37a4
e4a29918-1207-4149-bbac-7d0d8bdcbb60	1faf63b5-eb39-44a8-9fb5-65aacbc181f7
e4a29918-1207-4149-bbac-7d0d8bdcbb60	2c0a9a4d-e9d0-471e-ab01-68e405b25263
e4a29918-1207-4149-bbac-7d0d8bdcbb60	911fb8ee-18b5-47ac-9736-d5152b72994b
e4a29918-1207-4149-bbac-7d0d8bdcbb60	4f7d83ba-0c9a-4025-b365-b60b6784b3a5
e4a29918-1207-4149-bbac-7d0d8bdcbb60	0b4b32ad-dbe0-4f57-b13f-edc095b58d00
98fb112c-d691-43ae-9c2a-2e07e1ce9bd9	911fb8ee-18b5-47ac-9736-d5152b72994b
a17222fc-f8fc-4779-bd40-c265e237a49e	2c0a9a4d-e9d0-471e-ab01-68e405b25263
a17222fc-f8fc-4779-bd40-c265e237a49e	0b4b32ad-dbe0-4f57-b13f-edc095b58d00
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
e4a29918-1207-4149-bbac-7d0d8bdcbb60	00e704c6-6443-46f9-8d93-3882e8b95362
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
7744c556-b052-45bf-ad7e-50953c11f43e	\N	password	1b37a9b0-9b60-4848-93d9-447a863c7ad8	1684932848591	\N	{"value":"kUntyl87osbf7RMxxQT+23kNBSw2Wk6RQLImep/n9f4HGHrh5OahwCmf5hyLKVXiLwsTh+iUt0gOuaRluWqyVg==","salt":"meuUhJdCPxeocbWCodoAjQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-05-24 12:53:56.244326	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	4932835682
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-05-24 12:53:56.262641	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	4932835682
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-05-24 12:53:56.333479	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	4932835682
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-05-24 12:53:56.337942	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	4932835682
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-05-24 12:53:56.543392	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	4932835682
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-05-24 12:53:56.547102	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	4932835682
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-05-24 12:53:56.713646	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	4932835682
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-05-24 12:53:56.718438	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	4932835682
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-05-24 12:53:56.727463	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	4932835682
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-05-24 12:53:56.923665	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	4932835682
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-05-24 12:53:57.042365	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	4932835682
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-05-24 12:53:57.047008	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	4932835682
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-05-24 12:53:57.10009	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	4932835682
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-24 12:53:57.145504	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	4932835682
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-24 12:53:57.150184	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	4932835682
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-24 12:53:57.154477	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	4932835682
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-05-24 12:53:57.157162	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	4932835682
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-05-24 12:53:57.262896	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	4932835682
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-05-24 12:53:57.341162	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	4932835682
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-05-24 12:53:57.347482	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	4932835682
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-24 12:53:59.334018	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	4932835682
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-05-24 12:53:57.350377	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	4932835682
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-05-24 12:53:57.35361	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	4932835682
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-05-24 12:53:57.449882	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	4932835682
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-05-24 12:53:57.458526	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	4932835682
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-05-24 12:53:57.461061	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	4932835682
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-05-24 12:53:57.773716	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	4932835682
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-05-24 12:53:57.903235	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	4932835682
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-05-24 12:53:57.909565	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	4932835682
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-05-24 12:53:58.007334	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	4932835682
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-05-24 12:53:58.032348	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	4932835682
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-05-24 12:53:58.064375	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	4932835682
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-05-24 12:53:58.071408	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	4932835682
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-24 12:53:58.079069	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	4932835682
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-24 12:53:58.08175	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	4932835682
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-24 12:53:58.153411	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	4932835682
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-05-24 12:53:58.162179	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	4932835682
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-05-24 12:53:58.172331	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	4932835682
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-05-24 12:53:58.179251	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	4932835682
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-05-24 12:53:58.187064	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	4932835682
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-05-24 12:53:58.190739	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	4932835682
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-05-24 12:53:58.194483	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	4932835682
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-05-24 12:53:58.202976	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	4932835682
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-05-24 12:53:59.321429	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	4932835682
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-05-24 12:53:59.327056	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	4932835682
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-24 12:53:59.34122	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	4932835682
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-24 12:53:59.343864	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	4932835682
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-24 12:53:59.470654	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	4932835682
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-05-24 12:53:59.476832	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	4932835682
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-05-24 12:53:59.545402	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	4932835682
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-05-24 12:53:59.781454	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	4932835682
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-05-24 12:53:59.786016	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	4932835682
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-05-24 12:53:59.790128	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	4932835682
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-05-24 12:53:59.793784	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	4932835682
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-24 12:53:59.801954	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	4932835682
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-24 12:53:59.817259	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	4932835682
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-24 12:53:59.869845	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	4932835682
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-05-24 12:54:00.325149	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	4932835682
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-05-24 12:54:00.375468	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	4932835682
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-05-24 12:54:00.385989	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	4932835682
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-05-24 12:54:00.399168	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	4932835682
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-05-24 12:54:00.405058	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	4932835682
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-05-24 12:54:00.408738	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	4932835682
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-05-24 12:54:00.412615	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	4932835682
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-05-24 12:54:00.416226	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	4932835682
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-05-24 12:54:00.458317	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	4932835682
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-05-24 12:54:00.492692	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	4932835682
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-05-24 12:54:00.498797	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	4932835682
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-05-24 12:54:00.526295	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	4932835682
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-05-24 12:54:00.534599	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	4932835682
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-05-24 12:54:00.540432	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	4932835682
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-24 12:54:00.550876	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	4932835682
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-24 12:54:00.56056	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	4932835682
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-24 12:54:00.562606	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	4932835682
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-24 12:54:00.612192	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	4932835682
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-05-24 12:54:00.634608	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	4932835682
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-24 12:54:00.638969	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	4932835682
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-24 12:54:00.641097	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	4932835682
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-24 12:54:00.685215	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	4932835682
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-05-24 12:54:00.687362	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	4932835682
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-24 12:54:00.706082	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	4932835682
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-24 12:54:00.708375	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	4932835682
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-24 12:54:00.713543	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	4932835682
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-24 12:54:00.715717	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	4932835682
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-05-24 12:54:00.734559	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	4932835682
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-05-24 12:54:00.745601	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	4932835682
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-05-24 12:54:00.770289	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	4932835682
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-05-24 12:54:00.780943	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	4932835682
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-24 12:54:00.788463	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	4932835682
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-24 12:54:00.809007	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	4932835682
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-24 12:54:00.828105	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	4932835682
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-24 12:54:00.854626	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	4932835682
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-24 12:54:00.856946	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	4932835682
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-24 12:54:00.875433	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	4932835682
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-24 12:54:00.878117	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	4932835682
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-05-24 12:54:00.886525	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	4932835682
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-24 12:54:00.942118	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	4932835682
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-24 12:54:00.944323	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	4932835682
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-24 12:54:00.958673	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	4932835682
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-24 12:54:00.978455	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	4932835682
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-24 12:54:00.98084	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	4932835682
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-24 12:54:01.000444	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	4932835682
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-05-24 12:54:01.006526	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	4932835682
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-05-24 12:54:01.015001	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	4932835682
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-05-24 12:54:01.034591	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	4932835682
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-05-24 12:54:01.053762	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	4932835682
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-05-24 12:54:01.060466	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	4932835682
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
8c7aaac8-4834-4bc1-b139-b904b076efc0	f8a96911-f83b-418f-ae62-9e549e706238	f
8c7aaac8-4834-4bc1-b139-b904b076efc0	c63386ab-6583-4e53-a1e9-e3b3177e8e9f	t
8c7aaac8-4834-4bc1-b139-b904b076efc0	87f45f5e-93c9-4930-9c05-288f18aea3d9	t
8c7aaac8-4834-4bc1-b139-b904b076efc0	73543a1f-a869-4a85-98ce-a72f39e85660	t
8c7aaac8-4834-4bc1-b139-b904b076efc0	8e98d761-e0f6-4e89-a50b-f6c612cea8c1	f
8c7aaac8-4834-4bc1-b139-b904b076efc0	f8861c37-9273-438d-b004-8d56bc5a8735	f
8c7aaac8-4834-4bc1-b139-b904b076efc0	2596c46c-972e-4b1d-9b7f-b4137f706f48	t
8c7aaac8-4834-4bc1-b139-b904b076efc0	0efbf1f1-e032-4c4b-a144-ede05950d142	t
8c7aaac8-4834-4bc1-b139-b904b076efc0	2f676434-c963-49bb-a42e-b3dc19aa9b13	f
8c7aaac8-4834-4bc1-b139-b904b076efc0	0e5560e3-3ec9-4d87-9869-fa438367136c	t
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
-- Data for Name: event_entity; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
8945eff9-ebe4-492b-8429-2b6ccc139aad	8c7aaac8-4834-4bc1-b139-b904b076efc0	f	${role_default-roles}	default-roles-master	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N	\N
e4a29918-1207-4149-bbac-7d0d8bdcbb60	8c7aaac8-4834-4bc1-b139-b904b076efc0	f	${role_admin}	admin	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N	\N
f567b46e-425e-40ad-82e0-ff587ca10772	8c7aaac8-4834-4bc1-b139-b904b076efc0	f	${role_create-realm}	create-realm	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N	\N
113976e0-bfc3-4dc7-afe8-0821bdcf0ea9	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_create-client}	create-client	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
95f76c5c-787d-4313-b88b-6ffad83afdd8	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_view-realm}	view-realm	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
82c08e9c-f4c8-499c-a271-799364d21571	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_view-users}	view-users	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
b2a3b011-2e9c-452c-b196-d87179bc414b	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_view-clients}	view-clients	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
ba56f276-7a73-4117-9b35-0aa1e4fb2303	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_view-events}	view-events	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
f76985d5-3143-46fb-9b30-aeb9e8878466	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_view-identity-providers}	view-identity-providers	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
8b401364-ad0a-4667-b956-6ef7ad1f4326	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_view-authorization}	view-authorization	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
138b8724-6fc8-40ca-ab34-d7cd0b536997	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_manage-realm}	manage-realm	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
10bd1f3d-1909-40f2-91eb-3663f86ab72b	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_manage-users}	manage-users	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
a8bcd0e8-5bf9-4af1-bbaa-7edacdc0197b	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_manage-clients}	manage-clients	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
2508f456-077e-47cc-b03d-8daa815cf03a	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_manage-events}	manage-events	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
3a5e5066-d6d6-42ed-a922-cbd7f4ff6d30	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_manage-identity-providers}	manage-identity-providers	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
150d959d-949b-4897-bfc0-2079a330266b	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_manage-authorization}	manage-authorization	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
cf4c4d0c-96a5-41a6-b754-bdbc52a5fdb1	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_query-users}	query-users	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
9492fd4c-2aa1-4cb5-ab95-dacc6d9e5b85	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_query-clients}	query-clients	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
d4d636ab-ba0d-4822-b5a3-4d3c32615085	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_query-realms}	query-realms	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
ad5c04c4-9df3-4765-b740-9399ae68c155	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_query-groups}	query-groups	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
001ae7ac-cfcd-442b-80ab-4749c9505c15	668f6aba-213e-4775-b8ce-08d98a479eae	t	${role_view-profile}	view-profile	8c7aaac8-4834-4bc1-b139-b904b076efc0	668f6aba-213e-4775-b8ce-08d98a479eae	\N
d5c543dd-4ccd-4ab2-bee5-7a2d234c5321	668f6aba-213e-4775-b8ce-08d98a479eae	t	${role_manage-account}	manage-account	8c7aaac8-4834-4bc1-b139-b904b076efc0	668f6aba-213e-4775-b8ce-08d98a479eae	\N
638c1fdc-4b2e-4fc9-ae83-294e0b15f553	668f6aba-213e-4775-b8ce-08d98a479eae	t	${role_manage-account-links}	manage-account-links	8c7aaac8-4834-4bc1-b139-b904b076efc0	668f6aba-213e-4775-b8ce-08d98a479eae	\N
fa24dd90-4835-43ee-9da5-400921729424	668f6aba-213e-4775-b8ce-08d98a479eae	t	${role_view-applications}	view-applications	8c7aaac8-4834-4bc1-b139-b904b076efc0	668f6aba-213e-4775-b8ce-08d98a479eae	\N
a9df5345-c3c2-48bb-99b8-7a74407bebd1	668f6aba-213e-4775-b8ce-08d98a479eae	t	${role_view-consent}	view-consent	8c7aaac8-4834-4bc1-b139-b904b076efc0	668f6aba-213e-4775-b8ce-08d98a479eae	\N
450b8f3c-9d45-40ad-850f-06b94c736bc4	668f6aba-213e-4775-b8ce-08d98a479eae	t	${role_manage-consent}	manage-consent	8c7aaac8-4834-4bc1-b139-b904b076efc0	668f6aba-213e-4775-b8ce-08d98a479eae	\N
e2d4c3c2-2225-4d03-9e94-368fbe92aef8	668f6aba-213e-4775-b8ce-08d98a479eae	t	${role_delete-account}	delete-account	8c7aaac8-4834-4bc1-b139-b904b076efc0	668f6aba-213e-4775-b8ce-08d98a479eae	\N
6967a914-8cea-48a1-9d6e-22f076c72b3b	31d4cc1e-32f9-45fa-84a3-e6d75450c87d	t	${role_read-token}	read-token	8c7aaac8-4834-4bc1-b139-b904b076efc0	31d4cc1e-32f9-45fa-84a3-e6d75450c87d	\N
f985dd38-12ff-470c-b4c6-744b39d5cd32	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	t	${role_impersonation}	impersonation	8c7aaac8-4834-4bc1-b139-b904b076efc0	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	\N
a08231ff-e586-45e2-83cb-f7eafccd9d2d	8c7aaac8-4834-4bc1-b139-b904b076efc0	f	${role_offline-access}	offline_access	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N	\N
967ff481-2eba-407c-9a8e-4444556154ac	8c7aaac8-4834-4bc1-b139-b904b076efc0	f	${role_uma_authorization}	uma_authorization	8c7aaac8-4834-4bc1-b139-b904b076efc0	\N	\N
c8281036-19c6-4d54-92e1-b3efbf04d387	91cb1cd2-e133-4f67-9800-593c809120c8	f	${role_default-roles}	default-roles-ghoverblog	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
9c30d8f9-ce73-4685-a5ae-579c8207bfb8	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_create-client}	create-client	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
3e0f58dd-0365-49eb-94df-1cb2d91edd7b	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_view-realm}	view-realm	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
a17222fc-f8fc-4779-bd40-c265e237a49e	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_view-users}	view-users	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
98fb112c-d691-43ae-9c2a-2e07e1ce9bd9	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_view-clients}	view-clients	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
b6ecca21-98f1-42d2-a5d9-dccdffecd574	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_view-events}	view-events	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
d3e281c3-7635-438d-8063-4fff9395e9b4	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_view-identity-providers}	view-identity-providers	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
eb5ee7e6-d99c-49b1-ad73-c2ab56768af7	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_view-authorization}	view-authorization	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
0420ea5f-c3f5-4f58-bbdb-3951f1f8f7de	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_manage-realm}	manage-realm	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
79be78a6-2348-493b-b4fb-dd4525fc6185	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_manage-users}	manage-users	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
b714d690-5b0e-438b-82f4-ef97a289ea4c	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_manage-clients}	manage-clients	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
a3046ab9-9fd4-457c-8239-4125c51ea273	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_manage-events}	manage-events	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
90772378-1b0c-474d-9706-ee0f48cd37a4	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_manage-identity-providers}	manage-identity-providers	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
1faf63b5-eb39-44a8-9fb5-65aacbc181f7	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_manage-authorization}	manage-authorization	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
2c0a9a4d-e9d0-471e-ab01-68e405b25263	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_query-users}	query-users	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
911fb8ee-18b5-47ac-9736-d5152b72994b	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_query-clients}	query-clients	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
4f7d83ba-0c9a-4025-b365-b60b6784b3a5	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_query-realms}	query-realms	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
0b4b32ad-dbe0-4f57-b13f-edc095b58d00	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_query-groups}	query-groups	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
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
00e704c6-6443-46f9-8d93-3882e8b95362	6e28b55a-cc17-4c70-a96f-f829402fefc7	t	${role_impersonation}	impersonation	8c7aaac8-4834-4bc1-b139-b904b076efc0	6e28b55a-cc17-4c70-a96f-f829402fefc7	\N
e467c577-bd9d-4cd0-b3a1-c1d172921217	91cb1cd2-e133-4f67-9800-593c809120c8	f		admin	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
dd8af6cd-edf4-400a-b4bb-5a8cd9b4e937	91cb1cd2-e133-4f67-9800-593c809120c8	f		user	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.migration_model (id, version, update_time) FROM stdin;
n8vd6	19.0.3	1684932844
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
83e45b24-1353-42ed-9e25-70ab091e6002	audience resolve	openid-connect	oidc-audience-resolve-mapper	69dec60d-c5b1-492d-89b4-574261eaed96	\N
5da94495-486c-43d1-b359-ff6d6ceb3a25	locale	openid-connect	oidc-usermodel-attribute-mapper	d5c9db67-31c6-4309-8a06-296c4e5aeb36	\N
e2cad9f5-25bd-4fd0-b13f-23f129757e86	role list	saml	saml-role-list-mapper	\N	c63386ab-6583-4e53-a1e9-e3b3177e8e9f
501c4a9f-621d-407d-8cf8-f49a1e4aa786	full name	openid-connect	oidc-full-name-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
57e19474-f8b8-4790-a408-1ad7a9f3e610	family name	openid-connect	oidc-usermodel-property-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
bb72f1f2-0525-4be1-a894-77d484eaa14e	given name	openid-connect	oidc-usermodel-property-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
27bdb412-bb29-4a2f-b144-1e4f8ba3a35d	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
0213134c-1c4f-4fca-918c-43f1213d1fd1	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
3e70cbff-39d9-4243-945b-e1ea581b61c3	username	openid-connect	oidc-usermodel-property-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
e815ba3a-1cd7-43f5-8b49-2f057a4bf7b9	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
b348fe24-36e1-4d92-9497-bc25078373c9	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
6e84d385-5071-43dc-82cb-b9cf1c611c3c	website	openid-connect	oidc-usermodel-attribute-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
3094a0cd-9d47-47a1-877b-016fb0d2064d	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
175db509-5246-45ff-a15c-20e412f9e545	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
1ad58c76-4e50-4ff1-96b4-156a3bfa961c	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
bfb5f489-9f6b-4b98-a2ef-866b5b614917	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
5453a5c5-fc5a-4e5a-9521-4416ea1ebfe4	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	87f45f5e-93c9-4930-9c05-288f18aea3d9
00aef0a3-d143-4c22-b75d-7c6aec2096f0	email	openid-connect	oidc-usermodel-property-mapper	\N	73543a1f-a869-4a85-98ce-a72f39e85660
cd0b38af-c145-4beb-9e24-31136d7cf8c6	email verified	openid-connect	oidc-usermodel-property-mapper	\N	73543a1f-a869-4a85-98ce-a72f39e85660
324af5c5-0d48-4189-b949-55be93a54502	address	openid-connect	oidc-address-mapper	\N	8e98d761-e0f6-4e89-a50b-f6c612cea8c1
8700b6b0-d157-4bae-8965-aee8de6949cc	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	f8861c37-9273-438d-b004-8d56bc5a8735
acbf36c6-1722-46b1-a32c-232eeff1cba2	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	f8861c37-9273-438d-b004-8d56bc5a8735
f1e56b28-870a-4e80-96fb-91faf61cac26	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	2596c46c-972e-4b1d-9b7f-b4137f706f48
b434fe7e-62f4-499e-98e7-173ead597b38	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	2596c46c-972e-4b1d-9b7f-b4137f706f48
e6267d14-25cc-4e02-be48-5678da3ae9c0	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	2596c46c-972e-4b1d-9b7f-b4137f706f48
974cd87f-e9e8-4dd2-9cea-293700b1a3ba	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	0efbf1f1-e032-4c4b-a144-ede05950d142
8296c611-38d4-41fd-b7c5-e58730ba5200	upn	openid-connect	oidc-usermodel-property-mapper	\N	2f676434-c963-49bb-a42e-b3dc19aa9b13
d0c87c04-8d99-42d1-bfaf-1cb1f6109f72	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	2f676434-c963-49bb-a42e-b3dc19aa9b13
bec67453-b4da-454f-8a6d-5053fa72aaff	acr loa level	openid-connect	oidc-acr-mapper	\N	0e5560e3-3ec9-4d87-9869-fa438367136c
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
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
5da94495-486c-43d1-b359-ff6d6ceb3a25	true	userinfo.token.claim
5da94495-486c-43d1-b359-ff6d6ceb3a25	locale	user.attribute
5da94495-486c-43d1-b359-ff6d6ceb3a25	true	id.token.claim
5da94495-486c-43d1-b359-ff6d6ceb3a25	true	access.token.claim
5da94495-486c-43d1-b359-ff6d6ceb3a25	locale	claim.name
5da94495-486c-43d1-b359-ff6d6ceb3a25	String	jsonType.label
e2cad9f5-25bd-4fd0-b13f-23f129757e86	false	single
e2cad9f5-25bd-4fd0-b13f-23f129757e86	Basic	attribute.nameformat
e2cad9f5-25bd-4fd0-b13f-23f129757e86	Role	attribute.name
501c4a9f-621d-407d-8cf8-f49a1e4aa786	true	userinfo.token.claim
501c4a9f-621d-407d-8cf8-f49a1e4aa786	true	id.token.claim
501c4a9f-621d-407d-8cf8-f49a1e4aa786	true	access.token.claim
57e19474-f8b8-4790-a408-1ad7a9f3e610	true	userinfo.token.claim
57e19474-f8b8-4790-a408-1ad7a9f3e610	lastName	user.attribute
57e19474-f8b8-4790-a408-1ad7a9f3e610	true	id.token.claim
57e19474-f8b8-4790-a408-1ad7a9f3e610	true	access.token.claim
57e19474-f8b8-4790-a408-1ad7a9f3e610	family_name	claim.name
57e19474-f8b8-4790-a408-1ad7a9f3e610	String	jsonType.label
bb72f1f2-0525-4be1-a894-77d484eaa14e	true	userinfo.token.claim
bb72f1f2-0525-4be1-a894-77d484eaa14e	firstName	user.attribute
bb72f1f2-0525-4be1-a894-77d484eaa14e	true	id.token.claim
bb72f1f2-0525-4be1-a894-77d484eaa14e	true	access.token.claim
bb72f1f2-0525-4be1-a894-77d484eaa14e	given_name	claim.name
bb72f1f2-0525-4be1-a894-77d484eaa14e	String	jsonType.label
27bdb412-bb29-4a2f-b144-1e4f8ba3a35d	true	userinfo.token.claim
27bdb412-bb29-4a2f-b144-1e4f8ba3a35d	middleName	user.attribute
27bdb412-bb29-4a2f-b144-1e4f8ba3a35d	true	id.token.claim
27bdb412-bb29-4a2f-b144-1e4f8ba3a35d	true	access.token.claim
27bdb412-bb29-4a2f-b144-1e4f8ba3a35d	middle_name	claim.name
27bdb412-bb29-4a2f-b144-1e4f8ba3a35d	String	jsonType.label
0213134c-1c4f-4fca-918c-43f1213d1fd1	true	userinfo.token.claim
0213134c-1c4f-4fca-918c-43f1213d1fd1	nickname	user.attribute
0213134c-1c4f-4fca-918c-43f1213d1fd1	true	id.token.claim
0213134c-1c4f-4fca-918c-43f1213d1fd1	true	access.token.claim
0213134c-1c4f-4fca-918c-43f1213d1fd1	nickname	claim.name
0213134c-1c4f-4fca-918c-43f1213d1fd1	String	jsonType.label
3e70cbff-39d9-4243-945b-e1ea581b61c3	true	userinfo.token.claim
3e70cbff-39d9-4243-945b-e1ea581b61c3	username	user.attribute
3e70cbff-39d9-4243-945b-e1ea581b61c3	true	id.token.claim
3e70cbff-39d9-4243-945b-e1ea581b61c3	true	access.token.claim
3e70cbff-39d9-4243-945b-e1ea581b61c3	preferred_username	claim.name
3e70cbff-39d9-4243-945b-e1ea581b61c3	String	jsonType.label
e815ba3a-1cd7-43f5-8b49-2f057a4bf7b9	true	userinfo.token.claim
e815ba3a-1cd7-43f5-8b49-2f057a4bf7b9	profile	user.attribute
e815ba3a-1cd7-43f5-8b49-2f057a4bf7b9	true	id.token.claim
e815ba3a-1cd7-43f5-8b49-2f057a4bf7b9	true	access.token.claim
e815ba3a-1cd7-43f5-8b49-2f057a4bf7b9	profile	claim.name
e815ba3a-1cd7-43f5-8b49-2f057a4bf7b9	String	jsonType.label
b348fe24-36e1-4d92-9497-bc25078373c9	true	userinfo.token.claim
b348fe24-36e1-4d92-9497-bc25078373c9	picture	user.attribute
b348fe24-36e1-4d92-9497-bc25078373c9	true	id.token.claim
b348fe24-36e1-4d92-9497-bc25078373c9	true	access.token.claim
b348fe24-36e1-4d92-9497-bc25078373c9	picture	claim.name
b348fe24-36e1-4d92-9497-bc25078373c9	String	jsonType.label
6e84d385-5071-43dc-82cb-b9cf1c611c3c	true	userinfo.token.claim
6e84d385-5071-43dc-82cb-b9cf1c611c3c	website	user.attribute
6e84d385-5071-43dc-82cb-b9cf1c611c3c	true	id.token.claim
6e84d385-5071-43dc-82cb-b9cf1c611c3c	true	access.token.claim
6e84d385-5071-43dc-82cb-b9cf1c611c3c	website	claim.name
6e84d385-5071-43dc-82cb-b9cf1c611c3c	String	jsonType.label
3094a0cd-9d47-47a1-877b-016fb0d2064d	true	userinfo.token.claim
3094a0cd-9d47-47a1-877b-016fb0d2064d	gender	user.attribute
3094a0cd-9d47-47a1-877b-016fb0d2064d	true	id.token.claim
3094a0cd-9d47-47a1-877b-016fb0d2064d	true	access.token.claim
3094a0cd-9d47-47a1-877b-016fb0d2064d	gender	claim.name
3094a0cd-9d47-47a1-877b-016fb0d2064d	String	jsonType.label
175db509-5246-45ff-a15c-20e412f9e545	true	userinfo.token.claim
175db509-5246-45ff-a15c-20e412f9e545	birthdate	user.attribute
175db509-5246-45ff-a15c-20e412f9e545	true	id.token.claim
175db509-5246-45ff-a15c-20e412f9e545	true	access.token.claim
175db509-5246-45ff-a15c-20e412f9e545	birthdate	claim.name
175db509-5246-45ff-a15c-20e412f9e545	String	jsonType.label
1ad58c76-4e50-4ff1-96b4-156a3bfa961c	true	userinfo.token.claim
1ad58c76-4e50-4ff1-96b4-156a3bfa961c	zoneinfo	user.attribute
1ad58c76-4e50-4ff1-96b4-156a3bfa961c	true	id.token.claim
1ad58c76-4e50-4ff1-96b4-156a3bfa961c	true	access.token.claim
1ad58c76-4e50-4ff1-96b4-156a3bfa961c	zoneinfo	claim.name
1ad58c76-4e50-4ff1-96b4-156a3bfa961c	String	jsonType.label
bfb5f489-9f6b-4b98-a2ef-866b5b614917	true	userinfo.token.claim
bfb5f489-9f6b-4b98-a2ef-866b5b614917	locale	user.attribute
bfb5f489-9f6b-4b98-a2ef-866b5b614917	true	id.token.claim
bfb5f489-9f6b-4b98-a2ef-866b5b614917	true	access.token.claim
bfb5f489-9f6b-4b98-a2ef-866b5b614917	locale	claim.name
bfb5f489-9f6b-4b98-a2ef-866b5b614917	String	jsonType.label
5453a5c5-fc5a-4e5a-9521-4416ea1ebfe4	true	userinfo.token.claim
5453a5c5-fc5a-4e5a-9521-4416ea1ebfe4	updatedAt	user.attribute
5453a5c5-fc5a-4e5a-9521-4416ea1ebfe4	true	id.token.claim
5453a5c5-fc5a-4e5a-9521-4416ea1ebfe4	true	access.token.claim
5453a5c5-fc5a-4e5a-9521-4416ea1ebfe4	updated_at	claim.name
5453a5c5-fc5a-4e5a-9521-4416ea1ebfe4	long	jsonType.label
00aef0a3-d143-4c22-b75d-7c6aec2096f0	true	userinfo.token.claim
00aef0a3-d143-4c22-b75d-7c6aec2096f0	email	user.attribute
00aef0a3-d143-4c22-b75d-7c6aec2096f0	true	id.token.claim
00aef0a3-d143-4c22-b75d-7c6aec2096f0	true	access.token.claim
00aef0a3-d143-4c22-b75d-7c6aec2096f0	email	claim.name
00aef0a3-d143-4c22-b75d-7c6aec2096f0	String	jsonType.label
cd0b38af-c145-4beb-9e24-31136d7cf8c6	true	userinfo.token.claim
cd0b38af-c145-4beb-9e24-31136d7cf8c6	emailVerified	user.attribute
cd0b38af-c145-4beb-9e24-31136d7cf8c6	true	id.token.claim
cd0b38af-c145-4beb-9e24-31136d7cf8c6	true	access.token.claim
cd0b38af-c145-4beb-9e24-31136d7cf8c6	email_verified	claim.name
cd0b38af-c145-4beb-9e24-31136d7cf8c6	boolean	jsonType.label
324af5c5-0d48-4189-b949-55be93a54502	formatted	user.attribute.formatted
324af5c5-0d48-4189-b949-55be93a54502	country	user.attribute.country
324af5c5-0d48-4189-b949-55be93a54502	postal_code	user.attribute.postal_code
324af5c5-0d48-4189-b949-55be93a54502	true	userinfo.token.claim
324af5c5-0d48-4189-b949-55be93a54502	street	user.attribute.street
324af5c5-0d48-4189-b949-55be93a54502	true	id.token.claim
324af5c5-0d48-4189-b949-55be93a54502	region	user.attribute.region
324af5c5-0d48-4189-b949-55be93a54502	true	access.token.claim
324af5c5-0d48-4189-b949-55be93a54502	locality	user.attribute.locality
8700b6b0-d157-4bae-8965-aee8de6949cc	true	userinfo.token.claim
8700b6b0-d157-4bae-8965-aee8de6949cc	phoneNumber	user.attribute
8700b6b0-d157-4bae-8965-aee8de6949cc	true	id.token.claim
8700b6b0-d157-4bae-8965-aee8de6949cc	true	access.token.claim
8700b6b0-d157-4bae-8965-aee8de6949cc	phone_number	claim.name
8700b6b0-d157-4bae-8965-aee8de6949cc	String	jsonType.label
acbf36c6-1722-46b1-a32c-232eeff1cba2	true	userinfo.token.claim
acbf36c6-1722-46b1-a32c-232eeff1cba2	phoneNumberVerified	user.attribute
acbf36c6-1722-46b1-a32c-232eeff1cba2	true	id.token.claim
acbf36c6-1722-46b1-a32c-232eeff1cba2	true	access.token.claim
acbf36c6-1722-46b1-a32c-232eeff1cba2	phone_number_verified	claim.name
acbf36c6-1722-46b1-a32c-232eeff1cba2	boolean	jsonType.label
f1e56b28-870a-4e80-96fb-91faf61cac26	true	multivalued
f1e56b28-870a-4e80-96fb-91faf61cac26	foo	user.attribute
f1e56b28-870a-4e80-96fb-91faf61cac26	true	access.token.claim
f1e56b28-870a-4e80-96fb-91faf61cac26	realm_access.roles	claim.name
f1e56b28-870a-4e80-96fb-91faf61cac26	String	jsonType.label
b434fe7e-62f4-499e-98e7-173ead597b38	true	multivalued
b434fe7e-62f4-499e-98e7-173ead597b38	foo	user.attribute
b434fe7e-62f4-499e-98e7-173ead597b38	true	access.token.claim
b434fe7e-62f4-499e-98e7-173ead597b38	resource_access.${client_id}.roles	claim.name
b434fe7e-62f4-499e-98e7-173ead597b38	String	jsonType.label
8296c611-38d4-41fd-b7c5-e58730ba5200	true	userinfo.token.claim
8296c611-38d4-41fd-b7c5-e58730ba5200	username	user.attribute
8296c611-38d4-41fd-b7c5-e58730ba5200	true	id.token.claim
8296c611-38d4-41fd-b7c5-e58730ba5200	true	access.token.claim
8296c611-38d4-41fd-b7c5-e58730ba5200	upn	claim.name
8296c611-38d4-41fd-b7c5-e58730ba5200	String	jsonType.label
d0c87c04-8d99-42d1-bfaf-1cb1f6109f72	true	multivalued
d0c87c04-8d99-42d1-bfaf-1cb1f6109f72	foo	user.attribute
d0c87c04-8d99-42d1-bfaf-1cb1f6109f72	true	id.token.claim
d0c87c04-8d99-42d1-bfaf-1cb1f6109f72	true	access.token.claim
d0c87c04-8d99-42d1-bfaf-1cb1f6109f72	groups	claim.name
d0c87c04-8d99-42d1-bfaf-1cb1f6109f72	String	jsonType.label
bec67453-b4da-454f-8a6d-5053fa72aaff	true	id.token.claim
bec67453-b4da-454f-8a6d-5053fa72aaff	true	access.token.claim
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
-- Data for Name: realm; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
8c7aaac8-4834-4bc1-b139-b904b076efc0	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	b24b4acb-89a0-4821-a4c0-82bdd5a8e467	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	34573abd-eadf-423a-8fc0-5f127befbff9	78961e85-753e-4adf-bd8d-9d2287157467	3a01df8d-8cf7-4ee1-bd8f-f82fe15405b9	ec7f78d2-ef09-4d2a-85af-e9c0c01a6f1a	4cda879b-ac12-48df-bbbe-cb22c6376c3f	2592000	f	900	t	f	1d8a8069-184c-4dab-8706-b7cfdc6b0dce	0	f	0	0	8945eff9-ebe4-492b-8429-2b6ccc139aad
91cb1cd2-e133-4f67-9800-593c809120c8	60	300	300				t	f	0	ghoverblog	ghoverblog	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	6e28b55a-cc17-4c70-a96f-f829402fefc7	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	e62459b7-7fed-46ef-b152-3290716681b1	b122081f-baaa-4ee0-8bd3-de56d0f0a677	8aaa788b-b8c4-48c1-afa9-6f205d1a7f58	c37a4bd8-d911-4bcb-8c37-15d04669a61c	2519192b-9e5e-4557-a798-c843d62f5591	2592000	f	900	t	f	4e3245cb-5649-479e-be4b-823051d465bf	0	f	0	0	c8281036-19c6-4d54-92e1-b3efbf04d387
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	8c7aaac8-4834-4bc1-b139-b904b076efc0	
_browser_header.xContentTypeOptions	8c7aaac8-4834-4bc1-b139-b904b076efc0	nosniff
_browser_header.xRobotsTag	8c7aaac8-4834-4bc1-b139-b904b076efc0	none
_browser_header.xFrameOptions	8c7aaac8-4834-4bc1-b139-b904b076efc0	SAMEORIGIN
_browser_header.contentSecurityPolicy	8c7aaac8-4834-4bc1-b139-b904b076efc0	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	8c7aaac8-4834-4bc1-b139-b904b076efc0	1; mode=block
_browser_header.strictTransportSecurity	8c7aaac8-4834-4bc1-b139-b904b076efc0	max-age=31536000; includeSubDomains
bruteForceProtected	8c7aaac8-4834-4bc1-b139-b904b076efc0	false
permanentLockout	8c7aaac8-4834-4bc1-b139-b904b076efc0	false
maxFailureWaitSeconds	8c7aaac8-4834-4bc1-b139-b904b076efc0	900
minimumQuickLoginWaitSeconds	8c7aaac8-4834-4bc1-b139-b904b076efc0	60
waitIncrementSeconds	8c7aaac8-4834-4bc1-b139-b904b076efc0	60
quickLoginCheckMilliSeconds	8c7aaac8-4834-4bc1-b139-b904b076efc0	1000
maxDeltaTimeSeconds	8c7aaac8-4834-4bc1-b139-b904b076efc0	43200
failureFactor	8c7aaac8-4834-4bc1-b139-b904b076efc0	30
displayName	8c7aaac8-4834-4bc1-b139-b904b076efc0	Keycloak
displayNameHtml	8c7aaac8-4834-4bc1-b139-b904b076efc0	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	8c7aaac8-4834-4bc1-b139-b904b076efc0	RS256
offlineSessionMaxLifespanEnabled	8c7aaac8-4834-4bc1-b139-b904b076efc0	false
offlineSessionMaxLifespan	8c7aaac8-4834-4bc1-b139-b904b076efc0	5184000
clientSessionIdleTimeout	91cb1cd2-e133-4f67-9800-593c809120c8	0
clientSessionMaxLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	0
clientOfflineSessionIdleTimeout	91cb1cd2-e133-4f67-9800-593c809120c8	0
clientOfflineSessionMaxLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	0
oauth2DeviceCodeLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	600
oauth2DevicePollingInterval	91cb1cd2-e133-4f67-9800-593c809120c8	5
cibaBackchannelTokenDeliveryMode	91cb1cd2-e133-4f67-9800-593c809120c8	poll
cibaExpiresIn	91cb1cd2-e133-4f67-9800-593c809120c8	120
cibaInterval	91cb1cd2-e133-4f67-9800-593c809120c8	5
cibaAuthRequestedUserHint	91cb1cd2-e133-4f67-9800-593c809120c8	login_hint
parRequestUriLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	60
bruteForceProtected	91cb1cd2-e133-4f67-9800-593c809120c8	false
permanentLockout	91cb1cd2-e133-4f67-9800-593c809120c8	false
maxFailureWaitSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	900
minimumQuickLoginWaitSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	60
waitIncrementSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	60
quickLoginCheckMilliSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	1000
maxDeltaTimeSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	43200
failureFactor	91cb1cd2-e133-4f67-9800-593c809120c8	30
actionTokenGeneratedByAdminLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	43200
actionTokenGeneratedByUserLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	300
defaultSignatureAlgorithm	91cb1cd2-e133-4f67-9800-593c809120c8	RS256
offlineSessionMaxLifespanEnabled	91cb1cd2-e133-4f67-9800-593c809120c8	false
offlineSessionMaxLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	5184000
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
client-policies.profiles	91cb1cd2-e133-4f67-9800-593c809120c8	{"profiles":[]}
client-policies.policies	91cb1cd2-e133-4f67-9800-593c809120c8	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	91cb1cd2-e133-4f67-9800-593c809120c8	
_browser_header.xContentTypeOptions	91cb1cd2-e133-4f67-9800-593c809120c8	nosniff
_browser_header.xRobotsTag	91cb1cd2-e133-4f67-9800-593c809120c8	none
_browser_header.xFrameOptions	91cb1cd2-e133-4f67-9800-593c809120c8	SAMEORIGIN
_browser_header.contentSecurityPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	91cb1cd2-e133-4f67-9800-593c809120c8	1; mode=block
_browser_header.strictTransportSecurity	91cb1cd2-e133-4f67-9800-593c809120c8	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.realm_events_listeners (realm_id, value) FROM stdin;
8c7aaac8-4834-4bc1-b139-b904b076efc0	jboss-logging
91cb1cd2-e133-4f67-9800-593c809120c8	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	8c7aaac8-4834-4bc1-b139-b904b076efc0
password	password	t	t	91cb1cd2-e133-4f67-9800-593c809120c8
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.redirect_uris (client_id, value) FROM stdin;
668f6aba-213e-4775-b8ce-08d98a479eae	/realms/master/account/*
69dec60d-c5b1-492d-89b4-574261eaed96	/realms/master/account/*
d5c9db67-31c6-4309-8a06-296c4e5aeb36	/admin/master/console/*
42b5d478-6044-4e3d-aff5-837150682d0c	/realms/ghoverblog/account/*
255e96f7-f58d-4d04-b853-009fefecd80d	/realms/ghoverblog/account/*
85a82e6e-ccb6-4153-8304-3645d119899b	/admin/ghoverblog/console/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
9f3e1d2e-4bda-45b6-8c8a-91d04ec685e7	VERIFY_EMAIL	Verify Email	8c7aaac8-4834-4bc1-b139-b904b076efc0	t	f	VERIFY_EMAIL	50
1fec45e9-5d01-4193-8ceb-b3d356effdbd	UPDATE_PROFILE	Update Profile	8c7aaac8-4834-4bc1-b139-b904b076efc0	t	f	UPDATE_PROFILE	40
fefa0aa6-7650-4b00-ac30-39a5bab715e1	CONFIGURE_TOTP	Configure OTP	8c7aaac8-4834-4bc1-b139-b904b076efc0	t	f	CONFIGURE_TOTP	10
9d2ac3ee-4e20-414b-b1bb-c2a28bec1eb3	UPDATE_PASSWORD	Update Password	8c7aaac8-4834-4bc1-b139-b904b076efc0	t	f	UPDATE_PASSWORD	30
d7eeffcb-41ca-4c9d-9e9d-0d8bb39e0623	terms_and_conditions	Terms and Conditions	8c7aaac8-4834-4bc1-b139-b904b076efc0	f	f	terms_and_conditions	20
2b991c67-68a3-4b82-860a-2d339c7c3fa2	update_user_locale	Update User Locale	8c7aaac8-4834-4bc1-b139-b904b076efc0	t	f	update_user_locale	1000
c5c00fc7-1277-43b9-a4ab-ed88ef2d3cc1	delete_account	Delete Account	8c7aaac8-4834-4bc1-b139-b904b076efc0	f	f	delete_account	60
b974ed36-0096-4c9c-96ff-496b9502c791	webauthn-register	Webauthn Register	8c7aaac8-4834-4bc1-b139-b904b076efc0	t	f	webauthn-register	70
a768c509-cde7-4eea-a9af-5bfc3255380b	webauthn-register-passwordless	Webauthn Register Passwordless	8c7aaac8-4834-4bc1-b139-b904b076efc0	t	f	webauthn-register-passwordless	80
9c1c3775-d732-4be7-9466-a5e2cdb11045	CONFIGURE_TOTP	Configure OTP	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	CONFIGURE_TOTP	10
1a9dd054-7058-4ce5-8498-2bc34464696b	terms_and_conditions	Terms and Conditions	91cb1cd2-e133-4f67-9800-593c809120c8	f	f	terms_and_conditions	20
1c96dfe1-9140-493d-908a-d2fec38d648f	UPDATE_PASSWORD	Update Password	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	UPDATE_PASSWORD	30
9fe0aefe-22c3-4d95-9628-1118bc38d989	UPDATE_PROFILE	Update Profile	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	UPDATE_PROFILE	40
7edd2d0d-879d-445f-92a8-27ec5cbf9ea8	VERIFY_EMAIL	Verify Email	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	VERIFY_EMAIL	50
d9238dab-ef17-4424-be24-c28e649c94b7	delete_account	Delete Account	91cb1cd2-e133-4f67-9800-593c809120c8	f	f	delete_account	60
ac673211-d623-4e8b-9405-7d7c6a5d1e8a	webauthn-register	Webauthn Register	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	webauthn-register	70
65785804-8d2f-48d6-b25d-d52ba9f74eb2	webauthn-register-passwordless	Webauthn Register Passwordless	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	webauthn-register-passwordless	80
cc4a4fa3-8d87-4b33-b1c0-40390a8b9c6d	update_user_locale	Update User Locale	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.scope_mapping (client_id, role_id) FROM stdin;
69dec60d-c5b1-492d-89b4-574261eaed96	d5c543dd-4ccd-4ab2-bee5-7a2d234c5321
255e96f7-f58d-4d04-b853-009fefecd80d	6964e136-e8ce-49f8-b7b1-d04747ec11cd
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
1b37a9b0-9b60-4848-93d9-447a863c7ad8	\N	c20d3d5b-3a4d-445c-a77d-f6971bdea242	f	t	\N	\N	\N	8c7aaac8-4834-4bc1-b139-b904b076efc0	maxime	1684932848562	\N	0
0ffd34fc-d7c6-44de-b10f-ba2a6ac686d6	user_test1@gmail.com	user_test1@gmail.com	f	t	\N	First_user_test1	Last_user_test1	91cb1cd2-e133-4f67-9800-593c809120c8	user_test1	1684932899728	\N	0
6691ff4f-823b-4d86-ad49-4749caf85ffa	user_test2@gmail.com	user_test2@gmail.com	f	t	\N	First_user_test2	Last_user_test2	91cb1cd2-e133-4f67-9800-593c809120c8	user_test2	1684932912678	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_role_mapping (role_id, user_id) FROM stdin;
8945eff9-ebe4-492b-8429-2b6ccc139aad	1b37a9b0-9b60-4848-93d9-447a863c7ad8
e4a29918-1207-4149-bbac-7d0d8bdcbb60	1b37a9b0-9b60-4848-93d9-447a863c7ad8
c8281036-19c6-4d54-92e1-b3efbf04d387	0ffd34fc-d7c6-44de-b10f-ba2a6ac686d6
c8281036-19c6-4d54-92e1-b3efbf04d387	6691ff4f-823b-4d86-ad49-4749caf85ffa
e467c577-bd9d-4cd0-b3a1-c1d172921217	0ffd34fc-d7c6-44de-b10f-ba2a6ac686d6
dd8af6cd-edf4-400a-b4bb-5a8cd9b4e937	0ffd34fc-d7c6-44de-b10f-ba2a6ac686d6
dd8af6cd-edf4-400a-b4bb-5a8cd9b4e937	6691ff4f-823b-4d86-ad49-4749caf85ffa
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: kc_sh; Owner: max_admin
--

COPY kc_sh.web_origins (client_id, value) FROM stdin;
d5c9db67-31c6-4309-8a06-296c4e5aeb36	+
dd60301a-3b36-4b7b-b7f2-538c72209465	*
85a82e6e-ccb6-4153-8304-3645d119899b	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_admin_event_time ON kc_sh.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON kc_sh.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_auth_config_realm ON kc_sh.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_auth_exec_flow ON kc_sh.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_auth_exec_realm_flow ON kc_sh.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_auth_flow_realm ON kc_sh.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_cl_clscope ON kc_sh.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_client_att_by_name_value ON kc_sh.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_client_id ON kc_sh.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_client_init_acc_realm ON kc_sh.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_client_session_session ON kc_sh.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_clscope_attrs ON kc_sh.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_clscope_cl ON kc_sh.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_clscope_protmap ON kc_sh.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_clscope_role ON kc_sh.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_compo_config_compo ON kc_sh.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_component_provider_type ON kc_sh.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_component_realm ON kc_sh.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_composite ON kc_sh.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_composite_child ON kc_sh.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_defcls_realm ON kc_sh.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_defcls_scope ON kc_sh.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_event_time ON kc_sh.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fedidentity_feduser ON kc_sh.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fedidentity_user ON kc_sh.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_attribute ON kc_sh.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_cnsnt_ext ON kc_sh.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_consent ON kc_sh.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_consent_ru ON kc_sh.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_credential ON kc_sh.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_credential_ru ON kc_sh.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_group_membership ON kc_sh.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_group_membership_ru ON kc_sh.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_required_action ON kc_sh.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_required_action_ru ON kc_sh.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_role_mapping ON kc_sh.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_fu_role_mapping_ru ON kc_sh.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_group_attr_group ON kc_sh.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_group_role_mapp_group ON kc_sh.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_id_prov_mapp_realm ON kc_sh.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_ident_prov_realm ON kc_sh.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_keycloak_role_client ON kc_sh.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_keycloak_role_realm ON kc_sh.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_offline_css_preload ON kc_sh.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_offline_uss_by_user ON kc_sh.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_offline_uss_by_usersess ON kc_sh.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_offline_uss_createdon ON kc_sh.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_offline_uss_preload ON kc_sh.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_protocol_mapper_client ON kc_sh.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_realm_attr_realm ON kc_sh.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_realm_clscope ON kc_sh.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_realm_def_grp_realm ON kc_sh.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_realm_evt_list_realm ON kc_sh.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_realm_evt_types_realm ON kc_sh.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_realm_master_adm_cli ON kc_sh.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_realm_supp_local_realm ON kc_sh.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_redir_uri_client ON kc_sh.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_req_act_prov_realm ON kc_sh.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_res_policy_policy ON kc_sh.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_res_scope_scope ON kc_sh.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_res_serv_pol_res_serv ON kc_sh.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_res_srv_res_res_srv ON kc_sh.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_res_srv_scope_res_srv ON kc_sh.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_role_attribute ON kc_sh.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_role_clscope ON kc_sh.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_scope_mapping_role ON kc_sh.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_scope_policy_policy ON kc_sh.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_update_time ON kc_sh.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON kc_sh.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_usconsent_clscope ON kc_sh.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_user_attribute ON kc_sh.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_user_attribute_name ON kc_sh.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_user_consent ON kc_sh.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_user_credential ON kc_sh.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_user_email ON kc_sh.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_user_group_mapping ON kc_sh.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_user_reqactions ON kc_sh.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_user_role_mapping ON kc_sh.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_user_service_account ON kc_sh.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_usr_fed_map_fed_prv ON kc_sh.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_usr_fed_map_realm ON kc_sh.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_usr_fed_prv_realm ON kc_sh.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: kc_sh; Owner: max_admin
--

CREATE INDEX idx_web_orig_client ON kc_sh.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES kc_sh.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES kc_sh.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES kc_sh.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES kc_sh.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES kc_sh.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES kc_sh.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES kc_sh.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES kc_sh.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES kc_sh.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES kc_sh.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES kc_sh.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES kc_sh.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES kc_sh.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES kc_sh.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES kc_sh.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES kc_sh.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES kc_sh.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES kc_sh.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES kc_sh.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES kc_sh.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES kc_sh.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES kc_sh.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES kc_sh.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES kc_sh.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES kc_sh.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES kc_sh.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES kc_sh.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES kc_sh.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES kc_sh.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES kc_sh.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES kc_sh.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES kc_sh.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES kc_sh.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES kc_sh.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES kc_sh.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES kc_sh.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES kc_sh.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES kc_sh.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES kc_sh.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES kc_sh.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES kc_sh.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES kc_sh.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES kc_sh.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES kc_sh.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES kc_sh.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES kc_sh.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES kc_sh.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES kc_sh.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES kc_sh.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES kc_sh.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES kc_sh.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES kc_sh.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES kc_sh.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES kc_sh.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES kc_sh.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES kc_sh.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: kc_sh; Owner: max_admin
--

ALTER TABLE ONLY kc_sh.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES kc_sh.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

