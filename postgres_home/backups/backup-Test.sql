--
-- PostgreSQL database dump
--

-- Dumped from database version 17.1
-- Dumped by pg_dump version 17.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

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
    name character varying(255) NOT NULL,
    value text
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
    value text
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
    user_id character varying(255),
    details_json_long_value text
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
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
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
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
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
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL
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
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
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
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO max_admin;

--
-- Name: org; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO max_admin;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO max_admin;

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
    policy_enforce_mode smallint NOT NULL,
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
    decision_strategy smallint,
    logic smallint,
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
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: max_admin
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO max_admin;

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
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
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
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
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
92abc447-813d-44dd-93e9-deb12d33d9ce	\N	auth-cookie	760ef1ae-18ed-4a3f-90a4-48601a349de5	5c2e6e5d-bc77-46f9-bb55-f883f84bf1b8	2	10	f	\N	\N
3c3d23fa-a233-4591-a166-daa953d78a68	\N	auth-spnego	760ef1ae-18ed-4a3f-90a4-48601a349de5	5c2e6e5d-bc77-46f9-bb55-f883f84bf1b8	3	20	f	\N	\N
64b4fe05-af1a-4db2-9348-22d160d54499	\N	identity-provider-redirector	760ef1ae-18ed-4a3f-90a4-48601a349de5	5c2e6e5d-bc77-46f9-bb55-f883f84bf1b8	2	25	f	\N	\N
66d80e9e-1ff3-400e-aafe-aeeaadc5a84a	\N	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	5c2e6e5d-bc77-46f9-bb55-f883f84bf1b8	2	30	t	e08d631d-1b4e-460e-b1b9-e1f51917ba4a	\N
0c3a4af0-d8ec-43a7-a52f-028bf4037dbf	\N	auth-username-password-form	760ef1ae-18ed-4a3f-90a4-48601a349de5	e08d631d-1b4e-460e-b1b9-e1f51917ba4a	0	10	f	\N	\N
d270e906-4c8d-42f8-82c7-19f047221a3c	\N	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	e08d631d-1b4e-460e-b1b9-e1f51917ba4a	1	20	t	8ecd83fb-61a3-4a07-a00a-f2b5b85085ea	\N
9df7806b-3f15-466d-83f9-5d0921543570	\N	conditional-user-configured	760ef1ae-18ed-4a3f-90a4-48601a349de5	8ecd83fb-61a3-4a07-a00a-f2b5b85085ea	0	10	f	\N	\N
ab6c76f9-c62f-48e3-8a14-85ef1d6fd821	\N	auth-otp-form	760ef1ae-18ed-4a3f-90a4-48601a349de5	8ecd83fb-61a3-4a07-a00a-f2b5b85085ea	0	20	f	\N	\N
41572599-4d1c-490d-bee6-17923cfca86e	\N	direct-grant-validate-username	760ef1ae-18ed-4a3f-90a4-48601a349de5	a2c6ef03-5114-4134-850a-731ab053da4e	0	10	f	\N	\N
448fc3bc-ff49-4557-b9e3-6e9025af20df	\N	direct-grant-validate-password	760ef1ae-18ed-4a3f-90a4-48601a349de5	a2c6ef03-5114-4134-850a-731ab053da4e	0	20	f	\N	\N
60429629-6413-4cbe-be4f-1ca6c18bf8d3	\N	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	a2c6ef03-5114-4134-850a-731ab053da4e	1	30	t	e808922b-419a-4801-ac40-10bd2b379685	\N
9ccc96d0-c3b1-4889-85b9-4bcc864f61ff	\N	conditional-user-configured	760ef1ae-18ed-4a3f-90a4-48601a349de5	e808922b-419a-4801-ac40-10bd2b379685	0	10	f	\N	\N
042b1f10-91d7-4040-8ba9-302e20a38fc2	\N	direct-grant-validate-otp	760ef1ae-18ed-4a3f-90a4-48601a349de5	e808922b-419a-4801-ac40-10bd2b379685	0	20	f	\N	\N
f57f8e84-cac7-4db8-8ce6-98a0c872c7e0	\N	registration-page-form	760ef1ae-18ed-4a3f-90a4-48601a349de5	9cb7b8cb-97d5-4360-bfaa-d4da7059e0a9	0	10	t	d58cc3df-29c0-439a-bb39-f2f1876066de	\N
0af7faba-1864-40b8-8413-e4b0e8ae97f9	\N	registration-user-creation	760ef1ae-18ed-4a3f-90a4-48601a349de5	d58cc3df-29c0-439a-bb39-f2f1876066de	0	20	f	\N	\N
7c3054c7-9b2f-4abe-b8f2-682594b7d62d	\N	registration-password-action	760ef1ae-18ed-4a3f-90a4-48601a349de5	d58cc3df-29c0-439a-bb39-f2f1876066de	0	50	f	\N	\N
7318a21e-1732-45a2-8e35-1d64b9f741d9	\N	registration-recaptcha-action	760ef1ae-18ed-4a3f-90a4-48601a349de5	d58cc3df-29c0-439a-bb39-f2f1876066de	3	60	f	\N	\N
e509daef-bd3c-49c9-93c5-36a46a628991	\N	registration-terms-and-conditions	760ef1ae-18ed-4a3f-90a4-48601a349de5	d58cc3df-29c0-439a-bb39-f2f1876066de	3	70	f	\N	\N
240fa47a-9db5-4ac1-b6c9-fe3953462f8a	\N	reset-credentials-choose-user	760ef1ae-18ed-4a3f-90a4-48601a349de5	11d057e2-2a8c-48e0-8e3a-10ca21f56326	0	10	f	\N	\N
a1729016-4b10-4e44-a94d-cd0c98e31d5d	\N	reset-credential-email	760ef1ae-18ed-4a3f-90a4-48601a349de5	11d057e2-2a8c-48e0-8e3a-10ca21f56326	0	20	f	\N	\N
321b0bf0-2e2c-4a42-bbad-0c3791f7a29a	\N	reset-password	760ef1ae-18ed-4a3f-90a4-48601a349de5	11d057e2-2a8c-48e0-8e3a-10ca21f56326	0	30	f	\N	\N
06793690-2ddb-4f4d-a57d-fc150ec043bf	\N	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	11d057e2-2a8c-48e0-8e3a-10ca21f56326	1	40	t	e15ec7c6-b3da-47bf-99b8-07c3adb9b405	\N
71cd6155-d396-439d-aaec-e388917f24ef	\N	conditional-user-configured	760ef1ae-18ed-4a3f-90a4-48601a349de5	e15ec7c6-b3da-47bf-99b8-07c3adb9b405	0	10	f	\N	\N
4fdf2ab0-18e5-464f-b42a-73827011fbd3	\N	reset-otp	760ef1ae-18ed-4a3f-90a4-48601a349de5	e15ec7c6-b3da-47bf-99b8-07c3adb9b405	0	20	f	\N	\N
1dfd01be-525c-4455-85b7-34c1f6c6b6bf	\N	client-secret	760ef1ae-18ed-4a3f-90a4-48601a349de5	b9b81afc-1183-472f-9ca3-00ac5f807ece	2	10	f	\N	\N
0c239b24-5c85-46df-9aff-3b316cd35a69	\N	client-jwt	760ef1ae-18ed-4a3f-90a4-48601a349de5	b9b81afc-1183-472f-9ca3-00ac5f807ece	2	20	f	\N	\N
2c6d3499-5411-4a7a-b142-49be8cdf1b78	\N	client-secret-jwt	760ef1ae-18ed-4a3f-90a4-48601a349de5	b9b81afc-1183-472f-9ca3-00ac5f807ece	2	30	f	\N	\N
eab68813-9063-4163-ae0b-809292aa173a	\N	client-x509	760ef1ae-18ed-4a3f-90a4-48601a349de5	b9b81afc-1183-472f-9ca3-00ac5f807ece	2	40	f	\N	\N
059e6af2-1d1f-417f-acaa-f400dd56d4c8	\N	idp-review-profile	760ef1ae-18ed-4a3f-90a4-48601a349de5	ce6c6008-4ac3-477b-a3da-3b1d5d13db1d	0	10	f	\N	d8f2bb0f-de5e-4e72-9f9d-17cb189353ff
dc89f8df-3389-4290-beb5-3a507e295cae	\N	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	ce6c6008-4ac3-477b-a3da-3b1d5d13db1d	0	20	t	b4d98483-a134-40cf-ad8c-f910a8691fca	\N
04f50c08-399e-4a85-9fc3-5853dc1a5741	\N	idp-create-user-if-unique	760ef1ae-18ed-4a3f-90a4-48601a349de5	b4d98483-a134-40cf-ad8c-f910a8691fca	2	10	f	\N	38f41290-a060-417f-8825-ae8cdedf6ac2
dd74279e-2c21-417a-a38d-56bf9f9aec89	\N	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	b4d98483-a134-40cf-ad8c-f910a8691fca	2	20	t	309bf699-d8f9-4215-90b8-47c18fdaba28	\N
2c88f137-6fa8-460f-a03a-ed74397d4a12	\N	idp-confirm-link	760ef1ae-18ed-4a3f-90a4-48601a349de5	309bf699-d8f9-4215-90b8-47c18fdaba28	0	10	f	\N	\N
7c8afa0e-211a-4460-ac81-93d480cf4b58	\N	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	309bf699-d8f9-4215-90b8-47c18fdaba28	0	20	t	83b24c55-4782-4a5e-90f4-48f1d0935a2a	\N
8db7d655-1ffc-452a-8a71-a34adbe097ee	\N	idp-email-verification	760ef1ae-18ed-4a3f-90a4-48601a349de5	83b24c55-4782-4a5e-90f4-48f1d0935a2a	2	10	f	\N	\N
2e7272c4-8d6c-4c9d-99ae-3fe1c6b824ac	\N	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	83b24c55-4782-4a5e-90f4-48f1d0935a2a	2	20	t	98eeb5f7-64d4-439b-a48e-206f360af3c7	\N
5e5f50ce-ca46-4194-bd08-ef2a9d58db08	\N	idp-username-password-form	760ef1ae-18ed-4a3f-90a4-48601a349de5	98eeb5f7-64d4-439b-a48e-206f360af3c7	0	10	f	\N	\N
10ecf3ed-c5fb-4877-96a8-beca236e6eea	\N	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	98eeb5f7-64d4-439b-a48e-206f360af3c7	1	20	t	7720006f-e0bb-4902-ad6e-8adfa804b96e	\N
7bd1571f-4ec6-4ce5-bd89-107da957bde5	\N	conditional-user-configured	760ef1ae-18ed-4a3f-90a4-48601a349de5	7720006f-e0bb-4902-ad6e-8adfa804b96e	0	10	f	\N	\N
3f247f69-1abd-4d67-84b6-a7b408557a85	\N	auth-otp-form	760ef1ae-18ed-4a3f-90a4-48601a349de5	7720006f-e0bb-4902-ad6e-8adfa804b96e	0	20	f	\N	\N
e51c2764-b2fd-4e2d-afd8-0648e49339a8	\N	http-basic-authenticator	760ef1ae-18ed-4a3f-90a4-48601a349de5	a00413c4-9530-43b3-a8f2-876b3fec92d0	0	10	f	\N	\N
c8263571-2704-466b-b091-1e4f61480d1a	\N	docker-http-basic-authenticator	760ef1ae-18ed-4a3f-90a4-48601a349de5	222d5acd-349b-4423-bc3e-68980afe4a58	0	10	f	\N	\N
8af3d6f2-4d53-460d-840e-67cfa3b4d46f	\N	idp-email-verification	91cb1cd2-e133-4f67-9800-593c809120c8	1fc4ddf9-a0da-4845-bd06-b894b620d397	2	10	f	\N	\N
454bb899-f4e4-4ae8-9aae-9eaf7435e2e6	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	1fc4ddf9-a0da-4845-bd06-b894b620d397	2	20	t	6a7d693b-4378-4279-83b5-d4dc34cc07b4	\N
9ba47cf5-0b15-4372-b0b6-0924690511d8	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	1cdb2bfa-645d-4b9c-8e82-8a0748424264	0	10	f	\N	\N
e017c29e-eb9d-4dc4-9825-9e92ad064a09	\N	auth-otp-form	91cb1cd2-e133-4f67-9800-593c809120c8	1cdb2bfa-645d-4b9c-8e82-8a0748424264	0	20	f	\N	\N
61a07fb2-b673-410b-abcc-3222b2ea7d51	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	e90bc83d-70cd-433a-b039-a423e910df15	0	10	f	\N	\N
b505d65b-b175-415b-8feb-b56871a9ea29	\N	direct-grant-validate-otp	91cb1cd2-e133-4f67-9800-593c809120c8	e90bc83d-70cd-433a-b039-a423e910df15	0	20	f	\N	\N
fa9420e6-9774-4256-89a6-577624cce260	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	3945574b-5c33-4d33-9cce-4c12a7e6c24c	0	10	f	\N	\N
f53a23da-8c59-47f2-8037-363b2ab9f19e	\N	auth-otp-form	91cb1cd2-e133-4f67-9800-593c809120c8	3945574b-5c33-4d33-9cce-4c12a7e6c24c	0	20	f	\N	\N
fab0c36d-78ba-487b-b392-b16d28c8845f	\N	idp-confirm-link	91cb1cd2-e133-4f67-9800-593c809120c8	bf40da7f-adcf-435e-882b-309ce7c72dfa	0	10	f	\N	\N
d9001e3d-4805-4715-84f2-dd9b1cd12add	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	bf40da7f-adcf-435e-882b-309ce7c72dfa	0	20	t	1fc4ddf9-a0da-4845-bd06-b894b620d397	\N
f6e8bff1-fd00-4b0a-8594-43ce2a10d3b9	\N	conditional-user-configured	91cb1cd2-e133-4f67-9800-593c809120c8	db5526e7-88aa-4faf-b358-450bbd4e1fa0	0	10	f	\N	\N
3e531c8b-640e-42f9-9a0b-5585a243e41b	\N	reset-otp	91cb1cd2-e133-4f67-9800-593c809120c8	db5526e7-88aa-4faf-b358-450bbd4e1fa0	0	20	f	\N	\N
9e9d507f-e5b8-48dc-b24e-433976f5a136	\N	idp-create-user-if-unique	91cb1cd2-e133-4f67-9800-593c809120c8	8fc2cec3-e309-43cd-89f6-2f1f81a1132e	2	10	f	\N	58874d7f-eebc-427a-95e4-1be8461414e5
23046307-a72d-49e3-8f3a-3e714a82086b	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	8fc2cec3-e309-43cd-89f6-2f1f81a1132e	2	20	t	bf40da7f-adcf-435e-882b-309ce7c72dfa	\N
be8577de-56e5-4d8e-a9ea-1a470ed7a70b	\N	idp-username-password-form	91cb1cd2-e133-4f67-9800-593c809120c8	6a7d693b-4378-4279-83b5-d4dc34cc07b4	0	10	f	\N	\N
436e452c-c3c7-4ced-aadd-132e44de8598	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	6a7d693b-4378-4279-83b5-d4dc34cc07b4	1	20	t	3945574b-5c33-4d33-9cce-4c12a7e6c24c	\N
347577f4-f8b0-48d9-900f-63bfa0571cf1	\N	auth-cookie	91cb1cd2-e133-4f67-9800-593c809120c8	e62459b7-7fed-46ef-b152-3290716681b1	2	10	f	\N	\N
72b9ee7a-900b-4e60-bb93-267693508af7	\N	auth-spnego	91cb1cd2-e133-4f67-9800-593c809120c8	e62459b7-7fed-46ef-b152-3290716681b1	3	20	f	\N	\N
bef00466-3c89-4bab-b5a8-064f516c46f0	\N	identity-provider-redirector	91cb1cd2-e133-4f67-9800-593c809120c8	e62459b7-7fed-46ef-b152-3290716681b1	2	25	f	\N	\N
bc5aa141-0b8c-4e6f-a16d-2b71e74a70d0	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	e62459b7-7fed-46ef-b152-3290716681b1	2	30	t	0e63afa7-104b-49af-8467-dad2c2eaea75	\N
732a74cd-aa76-4c4f-9835-a3a297bd637a	\N	client-secret	91cb1cd2-e133-4f67-9800-593c809120c8	2519192b-9e5e-4557-a798-c843d62f5591	2	10	f	\N	\N
89c0863b-b4b5-406d-a239-aacf8a1ab3c2	\N	client-jwt	91cb1cd2-e133-4f67-9800-593c809120c8	2519192b-9e5e-4557-a798-c843d62f5591	2	20	f	\N	\N
d1b9d5ef-1856-4085-927d-f1f754d8a1b4	\N	client-secret-jwt	91cb1cd2-e133-4f67-9800-593c809120c8	2519192b-9e5e-4557-a798-c843d62f5591	2	30	f	\N	\N
4605e824-0a2c-450a-bd39-50b30285900f	\N	client-x509	91cb1cd2-e133-4f67-9800-593c809120c8	2519192b-9e5e-4557-a798-c843d62f5591	2	40	f	\N	\N
c3a82f23-35da-434d-8652-597e9859ea01	\N	direct-grant-validate-username	91cb1cd2-e133-4f67-9800-593c809120c8	8aaa788b-b8c4-48c1-afa9-6f205d1a7f58	0	10	f	\N	\N
019cf507-4e19-4307-929f-ea9023484b79	\N	direct-grant-validate-password	91cb1cd2-e133-4f67-9800-593c809120c8	8aaa788b-b8c4-48c1-afa9-6f205d1a7f58	0	20	f	\N	\N
76f0e332-cd50-4429-8613-c02f0cf3f044	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	8aaa788b-b8c4-48c1-afa9-6f205d1a7f58	1	30	t	e90bc83d-70cd-433a-b039-a423e910df15	\N
de84d406-a9a3-48b3-9912-2d8d36907823	\N	docker-http-basic-authenticator	91cb1cd2-e133-4f67-9800-593c809120c8	4e3245cb-5649-479e-be4b-823051d465bf	0	10	f	\N	\N
b08e336b-4d51-4984-81f9-1d00bd0ace98	\N	idp-review-profile	91cb1cd2-e133-4f67-9800-593c809120c8	a87217ca-2672-4d1b-8c18-1932c91dc1da	0	10	f	\N	14c75fca-1049-4355-8f24-daea1356076f
e6b9f420-5c96-4553-9fc3-20da35315c67	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	a87217ca-2672-4d1b-8c18-1932c91dc1da	0	20	t	8fc2cec3-e309-43cd-89f6-2f1f81a1132e	\N
18aab80a-67f5-424f-bd2e-4e1a4e8a0d85	\N	auth-username-password-form	91cb1cd2-e133-4f67-9800-593c809120c8	0e63afa7-104b-49af-8467-dad2c2eaea75	0	10	f	\N	\N
9a7348a5-d11d-434f-a80c-828d606c65ba	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	0e63afa7-104b-49af-8467-dad2c2eaea75	1	20	t	1cdb2bfa-645d-4b9c-8e82-8a0748424264	\N
f3249a33-360c-4356-8487-ac12882832c0	\N	registration-page-form	91cb1cd2-e133-4f67-9800-593c809120c8	b122081f-baaa-4ee0-8bd3-de56d0f0a677	0	10	t	10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	\N
f6960490-013b-4a25-938a-19d7e6df8a04	\N	registration-user-creation	91cb1cd2-e133-4f67-9800-593c809120c8	10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	0	20	f	\N	\N
5480b260-0b6a-4da7-b299-18e0467e0022	\N	registration-password-action	91cb1cd2-e133-4f67-9800-593c809120c8	10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	0	50	f	\N	\N
9f1a6298-2b22-4fb4-b995-c3ed21267617	\N	registration-recaptcha-action	91cb1cd2-e133-4f67-9800-593c809120c8	10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	3	60	f	\N	\N
55ddcda8-9d33-4820-b52a-8f551ad251e7	\N	reset-credentials-choose-user	91cb1cd2-e133-4f67-9800-593c809120c8	c37a4bd8-d911-4bcb-8c37-15d04669a61c	0	10	f	\N	\N
f4e17f0b-8d1f-41f9-81ed-78320c1b958a	\N	reset-credential-email	91cb1cd2-e133-4f67-9800-593c809120c8	c37a4bd8-d911-4bcb-8c37-15d04669a61c	0	20	f	\N	\N
843d8ccd-bfcf-4086-8318-9431889a354d	\N	reset-password	91cb1cd2-e133-4f67-9800-593c809120c8	c37a4bd8-d911-4bcb-8c37-15d04669a61c	0	30	f	\N	\N
cb8f7d08-2434-4129-9641-1ee98ec208a5	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	c37a4bd8-d911-4bcb-8c37-15d04669a61c	1	40	t	db5526e7-88aa-4faf-b358-450bbd4e1fa0	\N
12c42ffa-a8d1-4809-a141-73fb48c22196	\N	http-basic-authenticator	91cb1cd2-e133-4f67-9800-593c809120c8	1f90b2dc-b4b0-40ed-abed-fa316b7a11b3	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
5c2e6e5d-bc77-46f9-bb55-f883f84bf1b8	browser	Browser based authentication	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	t	t
e08d631d-1b4e-460e-b1b9-e1f51917ba4a	forms	Username, password, otp and other auth forms.	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	f	t
8ecd83fb-61a3-4a07-a00a-f2b5b85085ea	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	f	t
a2c6ef03-5114-4134-850a-731ab053da4e	direct grant	OpenID Connect Resource Owner Grant	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	t	t
e808922b-419a-4801-ac40-10bd2b379685	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	f	t
9cb7b8cb-97d5-4360-bfaa-d4da7059e0a9	registration	Registration flow	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	t	t
d58cc3df-29c0-439a-bb39-f2f1876066de	registration form	Registration form	760ef1ae-18ed-4a3f-90a4-48601a349de5	form-flow	f	t
11d057e2-2a8c-48e0-8e3a-10ca21f56326	reset credentials	Reset credentials for a user if they forgot their password or something	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	t	t
e15ec7c6-b3da-47bf-99b8-07c3adb9b405	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	f	t
b9b81afc-1183-472f-9ca3-00ac5f807ece	clients	Base authentication for clients	760ef1ae-18ed-4a3f-90a4-48601a349de5	client-flow	t	t
ce6c6008-4ac3-477b-a3da-3b1d5d13db1d	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	t	t
b4d98483-a134-40cf-ad8c-f910a8691fca	User creation or linking	Flow for the existing/non-existing user alternatives	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	f	t
309bf699-d8f9-4215-90b8-47c18fdaba28	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	f	t
83b24c55-4782-4a5e-90f4-48f1d0935a2a	Account verification options	Method with which to verity the existing account	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	f	t
98eeb5f7-64d4-439b-a48e-206f360af3c7	Verify Existing Account by Re-authentication	Reauthentication of existing account	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	f	t
7720006f-e0bb-4902-ad6e-8adfa804b96e	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	f	t
a00413c4-9530-43b3-a8f2-876b3fec92d0	saml ecp	SAML ECP Profile Authentication Flow	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	t	t
222d5acd-349b-4423-bc3e-68980afe4a58	docker auth	Used by Docker clients to authenticate against the IDP	760ef1ae-18ed-4a3f-90a4-48601a349de5	basic-flow	t	t
1fc4ddf9-a0da-4845-bd06-b894b620d397	Account verification options	Method with which to verity the existing account	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	f	t
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
b122081f-baaa-4ee0-8bd3-de56d0f0a677	registration	registration flow	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
10d7f5e9-0e13-48ff-8e5e-7517c874e3c5	registration form	registration form	91cb1cd2-e133-4f67-9800-593c809120c8	form-flow	f	t
c37a4bd8-d911-4bcb-8c37-15d04669a61c	reset credentials	Reset credentials for a user if they forgot their password or something	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
1f90b2dc-b4b0-40ed-abed-fa316b7a11b3	saml ecp	SAML ECP Profile Authentication Flow	91cb1cd2-e133-4f67-9800-593c809120c8	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
d8f2bb0f-de5e-4e72-9f9d-17cb189353ff	review profile config	760ef1ae-18ed-4a3f-90a4-48601a349de5
38f41290-a060-417f-8825-ae8cdedf6ac2	create unique user config	760ef1ae-18ed-4a3f-90a4-48601a349de5
58874d7f-eebc-427a-95e4-1be8461414e5	create unique user config	91cb1cd2-e133-4f67-9800-593c809120c8
14c75fca-1049-4355-8f24-daea1356076f	review profile config	91cb1cd2-e133-4f67-9800-593c809120c8
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
38f41290-a060-417f-8825-ae8cdedf6ac2	false	require.password.update.after.registration
d8f2bb0f-de5e-4e72-9f9d-17cb189353ff	missing	update.profile.on.first.login
14c75fca-1049-4355-8f24-daea1356076f	missing	update.profile.on.first.login
58874d7f-eebc-427a-95e4-1be8461414e5	false	require.password.update.after.registration
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
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	f	master-realm	0	f	\N	\N	t	\N	f	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
3fb2d9a5-2ebc-4777-bb33-d197c379a784	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	760ef1ae-18ed-4a3f-90a4-48601a349de5	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
4e55857f-d45e-4593-ad9e-2d7be47f9f53	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	760ef1ae-18ed-4a3f-90a4-48601a349de5	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	t	f	broker	0	f	\N	\N	t	\N	f	760ef1ae-18ed-4a3f-90a4-48601a349de5	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
c6c2d949-ed0e-467d-976f-e582918a2ffb	t	t	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	760ef1ae-18ed-4a3f-90a4-48601a349de5	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	t	t	admin-cli	0	t	\N	\N	f	\N	f	760ef1ae-18ed-4a3f-90a4-48601a349de5	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
6b74e717-72ab-4e3e-b082-4d4362d58d31	t	f	ghoverblog-realm	0	f	\N	\N	t	\N	f	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N	0	f	f	ghoverblog Realm	f	client-secret	\N	\N	\N	t	f	f	f
42b5d478-6044-4e3d-aff5-837150682d0c	t	f	account	0	t	\N	/realms/ghoverblog/account/	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
255e96f7-f58d-4d04-b853-009fefecd80d	t	f	account-console	0	t	\N	/realms/ghoverblog/account/	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
1d288522-1a62-43b1-9932-f23aa8959705	t	f	broker	0	f	\N	\N	t	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	t	t	overblog_DEV	0	t	\N	http://localhost:4200/	f		f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	-1	t	f		f	client-secret	http://localhost:4200/		\N	t	f	t	f
d9471be6-911f-40fd-8e52-a2e7d561fb66	t	t	overblog_DEV_Docker	0	t	\N	https://blog-pre.ghoverblog.ovh/	f		f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	-1	t	f		f	client-secret	https://blog-pre.ghoverblog.ovh/	Client docker de développement . \nVous pouvez soit utilise l'adresse IP via le proxy \nhttps://blog-pre.ghoverblog.ovh/\nSoit en direct depuis votre environnement locale\nhttp://localhost:4200/	\N	t	f	t	f
dd60301a-3b36-4b7b-b7f2-538c72209465	t	t	overblog_NAS	0	t	\N	https://ghoverblog.ovh/	f		f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	-1	t	f		f	client-secret	https://ghoverblog.ovh/		\N	t	f	t	t
72cd9e84-8d11-4a68-a610-227c8d6cded5	t	t	overblog_preprod	0	t	\N	https://blog-pre.ghoverblog.ovh	f		f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	-1	t	f		f	client-secret	https://blog-pre.ghoverblog.ovh		\N	t	f	t	f
de37e667-e65f-4127-88b0-040889a26d6c	t	f	realm-management	0	f	\N	\N	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_realm-management}	t	client-secret	\N	\N	\N	t	f	f	f
85a82e6e-ccb6-4153-8304-3645d119899b	t	t	security-admin-console	0	t	\N	/admin/ghoverblog/console/	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	t	t	admin-cli	0	t	\N	\N	f	\N	f	91cb1cd2-e133-4f67-9800-593c809120c8	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
3fb2d9a5-2ebc-4777-bb33-d197c379a784	post.logout.redirect.uris	+
4e55857f-d45e-4593-ad9e-2d7be47f9f53	post.logout.redirect.uris	+
4e55857f-d45e-4593-ad9e-2d7be47f9f53	pkce.code.challenge.method	S256
c6c2d949-ed0e-467d-976f-e582918a2ffb	post.logout.redirect.uris	+
c6c2d949-ed0e-467d-976f-e582918a2ffb	pkce.code.challenge.method	S256
c6c2d949-ed0e-467d-976f-e582918a2ffb	client.use.lightweight.access.token.enabled	true
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	client.use.lightweight.access.token.enabled	true
42b5d478-6044-4e3d-aff5-837150682d0c	post.logout.redirect.uris	+
255e96f7-f58d-4d04-b853-009fefecd80d	post.logout.redirect.uris	+
255e96f7-f58d-4d04-b853-009fefecd80d	pkce.code.challenge.method	S256
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	post.logout.redirect.uris	+
1d288522-1a62-43b1-9932-f23aa8959705	post.logout.redirect.uris	+
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	oidc.ciba.grant.enabled	false
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	client.secret.creation.time	1718467470
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	backchannel.logout.session.required	true
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	login_theme	ghoverblog
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	post.logout.redirect.uris	http://localhost:4200/*
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	oauth2.device.authorization.grant.enabled	false
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	display.on.consent.screen	false
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	use.jwks.url	false
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	backchannel.logout.revoke.offline.tokens	false
d9471be6-911f-40fd-8e52-a2e7d561fb66	oidc.ciba.grant.enabled	false
d9471be6-911f-40fd-8e52-a2e7d561fb66	backchannel.logout.session.required	true
d9471be6-911f-40fd-8e52-a2e7d561fb66	login_theme	ghoverblog
d9471be6-911f-40fd-8e52-a2e7d561fb66	post.logout.redirect.uris	https://blog-pre.ghoverblog.ovh/*
d9471be6-911f-40fd-8e52-a2e7d561fb66	oauth2.device.authorization.grant.enabled	false
d9471be6-911f-40fd-8e52-a2e7d561fb66	display.on.consent.screen	false
d9471be6-911f-40fd-8e52-a2e7d561fb66	backchannel.logout.revoke.offline.tokens	false
dd60301a-3b36-4b7b-b7f2-538c72209465	oidc.ciba.grant.enabled	false
dd60301a-3b36-4b7b-b7f2-538c72209465	backchannel.logout.session.required	true
dd60301a-3b36-4b7b-b7f2-538c72209465	login_theme	ghoverblog
dd60301a-3b36-4b7b-b7f2-538c72209465	post.logout.redirect.uris	https://ghoverblog.ovh/*
dd60301a-3b36-4b7b-b7f2-538c72209465	display.on.consent.screen	false
dd60301a-3b36-4b7b-b7f2-538c72209465	oauth2.device.authorization.grant.enabled	false
dd60301a-3b36-4b7b-b7f2-538c72209465	backchannel.logout.revoke.offline.tokens	false
72cd9e84-8d11-4a68-a610-227c8d6cded5	oidc.ciba.grant.enabled	false
72cd9e84-8d11-4a68-a610-227c8d6cded5	backchannel.logout.session.required	true
72cd9e84-8d11-4a68-a610-227c8d6cded5	login_theme	ghoverblog
72cd9e84-8d11-4a68-a610-227c8d6cded5	post.logout.redirect.uris	https://blog-pre.ghoverblog.ovh
72cd9e84-8d11-4a68-a610-227c8d6cded5	oauth2.device.authorization.grant.enabled	false
72cd9e84-8d11-4a68-a610-227c8d6cded5	display.on.consent.screen	false
72cd9e84-8d11-4a68-a610-227c8d6cded5	backchannel.logout.revoke.offline.tokens	false
de37e667-e65f-4127-88b0-040889a26d6c	post.logout.redirect.uris	+
85a82e6e-ccb6-4153-8304-3645d119899b	post.logout.redirect.uris	+
85a82e6e-ccb6-4153-8304-3645d119899b	pkce.code.challenge.method	S256
85a82e6e-ccb6-4153-8304-3645d119899b	client.use.lightweight.access.token.enabled	true
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	client.use.lightweight.access.token.enabled	true
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
7200045e-4c7d-441b-b054-2895bb1aea30	offline_access	760ef1ae-18ed-4a3f-90a4-48601a349de5	OpenID Connect built-in scope: offline_access	openid-connect
506c8a68-324a-4f4b-8180-59f144e9d35c	role_list	760ef1ae-18ed-4a3f-90a4-48601a349de5	SAML role list	saml
5144eac9-4751-4e02-996f-59f51393ca51	saml_organization	760ef1ae-18ed-4a3f-90a4-48601a349de5	Organization Membership	saml
5a896f3d-ced0-4ac4-b77a-6e5779790bdd	profile	760ef1ae-18ed-4a3f-90a4-48601a349de5	OpenID Connect built-in scope: profile	openid-connect
e7116a1f-d2b0-455a-993f-5f381afc0275	email	760ef1ae-18ed-4a3f-90a4-48601a349de5	OpenID Connect built-in scope: email	openid-connect
73510cbb-563a-484b-b984-80760a340438	address	760ef1ae-18ed-4a3f-90a4-48601a349de5	OpenID Connect built-in scope: address	openid-connect
f9920369-c5bf-49c3-9a40-44f4f6079bd3	phone	760ef1ae-18ed-4a3f-90a4-48601a349de5	OpenID Connect built-in scope: phone	openid-connect
de10af56-4561-4320-ae90-88440630e099	roles	760ef1ae-18ed-4a3f-90a4-48601a349de5	OpenID Connect scope for add user roles to the access token	openid-connect
286e99b6-b0ff-4318-a22a-f1d8e25548c3	web-origins	760ef1ae-18ed-4a3f-90a4-48601a349de5	OpenID Connect scope for add allowed web origins to the access token	openid-connect
d2e4609f-1aea-4bdb-87fd-79dde8a86a10	microprofile-jwt	760ef1ae-18ed-4a3f-90a4-48601a349de5	Microprofile - JWT built-in scope	openid-connect
33b294e3-6a19-4982-adfe-272c17b3acc8	acr	760ef1ae-18ed-4a3f-90a4-48601a349de5	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
3aca360a-7f10-4be6-a482-b33c1a84fa7b	basic	760ef1ae-18ed-4a3f-90a4-48601a349de5	OpenID Connect scope for add all basic claims to the token	openid-connect
187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	organization	760ef1ae-18ed-4a3f-90a4-48601a349de5	Additional claims about the organization a subject belongs to	openid-connect
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
c16be52b-cff6-4387-8b5f-2485baa1bdfb	basic	91cb1cd2-e133-4f67-9800-593c809120c8	OpenID Connect scope for add all basic claims to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
7200045e-4c7d-441b-b054-2895bb1aea30	true	display.on.consent.screen
7200045e-4c7d-441b-b054-2895bb1aea30	${offlineAccessScopeConsentText}	consent.screen.text
506c8a68-324a-4f4b-8180-59f144e9d35c	true	display.on.consent.screen
506c8a68-324a-4f4b-8180-59f144e9d35c	${samlRoleListScopeConsentText}	consent.screen.text
5144eac9-4751-4e02-996f-59f51393ca51	false	display.on.consent.screen
5a896f3d-ced0-4ac4-b77a-6e5779790bdd	true	display.on.consent.screen
5a896f3d-ced0-4ac4-b77a-6e5779790bdd	${profileScopeConsentText}	consent.screen.text
5a896f3d-ced0-4ac4-b77a-6e5779790bdd	true	include.in.token.scope
e7116a1f-d2b0-455a-993f-5f381afc0275	true	display.on.consent.screen
e7116a1f-d2b0-455a-993f-5f381afc0275	${emailScopeConsentText}	consent.screen.text
e7116a1f-d2b0-455a-993f-5f381afc0275	true	include.in.token.scope
73510cbb-563a-484b-b984-80760a340438	true	display.on.consent.screen
73510cbb-563a-484b-b984-80760a340438	${addressScopeConsentText}	consent.screen.text
73510cbb-563a-484b-b984-80760a340438	true	include.in.token.scope
f9920369-c5bf-49c3-9a40-44f4f6079bd3	true	display.on.consent.screen
f9920369-c5bf-49c3-9a40-44f4f6079bd3	${phoneScopeConsentText}	consent.screen.text
f9920369-c5bf-49c3-9a40-44f4f6079bd3	true	include.in.token.scope
de10af56-4561-4320-ae90-88440630e099	true	display.on.consent.screen
de10af56-4561-4320-ae90-88440630e099	${rolesScopeConsentText}	consent.screen.text
de10af56-4561-4320-ae90-88440630e099	false	include.in.token.scope
286e99b6-b0ff-4318-a22a-f1d8e25548c3	false	display.on.consent.screen
286e99b6-b0ff-4318-a22a-f1d8e25548c3		consent.screen.text
286e99b6-b0ff-4318-a22a-f1d8e25548c3	false	include.in.token.scope
d2e4609f-1aea-4bdb-87fd-79dde8a86a10	false	display.on.consent.screen
d2e4609f-1aea-4bdb-87fd-79dde8a86a10	true	include.in.token.scope
33b294e3-6a19-4982-adfe-272c17b3acc8	false	display.on.consent.screen
33b294e3-6a19-4982-adfe-272c17b3acc8	false	include.in.token.scope
3aca360a-7f10-4be6-a482-b33c1a84fa7b	false	display.on.consent.screen
3aca360a-7f10-4be6-a482-b33c1a84fa7b	false	include.in.token.scope
187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	true	display.on.consent.screen
187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	${organizationScopeConsentText}	consent.screen.text
187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	true	include.in.token.scope
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
c16be52b-cff6-4387-8b5f-2485baa1bdfb	false	display.on.consent.screen
c16be52b-cff6-4387-8b5f-2485baa1bdfb	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
3fb2d9a5-2ebc-4777-bb33-d197c379a784	3aca360a-7f10-4be6-a482-b33c1a84fa7b	t
3fb2d9a5-2ebc-4777-bb33-d197c379a784	e7116a1f-d2b0-455a-993f-5f381afc0275	t
3fb2d9a5-2ebc-4777-bb33-d197c379a784	33b294e3-6a19-4982-adfe-272c17b3acc8	t
3fb2d9a5-2ebc-4777-bb33-d197c379a784	5a896f3d-ced0-4ac4-b77a-6e5779790bdd	t
3fb2d9a5-2ebc-4777-bb33-d197c379a784	de10af56-4561-4320-ae90-88440630e099	t
3fb2d9a5-2ebc-4777-bb33-d197c379a784	286e99b6-b0ff-4318-a22a-f1d8e25548c3	t
3fb2d9a5-2ebc-4777-bb33-d197c379a784	187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	f
3fb2d9a5-2ebc-4777-bb33-d197c379a784	73510cbb-563a-484b-b984-80760a340438	f
3fb2d9a5-2ebc-4777-bb33-d197c379a784	7200045e-4c7d-441b-b054-2895bb1aea30	f
3fb2d9a5-2ebc-4777-bb33-d197c379a784	f9920369-c5bf-49c3-9a40-44f4f6079bd3	f
3fb2d9a5-2ebc-4777-bb33-d197c379a784	d2e4609f-1aea-4bdb-87fd-79dde8a86a10	f
4e55857f-d45e-4593-ad9e-2d7be47f9f53	3aca360a-7f10-4be6-a482-b33c1a84fa7b	t
4e55857f-d45e-4593-ad9e-2d7be47f9f53	e7116a1f-d2b0-455a-993f-5f381afc0275	t
4e55857f-d45e-4593-ad9e-2d7be47f9f53	33b294e3-6a19-4982-adfe-272c17b3acc8	t
4e55857f-d45e-4593-ad9e-2d7be47f9f53	5a896f3d-ced0-4ac4-b77a-6e5779790bdd	t
4e55857f-d45e-4593-ad9e-2d7be47f9f53	de10af56-4561-4320-ae90-88440630e099	t
4e55857f-d45e-4593-ad9e-2d7be47f9f53	286e99b6-b0ff-4318-a22a-f1d8e25548c3	t
4e55857f-d45e-4593-ad9e-2d7be47f9f53	187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	f
4e55857f-d45e-4593-ad9e-2d7be47f9f53	73510cbb-563a-484b-b984-80760a340438	f
4e55857f-d45e-4593-ad9e-2d7be47f9f53	7200045e-4c7d-441b-b054-2895bb1aea30	f
4e55857f-d45e-4593-ad9e-2d7be47f9f53	f9920369-c5bf-49c3-9a40-44f4f6079bd3	f
4e55857f-d45e-4593-ad9e-2d7be47f9f53	d2e4609f-1aea-4bdb-87fd-79dde8a86a10	f
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	3aca360a-7f10-4be6-a482-b33c1a84fa7b	t
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	e7116a1f-d2b0-455a-993f-5f381afc0275	t
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	33b294e3-6a19-4982-adfe-272c17b3acc8	t
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	5a896f3d-ced0-4ac4-b77a-6e5779790bdd	t
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	de10af56-4561-4320-ae90-88440630e099	t
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	286e99b6-b0ff-4318-a22a-f1d8e25548c3	t
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	f
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	73510cbb-563a-484b-b984-80760a340438	f
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	7200045e-4c7d-441b-b054-2895bb1aea30	f
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	f9920369-c5bf-49c3-9a40-44f4f6079bd3	f
e030e5a0-f43b-4eab-bb64-bfec7feb43cf	d2e4609f-1aea-4bdb-87fd-79dde8a86a10	f
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	3aca360a-7f10-4be6-a482-b33c1a84fa7b	t
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	e7116a1f-d2b0-455a-993f-5f381afc0275	t
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	33b294e3-6a19-4982-adfe-272c17b3acc8	t
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	5a896f3d-ced0-4ac4-b77a-6e5779790bdd	t
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	de10af56-4561-4320-ae90-88440630e099	t
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	286e99b6-b0ff-4318-a22a-f1d8e25548c3	t
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	f
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	73510cbb-563a-484b-b984-80760a340438	f
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	7200045e-4c7d-441b-b054-2895bb1aea30	f
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	f9920369-c5bf-49c3-9a40-44f4f6079bd3	f
0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	d2e4609f-1aea-4bdb-87fd-79dde8a86a10	f
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	3aca360a-7f10-4be6-a482-b33c1a84fa7b	t
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	e7116a1f-d2b0-455a-993f-5f381afc0275	t
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	33b294e3-6a19-4982-adfe-272c17b3acc8	t
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	5a896f3d-ced0-4ac4-b77a-6e5779790bdd	t
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	de10af56-4561-4320-ae90-88440630e099	t
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	286e99b6-b0ff-4318-a22a-f1d8e25548c3	t
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	f
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	73510cbb-563a-484b-b984-80760a340438	f
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	7200045e-4c7d-441b-b054-2895bb1aea30	f
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	f9920369-c5bf-49c3-9a40-44f4f6079bd3	f
2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	d2e4609f-1aea-4bdb-87fd-79dde8a86a10	f
c6c2d949-ed0e-467d-976f-e582918a2ffb	3aca360a-7f10-4be6-a482-b33c1a84fa7b	t
c6c2d949-ed0e-467d-976f-e582918a2ffb	e7116a1f-d2b0-455a-993f-5f381afc0275	t
c6c2d949-ed0e-467d-976f-e582918a2ffb	33b294e3-6a19-4982-adfe-272c17b3acc8	t
c6c2d949-ed0e-467d-976f-e582918a2ffb	5a896f3d-ced0-4ac4-b77a-6e5779790bdd	t
c6c2d949-ed0e-467d-976f-e582918a2ffb	de10af56-4561-4320-ae90-88440630e099	t
c6c2d949-ed0e-467d-976f-e582918a2ffb	286e99b6-b0ff-4318-a22a-f1d8e25548c3	t
c6c2d949-ed0e-467d-976f-e582918a2ffb	187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	f
c6c2d949-ed0e-467d-976f-e582918a2ffb	73510cbb-563a-484b-b984-80760a340438	f
c6c2d949-ed0e-467d-976f-e582918a2ffb	7200045e-4c7d-441b-b054-2895bb1aea30	f
c6c2d949-ed0e-467d-976f-e582918a2ffb	f9920369-c5bf-49c3-9a40-44f4f6079bd3	f
c6c2d949-ed0e-467d-976f-e582918a2ffb	d2e4609f-1aea-4bdb-87fd-79dde8a86a10	f
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
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	0a896f39-565a-4c91-812d-4e7d02b9f019	t
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	07700bf6-988b-451a-822e-cdd0c00e2eba	t
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	3f230cc1-3768-41b7-9b22-974aedee8acc	t
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	3a253936-dbc8-4764-8c5c-c046055cb129	f
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
d9471be6-911f-40fd-8e52-a2e7d561fb66	0a896f39-565a-4c91-812d-4e7d02b9f019	t
d9471be6-911f-40fd-8e52-a2e7d561fb66	07700bf6-988b-451a-822e-cdd0c00e2eba	t
d9471be6-911f-40fd-8e52-a2e7d561fb66	3f230cc1-3768-41b7-9b22-974aedee8acc	t
d9471be6-911f-40fd-8e52-a2e7d561fb66	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
d9471be6-911f-40fd-8e52-a2e7d561fb66	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
d9471be6-911f-40fd-8e52-a2e7d561fb66	3a253936-dbc8-4764-8c5c-c046055cb129	f
d9471be6-911f-40fd-8e52-a2e7d561fb66	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
d9471be6-911f-40fd-8e52-a2e7d561fb66	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
d9471be6-911f-40fd-8e52-a2e7d561fb66	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
dd60301a-3b36-4b7b-b7f2-538c72209465	0a896f39-565a-4c91-812d-4e7d02b9f019	t
dd60301a-3b36-4b7b-b7f2-538c72209465	07700bf6-988b-451a-822e-cdd0c00e2eba	t
dd60301a-3b36-4b7b-b7f2-538c72209465	3f230cc1-3768-41b7-9b22-974aedee8acc	t
dd60301a-3b36-4b7b-b7f2-538c72209465	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
dd60301a-3b36-4b7b-b7f2-538c72209465	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
dd60301a-3b36-4b7b-b7f2-538c72209465	3a253936-dbc8-4764-8c5c-c046055cb129	f
dd60301a-3b36-4b7b-b7f2-538c72209465	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
dd60301a-3b36-4b7b-b7f2-538c72209465	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
dd60301a-3b36-4b7b-b7f2-538c72209465	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
72cd9e84-8d11-4a68-a610-227c8d6cded5	0a896f39-565a-4c91-812d-4e7d02b9f019	t
72cd9e84-8d11-4a68-a610-227c8d6cded5	07700bf6-988b-451a-822e-cdd0c00e2eba	t
72cd9e84-8d11-4a68-a610-227c8d6cded5	3f230cc1-3768-41b7-9b22-974aedee8acc	t
72cd9e84-8d11-4a68-a610-227c8d6cded5	ae3a02b3-dab8-4d85-9aa6-00e381d39d88	t
72cd9e84-8d11-4a68-a610-227c8d6cded5	dcd0bee6-81c7-41a4-95c7-8ef471f111ef	t
72cd9e84-8d11-4a68-a610-227c8d6cded5	3a253936-dbc8-4764-8c5c-c046055cb129	f
72cd9e84-8d11-4a68-a610-227c8d6cded5	471a4340-ffd4-490b-99d9-4a5750bab7b5	f
72cd9e84-8d11-4a68-a610-227c8d6cded5	dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	f
72cd9e84-8d11-4a68-a610-227c8d6cded5	3e04b2fc-ca58-4b87-9542-f1dcead4a7e9	f
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
42b5d478-6044-4e3d-aff5-837150682d0c	c16be52b-cff6-4387-8b5f-2485baa1bdfb	t
255e96f7-f58d-4d04-b853-009fefecd80d	c16be52b-cff6-4387-8b5f-2485baa1bdfb	t
84b039a1-d9ab-4ddd-9da6-b4288dd04d5c	c16be52b-cff6-4387-8b5f-2485baa1bdfb	t
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	c16be52b-cff6-4387-8b5f-2485baa1bdfb	t
d9471be6-911f-40fd-8e52-a2e7d561fb66	c16be52b-cff6-4387-8b5f-2485baa1bdfb	t
dd60301a-3b36-4b7b-b7f2-538c72209465	c16be52b-cff6-4387-8b5f-2485baa1bdfb	t
72cd9e84-8d11-4a68-a610-227c8d6cded5	c16be52b-cff6-4387-8b5f-2485baa1bdfb	t
de37e667-e65f-4127-88b0-040889a26d6c	c16be52b-cff6-4387-8b5f-2485baa1bdfb	t
85a82e6e-ccb6-4153-8304-3645d119899b	c16be52b-cff6-4387-8b5f-2485baa1bdfb	t
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
7200045e-4c7d-441b-b054-2895bb1aea30	86541368-548e-4b68-aaba-457b310163cc
dc7933e2-6b63-4e7d-86ee-aae51cb7c7b2	d110694d-134d-4b14-aec0-530415e26704
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
32bc235f-4ba0-4473-b22a-56cb6400b0d8	Trusted Hosts	760ef1ae-18ed-4a3f-90a4-48601a349de5	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	760ef1ae-18ed-4a3f-90a4-48601a349de5	anonymous
19076d9a-0349-4e52-a373-7eeb87fbbb21	Consent Required	760ef1ae-18ed-4a3f-90a4-48601a349de5	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	760ef1ae-18ed-4a3f-90a4-48601a349de5	anonymous
01972bf3-1885-4d3b-9e6d-af1dca40a466	Full Scope Disabled	760ef1ae-18ed-4a3f-90a4-48601a349de5	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	760ef1ae-18ed-4a3f-90a4-48601a349de5	anonymous
9bf7e4cd-00ac-4018-be36-30dabd1c327b	Max Clients Limit	760ef1ae-18ed-4a3f-90a4-48601a349de5	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	760ef1ae-18ed-4a3f-90a4-48601a349de5	anonymous
d894a934-082a-4dd0-b80a-ff1ca91bc9b8	Allowed Protocol Mapper Types	760ef1ae-18ed-4a3f-90a4-48601a349de5	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	760ef1ae-18ed-4a3f-90a4-48601a349de5	anonymous
53953362-179a-47dd-b2d3-6107daa95545	Allowed Client Scopes	760ef1ae-18ed-4a3f-90a4-48601a349de5	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	760ef1ae-18ed-4a3f-90a4-48601a349de5	anonymous
ac316a2e-7ca1-4a53-91a3-3c0128184be8	Allowed Protocol Mapper Types	760ef1ae-18ed-4a3f-90a4-48601a349de5	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	760ef1ae-18ed-4a3f-90a4-48601a349de5	authenticated
a0ab61ea-7f4a-4335-aa47-6bc7cfbbc03a	Allowed Client Scopes	760ef1ae-18ed-4a3f-90a4-48601a349de5	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	760ef1ae-18ed-4a3f-90a4-48601a349de5	authenticated
8e88c26c-ea19-4bcf-9491-1a2d9a727f8f	rsa-generated	760ef1ae-18ed-4a3f-90a4-48601a349de5	rsa-generated	org.keycloak.keys.KeyProvider	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N
fc86dce5-a479-479e-9277-42cea7f9ea07	rsa-enc-generated	760ef1ae-18ed-4a3f-90a4-48601a349de5	rsa-enc-generated	org.keycloak.keys.KeyProvider	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N
b31227cf-8481-4803-8e16-2cec8bcbd81b	hmac-generated-hs512	760ef1ae-18ed-4a3f-90a4-48601a349de5	hmac-generated	org.keycloak.keys.KeyProvider	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N
30673ff9-0dc0-49f9-b260-9ce13cdd67a5	aes-generated	760ef1ae-18ed-4a3f-90a4-48601a349de5	aes-generated	org.keycloak.keys.KeyProvider	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N
a2827d90-b12e-4d60-9853-d95e311ca090	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N
386fa898-2195-4f3d-8fde-939b3877f02e	Allowed Protocol Mapper Types	91cb1cd2-e133-4f67-9800-593c809120c8	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
c75c7476-d846-49e7-ac5d-0362a8351964	Allowed Protocol Mapper Types	91cb1cd2-e133-4f67-9800-593c809120c8	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	authenticated
7649d521-543a-44ee-9757-2580f313c03d	Allowed Client Scopes	91cb1cd2-e133-4f67-9800-593c809120c8	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
84ee0ff6-3d90-4a63-86f6-e096b2b3b55e	Consent Required	91cb1cd2-e133-4f67-9800-593c809120c8	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
b740d88a-7249-4761-b7f4-cbd3a9088c9b	Full Scope Disabled	91cb1cd2-e133-4f67-9800-593c809120c8	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
5c82aadb-b771-4643-93f3-44004ca2276c	Allowed Client Scopes	91cb1cd2-e133-4f67-9800-593c809120c8	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	authenticated
d13b325f-b4d0-4f95-b50a-f854f8dce599	Max Clients Limit	91cb1cd2-e133-4f67-9800-593c809120c8	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
c3a412a6-8bff-4786-843f-9e15a38d0d35	Trusted Hosts	91cb1cd2-e133-4f67-9800-593c809120c8	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	anonymous
d8d8629a-b2dc-4b88-a661-b7bf9c6dfc16	\N	91cb1cd2-e133-4f67-9800-593c809120c8	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
3d7e0de5-7827-4e66-b09c-6b3ee2884e24	hmac-generated	91cb1cd2-e133-4f67-9800-593c809120c8	hmac-generated	org.keycloak.keys.KeyProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
68344544-b0a0-4cdc-a375-c6aaf6da0c01	rsa-generated	91cb1cd2-e133-4f67-9800-593c809120c8	rsa-generated	org.keycloak.keys.KeyProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
2be845c2-1dd4-470c-897c-0c6e77eb3e9c	aes-generated	91cb1cd2-e133-4f67-9800-593c809120c8	aes-generated	org.keycloak.keys.KeyProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
fa662f9f-c916-423c-843b-19d549fcc0ff	rsa-enc-generated	91cb1cd2-e133-4f67-9800-593c809120c8	rsa-enc-generated	org.keycloak.keys.KeyProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
f112b009-12fa-498c-a2f9-c0acb4768fab	hmac-generated-hs512	91cb1cd2-e133-4f67-9800-593c809120c8	hmac-generated	org.keycloak.keys.KeyProvider	91cb1cd2-e133-4f67-9800-593c809120c8	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
30d6bc4c-d4c8-410e-9a83-3215227c896d	32bc235f-4ba0-4473-b22a-56cb6400b0d8	host-sending-registration-request-must-match	true
57bf7456-18e6-4e84-8083-ee4c487c6de1	32bc235f-4ba0-4473-b22a-56cb6400b0d8	client-uris-must-match	true
e8305657-c944-4a2f-a28c-c948522a8d55	53953362-179a-47dd-b2d3-6107daa95545	allow-default-scopes	true
afc3f932-59ce-4216-ad53-a395e557db35	ac316a2e-7ca1-4a53-91a3-3c0128184be8	allowed-protocol-mapper-types	saml-role-list-mapper
e82faa45-2f2e-4445-a461-f5ccbe6ef3a2	ac316a2e-7ca1-4a53-91a3-3c0128184be8	allowed-protocol-mapper-types	oidc-full-name-mapper
1c1c95e9-61de-4b71-9775-038431499789	ac316a2e-7ca1-4a53-91a3-3c0128184be8	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
1b62c803-9350-4d8a-8803-0f163f3743ac	ac316a2e-7ca1-4a53-91a3-3c0128184be8	allowed-protocol-mapper-types	saml-user-attribute-mapper
6c77ec40-5d95-405e-b95e-9acae23abd8c	ac316a2e-7ca1-4a53-91a3-3c0128184be8	allowed-protocol-mapper-types	saml-user-property-mapper
b00e77c8-d03a-40c9-bf1c-31236a253c9e	ac316a2e-7ca1-4a53-91a3-3c0128184be8	allowed-protocol-mapper-types	oidc-address-mapper
87abec03-597f-470b-937d-8e2067613f29	ac316a2e-7ca1-4a53-91a3-3c0128184be8	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
9a61794c-ea06-4f68-b904-66766aaf860b	ac316a2e-7ca1-4a53-91a3-3c0128184be8	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
a5574970-1ce5-446b-bbd6-390ec34480c5	a0ab61ea-7f4a-4335-aa47-6bc7cfbbc03a	allow-default-scopes	true
bd8a88b4-937b-41b7-b21e-c3e3cd78703d	d894a934-082a-4dd0-b80a-ff1ca91bc9b8	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
01da0a57-66c8-4b98-a587-4e61e58a9cc5	d894a934-082a-4dd0-b80a-ff1ca91bc9b8	allowed-protocol-mapper-types	oidc-full-name-mapper
17aba0fc-ef91-4587-94a8-f10e7cdb3c30	d894a934-082a-4dd0-b80a-ff1ca91bc9b8	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
72a7879b-edbb-4bd2-bc69-aac7c9b837f2	d894a934-082a-4dd0-b80a-ff1ca91bc9b8	allowed-protocol-mapper-types	saml-role-list-mapper
dd133e82-6d52-4a98-a254-fbeab93ce3d7	d894a934-082a-4dd0-b80a-ff1ca91bc9b8	allowed-protocol-mapper-types	saml-user-attribute-mapper
5478b898-c961-4490-a7ca-8cf6639c971b	d894a934-082a-4dd0-b80a-ff1ca91bc9b8	allowed-protocol-mapper-types	oidc-address-mapper
e3e5a74c-5ecc-4184-b487-8acfdb86b27a	d894a934-082a-4dd0-b80a-ff1ca91bc9b8	allowed-protocol-mapper-types	saml-user-property-mapper
4b70737a-3f18-4cea-8837-3f678f8e27a5	d894a934-082a-4dd0-b80a-ff1ca91bc9b8	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b5780fb6-a056-46b5-8410-96483064af9d	9bf7e4cd-00ac-4018-be36-30dabd1c327b	max-clients	200
412d4d11-de6c-47b7-802e-882b973abc0b	30673ff9-0dc0-49f9-b260-9ce13cdd67a5	priority	100
a00a18bf-6fb2-4959-81b8-1c1e51eb8f6b	30673ff9-0dc0-49f9-b260-9ce13cdd67a5	kid	3977c16d-e729-441f-9de2-7e461917b1a7
2c6cb865-602d-4d07-915f-346b998e9d51	30673ff9-0dc0-49f9-b260-9ce13cdd67a5	secret	X-QwF8pWTdZRoBTVwYgpsQ
275bc501-a40b-44d6-85dd-751bdface2cd	b31227cf-8481-4803-8e16-2cec8bcbd81b	kid	f4aca57d-d68e-4e7d-8926-2de2f26c002c
3461f98f-e7de-4d08-84f8-aedec2e9b161	b31227cf-8481-4803-8e16-2cec8bcbd81b	secret	q6M2R35bg3ob3vs_ERzwkLhgM2SbGPwa-Xl-dkJj6ak53BCb9s7mJk7e6fu1uem8_Ps8B4qrKm_Zq6mJZaJm6xK7iIzuZkEoVlT2y4RBvwCxJdlWDzngpRDc89TtJS5Q-RdgILALxZUSPdGgJPcs9F2BvNBpijPUr3s_yLJRp0I
fb797a55-b013-45a4-bf8b-79fb85dd5732	b31227cf-8481-4803-8e16-2cec8bcbd81b	priority	100
7a428909-b6cd-4d07-97e7-8da589972540	b31227cf-8481-4803-8e16-2cec8bcbd81b	algorithm	HS512
ed347a25-8a3e-4706-befe-5b01b73a10b8	8e88c26c-ea19-4bcf-9491-1a2d9a727f8f	keyUse	SIG
56ab9747-84c1-4d6d-91f0-f40f31b0ae29	8e88c26c-ea19-4bcf-9491-1a2d9a727f8f	priority	100
174cd2aa-959b-479b-9b77-8b001ed8d8ad	8e88c26c-ea19-4bcf-9491-1a2d9a727f8f	privateKey	MIIEpAIBAAKCAQEA1ZRfkjEwQcTLsaJECUtkh5nLmfDcu86RR4r377yvB52FrjTmMAsHc9zOtw8oxOR6wLQND5/h9qcjOqNLapgWCYPxGNMr8Jvgzl4/XkvCnbSYzMWrdjFXlgM++zHdhkZexYtK2dXC2Gd6O3gx3zLJfOB8cu4Li/CkdCkuAwNgbOupfWtjcLAz4ySDudLNnlrTdaTDaU9pU9XY1SXJE4PbyiM1oYnYIYoM4KXjvx9LrcbU9j5LJbfdfI+HLA2u/B0Rt/1rnQjWB4FrCqegY+oTzBv/oanx35bDMCurU+ckZT+OJ9ObG1W1V0qkJrYMUpgO8wh0Q3Uee2Hqz0BrTCyv7wIDAQABAoIBAEQKJoAeJ29sUC/gr6f+WqJQPmpmLwutfN67yMyY4XGdnw6mT4aSnOcuOrRaofRHjUuCkH6fwo6fJDvz9XyZwrt5Sv9Llr3qCq3znGBf5jnzZJInjr3ybiKeGhxQAHBcTqjD/S50SMREAs6bNdgTB9k+cqbyar9EBD/1NnFDTB6mR7W1ks4HqmEff28XT0ejtyIO/iJkL4uyryvDeGbrMs79ia9tdhsKPcq+jSnQ7fXhBHejV9HHpVNnG+FZN2DtkNpX1/bhoNYCAtoX1appt4rOys6M+2Ynhp4ZCqBoWCp2VnI9WNQlc/b7UcBGFbAz6vFUiVdNh7xpwqGFV65tLQECgYEA62uSjJ7uz5KibUB24oZGC1Kp0Upysro0yWFWS3L83tgcr8aW04rnM+F591ho1JX2IvHFI0rv7tQiv9xr8vd8ri3jVnier+l3AeIzqNqPx5yA6XE7AOZ+mNwRjWue4/8ybnzQhlBU9cVWu7NiJ0KnvkXHoWYMM8ecdcpSt28IJy8CgYEA6EAIji+Thy1X070VaLD/PaGRkPdgIpQCrW1BQLsKwXlK3IJbTBey2eqkKbSMiGvSCjhd/Ym2jl24o2c1uXD7424i+xboQHXAJK/2BIGiqrFa6eIoPasZPCMbwEJYSGhsgjh3NgdHLaA78ucH/sinauCDeFnUu8okkhacOJZh00ECgYEA4fgdcPDVFVUQp4FrG7/6179+1S96rOdi57GQnVdANb6GuooKF/+KMRhKdArehL90xNIAggHaEAp7WGIBE/ROLvpI7qVU3FFiM+Kl53vy6ozkiC5xjkmwVpVWG8KjfwFjrP4NQf81rbq/p+dlXX3zeQWNuvQy3jjJi56qivv+fW0CgYBCUn7e87Eiag1pltZ1Rg4tcGUcS7g1R6UYF1oJ/R/OLi/1lngx25akakAk9L0o+/lIF96nV1s9foAKkZ+i7CPSR5JPt7PtLHMJRwJvOQHV0r3OilnJeoHDTZdQKOIDE2bhLPTGBgAKhHZ6IAWFeZFtkN2aUbTRR6F34mMMOc2HwQKBgQDSD1+4qUZCkLJ+V7gY7HFEa8Mw+bOum4wvPdqnIErtXzNRLpbfDsTZGCUbrOmy+2EzTP0zSqb8zIzYq/RfsvD9hSvUWwr167sDWD1aMQVewDGQmqLA5CXYNa+2PjPlQGBm0Tyr5bZkQs+wZeaGKD5/+tpeQclJZ+T0uVFqroLgjA==
ef6383f6-ded4-4f82-ae13-1a6624a6917a	8e88c26c-ea19-4bcf-9491-1a2d9a727f8f	certificate	MIICmzCCAYMCBgGTRFOV5jANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQxMTE5MTIwNzI4WhcNMzQxMTE5MTIwOTA4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDVlF+SMTBBxMuxokQJS2SHmcuZ8Ny7zpFHivfvvK8HnYWuNOYwCwdz3M63DyjE5HrAtA0Pn+H2pyM6o0tqmBYJg/EY0yvwm+DOXj9eS8KdtJjMxat2MVeWAz77Md2GRl7Fi0rZ1cLYZ3o7eDHfMsl84Hxy7guL8KR0KS4DA2Bs66l9a2NwsDPjJIO50s2eWtN1pMNpT2lT1djVJckTg9vKIzWhidghigzgpeO/H0utxtT2Pkslt918j4csDa78HRG3/WudCNYHgWsKp6Bj6hPMG/+hqfHflsMwK6tT5yRlP44n05sbVbVXSqQmtgxSmA7zCHRDdR57YerPQGtMLK/vAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAM0kIHHHq8UOa1nQv3u5N1FjGbLZwo6pMWripPyeIaS6/7hyIve5+1yr55NgtfKDlsTN+EneUFlfFJ42f0UjUSb5dQbZ9q3SrZI9cfLhyK3hbxKsk+zMbCjri2fc1q0x48mFPRpuf/P70ODfcL6ZhLUC4oaa6yEpw6qY3+FKm9v0FKbg7fPCIDG3XF+F1Jwbwn/ieGHoW9gmjesLrsRQIXwcc8AX9C/6cdHflARp9gAu756p/EZQcTWOOvykHo/45+aZ3gKaMaaEaOgWCRENYktzTzn60tDPheXCtj5PKOAr7132MC8vEFEI0V7GkO+EcgZoeByBOKX7qOc1zNF/sLg=
1998aaef-3493-403a-836d-7ada153512da	a2827d90-b12e-4d60-9853-d95e311ca090	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}
d55e5bc5-0137-41d8-9552-9f30afa33e78	fc86dce5-a479-479e-9277-42cea7f9ea07	keyUse	ENC
a9017930-5ca2-47e6-b7fe-3efeb3c0a5e5	fc86dce5-a479-479e-9277-42cea7f9ea07	algorithm	RSA-OAEP
e381c598-f887-4dd5-bcef-95ebc0c92d3b	fc86dce5-a479-479e-9277-42cea7f9ea07	privateKey	MIIEpAIBAAKCAQEAwfC2rEi8Uhnm7YXw0DYxmuNLQSUZtWaA06PQlDb/sMYl93fUxZi2TKDsxBqnORYFiFv3ewvEpk2CN7CmI50PvYgwiYg6BCvypb9H9PrIXyYdIksDxGr6oabMW27qKaSLDRv9A6QETzrCcyBiQMSc9aMxVWuAOcQiRKfo7+MkRWSsNeEHrTo4T9vl3M4es9ST8xV1OQfEFbupk70o0jjJerf4bonaN2UT49T5TE6FnNQGIz5UhQ/L+frkqnMJJr/VricQRtCyhPgxsP5/enZpmpmC7RixAXwLGL4YYUZ7Qt43Ykhg8pC/UBmDBCVsC64r6+IbR1dsCw+kXaEXhhrbawIDAQABAoIBABHhJfFZKhkGYuThiC0LdsqsPlTAEMNjMuippA7EYt5o57jz6hpANQirsPHdV5Ud0IT2ayjqK1PkaZpfvz+7EmeE32pDTfHythKNjjRps42BRbm5IU/hriYdngTZ6cQADU+4LyNZFiQ4999F2R9wFA/zRRbDOK8ndu9OBl2pp6WvJ4HtnsbQQ4e/wrAGCb3q4bEMrQGv3hPJwQZrmxgNxPxfIOx+T6HIncvU56/1egsoXECgCwYAd+m35A0PTsqFDrFzFlo7hx5K5hww2Q7sLjarUqc92YakqjmP2cd379/G1hgD/BGASMUgdXhR1Q5C07tRiFw5EmgsJ/XiWgfxrAECgYEA5Wg80VzhTX16wZWihlzknxVURsEug1EgikLdDYBbbn1WAuKUm8TIu8haNMCX2O3Oc0Wuhiu/euvMCX4gwSZ4AhDFPqQ+K/sBwPVYxyUjiZTwrOGJJ3jIkPmi6zjbcnghXxYLurfWdrz2w7m98zpDIjxlEVIynvqTk5UDcHZTJAECgYEA2Gv62PT27cMEJiWxKoq2ow4vkEDFn8ciWAfBPkTXaLzDKpklgvuPOzRGXwokGejr2IG2/Q1iueGaxYYU12qiJu/F3VuzGRk8BplP1RiIYR6Y8AlyPlN/GYGri2tZvJ3/eFAmDb3nxiPcQU5oez3vRNQ1XYpCA7DvlGGf6h8+z2sCgYEAgSezfee9zOPFVfHJw73O1SWsAf3HExV8rXrBe1V1pHoaD5vDMQOUQ+yjpKl9lBsmrU1g2ZcNwcW5ZOrGxBfFXtxUQFU1z4sMzLcU2WG2ZUIeUibUEg31VXHGYIntOsAZgbAmwGO58bWndEBBiguWOlMoT50odMr8hQ1TF2D2pAECgYEAou5wFIQfnpJR/lIkFi4GH62fW0+YOJjXn0R/VFzJex2ZJOnVFs5CX8UUMZrV4Pe9DuthExPPvrc9KPWvnRm3Z+7dnK/bnsqjqSgktP5aNhut8hB6hLehmVdJCZZRIbIlUbOtYm0VH9OBj1zzRc0z5DKK1pgu6M59H817cewCAm8CgYBHCy6Duh339oa48P9nhp61UlPKO5oRtsueopF5SlfpYnxGq4IOCYpLngk9VlT9bgJEodM6N+veCQRFMafw8basNgbq1uN5mfA677VSYxZOlCBbAaJX5VCCyvA4a5aqJmkBtrBZjFI+XYLR5tG5VjOhatok11YVLSesbvmM62KIXw==
e475de3e-e535-4bf5-a927-ff7c26c3d00f	fc86dce5-a479-479e-9277-42cea7f9ea07	certificate	MIICmzCCAYMCBgGTRFOXtzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQxMTE5MTIwNzI5WhcNMzQxMTE5MTIwOTA5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDB8LasSLxSGebthfDQNjGa40tBJRm1ZoDTo9CUNv+wxiX3d9TFmLZMoOzEGqc5FgWIW/d7C8SmTYI3sKYjnQ+9iDCJiDoEK/Klv0f0+shfJh0iSwPEavqhpsxbbuoppIsNG/0DpARPOsJzIGJAxJz1ozFVa4A5xCJEp+jv4yRFZKw14QetOjhP2+Xczh6z1JPzFXU5B8QVu6mTvSjSOMl6t/huido3ZRPj1PlMToWc1AYjPlSFD8v5+uSqcwkmv9WuJxBG0LKE+DGw/n96dmmamYLtGLEBfAsYvhhhRntC3jdiSGDykL9QGYMEJWwLrivr4htHV2wLD6RdoReGGttrAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAD0jePR65aJvCDo1N4k0N5/yvNrbbTovS9r+UQr/OYiQ2tu5AXqTsY1QhL8rGBgl6JEqAGVfdA66nBiQP1cj2U4h6A7L3S+dWm3SRwxSGJ7vfBFamDAPycZ69Wk+CUagkcNUaRMy2FHrdmqyJ6givIV353u3OOSh4y+vm1yWUjupmVCC/mCOxopIERmgW6lO2PFPIOa8ELvytO1k0CW0tIJY/naPGj1dIjKvCKXky6+hR5IpCvqwSzyc+J0WtGz50UIwcgTTiN7jJ2epn1hBUThKqran6Yf07wdyI+AlZAaL3mtYbF6yII1WP79UMcTym8dcS+RG6DQ4bNAr7BCosiQ=
ce63dcd1-6585-47e2-8f85-8544128bcb03	fc86dce5-a479-479e-9277-42cea7f9ea07	priority	100
8797e1ca-c8d4-4401-ba28-eb670aa3641c	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-user-property-mapper
c9bf3e8c-d0f4-463e-9bf4-3631318ad85f	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
f36e44eb-8645-44c3-bc01-75435a751a35	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
84ccedda-baf0-4763-a392-d85610f6d83b	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
76943f9c-cccb-4fb8-af68-3272da1cc121	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-user-attribute-mapper
988a404b-d759-4469-8c4d-d7a5b33cd732	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-full-name-mapper
86be671c-edca-4f1f-8d5b-3264bc6ab3f1	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	saml-role-list-mapper
4c931fa8-2650-4f5d-9498-c353238641e8	386fa898-2195-4f3d-8fde-939b3877f02e	allowed-protocol-mapper-types	oidc-address-mapper
2182d431-8edd-42fb-a217-fb09a26342cb	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-role-list-mapper
829a5113-0819-4a33-b4c4-7282c9eed3e7	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-full-name-mapper
70248f9e-f41c-4ab4-bb5c-060e0dd8f74a	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-user-attribute-mapper
50d3bf7f-326c-41f6-942c-71565ac21acd	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
ddf13c76-ffc6-406b-95a1-7235e17aee93	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	saml-user-property-mapper
9ad1dccf-5331-4d57-bcaf-2ed789a5c8c5	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-address-mapper
20ac1cfc-4865-42f1-95b3-9e3b6cadce3e	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
c75ebb85-ac0e-414c-b878-7825cfcf43b6	c75c7476-d846-49e7-ac5d-0362a8351964	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
10564164-9aa1-479f-abe8-944b6b3aa632	7649d521-543a-44ee-9757-2580f313c03d	allow-default-scopes	true
f312c6ed-b64c-4546-bf01-7dd9657daef8	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	algorithm	HS256
5abaea15-2ffa-41a5-b88e-cdbb5789974e	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	secret	hMg4u1Oh2CNmFa4EIM7NuIMkIu4DZLZYxkAOGZHmjScg3gdNT_13sikp24zKIFwim0KtSdkOl-5F6EDCjOK-6c6vc9YQOserkZ8FOkyHHSC2ytmvs5pnnDE2sero3XtGWJlICvm2NvRfbY6pmfqiiB77T-ZrKjC96Aqi8Cdqejs
301bc658-7a20-4d93-ad3f-6d3aa854db71	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	priority	100
0119789c-9258-41b9-acb7-50930cf5e0bb	3d7e0de5-7827-4e66-b09c-6b3ee2884e24	kid	3d0c45c7-f6f5-4088-8ee4-94f3b3e03e4c
a5e1dafe-f55c-4dc9-bcc0-e37a6caf5265	68344544-b0a0-4cdc-a375-c6aaf6da0c01	privateKey	MIIEowIBAAKCAQEAv69p1eW7itoTrwpkxkia+YDrJgd3u6xDQc0JEdDbR7+K+CAuTauNO1k+Gm2RxFEyWG41s4/lJVt6QL/CB0h8r8JQky7x28XdX3D43BIshHHlkrkC9AyhyQY1sZeynDPZhWjb96JNsWOgwsPM0a/KqfZ0ZfiCvQIXPlEG4v1/dJZv00xeafUylLo6iMPrbndegXkyz1lHRLgZGpCgLkKOU2uHtScqSdqRN13tdcqB5NP/5p0pqVs7ncWuEK2Gbjf5WPXcRjYohzZnPrUV5BAZCcQ5JekEby89QrYNliLvhoZftosyACKvnnPvOu5bcjSUthG2HXaSkOMJrBQu94wAbwIDAQABAoIBAFqpp5fVdJpsojHA60BDuBU5zj7q+k1IYXledqM4E3dAmATbB7uR4BeJks+iMndV5kegPQMklL/SICU+7ZFPTjY9ZKnw4tFNqXKKdxJ0AB1W17xJiKWQ0fbIWp4Yf5DVD1XD7oKWgEPeOPvV62rkSCmSmaRfYcrvEbpWTbkQKHgmGpmMU3BDSkxcWHEeJK+rGiE7xQfd8+lLB4EQ1QzaeV17tPFoHoY8n0zQ6EY//X2iTZ9Qua4XtnfdvFFV3DZsjLNYHLJcMGCnBSdDccne4r5ScklEO9P8cn6w1beCQdWeDteCEjIzeLRr8iVDdFJELbYxDayBca/IwYfsIWEcj1kCgYEA9mjaAyVVnjwFjIe50hpeyNhfEqIPWm8bguMA7s85rw3YWAUzJ2JdV6BviprYc2Vb8Mrdg7ZgE2IpWBdQ/TgwnL0knRAsd+EDyylaxAkIJO3xs9l0GFWDt6mf7VXbO1ZfTosAi/1v4/BSLfKRQVssNJnaDzD6+CqYTIAn+tjkv1kCgYEAxyVOI1GM7kZKsFRGPIuXomvxXuz1IFaEv+gEyMAKoBWnL3ag+XlWTi3Zenph3ICvSYNeOFQRRgaL8eLMEdqA2ttLp0JJV5z3HHzhGx5Fr8Yz2EW5x1WwJI153x6yON2adVkSnDreaSeIsPc/7m64RBO4mdERJo+MhXG+qZcFTQcCgYATg34wXZaIL2ypEl6O2vPCqA/vY9IfcUkWdm+uec6xpEELx22jotCNjfEHYvfdO5uqWAZu1dSJ9G4dwcryIq8G2pu5rHw5CiLIxf+gIq74bbeEbKYa/zqtIsu9ed0gt9hYWf2zGGDyBigb52fFazj2+XAhX9mgKY9iD4wa+24yEQKBgAvH7DBwsZqi8+Yshh8szuKf6h6IfBPWqnHD4wyRN8+ymDpZlTpM8EsdsUDqnoFx52y85cUFTCRNXNgJZ7Mirv7DfF0/saEKOyAnTxXQm6TDX+vKbCwbqJjw+aW2ZiqxCWMpys0NOn0UBqUZa2HKkQIN/Jy03oPeeByo1vOnaHvfAoGBAJk6MDxDFHoXW+ORaDd1bScaugJ4Ywx7EuW+KLu2Invk7eWL1Tm2kedyZlt/wwiW8eBOTZfuS7X0reHxHu7REFWzR4RAK98yKx9K8oVoERZeityRj/9OM95+sK9ZKA/UhCQrIEMEJupo0m38KcbKS4cL1yOV+quWiYPzfvMYnKcb
33e7044c-a225-49ab-90ed-a0c3a04a3ceb	68344544-b0a0-4cdc-a375-c6aaf6da0c01	priority	100
bf0d08e3-bdc6-485e-862b-e11cb2fde6ec	68344544-b0a0-4cdc-a375-c6aaf6da0c01	certificate	MIICozCCAYsCBgGTRFO3jjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApnaG92ZXJibG9nMB4XDTI0MTExOTEyMDczN1oXDTM0MTExOTEyMDkxN1owFTETMBEGA1UEAwwKZ2hvdmVyYmxvZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL+vadXlu4raE68KZMZImvmA6yYHd7usQ0HNCRHQ20e/ivggLk2rjTtZPhptkcRRMlhuNbOP5SVbekC/wgdIfK/CUJMu8dvF3V9w+NwSLIRx5ZK5AvQMockGNbGXspwz2YVo2/eiTbFjoMLDzNGvyqn2dGX4gr0CFz5RBuL9f3SWb9NMXmn1MpS6OojD6253XoF5Ms9ZR0S4GRqQoC5CjlNrh7UnKknakTdd7XXKgeTT/+adKalbO53FrhCthm43+Vj13EY2KIc2Zz61FeQQGQnEOSXpBG8vPUK2DZYi74aGX7aLMgAir55z7zruW3I0lLYRth12kpDjCawULveMAG8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAch0e9JjwY4U/pA6ACnpku1VmHFpDEliK2yq+gVwkG8MFanOY2Eupapuh8EbSre5fjspWcpLcLXFpwe8uHpAtNNOHSEoOYapW4hUo1pBioOPrihG6qf9Y8Lav1qEUFhMTNgTdZfJKNZA/6Y9wR6/mwaMFaM2DXToMGBDZyd+S+rnJsHGhDqsa2zAm+5D46WVg2OKAocKRtBgpjJ11Hu/XS/k2kKIHf6xAW8e05jlxLqLzBMSkm3jMqRKmxoSPIHEIhr7Dl+z5rZuxkUTxDoEoOoan7JMuMVZG3+BPU4hR1e7FJPdZJ7QE9WuNnR1skfzUnILAjdqb6noyzFFkcn/K5Q==
c05fb9b8-b6c2-44cd-abb3-96e6d686770d	5c82aadb-b771-4643-93f3-44004ca2276c	allow-default-scopes	true
553cd100-f4fc-4738-87bc-8187d87fddac	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	secret	UjN3nwLf45a3hD2CWp-zMQ
c8134400-1b60-43a7-b30b-2537d6d1c7a7	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	kid	d72eb506-ca0a-4b34-ac03-afe212581551
cb4ea1fe-704d-4dbf-91d2-6459e40a38f3	2be845c2-1dd4-470c-897c-0c6e77eb3e9c	priority	100
e1e7ea28-9605-4a2d-85e8-92c3b664c022	fa662f9f-c916-423c-843b-19d549fcc0ff	algorithm	RSA-OAEP
c1c81113-2875-457d-bb84-b32ba582f891	fa662f9f-c916-423c-843b-19d549fcc0ff	privateKey	MIIEpAIBAAKCAQEAu4lxl4fd2BfRzD3mte/oIwEUEU/QvyxJRbjCWL5ZAQtzWI2EoXn1STaB57ufaUzF5XkWjMwRI7XLHxjSWFix8Ao89EK1CKuOhBl2xw0fShzdsxGr6jVioFANnVhOLi+xaFeWTqarqbDgc4yEEig5/zH8r7czrfGaYMXtvbobGQFeTbJQyBz8e5kiJtRXIcynRAhOxzg2CJ42vjCnyephpASjIE1eY4cbLxc1lCJbuuaDQcu0wiiRQVSWFqUUW1Wf/DTYxjFaZ3X6k89+ZUw11J0O+m3gTMzUEuIl3c1SW/6gelcyoBptFEykGpHghD2vIKlRi2xu1mOregSBbZR/twIDAQABAoIBABOugwtiKPgq18vVm0bw3K3/yPlgJQpLPY1hrJPftjuT1hEvGQJRaFq8q7mESWClvAcvRByWth3HUH/8/OZkuJf2mxsPfSxhxN08RujxCZ2flezbJ+22mJk2jZc700ipnLbUqmOqvk1a0NOPpbS6IAwWVOykD3pr5sXNP/wvcfSXsCtSfXzY3EcDooqdJUNW1mrWDEv9FQrfdlm7xx2hyBbIC5VgaPWLRzqVhC8oEokPND/OWhNUBj1y0ERogOND0ER+pAiW3cf6x6k4cBT9aHIY1FcW9oQ4LEns5c9+gI4lj0oPHxjl2oPJrsp86FuScGtkYsCUi3jfrOgbjpejvmECgYEA4ATqN7zbMlQWNgv60FGvrilUdMw1KAJvps1txKOz6FOMRQQNAFC51wj0yiEwixauWEWbj9jtihdpk6xflgy4b0pSzRLl0tx/AIRQSxOZQkA84gDz+LYnfF/x3Jxi/XTgGRp/MqXNXKTFFEj7AQxweMcyKQPAZaR0zTs3HUPY7NkCgYEA1k87v3FNNiv7KOnOJE96CE1hCCHRg34WGa9S0rhOOw+zweG93HmFQPQCKJOdQymzUVvSR4mlRTEshwWsi33bg5wc1XZLhAM9QwMPyhT5irYy00brg950fajrYgeQS1mtssmImoPUymaW3/wIEKe2Ito3lLrpvrO20qQGFrNcNw8CgYBMVsBuAAh+TRNIlaqB5ORGKEVki9YtbS8ZG3YlhVegeyAYwLmheuDpe17XppnBPBhrckUBrv27iiDrNtlX67vKCPzQb3kr8wHAblZiTypx3iwhJAv/nCs2ggeMkypUjshzJYlk/AVQZcHXGMuYXuHQ9qiMO4AL4w/+hAhTC7TXeQKBgQDMAJZ+cWsvYwRteMrbM7CVkJsKM68N/YsqHgO4ROtrO1JBABNMeX0ITH51g7bSxTJGAyMTKArj56BcU2FhU4gPKx8jb70IyFCbpqF0Gy1EBpYxGjR8zdiT+aU/JrYLlC1NoJxhgZagqLF8O5ytxggR+ymncZmqB8bDkpGdMFVarwKBgQC5QT2ph03V4r/tns48JDeI10lCYL99tzB91MbVxtmVS5ixvZ0OM0y+JNDlsd0M3uKrxLD41WVMk3ECnJ8PcRG9U2qfs8sFx/dgtUJ1NmnrgCp6J0HwHiDOJgv+j3npn2O8ffb/4zletMxa56I/P+Uyp/H1GEjoAYqy1QHo3Cx11w==
6e0f04c3-4414-434e-ab15-9e3243bb273f	fa662f9f-c916-423c-843b-19d549fcc0ff	certificate	MIICozCCAYsCBgGTRFO4RDANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApnaG92ZXJibG9nMB4XDTI0MTExOTEyMDczN1oXDTM0MTExOTEyMDkxN1owFTETMBEGA1UEAwwKZ2hvdmVyYmxvZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALuJcZeH3dgX0cw95rXv6CMBFBFP0L8sSUW4wli+WQELc1iNhKF59Uk2gee7n2lMxeV5FozMESO1yx8Y0lhYsfAKPPRCtQirjoQZdscNH0oc3bMRq+o1YqBQDZ1YTi4vsWhXlk6mq6mw4HOMhBIoOf8x/K+3M63xmmDF7b26GxkBXk2yUMgc/HuZIibUVyHMp0QITsc4NgieNr4wp8nqYaQEoyBNXmOHGy8XNZQiW7rmg0HLtMIokUFUlhalFFtVn/w02MYxWmd1+pPPfmVMNdSdDvpt4EzM1BLiJd3NUlv+oHpXMqAabRRMpBqR4IQ9ryCpUYtsbtZjq3oEgW2Uf7cCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAZ8jOBKq3eNTo3E1vWGolljFOttEhGRYtgqMtsBkTt3I34XPEAJs1nN6bp/zO1qC9nEqBw1E3nkewCRXsPuff9c0DVDDSkIxFYbkZmR7JTCZ1AH51kd2CKIp9selyw5ZvUtFZQCDiFisfSEykC4yYE8Rqf370CNOhLPfBIlChqdep/9lwNkkEhTCyNCM2P0p3nr+eavhpaRKXxPfxgN81XME2NqCj2oSbK+G9BQxoZh7kOuZnMkxx+q6Z1DxnxlXVTYPCeIgOw2kZxPVO1eWiyMsQuoyLe7y3uFldPptipKVfj+DkE5UDHNft47DmuJLplQ8fNQqoe+GYYlDSqh5iTA==
2c588790-8968-482b-ae2f-b1c27203b32e	fa662f9f-c916-423c-843b-19d549fcc0ff	priority	100
4739a479-e1c9-48c1-801b-95196ec4594f	d13b325f-b4d0-4f95-b50a-f854f8dce599	max-clients	200
2ffe1b9d-b08c-42e8-bf46-1037fa817579	c3a412a6-8bff-4786-843f-9e15a38d0d35	client-uris-must-match	true
a4afe62b-b963-496a-8dae-d5e66d15d56a	c3a412a6-8bff-4786-843f-9e15a38d0d35	host-sending-registration-request-must-match	true
dfc799b0-fbde-47cb-877b-563fb56de55e	f112b009-12fa-498c-a2f9-c0acb4768fab	kid	24eac43d-2d76-4fe9-93b2-011db2a83e34
7a01d1e0-d4a3-4f73-b93d-0a42c48dfb69	f112b009-12fa-498c-a2f9-c0acb4768fab	algorithm	HS512
2c5cbdc5-6107-473d-97b7-849b6feea082	f112b009-12fa-498c-a2f9-c0acb4768fab	secret	-Ro3D9J9_ljt7ZFlT7EIV5ENEQHkdeQxVfyGm5jfG6oKdERms4ui1mUltfQJQ_NWdwwdnQ-Gpw7Wfic0Ck2BRIwcFCSy5FIpSR8UJixNscgo_KH4nLrX1m8NHPV1pLGy2XZ6y6gCkTIhABhPJ9VntikWbFunhd1KrqjBy44AJvQ
ee18af9a-b594-42a1-925d-9e5017fb5af6	f112b009-12fa-498c-a2f9-c0acb4768fab	priority	100
2344494e-0c76-4f95-81a2-28282468f55c	d8d8629a-b2dc-4b88-a661-b7bf9c6dfc16	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}],"unmanagedAttributePolicy":"ENABLED"}
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.composite_role (composite, child_role) FROM stdin;
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	4e48ee5d-1fa5-4383-9770-98aa6baa5a7b
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	e8a6c4c6-6e23-4005-9c47-31bbecd82445
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	57affa9f-fc5c-4e3b-a050-68d1868dfc21
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	2982d3ed-60e9-4434-be61-457fa478715d
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	05cd195e-1cc2-4687-b40a-04aa3f2daa34
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	7d6ab8c9-5abd-4786-aa75-6236c2626d8a
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	74096655-ef7b-4564-b1b6-18a5d76c4ae0
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	b110e835-0176-49d3-86ae-c6b6b1203bd9
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	ecb29b50-1eab-46e2-88cf-7b2cad5c9e2d
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	ab91d1e4-c50f-483f-8629-6fc2f30ee534
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	211f5cc1-5237-4617-8b2f-901d56ca0cc3
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	d3ce6f22-a87b-41af-845c-8a052d92fe4d
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	3a523310-9c47-4757-a463-783d4d31159a
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	a4af1f09-0d7d-457a-b763-41eeefa7d898
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	cc100df3-323f-454a-97d3-3338f0c54bff
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	3d7052b8-98d7-4393-a1b0-310a0eac8125
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	a06d27c4-5d79-40b5-8423-f25d0cba889c
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	8d1554ef-7250-47d1-b2c9-ae6a61f60c20
05cd195e-1cc2-4687-b40a-04aa3f2daa34	3d7052b8-98d7-4393-a1b0-310a0eac8125
2982d3ed-60e9-4434-be61-457fa478715d	cc100df3-323f-454a-97d3-3338f0c54bff
2982d3ed-60e9-4434-be61-457fa478715d	8d1554ef-7250-47d1-b2c9-ae6a61f60c20
5c7eb095-2f10-495b-8520-d173b358bfcd	0a72328c-f9ae-4ff0-a5d9-57a4538a3a31
5c7eb095-2f10-495b-8520-d173b358bfcd	a0e06c28-09ef-4efd-b3da-c099f95a2813
a0e06c28-09ef-4efd-b3da-c099f95a2813	d299e3c4-67bb-4a47-95b4-194d0a7ecacc
5a6c380e-c5f3-4148-a42f-c632dd03c20f	bb72110e-806f-4c34-bcf1-2fbed971d171
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	c47db0ce-d671-408c-83b9-feba41ec0a2a
5c7eb095-2f10-495b-8520-d173b358bfcd	86541368-548e-4b68-aaba-457b310163cc
5c7eb095-2f10-495b-8520-d173b358bfcd	7d65ea68-a692-4bd6-8aad-1c44822a96b7
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	2f9d18cc-829d-4e4d-b0f9-b8ee10d3dce2
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	2218ed74-c94e-47e2-9f8b-6695cb8ff96b
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	a46769b9-a1c6-449d-bcef-cf7583805a7c
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	2392e121-7c4b-433d-ad85-36f3dc1a19d6
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	bd35c49d-f2fe-447c-8a83-c5254fa662ff
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	d19397e8-9676-4048-ae9a-390e890d1174
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	f213f2ef-b6c5-4090-839d-58ad80996512
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	6f6feedf-4923-4c1c-bdd6-2fe71bef00e2
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	f53652aa-fef1-4a7a-81c4-79b9cd1ddde3
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	8251d053-41c8-4fad-8d95-72b6d367522d
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	07708f3d-df7b-4f83-9545-9fcf24429443
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	0eb82f8d-24d8-4c53-954d-b63ad099ed1d
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	662df19d-4519-49c9-9400-bd12b9dcdf4e
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	d4bbfb02-1253-4f48-8326-b7793773ca6d
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	155301ad-b419-44ce-bacb-7c0beb3acb2a
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	f03b9221-5fb6-4168-a139-4359acf8c994
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	5bbd9cd1-0513-4cda-9a66-e361fc3b23dc
2392e121-7c4b-433d-ad85-36f3dc1a19d6	155301ad-b419-44ce-bacb-7c0beb3acb2a
a46769b9-a1c6-449d-bcef-cf7583805a7c	d4bbfb02-1253-4f48-8326-b7793773ca6d
a46769b9-a1c6-449d-bcef-cf7583805a7c	5bbd9cd1-0513-4cda-9a66-e361fc3b23dc
1cd7b4b3-ab87-4bbb-ba61-ab915faf64e3	de1cdcf8-8035-4e2b-a804-a6e439a213ad
1cd7b4b3-ab87-4bbb-ba61-ab915faf64e3	26230398-74d1-438c-bb70-d915a642ccab
341092a5-fd34-4818-b434-f0a11c401591	0fff7797-988d-4163-b1f0-3be97ce41131
56b21d06-17c8-4776-8157-71695a4430e4	81b024f0-4bb8-4631-a750-0d038a088319
56b21d06-17c8-4776-8157-71695a4430e4	d7c9043c-37b5-44d8-bbbb-12eb722e8501
56b21d06-17c8-4776-8157-71695a4430e4	4a862d95-ada3-4b81-a8a8-9e1c613d2a5b
56b21d06-17c8-4776-8157-71695a4430e4	22c91643-c266-4ff1-8508-8fba7d92a0fd
56b21d06-17c8-4776-8157-71695a4430e4	3719b41e-1b8c-45f6-939f-63b0e0b7bb25
56b21d06-17c8-4776-8157-71695a4430e4	89bc8258-c807-4faf-805f-c24c3ed16c36
56b21d06-17c8-4776-8157-71695a4430e4	26230398-74d1-438c-bb70-d915a642ccab
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
c8281036-19c6-4d54-92e1-b3efbf04d387	6964e136-e8ce-49f8-b7b1-d04747ec11cd
c8281036-19c6-4d54-92e1-b3efbf04d387	d110694d-134d-4b14-aec0-530415e26704
c8281036-19c6-4d54-92e1-b3efbf04d387	14d449d4-e0d7-47fd-b965-d446a752b9cf
c8281036-19c6-4d54-92e1-b3efbf04d387	07efab90-e40e-40e1-bcce-1b973765544c
c8281036-19c6-4d54-92e1-b3efbf04d387	d2d4c3dd-4e66-4dc3-9747-f9bff3068daf
fa8231dd-109e-4a0d-b644-78b987ee8124	81b024f0-4bb8-4631-a750-0d038a088319
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	41798910-4d26-46d9-a027-d2b4450fd36e
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
3fc377f3-5c82-4d8b-9476-90fce3c77f9b	\N	password	3563a569-70b7-4184-b025-9acac5e14bc6	1732018159176	\N	{"value":"EMLdY0KwzE3Efq6TGupAZh3S52GR+zpbJrROArTC+tY=","salt":"W4NgZNmYXzZ8VsObRtIgAQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-11-19 12:08:56.564293	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	2018135287
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-11-19 12:08:56.601726	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.29.1	\N	\N	2018135287
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-11-19 12:08:56.706852	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.29.1	\N	\N	2018135287
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-11-19 12:08:56.733793	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	2018135287
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-11-19 12:08:56.988501	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	2018135287
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-11-19 12:08:57.001942	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.29.1	\N	\N	2018135287
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-11-19 12:08:57.234351	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	2018135287
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-11-19 12:08:57.247219	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.29.1	\N	\N	2018135287
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-11-19 12:08:57.263638	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.29.1	\N	\N	2018135287
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-11-19 12:08:57.467394	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.29.1	\N	\N	2018135287
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-11-19 12:08:57.566545	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	2018135287
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-11-19 12:08:57.575451	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	2018135287
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-11-19 12:08:57.621414	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.29.1	\N	\N	2018135287
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-11-19 12:08:57.644439	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.29.1	\N	\N	2018135287
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-11-19 12:08:57.648175	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2018135287
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-11-19 12:08:57.654171	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.29.1	\N	\N	2018135287
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-11-19 12:08:57.659947	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.29.1	\N	\N	2018135287
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-11-19 12:08:57.742055	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.29.1	\N	\N	2018135287
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-11-19 12:08:57.815712	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	2018135287
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-11-19 12:08:57.826011	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	2018135287
26.0.0-33201-org-redirect-url	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-11-19 12:09:05.394492	144	EXECUTED	9:4d0e22b0ac68ebe9794fa9cb752ea660	addColumn tableName=ORG		\N	4.29.1	\N	\N	2018135287
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-11-19 12:08:57.832104	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.29.1	\N	\N	2018135287
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-11-19 12:08:57.837151	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.29.1	\N	\N	2018135287
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-11-19 12:08:58.005048	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.29.1	\N	\N	2018135287
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-11-19 12:08:58.018259	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	2018135287
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-11-19 12:08:58.021788	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.29.1	\N	\N	2018135287
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-11-19 12:08:58.852689	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.29.1	\N	\N	2018135287
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-11-19 12:08:58.947118	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.29.1	\N	\N	2018135287
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-11-19 12:08:58.95429	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	2018135287
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-11-19 12:08:59.046775	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.29.1	\N	\N	2018135287
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-11-19 12:08:59.06808	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.29.1	\N	\N	2018135287
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-11-19 12:08:59.09901	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.29.1	\N	\N	2018135287
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-11-19 12:08:59.107412	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.29.1	\N	\N	2018135287
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-11-19 12:08:59.119411	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2018135287
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-11-19 12:08:59.12419	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	2018135287
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-11-19 12:08:59.165903	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.29.1	\N	\N	2018135287
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-11-19 12:08:59.175505	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.29.1	\N	\N	2018135287
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-11-19 12:08:59.18548	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	2018135287
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-11-19 12:08:59.193324	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.29.1	\N	\N	2018135287
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-11-19 12:08:59.201381	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.29.1	\N	\N	2018135287
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-11-19 12:08:59.204338	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	2018135287
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-11-19 12:08:59.208118	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.29.1	\N	\N	2018135287
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-11-19 12:08:59.21724	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.29.1	\N	\N	2018135287
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-11-19 12:09:01.688925	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.29.1	\N	\N	2018135287
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-11-19 12:09:01.697844	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.29.1	\N	\N	2018135287
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-11-19 12:09:01.707348	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	2018135287
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-11-19 12:09:01.715517	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.29.1	\N	\N	2018135287
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-11-19 12:09:01.718446	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.29.1	\N	\N	2018135287
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-11-19 12:09:01.891987	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.29.1	\N	\N	2018135287
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-11-19 12:09:01.899245	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.29.1	\N	\N	2018135287
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-11-19 12:09:01.934664	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.29.1	\N	\N	2018135287
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-11-19 12:09:02.407203	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.29.1	\N	\N	2018135287
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-11-19 12:09:02.413514	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2018135287
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-11-19 12:09:02.417558	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.29.1	\N	\N	2018135287
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-11-19 12:09:02.421252	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.29.1	\N	\N	2018135287
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-11-19 12:09:02.428981	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.29.1	\N	\N	2018135287
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-11-19 12:09:02.439952	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.29.1	\N	\N	2018135287
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-11-19 12:09:02.512564	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.29.1	\N	\N	2018135287
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-11-19 12:09:03.071464	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.29.1	\N	\N	2018135287
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-11-19 12:09:03.10376	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.29.1	\N	\N	2018135287
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-11-19 12:09:03.116523	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.29.1	\N	\N	2018135287
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-11-19 12:09:03.133958	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.29.1	\N	\N	2018135287
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-11-19 12:09:03.142201	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.29.1	\N	\N	2018135287
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-11-19 12:09:03.149825	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	2018135287
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-11-19 12:09:03.155945	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.29.1	\N	\N	2018135287
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-11-19 12:09:03.161754	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.29.1	\N	\N	2018135287
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-11-19 12:09:03.229996	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.29.1	\N	\N	2018135287
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-11-19 12:09:03.290476	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.29.1	\N	\N	2018135287
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-11-19 12:09:03.299523	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.29.1	\N	\N	2018135287
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-11-19 12:09:03.385281	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.29.1	\N	\N	2018135287
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-11-19 12:09:03.394029	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.29.1	\N	\N	2018135287
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-11-19 12:09:03.400431	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	2018135287
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-11-19 12:09:03.415304	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	2018135287
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-11-19 12:09:03.426786	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	2018135287
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-11-19 12:09:03.430264	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.29.1	\N	\N	2018135287
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-11-19 12:09:03.465745	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.29.1	\N	\N	2018135287
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-11-19 12:09:03.526273	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.29.1	\N	\N	2018135287
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-11-19 12:09:03.532976	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.29.1	\N	\N	2018135287
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-11-19 12:09:03.535989	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.29.1	\N	\N	2018135287
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-11-19 12:09:03.566585	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.29.1	\N	\N	2018135287
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-11-19 12:09:03.56972	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.29.1	\N	\N	2018135287
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-11-19 12:09:03.632891	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.29.1	\N	\N	2018135287
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-11-19 12:09:03.635892	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	2018135287
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-11-19 12:09:03.643212	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	2018135287
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-11-19 12:09:03.645703	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.29.1	\N	\N	2018135287
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-11-19 12:09:03.686834	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	2018135287
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-11-19 12:09:03.69642	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.29.1	\N	\N	2018135287
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-11-19 12:09:03.711973	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.29.1	\N	\N	2018135287
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-11-19 12:09:03.72048	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.29.1	\N	\N	2018135287
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-11-19 12:09:03.728988	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.29.1	\N	\N	2018135287
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-11-19 12:09:03.741901	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.29.1	\N	\N	2018135287
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-11-19 12:09:03.784104	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2018135287
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-11-19 12:09:03.800702	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.29.1	\N	\N	2018135287
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-11-19 12:09:03.803512	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	2018135287
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-11-19 12:09:03.817039	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.29.1	\N	\N	2018135287
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-11-19 12:09:03.820876	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.29.1	\N	\N	2018135287
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-11-19 12:09:03.831379	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.29.1	\N	\N	2018135287
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-11-19 12:09:03.956299	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2018135287
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-11-19 12:09:03.960001	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2018135287
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-11-19 12:09:03.980444	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2018135287
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-11-19 12:09:04.043457	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2018135287
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-11-19 12:09:04.047276	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2018135287
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-11-19 12:09:04.110545	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.29.1	\N	\N	2018135287
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-11-19 12:09:04.116809	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.29.1	\N	\N	2018135287
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-11-19 12:09:04.12711	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.29.1	\N	\N	2018135287
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-11-19 12:09:04.179918	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.29.1	\N	\N	2018135287
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-11-19 12:09:04.230708	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.29.1	\N	\N	2018135287
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2024-11-19 12:09:04.303933	107	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.29.1	\N	\N	2018135287
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-11-19 12:09:04.310552	108	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.29.1	\N	\N	2018135287
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-11-19 12:09:04.384733	109	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	2018135287
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-11-19 12:09:04.38848	110	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.29.1	\N	\N	2018135287
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-11-19 12:09:04.400418	111	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2018135287
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-11-19 12:09:04.408186	112	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.29.1	\N	\N	2018135287
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-11-19 12:09:04.430965	113	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.29.1	\N	\N	2018135287
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-11-19 12:09:04.435416	114	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.29.1	\N	\N	2018135287
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-11-19 12:09:04.443818	115	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.29.1	\N	\N	2018135287
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-11-19 12:09:04.446863	116	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.29.1	\N	\N	2018135287
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-11-19 12:09:04.456885	117	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.29.1	\N	\N	2018135287
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-11-19 12:09:04.462924	118	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.29.1	\N	\N	2018135287
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-11-19 12:09:04.645765	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.29.1	\N	\N	2018135287
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-11-19 12:09:04.652163	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.29.1	\N	\N	2018135287
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-11-19 12:09:04.659744	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2018135287
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-11-19 12:09:04.716305	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2018135287
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-11-19 12:09:04.722159	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.29.1	\N	\N	2018135287
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-11-19 12:09:04.724652	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2018135287
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-11-19 12:09:04.727622	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.29.1	\N	\N	2018135287
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-11-19 12:09:04.735623	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	2018135287
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-11-19 12:09:04.795406	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2018135287
25.0.0-28265-index-cleanup	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-11-19 12:09:04.809696	128	EXECUTED	9:8c0cfa341a0474385b324f5c4b2dfcc1	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION; dropIndex ...		\N	4.29.1	\N	\N	2018135287
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-11-19 12:09:04.813161	129	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2018135287
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-11-19 12:09:04.882639	130	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.29.1	\N	\N	2018135287
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-11-19 12:09:04.899778	131	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	2018135287
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-11-19 12:09:04.913347	132	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	2018135287
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-11-19 12:09:04.916472	133	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.29.1	\N	\N	2018135287
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-11-19 12:09:05.029235	134	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.29.1	\N	\N	2018135287
26.0.0-org-alias	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-11-19 12:09:05.038635	135	EXECUTED	9:6ef7d63e4412b3c2d66ed179159886a4	addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG		\N	4.29.1	\N	\N	2018135287
26.0.0-org-group	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-11-19 12:09:05.04995	136	EXECUTED	9:da8e8087d80ef2ace4f89d8c5b9ca223	addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange		\N	4.29.1	\N	\N	2018135287
26.0.0-org-indexes	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-11-19 12:09:05.104527	137	EXECUTED	9:79b05dcd610a8c7f25ec05135eec0857	createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN		\N	4.29.1	\N	\N	2018135287
26.0.0-org-group-membership	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-11-19 12:09:05.113279	138	EXECUTED	9:a6ace2ce583a421d89b01ba2a28dc2d4	addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP		\N	4.29.1	\N	\N	2018135287
31296-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-11-19 12:09:05.121573	139	EXECUTED	9:64ef94489d42a358e8304b0e245f0ed4	createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	2018135287
31725-index-persist-revoked-access-tokens	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-11-19 12:09:05.164158	140	EXECUTED	9:b994246ec2bf7c94da881e1d28782c7b	createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN		\N	4.29.1	\N	\N	2018135287
26.0.0-idps-for-login	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-11-19 12:09:05.262524	141	EXECUTED	9:51f5fffadf986983d4bd59582c6c1604	addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange		\N	4.29.1	\N	\N	2018135287
26.0.0-32583-drop-redundant-index-on-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-11-19 12:09:05.341772	142	EXECUTED	9:24972d83bf27317a055d234187bb4af9	dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION		\N	4.29.1	\N	\N	2018135287
26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session	keycloak	META-INF/jpa-changelog-26.0.0.xml	2024-11-19 12:09:05.381782	143	EXECUTED	9:febdc0f47f2ed241c59e60f58c3ceea5	dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...		\N	4.29.1	\N	\N	2018135287
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
760ef1ae-18ed-4a3f-90a4-48601a349de5	7200045e-4c7d-441b-b054-2895bb1aea30	f
760ef1ae-18ed-4a3f-90a4-48601a349de5	506c8a68-324a-4f4b-8180-59f144e9d35c	t
760ef1ae-18ed-4a3f-90a4-48601a349de5	5144eac9-4751-4e02-996f-59f51393ca51	t
760ef1ae-18ed-4a3f-90a4-48601a349de5	5a896f3d-ced0-4ac4-b77a-6e5779790bdd	t
760ef1ae-18ed-4a3f-90a4-48601a349de5	e7116a1f-d2b0-455a-993f-5f381afc0275	t
760ef1ae-18ed-4a3f-90a4-48601a349de5	73510cbb-563a-484b-b984-80760a340438	f
760ef1ae-18ed-4a3f-90a4-48601a349de5	f9920369-c5bf-49c3-9a40-44f4f6079bd3	f
760ef1ae-18ed-4a3f-90a4-48601a349de5	de10af56-4561-4320-ae90-88440630e099	t
760ef1ae-18ed-4a3f-90a4-48601a349de5	286e99b6-b0ff-4318-a22a-f1d8e25548c3	t
760ef1ae-18ed-4a3f-90a4-48601a349de5	d2e4609f-1aea-4bdb-87fd-79dde8a86a10	f
760ef1ae-18ed-4a3f-90a4-48601a349de5	33b294e3-6a19-4982-adfe-272c17b3acc8	t
760ef1ae-18ed-4a3f-90a4-48601a349de5	3aca360a-7f10-4be6-a482-b33c1a84fa7b	t
760ef1ae-18ed-4a3f-90a4-48601a349de5	187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8	f
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
91cb1cd2-e133-4f67-9800-593c809120c8	c16be52b-cff6-4387-8b5f-2485baa1bdfb	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
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
14d449d4-e0d7-47fd-b965-d446a752b9cf	6b4f1382-825b-4131-b177-ecfc122d41a8
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only, organization_id, hide_on_login) FROM stdin;
c0bb12d5-0ae3-4601-9309-e13ae96d0196	t	github	github	f	f	91cb1cd2-e133-4f67-9800-593c809120c8	f	f	a87217ca-2672-4d1b-8c18-1932c91dc1da	\N	\N	f	\N	f
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
c0bb12d5-0ae3-4601-9309-e13ae96d0196	https://github.com	baseUrl
c0bb12d5-0ae3-4601-9309-e13ae96d0196	**********	clientSecret
c0bb12d5-0ae3-4601-9309-e13ae96d0196	Ov23li8cfSaVme40UZhz	clientId
c0bb12d5-0ae3-4601-9309-e13ae96d0196	https://api.github.com	apiUrl
c0bb12d5-0ae3-4601-9309-e13ae96d0196	1	guiOrder
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

COPY public.keycloak_group (id, name, parent_group, realm_id, type) FROM stdin;
6b4f1382-825b-4131-b177-ecfc122d41a8	visiteur	 	91cb1cd2-e133-4f67-9800-593c809120c8	0
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
5c7eb095-2f10-495b-8520-d173b358bfcd	760ef1ae-18ed-4a3f-90a4-48601a349de5	f	${role_default-roles}	default-roles-master	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N	\N
4e48ee5d-1fa5-4383-9770-98aa6baa5a7b	760ef1ae-18ed-4a3f-90a4-48601a349de5	f	${role_create-realm}	create-realm	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N	\N
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	760ef1ae-18ed-4a3f-90a4-48601a349de5	f	${role_admin}	admin	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N	\N
e8a6c4c6-6e23-4005-9c47-31bbecd82445	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_create-client}	create-client	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
57affa9f-fc5c-4e3b-a050-68d1868dfc21	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_view-realm}	view-realm	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
2982d3ed-60e9-4434-be61-457fa478715d	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_view-users}	view-users	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
05cd195e-1cc2-4687-b40a-04aa3f2daa34	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_view-clients}	view-clients	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
7d6ab8c9-5abd-4786-aa75-6236c2626d8a	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_view-events}	view-events	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
74096655-ef7b-4564-b1b6-18a5d76c4ae0	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_view-identity-providers}	view-identity-providers	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
b110e835-0176-49d3-86ae-c6b6b1203bd9	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_view-authorization}	view-authorization	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
ecb29b50-1eab-46e2-88cf-7b2cad5c9e2d	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_manage-realm}	manage-realm	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
ab91d1e4-c50f-483f-8629-6fc2f30ee534	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_manage-users}	manage-users	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
211f5cc1-5237-4617-8b2f-901d56ca0cc3	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_manage-clients}	manage-clients	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
d3ce6f22-a87b-41af-845c-8a052d92fe4d	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_manage-events}	manage-events	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
3a523310-9c47-4757-a463-783d4d31159a	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_manage-identity-providers}	manage-identity-providers	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
a4af1f09-0d7d-457a-b763-41eeefa7d898	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_manage-authorization}	manage-authorization	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
cc100df3-323f-454a-97d3-3338f0c54bff	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_query-users}	query-users	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
3d7052b8-98d7-4393-a1b0-310a0eac8125	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_query-clients}	query-clients	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
a06d27c4-5d79-40b5-8423-f25d0cba889c	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_query-realms}	query-realms	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
8d1554ef-7250-47d1-b2c9-ae6a61f60c20	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_query-groups}	query-groups	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
0a72328c-f9ae-4ff0-a5d9-57a4538a3a31	3fb2d9a5-2ebc-4777-bb33-d197c379a784	t	${role_view-profile}	view-profile	760ef1ae-18ed-4a3f-90a4-48601a349de5	3fb2d9a5-2ebc-4777-bb33-d197c379a784	\N
a0e06c28-09ef-4efd-b3da-c099f95a2813	3fb2d9a5-2ebc-4777-bb33-d197c379a784	t	${role_manage-account}	manage-account	760ef1ae-18ed-4a3f-90a4-48601a349de5	3fb2d9a5-2ebc-4777-bb33-d197c379a784	\N
d299e3c4-67bb-4a47-95b4-194d0a7ecacc	3fb2d9a5-2ebc-4777-bb33-d197c379a784	t	${role_manage-account-links}	manage-account-links	760ef1ae-18ed-4a3f-90a4-48601a349de5	3fb2d9a5-2ebc-4777-bb33-d197c379a784	\N
9755f37a-b43a-4c46-a0c4-21036d1eeca4	3fb2d9a5-2ebc-4777-bb33-d197c379a784	t	${role_view-applications}	view-applications	760ef1ae-18ed-4a3f-90a4-48601a349de5	3fb2d9a5-2ebc-4777-bb33-d197c379a784	\N
bb72110e-806f-4c34-bcf1-2fbed971d171	3fb2d9a5-2ebc-4777-bb33-d197c379a784	t	${role_view-consent}	view-consent	760ef1ae-18ed-4a3f-90a4-48601a349de5	3fb2d9a5-2ebc-4777-bb33-d197c379a784	\N
5a6c380e-c5f3-4148-a42f-c632dd03c20f	3fb2d9a5-2ebc-4777-bb33-d197c379a784	t	${role_manage-consent}	manage-consent	760ef1ae-18ed-4a3f-90a4-48601a349de5	3fb2d9a5-2ebc-4777-bb33-d197c379a784	\N
0dfb1ff7-28d1-40b3-b5c5-827fd8e6b88a	3fb2d9a5-2ebc-4777-bb33-d197c379a784	t	${role_view-groups}	view-groups	760ef1ae-18ed-4a3f-90a4-48601a349de5	3fb2d9a5-2ebc-4777-bb33-d197c379a784	\N
34ad3d28-c866-4515-9122-e0e294b39182	3fb2d9a5-2ebc-4777-bb33-d197c379a784	t	${role_delete-account}	delete-account	760ef1ae-18ed-4a3f-90a4-48601a349de5	3fb2d9a5-2ebc-4777-bb33-d197c379a784	\N
83ba03fd-da79-4cbc-af24-fd1747cdec58	0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	t	${role_read-token}	read-token	760ef1ae-18ed-4a3f-90a4-48601a349de5	0ecbbdf2-0d18-41e6-9b9e-5a69957b8c17	\N
c47db0ce-d671-408c-83b9-feba41ec0a2a	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	t	${role_impersonation}	impersonation	760ef1ae-18ed-4a3f-90a4-48601a349de5	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	\N
86541368-548e-4b68-aaba-457b310163cc	760ef1ae-18ed-4a3f-90a4-48601a349de5	f	${role_offline-access}	offline_access	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N	\N
7d65ea68-a692-4bd6-8aad-1c44822a96b7	760ef1ae-18ed-4a3f-90a4-48601a349de5	f	${role_uma_authorization}	uma_authorization	760ef1ae-18ed-4a3f-90a4-48601a349de5	\N	\N
c8281036-19c6-4d54-92e1-b3efbf04d387	91cb1cd2-e133-4f67-9800-593c809120c8	f	${role_default-roles}	default-roles-ghoverblog	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
2f9d18cc-829d-4e4d-b0f9-b8ee10d3dce2	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_create-client}	create-client	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
2218ed74-c94e-47e2-9f8b-6695cb8ff96b	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_view-realm}	view-realm	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
a46769b9-a1c6-449d-bcef-cf7583805a7c	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_view-users}	view-users	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
2392e121-7c4b-433d-ad85-36f3dc1a19d6	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_view-clients}	view-clients	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
bd35c49d-f2fe-447c-8a83-c5254fa662ff	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_view-events}	view-events	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
d19397e8-9676-4048-ae9a-390e890d1174	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_view-identity-providers}	view-identity-providers	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
f213f2ef-b6c5-4090-839d-58ad80996512	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_view-authorization}	view-authorization	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
6f6feedf-4923-4c1c-bdd6-2fe71bef00e2	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_manage-realm}	manage-realm	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
f53652aa-fef1-4a7a-81c4-79b9cd1ddde3	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_manage-users}	manage-users	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
8251d053-41c8-4fad-8d95-72b6d367522d	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_manage-clients}	manage-clients	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
07708f3d-df7b-4f83-9545-9fcf24429443	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_manage-events}	manage-events	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
0eb82f8d-24d8-4c53-954d-b63ad099ed1d	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_manage-identity-providers}	manage-identity-providers	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
662df19d-4519-49c9-9400-bd12b9dcdf4e	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_manage-authorization}	manage-authorization	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
d4bbfb02-1253-4f48-8326-b7793773ca6d	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_query-users}	query-users	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
155301ad-b419-44ce-bacb-7c0beb3acb2a	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_query-clients}	query-clients	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
f03b9221-5fb6-4168-a139-4359acf8c994	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_query-realms}	query-realms	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
5bbd9cd1-0513-4cda-9a66-e361fc3b23dc	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_query-groups}	query-groups	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
d110694d-134d-4b14-aec0-530415e26704	91cb1cd2-e133-4f67-9800-593c809120c8	f	${role_offline-access}	offline_access	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
3241296e-3985-49ba-8e40-aa9c56fa3e19	91cb1cd2-e133-4f67-9800-593c809120c8	f	Rôle réserver au créateur d'article	user	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
e467c577-bd9d-4cd0-b3a1-c1d172921217	91cb1cd2-e133-4f67-9800-593c809120c8	f	Ce rôle est réserver a l'administrateur 	admin	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
14d449d4-e0d7-47fd-b965-d446a752b9cf	91cb1cd2-e133-4f67-9800-593c809120c8	f	permet de créer des commentaire sous les articles	commentaire	91cb1cd2-e133-4f67-9800-593c809120c8	\N	\N
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
bf67d9be-fbac-45f3-b598-02fbac115e3d	d0ab4a02-8a6d-44d9-a014-8519d0ebca30	t	\N	uma_protection	91cb1cd2-e133-4f67-9800-593c809120c8	d0ab4a02-8a6d-44d9-a014-8519d0ebca30	\N
5793fa89-49dc-4721-8773-e43d680419fa	1d288522-1a62-43b1-9932-f23aa8959705	t	${role_read-token}	read-token	91cb1cd2-e133-4f67-9800-593c809120c8	1d288522-1a62-43b1-9932-f23aa8959705	\N
6964e136-e8ce-49f8-b7b1-d04747ec11cd	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_manage-account}	manage-account	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
eb2ebb12-0d08-4426-994f-7b03e6ead65f	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_delete-account}	delete-account	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
341092a5-fd34-4818-b434-f0a11c401591	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_manage-consent}	manage-consent	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
0fff7797-988d-4163-b1f0-3be97ce41131	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_view-consent}	view-consent	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
07efab90-e40e-40e1-bcce-1b973765544c	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_view-profile}	view-profile	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
3f90d07f-83b7-40b4-b2a4-302981edfb4a	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_view-applications}	view-applications	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
78ede6e8-6592-42e9-bd30-20e95ef21813	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_manage-account-links}	manage-account-links	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
fc408ff1-70b8-443f-a4b9-eefd833b0984	de37e667-e65f-4127-88b0-040889a26d6c	t	\N	uma_protection	91cb1cd2-e133-4f67-9800-593c809120c8	de37e667-e65f-4127-88b0-040889a26d6c	\N
41798910-4d26-46d9-a027-d2b4450fd36e	6b74e717-72ab-4e3e-b082-4d4362d58d31	t	${role_impersonation}	impersonation	760ef1ae-18ed-4a3f-90a4-48601a349de5	6b74e717-72ab-4e3e-b082-4d4362d58d31	\N
e975f04e-9d81-44e1-ae05-79af6947dc9e	42b5d478-6044-4e3d-aff5-837150682d0c	t	${role_view-groups}	view-groups	91cb1cd2-e133-4f67-9800-593c809120c8	42b5d478-6044-4e3d-aff5-837150682d0c	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.migration_model (id, version, update_time) FROM stdin;
6kziy	26.0.5	1732018146
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
\.


--
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.org (id, enabled, realm_id, group_id, name, description, alias, redirect_url) FROM stdin;
\.


--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
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
b34144d7-e7cc-49ee-aa36-c0462d885f2d	audience resolve	openid-connect	oidc-audience-resolve-mapper	4e55857f-d45e-4593-ad9e-2d7be47f9f53	\N
fff0c870-7662-4466-a1f8-0ddde8ca271f	locale	openid-connect	oidc-usermodel-attribute-mapper	c6c2d949-ed0e-467d-976f-e582918a2ffb	\N
198313a5-78f7-4778-92c1-7f9b1362e69c	role list	saml	saml-role-list-mapper	\N	506c8a68-324a-4f4b-8180-59f144e9d35c
d3ec6efd-98c0-4b40-ba67-b15c31fe246e	organization	saml	saml-organization-membership-mapper	\N	5144eac9-4751-4e02-996f-59f51393ca51
9301edc7-639e-4fe4-8934-0e1479ca635a	full name	openid-connect	oidc-full-name-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
e7191bc7-4cdc-4cd8-a05c-91e30edeafc7	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
43ee2bf5-616e-423a-8043-5aeff63ffa90	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
461c6dbe-a1c6-4c11-ba39-97ba0ed4773f	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
7e2fbf5b-bd88-4fe5-9227-de001ec83285	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
59ad9062-0e71-4bea-a43e-8de38b674759	username	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
69382621-8028-4e65-9983-fb91ba73d3c7	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
e546b9c3-939f-4e38-bd4f-496fe5cdab15	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
578cabbb-f1a9-4e0b-83ac-323a6bfda77f	website	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
4f18c31b-8c5b-4f19-85f3-f48cfab7498a	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
ea86c671-5456-48dc-bd7e-6a7174891757	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
442e2327-ecfc-49d3-a6e9-fe431bbc7fad	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
7a7422aa-6953-4367-b9d3-6c68379dee86	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
b847e104-f14c-454e-9e62-5e710ec76fcd	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	5a896f3d-ced0-4ac4-b77a-6e5779790bdd
4c2aa87f-b2fd-4372-ba75-fefbe55b7c18	email	openid-connect	oidc-usermodel-attribute-mapper	\N	e7116a1f-d2b0-455a-993f-5f381afc0275
9933b85e-cf65-46d7-8f32-8f6c14274e9d	email verified	openid-connect	oidc-usermodel-property-mapper	\N	e7116a1f-d2b0-455a-993f-5f381afc0275
527d63d1-006b-4d41-a40c-0a73e430cdd7	address	openid-connect	oidc-address-mapper	\N	73510cbb-563a-484b-b984-80760a340438
b4339eea-ece4-4903-9daa-440a75b9236a	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	f9920369-c5bf-49c3-9a40-44f4f6079bd3
bcbaeb2e-c400-46cc-b0c5-a0529961b2cd	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	f9920369-c5bf-49c3-9a40-44f4f6079bd3
9adc4296-0c02-43f7-8e6c-5cde0feefdb9	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	de10af56-4561-4320-ae90-88440630e099
73e872d8-f84b-4082-9d05-219893757b17	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	de10af56-4561-4320-ae90-88440630e099
677e4942-1478-4131-aded-ecd5be138e8c	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	de10af56-4561-4320-ae90-88440630e099
128b1164-7532-4341-9374-dc8aa879eb2d	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	286e99b6-b0ff-4318-a22a-f1d8e25548c3
d878f7b0-afd9-4b23-84b0-fbe721246680	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	d2e4609f-1aea-4bdb-87fd-79dde8a86a10
3d84fa42-4a5a-4f29-91c3-34f27fbd5c1e	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	d2e4609f-1aea-4bdb-87fd-79dde8a86a10
88266109-f0f5-4727-9f02-43b90d8bef24	acr loa level	openid-connect	oidc-acr-mapper	\N	33b294e3-6a19-4982-adfe-272c17b3acc8
c4c8eac2-c5da-40fe-80f7-5817e5a3a045	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	3aca360a-7f10-4be6-a482-b33c1a84fa7b
9912b140-5188-4b71-92d0-269da53f5fb5	sub	openid-connect	oidc-sub-mapper	\N	3aca360a-7f10-4be6-a482-b33c1a84fa7b
245396d1-ca42-4991-ae20-862ee83a2eaf	organization	openid-connect	oidc-organization-membership-mapper	\N	187c88d3-1d6a-4c0a-ab3e-43bad4b6b5d8
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
86243674-560c-4cdc-9d3c-da57a8d73631	client roles	openid-connect	oidc-usermodel-client-role-mapper	d0ab4a02-8a6d-44d9-a014-8519d0ebca30	\N
3832b8ab-16c2-4cce-8bf3-c442e9513785	locale	openid-connect	oidc-usermodel-attribute-mapper	85a82e6e-ccb6-4153-8304-3645d119899b	\N
a79590c9-d228-4a65-a593-509529f1259b	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	de37e667-e65f-4127-88b0-040889a26d6c	\N
2c92d7d5-62a0-41cc-81ed-b1e232ea0e21	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	de37e667-e65f-4127-88b0-040889a26d6c	\N
b301414a-dc06-4cc3-9c28-9ec315882363	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	de37e667-e65f-4127-88b0-040889a26d6c	\N
28fa81c9-9712-469a-b190-73f8cf0e0dcf	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	c16be52b-cff6-4387-8b5f-2485baa1bdfb
49d22843-5bcf-4849-8f31-0c8430ef15d7	sub	openid-connect	oidc-sub-mapper	\N	c16be52b-cff6-4387-8b5f-2485baa1bdfb
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
fff0c870-7662-4466-a1f8-0ddde8ca271f	true	introspection.token.claim
fff0c870-7662-4466-a1f8-0ddde8ca271f	true	userinfo.token.claim
fff0c870-7662-4466-a1f8-0ddde8ca271f	locale	user.attribute
fff0c870-7662-4466-a1f8-0ddde8ca271f	true	id.token.claim
fff0c870-7662-4466-a1f8-0ddde8ca271f	true	access.token.claim
fff0c870-7662-4466-a1f8-0ddde8ca271f	locale	claim.name
fff0c870-7662-4466-a1f8-0ddde8ca271f	String	jsonType.label
198313a5-78f7-4778-92c1-7f9b1362e69c	false	single
198313a5-78f7-4778-92c1-7f9b1362e69c	Basic	attribute.nameformat
198313a5-78f7-4778-92c1-7f9b1362e69c	Role	attribute.name
43ee2bf5-616e-423a-8043-5aeff63ffa90	true	introspection.token.claim
43ee2bf5-616e-423a-8043-5aeff63ffa90	true	userinfo.token.claim
43ee2bf5-616e-423a-8043-5aeff63ffa90	firstName	user.attribute
43ee2bf5-616e-423a-8043-5aeff63ffa90	true	id.token.claim
43ee2bf5-616e-423a-8043-5aeff63ffa90	true	access.token.claim
43ee2bf5-616e-423a-8043-5aeff63ffa90	given_name	claim.name
43ee2bf5-616e-423a-8043-5aeff63ffa90	String	jsonType.label
442e2327-ecfc-49d3-a6e9-fe431bbc7fad	true	introspection.token.claim
442e2327-ecfc-49d3-a6e9-fe431bbc7fad	true	userinfo.token.claim
442e2327-ecfc-49d3-a6e9-fe431bbc7fad	zoneinfo	user.attribute
442e2327-ecfc-49d3-a6e9-fe431bbc7fad	true	id.token.claim
442e2327-ecfc-49d3-a6e9-fe431bbc7fad	true	access.token.claim
442e2327-ecfc-49d3-a6e9-fe431bbc7fad	zoneinfo	claim.name
442e2327-ecfc-49d3-a6e9-fe431bbc7fad	String	jsonType.label
461c6dbe-a1c6-4c11-ba39-97ba0ed4773f	true	introspection.token.claim
461c6dbe-a1c6-4c11-ba39-97ba0ed4773f	true	userinfo.token.claim
461c6dbe-a1c6-4c11-ba39-97ba0ed4773f	middleName	user.attribute
461c6dbe-a1c6-4c11-ba39-97ba0ed4773f	true	id.token.claim
461c6dbe-a1c6-4c11-ba39-97ba0ed4773f	true	access.token.claim
461c6dbe-a1c6-4c11-ba39-97ba0ed4773f	middle_name	claim.name
461c6dbe-a1c6-4c11-ba39-97ba0ed4773f	String	jsonType.label
4f18c31b-8c5b-4f19-85f3-f48cfab7498a	true	introspection.token.claim
4f18c31b-8c5b-4f19-85f3-f48cfab7498a	true	userinfo.token.claim
4f18c31b-8c5b-4f19-85f3-f48cfab7498a	gender	user.attribute
4f18c31b-8c5b-4f19-85f3-f48cfab7498a	true	id.token.claim
4f18c31b-8c5b-4f19-85f3-f48cfab7498a	true	access.token.claim
4f18c31b-8c5b-4f19-85f3-f48cfab7498a	gender	claim.name
4f18c31b-8c5b-4f19-85f3-f48cfab7498a	String	jsonType.label
578cabbb-f1a9-4e0b-83ac-323a6bfda77f	true	introspection.token.claim
578cabbb-f1a9-4e0b-83ac-323a6bfda77f	true	userinfo.token.claim
578cabbb-f1a9-4e0b-83ac-323a6bfda77f	website	user.attribute
578cabbb-f1a9-4e0b-83ac-323a6bfda77f	true	id.token.claim
578cabbb-f1a9-4e0b-83ac-323a6bfda77f	true	access.token.claim
578cabbb-f1a9-4e0b-83ac-323a6bfda77f	website	claim.name
578cabbb-f1a9-4e0b-83ac-323a6bfda77f	String	jsonType.label
59ad9062-0e71-4bea-a43e-8de38b674759	true	introspection.token.claim
59ad9062-0e71-4bea-a43e-8de38b674759	true	userinfo.token.claim
59ad9062-0e71-4bea-a43e-8de38b674759	username	user.attribute
59ad9062-0e71-4bea-a43e-8de38b674759	true	id.token.claim
59ad9062-0e71-4bea-a43e-8de38b674759	true	access.token.claim
59ad9062-0e71-4bea-a43e-8de38b674759	preferred_username	claim.name
59ad9062-0e71-4bea-a43e-8de38b674759	String	jsonType.label
69382621-8028-4e65-9983-fb91ba73d3c7	true	introspection.token.claim
69382621-8028-4e65-9983-fb91ba73d3c7	true	userinfo.token.claim
69382621-8028-4e65-9983-fb91ba73d3c7	profile	user.attribute
69382621-8028-4e65-9983-fb91ba73d3c7	true	id.token.claim
69382621-8028-4e65-9983-fb91ba73d3c7	true	access.token.claim
69382621-8028-4e65-9983-fb91ba73d3c7	profile	claim.name
69382621-8028-4e65-9983-fb91ba73d3c7	String	jsonType.label
7a7422aa-6953-4367-b9d3-6c68379dee86	true	introspection.token.claim
7a7422aa-6953-4367-b9d3-6c68379dee86	true	userinfo.token.claim
7a7422aa-6953-4367-b9d3-6c68379dee86	locale	user.attribute
7a7422aa-6953-4367-b9d3-6c68379dee86	true	id.token.claim
7a7422aa-6953-4367-b9d3-6c68379dee86	true	access.token.claim
7a7422aa-6953-4367-b9d3-6c68379dee86	locale	claim.name
7a7422aa-6953-4367-b9d3-6c68379dee86	String	jsonType.label
7e2fbf5b-bd88-4fe5-9227-de001ec83285	true	introspection.token.claim
7e2fbf5b-bd88-4fe5-9227-de001ec83285	true	userinfo.token.claim
7e2fbf5b-bd88-4fe5-9227-de001ec83285	nickname	user.attribute
7e2fbf5b-bd88-4fe5-9227-de001ec83285	true	id.token.claim
7e2fbf5b-bd88-4fe5-9227-de001ec83285	true	access.token.claim
7e2fbf5b-bd88-4fe5-9227-de001ec83285	nickname	claim.name
7e2fbf5b-bd88-4fe5-9227-de001ec83285	String	jsonType.label
9301edc7-639e-4fe4-8934-0e1479ca635a	true	introspection.token.claim
9301edc7-639e-4fe4-8934-0e1479ca635a	true	userinfo.token.claim
9301edc7-639e-4fe4-8934-0e1479ca635a	true	id.token.claim
9301edc7-639e-4fe4-8934-0e1479ca635a	true	access.token.claim
b847e104-f14c-454e-9e62-5e710ec76fcd	true	introspection.token.claim
b847e104-f14c-454e-9e62-5e710ec76fcd	true	userinfo.token.claim
b847e104-f14c-454e-9e62-5e710ec76fcd	updatedAt	user.attribute
b847e104-f14c-454e-9e62-5e710ec76fcd	true	id.token.claim
b847e104-f14c-454e-9e62-5e710ec76fcd	true	access.token.claim
b847e104-f14c-454e-9e62-5e710ec76fcd	updated_at	claim.name
b847e104-f14c-454e-9e62-5e710ec76fcd	long	jsonType.label
e546b9c3-939f-4e38-bd4f-496fe5cdab15	true	introspection.token.claim
e546b9c3-939f-4e38-bd4f-496fe5cdab15	true	userinfo.token.claim
e546b9c3-939f-4e38-bd4f-496fe5cdab15	picture	user.attribute
e546b9c3-939f-4e38-bd4f-496fe5cdab15	true	id.token.claim
e546b9c3-939f-4e38-bd4f-496fe5cdab15	true	access.token.claim
e546b9c3-939f-4e38-bd4f-496fe5cdab15	picture	claim.name
e546b9c3-939f-4e38-bd4f-496fe5cdab15	String	jsonType.label
e7191bc7-4cdc-4cd8-a05c-91e30edeafc7	true	introspection.token.claim
e7191bc7-4cdc-4cd8-a05c-91e30edeafc7	true	userinfo.token.claim
e7191bc7-4cdc-4cd8-a05c-91e30edeafc7	lastName	user.attribute
e7191bc7-4cdc-4cd8-a05c-91e30edeafc7	true	id.token.claim
e7191bc7-4cdc-4cd8-a05c-91e30edeafc7	true	access.token.claim
e7191bc7-4cdc-4cd8-a05c-91e30edeafc7	family_name	claim.name
e7191bc7-4cdc-4cd8-a05c-91e30edeafc7	String	jsonType.label
ea86c671-5456-48dc-bd7e-6a7174891757	true	introspection.token.claim
ea86c671-5456-48dc-bd7e-6a7174891757	true	userinfo.token.claim
ea86c671-5456-48dc-bd7e-6a7174891757	birthdate	user.attribute
ea86c671-5456-48dc-bd7e-6a7174891757	true	id.token.claim
ea86c671-5456-48dc-bd7e-6a7174891757	true	access.token.claim
ea86c671-5456-48dc-bd7e-6a7174891757	birthdate	claim.name
ea86c671-5456-48dc-bd7e-6a7174891757	String	jsonType.label
4c2aa87f-b2fd-4372-ba75-fefbe55b7c18	true	introspection.token.claim
4c2aa87f-b2fd-4372-ba75-fefbe55b7c18	true	userinfo.token.claim
4c2aa87f-b2fd-4372-ba75-fefbe55b7c18	email	user.attribute
4c2aa87f-b2fd-4372-ba75-fefbe55b7c18	true	id.token.claim
4c2aa87f-b2fd-4372-ba75-fefbe55b7c18	true	access.token.claim
4c2aa87f-b2fd-4372-ba75-fefbe55b7c18	email	claim.name
4c2aa87f-b2fd-4372-ba75-fefbe55b7c18	String	jsonType.label
9933b85e-cf65-46d7-8f32-8f6c14274e9d	true	introspection.token.claim
9933b85e-cf65-46d7-8f32-8f6c14274e9d	true	userinfo.token.claim
9933b85e-cf65-46d7-8f32-8f6c14274e9d	emailVerified	user.attribute
9933b85e-cf65-46d7-8f32-8f6c14274e9d	true	id.token.claim
9933b85e-cf65-46d7-8f32-8f6c14274e9d	true	access.token.claim
9933b85e-cf65-46d7-8f32-8f6c14274e9d	email_verified	claim.name
9933b85e-cf65-46d7-8f32-8f6c14274e9d	boolean	jsonType.label
527d63d1-006b-4d41-a40c-0a73e430cdd7	formatted	user.attribute.formatted
527d63d1-006b-4d41-a40c-0a73e430cdd7	country	user.attribute.country
527d63d1-006b-4d41-a40c-0a73e430cdd7	true	introspection.token.claim
527d63d1-006b-4d41-a40c-0a73e430cdd7	postal_code	user.attribute.postal_code
527d63d1-006b-4d41-a40c-0a73e430cdd7	true	userinfo.token.claim
527d63d1-006b-4d41-a40c-0a73e430cdd7	street	user.attribute.street
527d63d1-006b-4d41-a40c-0a73e430cdd7	true	id.token.claim
527d63d1-006b-4d41-a40c-0a73e430cdd7	region	user.attribute.region
527d63d1-006b-4d41-a40c-0a73e430cdd7	true	access.token.claim
527d63d1-006b-4d41-a40c-0a73e430cdd7	locality	user.attribute.locality
b4339eea-ece4-4903-9daa-440a75b9236a	true	introspection.token.claim
b4339eea-ece4-4903-9daa-440a75b9236a	true	userinfo.token.claim
b4339eea-ece4-4903-9daa-440a75b9236a	phoneNumber	user.attribute
b4339eea-ece4-4903-9daa-440a75b9236a	true	id.token.claim
b4339eea-ece4-4903-9daa-440a75b9236a	true	access.token.claim
b4339eea-ece4-4903-9daa-440a75b9236a	phone_number	claim.name
b4339eea-ece4-4903-9daa-440a75b9236a	String	jsonType.label
bcbaeb2e-c400-46cc-b0c5-a0529961b2cd	true	introspection.token.claim
bcbaeb2e-c400-46cc-b0c5-a0529961b2cd	true	userinfo.token.claim
bcbaeb2e-c400-46cc-b0c5-a0529961b2cd	phoneNumberVerified	user.attribute
bcbaeb2e-c400-46cc-b0c5-a0529961b2cd	true	id.token.claim
bcbaeb2e-c400-46cc-b0c5-a0529961b2cd	true	access.token.claim
bcbaeb2e-c400-46cc-b0c5-a0529961b2cd	phone_number_verified	claim.name
bcbaeb2e-c400-46cc-b0c5-a0529961b2cd	boolean	jsonType.label
677e4942-1478-4131-aded-ecd5be138e8c	true	introspection.token.claim
677e4942-1478-4131-aded-ecd5be138e8c	true	access.token.claim
73e872d8-f84b-4082-9d05-219893757b17	true	introspection.token.claim
73e872d8-f84b-4082-9d05-219893757b17	true	multivalued
73e872d8-f84b-4082-9d05-219893757b17	foo	user.attribute
73e872d8-f84b-4082-9d05-219893757b17	true	access.token.claim
73e872d8-f84b-4082-9d05-219893757b17	resource_access.${client_id}.roles	claim.name
73e872d8-f84b-4082-9d05-219893757b17	String	jsonType.label
9adc4296-0c02-43f7-8e6c-5cde0feefdb9	true	introspection.token.claim
9adc4296-0c02-43f7-8e6c-5cde0feefdb9	true	multivalued
9adc4296-0c02-43f7-8e6c-5cde0feefdb9	foo	user.attribute
9adc4296-0c02-43f7-8e6c-5cde0feefdb9	true	access.token.claim
9adc4296-0c02-43f7-8e6c-5cde0feefdb9	realm_access.roles	claim.name
9adc4296-0c02-43f7-8e6c-5cde0feefdb9	String	jsonType.label
128b1164-7532-4341-9374-dc8aa879eb2d	true	introspection.token.claim
128b1164-7532-4341-9374-dc8aa879eb2d	true	access.token.claim
3d84fa42-4a5a-4f29-91c3-34f27fbd5c1e	true	introspection.token.claim
3d84fa42-4a5a-4f29-91c3-34f27fbd5c1e	true	multivalued
3d84fa42-4a5a-4f29-91c3-34f27fbd5c1e	foo	user.attribute
3d84fa42-4a5a-4f29-91c3-34f27fbd5c1e	true	id.token.claim
3d84fa42-4a5a-4f29-91c3-34f27fbd5c1e	true	access.token.claim
3d84fa42-4a5a-4f29-91c3-34f27fbd5c1e	groups	claim.name
3d84fa42-4a5a-4f29-91c3-34f27fbd5c1e	String	jsonType.label
d878f7b0-afd9-4b23-84b0-fbe721246680	true	introspection.token.claim
d878f7b0-afd9-4b23-84b0-fbe721246680	true	userinfo.token.claim
d878f7b0-afd9-4b23-84b0-fbe721246680	username	user.attribute
d878f7b0-afd9-4b23-84b0-fbe721246680	true	id.token.claim
d878f7b0-afd9-4b23-84b0-fbe721246680	true	access.token.claim
d878f7b0-afd9-4b23-84b0-fbe721246680	upn	claim.name
d878f7b0-afd9-4b23-84b0-fbe721246680	String	jsonType.label
88266109-f0f5-4727-9f02-43b90d8bef24	true	introspection.token.claim
88266109-f0f5-4727-9f02-43b90d8bef24	true	id.token.claim
88266109-f0f5-4727-9f02-43b90d8bef24	true	access.token.claim
9912b140-5188-4b71-92d0-269da53f5fb5	true	introspection.token.claim
9912b140-5188-4b71-92d0-269da53f5fb5	true	access.token.claim
c4c8eac2-c5da-40fe-80f7-5817e5a3a045	AUTH_TIME	user.session.note
c4c8eac2-c5da-40fe-80f7-5817e5a3a045	true	introspection.token.claim
c4c8eac2-c5da-40fe-80f7-5817e5a3a045	true	id.token.claim
c4c8eac2-c5da-40fe-80f7-5817e5a3a045	true	access.token.claim
c4c8eac2-c5da-40fe-80f7-5817e5a3a045	auth_time	claim.name
c4c8eac2-c5da-40fe-80f7-5817e5a3a045	long	jsonType.label
245396d1-ca42-4991-ae20-862ee83a2eaf	true	introspection.token.claim
245396d1-ca42-4991-ae20-862ee83a2eaf	true	multivalued
245396d1-ca42-4991-ae20-862ee83a2eaf	true	id.token.claim
245396d1-ca42-4991-ae20-862ee83a2eaf	true	access.token.claim
245396d1-ca42-4991-ae20-862ee83a2eaf	organization	claim.name
245396d1-ca42-4991-ae20-862ee83a2eaf	String	jsonType.label
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	emailVerified	user.attribute
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	true	id.token.claim
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	true	access.token.claim
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	email_verified	claim.name
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	boolean	jsonType.label
39615bbd-e6e8-4571-bdc4-b9b8aca5eec2	true	userinfo.token.claim
81e7bde4-77ac-422c-b21a-b5865236f0b9	email	user.attribute
81e7bde4-77ac-422c-b21a-b5865236f0b9	true	id.token.claim
81e7bde4-77ac-422c-b21a-b5865236f0b9	true	access.token.claim
81e7bde4-77ac-422c-b21a-b5865236f0b9	email	claim.name
81e7bde4-77ac-422c-b21a-b5865236f0b9	String	jsonType.label
81e7bde4-77ac-422c-b21a-b5865236f0b9	true	userinfo.token.claim
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	picture	user.attribute
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	true	id.token.claim
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	true	access.token.claim
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	picture	claim.name
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	String	jsonType.label
0cf02c7b-529f-4ae7-b4af-90701c3c6a52	true	userinfo.token.claim
1c7d25a8-1890-433a-b034-5d5e472ef3d7	locale	user.attribute
1c7d25a8-1890-433a-b034-5d5e472ef3d7	true	id.token.claim
1c7d25a8-1890-433a-b034-5d5e472ef3d7	true	access.token.claim
1c7d25a8-1890-433a-b034-5d5e472ef3d7	locale	claim.name
1c7d25a8-1890-433a-b034-5d5e472ef3d7	String	jsonType.label
1c7d25a8-1890-433a-b034-5d5e472ef3d7	true	userinfo.token.claim
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	firstName	user.attribute
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	true	id.token.claim
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	true	access.token.claim
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	given_name	claim.name
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	String	jsonType.label
2c78a8fa-15c0-4534-bd57-e5c41c73a3b0	true	userinfo.token.claim
34392d29-3859-4c47-8794-3882417dea95	website	user.attribute
34392d29-3859-4c47-8794-3882417dea95	true	id.token.claim
34392d29-3859-4c47-8794-3882417dea95	true	access.token.claim
34392d29-3859-4c47-8794-3882417dea95	website	claim.name
34392d29-3859-4c47-8794-3882417dea95	String	jsonType.label
34392d29-3859-4c47-8794-3882417dea95	true	userinfo.token.claim
45cc72c7-984a-4eb3-b32d-eb9142c9f8a9	true	id.token.claim
45cc72c7-984a-4eb3-b32d-eb9142c9f8a9	true	access.token.claim
45cc72c7-984a-4eb3-b32d-eb9142c9f8a9	true	userinfo.token.claim
45db5704-a0b9-451d-83d2-e599c12042f5	middleName	user.attribute
45db5704-a0b9-451d-83d2-e599c12042f5	true	id.token.claim
45db5704-a0b9-451d-83d2-e599c12042f5	true	access.token.claim
45db5704-a0b9-451d-83d2-e599c12042f5	middle_name	claim.name
45db5704-a0b9-451d-83d2-e599c12042f5	String	jsonType.label
45db5704-a0b9-451d-83d2-e599c12042f5	true	userinfo.token.claim
5dfdd04e-e987-4437-8791-7309d7eae9c6	nickname	user.attribute
5dfdd04e-e987-4437-8791-7309d7eae9c6	true	id.token.claim
5dfdd04e-e987-4437-8791-7309d7eae9c6	true	access.token.claim
5dfdd04e-e987-4437-8791-7309d7eae9c6	nickname	claim.name
5dfdd04e-e987-4437-8791-7309d7eae9c6	String	jsonType.label
5dfdd04e-e987-4437-8791-7309d7eae9c6	true	userinfo.token.claim
77fb9f07-3604-44b2-892f-d13902c23e0b	updatedAt	user.attribute
77fb9f07-3604-44b2-892f-d13902c23e0b	true	id.token.claim
77fb9f07-3604-44b2-892f-d13902c23e0b	true	access.token.claim
77fb9f07-3604-44b2-892f-d13902c23e0b	updated_at	claim.name
77fb9f07-3604-44b2-892f-d13902c23e0b	long	jsonType.label
77fb9f07-3604-44b2-892f-d13902c23e0b	true	userinfo.token.claim
7c51c33a-339c-419b-b61c-8900928a17b8	lastName	user.attribute
7c51c33a-339c-419b-b61c-8900928a17b8	true	id.token.claim
7c51c33a-339c-419b-b61c-8900928a17b8	true	access.token.claim
7c51c33a-339c-419b-b61c-8900928a17b8	family_name	claim.name
7c51c33a-339c-419b-b61c-8900928a17b8	String	jsonType.label
7c51c33a-339c-419b-b61c-8900928a17b8	true	userinfo.token.claim
96260702-ab50-4f7c-b56d-b87675242d01	profile	user.attribute
96260702-ab50-4f7c-b56d-b87675242d01	true	id.token.claim
96260702-ab50-4f7c-b56d-b87675242d01	true	access.token.claim
96260702-ab50-4f7c-b56d-b87675242d01	profile	claim.name
96260702-ab50-4f7c-b56d-b87675242d01	String	jsonType.label
96260702-ab50-4f7c-b56d-b87675242d01	true	userinfo.token.claim
abe0b621-7d97-416e-a432-1a63a830fa7d	birthdate	user.attribute
abe0b621-7d97-416e-a432-1a63a830fa7d	true	id.token.claim
abe0b621-7d97-416e-a432-1a63a830fa7d	true	access.token.claim
abe0b621-7d97-416e-a432-1a63a830fa7d	birthdate	claim.name
abe0b621-7d97-416e-a432-1a63a830fa7d	String	jsonType.label
abe0b621-7d97-416e-a432-1a63a830fa7d	true	userinfo.token.claim
acc46178-8cfd-43d1-8a0f-788eb8886f4a	zoneinfo	user.attribute
acc46178-8cfd-43d1-8a0f-788eb8886f4a	true	id.token.claim
acc46178-8cfd-43d1-8a0f-788eb8886f4a	true	access.token.claim
acc46178-8cfd-43d1-8a0f-788eb8886f4a	zoneinfo	claim.name
acc46178-8cfd-43d1-8a0f-788eb8886f4a	String	jsonType.label
acc46178-8cfd-43d1-8a0f-788eb8886f4a	true	userinfo.token.claim
d7fee141-2abf-4572-bcf3-bf085e0a762c	username	user.attribute
d7fee141-2abf-4572-bcf3-bf085e0a762c	true	id.token.claim
d7fee141-2abf-4572-bcf3-bf085e0a762c	true	access.token.claim
d7fee141-2abf-4572-bcf3-bf085e0a762c	preferred_username	claim.name
d7fee141-2abf-4572-bcf3-bf085e0a762c	String	jsonType.label
d7fee141-2abf-4572-bcf3-bf085e0a762c	true	userinfo.token.claim
ebc56ceb-9d1d-4236-b00c-a58813330a40	gender	user.attribute
ebc56ceb-9d1d-4236-b00c-a58813330a40	true	id.token.claim
ebc56ceb-9d1d-4236-b00c-a58813330a40	true	access.token.claim
ebc56ceb-9d1d-4236-b00c-a58813330a40	gender	claim.name
ebc56ceb-9d1d-4236-b00c-a58813330a40	String	jsonType.label
ebc56ceb-9d1d-4236-b00c-a58813330a40	true	userinfo.token.claim
ea513ef6-9146-43b6-8209-d21b13b4da96	foo	user.attribute
ea513ef6-9146-43b6-8209-d21b13b4da96	true	access.token.claim
ea513ef6-9146-43b6-8209-d21b13b4da96	realm_access.roles	claim.name
ea513ef6-9146-43b6-8209-d21b13b4da96	String	jsonType.label
ea513ef6-9146-43b6-8209-d21b13b4da96	true	multivalued
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	foo	user.attribute
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	true	access.token.claim
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	resource_access.${client_id}.roles	claim.name
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	String	jsonType.label
f1e6a7e2-be31-4f42-bf72-ceaf0c9636f5	true	multivalued
17399230-4b7f-4e18-bbdb-cb910dc11d51	phoneNumberVerified	user.attribute
17399230-4b7f-4e18-bbdb-cb910dc11d51	true	id.token.claim
17399230-4b7f-4e18-bbdb-cb910dc11d51	true	access.token.claim
17399230-4b7f-4e18-bbdb-cb910dc11d51	phone_number_verified	claim.name
17399230-4b7f-4e18-bbdb-cb910dc11d51	boolean	jsonType.label
17399230-4b7f-4e18-bbdb-cb910dc11d51	true	userinfo.token.claim
556081f7-86b7-4de1-a9ae-7f28a5314208	phoneNumber	user.attribute
556081f7-86b7-4de1-a9ae-7f28a5314208	true	id.token.claim
556081f7-86b7-4de1-a9ae-7f28a5314208	true	access.token.claim
556081f7-86b7-4de1-a9ae-7f28a5314208	phone_number	claim.name
556081f7-86b7-4de1-a9ae-7f28a5314208	String	jsonType.label
556081f7-86b7-4de1-a9ae-7f28a5314208	true	userinfo.token.claim
6882646c-0578-47b0-aa19-05b248698fff	username	user.attribute
6882646c-0578-47b0-aa19-05b248698fff	true	id.token.claim
6882646c-0578-47b0-aa19-05b248698fff	true	access.token.claim
6882646c-0578-47b0-aa19-05b248698fff	upn	claim.name
6882646c-0578-47b0-aa19-05b248698fff	String	jsonType.label
6882646c-0578-47b0-aa19-05b248698fff	true	userinfo.token.claim
966f1722-36a5-4fe0-a964-82bbde99d73b	true	multivalued
966f1722-36a5-4fe0-a964-82bbde99d73b	true	userinfo.token.claim
966f1722-36a5-4fe0-a964-82bbde99d73b	foo	user.attribute
966f1722-36a5-4fe0-a964-82bbde99d73b	true	id.token.claim
966f1722-36a5-4fe0-a964-82bbde99d73b	true	access.token.claim
966f1722-36a5-4fe0-a964-82bbde99d73b	groups	claim.name
966f1722-36a5-4fe0-a964-82bbde99d73b	String	jsonType.label
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
86243674-560c-4cdc-9d3c-da57a8d73631	foo	user.attribute
86243674-560c-4cdc-9d3c-da57a8d73631	true	access.token.claim
86243674-560c-4cdc-9d3c-da57a8d73631	resource_access.${client_id}.roles	claim.name
86243674-560c-4cdc-9d3c-da57a8d73631	String	jsonType.label
86243674-560c-4cdc-9d3c-da57a8d73631	true	multivalued
3832b8ab-16c2-4cce-8bf3-c442e9513785	locale	user.attribute
3832b8ab-16c2-4cce-8bf3-c442e9513785	true	id.token.claim
3832b8ab-16c2-4cce-8bf3-c442e9513785	true	access.token.claim
3832b8ab-16c2-4cce-8bf3-c442e9513785	locale	claim.name
3832b8ab-16c2-4cce-8bf3-c442e9513785	String	jsonType.label
3832b8ab-16c2-4cce-8bf3-c442e9513785	true	userinfo.token.claim
2c92d7d5-62a0-41cc-81ed-b1e232ea0e21	clientHost	user.session.note
2c92d7d5-62a0-41cc-81ed-b1e232ea0e21	true	introspection.token.claim
2c92d7d5-62a0-41cc-81ed-b1e232ea0e21	true	id.token.claim
2c92d7d5-62a0-41cc-81ed-b1e232ea0e21	true	access.token.claim
2c92d7d5-62a0-41cc-81ed-b1e232ea0e21	clientHost	claim.name
2c92d7d5-62a0-41cc-81ed-b1e232ea0e21	String	jsonType.label
a79590c9-d228-4a65-a593-509529f1259b	client_id	user.session.note
a79590c9-d228-4a65-a593-509529f1259b	true	introspection.token.claim
a79590c9-d228-4a65-a593-509529f1259b	true	id.token.claim
a79590c9-d228-4a65-a593-509529f1259b	true	access.token.claim
a79590c9-d228-4a65-a593-509529f1259b	client_id	claim.name
a79590c9-d228-4a65-a593-509529f1259b	String	jsonType.label
b301414a-dc06-4cc3-9c28-9ec315882363	clientAddress	user.session.note
b301414a-dc06-4cc3-9c28-9ec315882363	true	introspection.token.claim
b301414a-dc06-4cc3-9c28-9ec315882363	true	id.token.claim
b301414a-dc06-4cc3-9c28-9ec315882363	true	access.token.claim
b301414a-dc06-4cc3-9c28-9ec315882363	clientAddress	claim.name
b301414a-dc06-4cc3-9c28-9ec315882363	String	jsonType.label
28fa81c9-9712-469a-b190-73f8cf0e0dcf	AUTH_TIME	user.session.note
28fa81c9-9712-469a-b190-73f8cf0e0dcf	true	introspection.token.claim
28fa81c9-9712-469a-b190-73f8cf0e0dcf	true	id.token.claim
28fa81c9-9712-469a-b190-73f8cf0e0dcf	true	access.token.claim
28fa81c9-9712-469a-b190-73f8cf0e0dcf	auth_time	claim.name
28fa81c9-9712-469a-b190-73f8cf0e0dcf	long	jsonType.label
49d22843-5bcf-4849-8f31-0c8430ef15d7	true	introspection.token.claim
49d22843-5bcf-4849-8f31-0c8430ef15d7	true	access.token.claim
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
760ef1ae-18ed-4a3f-90a4-48601a349de5	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	2c56d63a-9e0b-4102-8cc5-2fc9b4c30403	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	5c2e6e5d-bc77-46f9-bb55-f883f84bf1b8	9cb7b8cb-97d5-4360-bfaa-d4da7059e0a9	a2c6ef03-5114-4134-850a-731ab053da4e	11d057e2-2a8c-48e0-8e3a-10ca21f56326	b9b81afc-1183-472f-9ca3-00ac5f807ece	2592000	f	900	t	f	222d5acd-349b-4423-bc3e-68980afe4a58	0	f	0	0	5c7eb095-2f10-495b-8520-d173b358bfcd
91cb1cd2-e133-4f67-9800-593c809120c8	60	300	300				t	f	0	ghoverblog	ghoverblog	0	\N	t	t	f	f	EXTERNAL	600	3600	f	f	6b74e717-72ab-4e3e-b082-4d4362d58d31	1800	t	fr	f	f	f	t	0	1	30	6	HmacSHA1	totp	e62459b7-7fed-46ef-b152-3290716681b1	b122081f-baaa-4ee0-8bd3-de56d0f0a677	8aaa788b-b8c4-48c1-afa9-6f205d1a7f58	c37a4bd8-d911-4bcb-8c37-15d04669a61c	2519192b-9e5e-4557-a798-c843d62f5591	864000	f	300	t	f	4e3245cb-5649-479e-be4b-823051d465bf	0	f	86400	2400	c8281036-19c6-4d54-92e1-b3efbf04d387
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	760ef1ae-18ed-4a3f-90a4-48601a349de5	
_browser_header.xContentTypeOptions	760ef1ae-18ed-4a3f-90a4-48601a349de5	nosniff
_browser_header.referrerPolicy	760ef1ae-18ed-4a3f-90a4-48601a349de5	no-referrer
_browser_header.xRobotsTag	760ef1ae-18ed-4a3f-90a4-48601a349de5	none
_browser_header.xFrameOptions	760ef1ae-18ed-4a3f-90a4-48601a349de5	SAMEORIGIN
_browser_header.contentSecurityPolicy	760ef1ae-18ed-4a3f-90a4-48601a349de5	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	760ef1ae-18ed-4a3f-90a4-48601a349de5	1; mode=block
_browser_header.strictTransportSecurity	760ef1ae-18ed-4a3f-90a4-48601a349de5	max-age=31536000; includeSubDomains
bruteForceProtected	760ef1ae-18ed-4a3f-90a4-48601a349de5	false
permanentLockout	760ef1ae-18ed-4a3f-90a4-48601a349de5	false
maxTemporaryLockouts	760ef1ae-18ed-4a3f-90a4-48601a349de5	0
bruteForceStrategy	760ef1ae-18ed-4a3f-90a4-48601a349de5	MULTIPLE
maxFailureWaitSeconds	760ef1ae-18ed-4a3f-90a4-48601a349de5	900
minimumQuickLoginWaitSeconds	760ef1ae-18ed-4a3f-90a4-48601a349de5	60
waitIncrementSeconds	760ef1ae-18ed-4a3f-90a4-48601a349de5	60
quickLoginCheckMilliSeconds	760ef1ae-18ed-4a3f-90a4-48601a349de5	1000
maxDeltaTimeSeconds	760ef1ae-18ed-4a3f-90a4-48601a349de5	43200
failureFactor	760ef1ae-18ed-4a3f-90a4-48601a349de5	30
realmReusableOtpCode	760ef1ae-18ed-4a3f-90a4-48601a349de5	false
firstBrokerLoginFlowId	760ef1ae-18ed-4a3f-90a4-48601a349de5	ce6c6008-4ac3-477b-a3da-3b1d5d13db1d
displayName	760ef1ae-18ed-4a3f-90a4-48601a349de5	Keycloak
displayNameHtml	760ef1ae-18ed-4a3f-90a4-48601a349de5	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	760ef1ae-18ed-4a3f-90a4-48601a349de5	RS256
offlineSessionMaxLifespanEnabled	760ef1ae-18ed-4a3f-90a4-48601a349de5	false
offlineSessionMaxLifespan	760ef1ae-18ed-4a3f-90a4-48601a349de5	5184000
_browser_header.contentSecurityPolicyReportOnly	91cb1cd2-e133-4f67-9800-593c809120c8	
_browser_header.xContentTypeOptions	91cb1cd2-e133-4f67-9800-593c809120c8	nosniff
_browser_header.referrerPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	no-referrer
_browser_header.xRobotsTag	91cb1cd2-e133-4f67-9800-593c809120c8	none
_browser_header.xFrameOptions	91cb1cd2-e133-4f67-9800-593c809120c8	SAMEORIGIN
_browser_header.contentSecurityPolicy	91cb1cd2-e133-4f67-9800-593c809120c8	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	91cb1cd2-e133-4f67-9800-593c809120c8	1; mode=block
_browser_header.strictTransportSecurity	91cb1cd2-e133-4f67-9800-593c809120c8	max-age=31536000; includeSubDomains
bruteForceProtected	91cb1cd2-e133-4f67-9800-593c809120c8	false
permanentLockout	91cb1cd2-e133-4f67-9800-593c809120c8	false
maxTemporaryLockouts	91cb1cd2-e133-4f67-9800-593c809120c8	0
bruteForceStrategy	91cb1cd2-e133-4f67-9800-593c809120c8	MULTIPLE
maxFailureWaitSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	900
minimumQuickLoginWaitSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	60
waitIncrementSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	60
quickLoginCheckMilliSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	1000
maxDeltaTimeSeconds	91cb1cd2-e133-4f67-9800-593c809120c8	43200
failureFactor	91cb1cd2-e133-4f67-9800-593c809120c8	30
realmReusableOtpCode	91cb1cd2-e133-4f67-9800-593c809120c8	false
displayName	91cb1cd2-e133-4f67-9800-593c809120c8	
displayNameHtml	91cb1cd2-e133-4f67-9800-593c809120c8	
defaultSignatureAlgorithm	91cb1cd2-e133-4f67-9800-593c809120c8	RS256
offlineSessionMaxLifespanEnabled	91cb1cd2-e133-4f67-9800-593c809120c8	false
offlineSessionMaxLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	5184000
clientSessionIdleTimeout	91cb1cd2-e133-4f67-9800-593c809120c8	2400
clientSessionMaxLifespan	91cb1cd2-e133-4f67-9800-593c809120c8	3600
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
firstBrokerLoginFlowId	91cb1cd2-e133-4f67-9800-593c809120c8	a87217ca-2672-4d1b-8c18-1932c91dc1da
actionTokenGeneratedByUserLifespan-execute-actions	91cb1cd2-e133-4f67-9800-593c809120c8	
actionTokenGeneratedByUserLifespan-verify-email	91cb1cd2-e133-4f67-9800-593c809120c8	
actionTokenGeneratedByUserLifespan-reset-credentials	91cb1cd2-e133-4f67-9800-593c809120c8	
actionTokenGeneratedByUserLifespan-idp-verify-account-via-email	91cb1cd2-e133-4f67-9800-593c809120c8	
frontendUrl	91cb1cd2-e133-4f67-9800-593c809120c8	https://keycloak-nas.backhole.ovh/auth/
acr.loa.map	91cb1cd2-e133-4f67-9800-593c809120c8	{}
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
760ef1ae-18ed-4a3f-90a4-48601a349de5	jboss-logging
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
password	password	t	t	760ef1ae-18ed-4a3f-90a4-48601a349de5
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
91cb1cd2-e133-4f67-9800-593c809120c8	en
91cb1cd2-e133-4f67-9800-593c809120c8	fr
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.redirect_uris (client_id, value) FROM stdin;
3fb2d9a5-2ebc-4777-bb33-d197c379a784	/realms/master/account/*
4e55857f-d45e-4593-ad9e-2d7be47f9f53	/realms/master/account/*
c6c2d949-ed0e-467d-976f-e582918a2ffb	/admin/master/console/*
42b5d478-6044-4e3d-aff5-837150682d0c	/realms/ghoverblog/account/*
255e96f7-f58d-4d04-b853-009fefecd80d	/realms/ghoverblog/account/*
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	http://localhost:4200/*
d9471be6-911f-40fd-8e52-a2e7d561fb66	https://blog-pre.ghoverblog.ovh/*
dd60301a-3b36-4b7b-b7f2-538c72209465	https://ghoverblog.ovh/*
72cd9e84-8d11-4a68-a610-227c8d6cded5	https://blog-pre.ghoverblog.ovh/*
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
206282c3-1f16-46c0-9202-60d3ff0c8f69	VERIFY_EMAIL	Verify Email	760ef1ae-18ed-4a3f-90a4-48601a349de5	t	f	VERIFY_EMAIL	50
46f9ab0b-6ee5-43fc-be04-66d5552387bf	UPDATE_PROFILE	Update Profile	760ef1ae-18ed-4a3f-90a4-48601a349de5	t	f	UPDATE_PROFILE	40
c0e6e31f-0ba1-4df0-8d8a-a76b70154172	CONFIGURE_TOTP	Configure OTP	760ef1ae-18ed-4a3f-90a4-48601a349de5	t	f	CONFIGURE_TOTP	10
a770ddb8-b398-4efe-b8d6-bda8b698f742	UPDATE_PASSWORD	Update Password	760ef1ae-18ed-4a3f-90a4-48601a349de5	t	f	UPDATE_PASSWORD	30
ab7f74df-c768-48de-9011-fc0351db0484	TERMS_AND_CONDITIONS	Terms and Conditions	760ef1ae-18ed-4a3f-90a4-48601a349de5	f	f	TERMS_AND_CONDITIONS	20
7e120149-b9fb-4f94-a10f-33a0949a07b7	delete_account	Delete Account	760ef1ae-18ed-4a3f-90a4-48601a349de5	f	f	delete_account	60
31e181e0-aa58-47a1-898c-8d173d18f831	delete_credential	Delete Credential	760ef1ae-18ed-4a3f-90a4-48601a349de5	t	f	delete_credential	100
d2f32d65-314a-4e0c-aeab-33c2172dd2f9	update_user_locale	Update User Locale	760ef1ae-18ed-4a3f-90a4-48601a349de5	t	f	update_user_locale	1000
cb700e3d-115e-46c6-9eb4-f1a9186ed556	webauthn-register	Webauthn Register	760ef1ae-18ed-4a3f-90a4-48601a349de5	t	f	webauthn-register	70
e6a019d8-bd5b-43a3-b515-0c9023671a31	webauthn-register-passwordless	Webauthn Register Passwordless	760ef1ae-18ed-4a3f-90a4-48601a349de5	t	f	webauthn-register-passwordless	80
29e1ef4d-e416-41cc-9b13-e0fe2cec49da	VERIFY_PROFILE	Verify Profile	760ef1ae-18ed-4a3f-90a4-48601a349de5	t	f	VERIFY_PROFILE	90
2350f602-7b52-4a67-83a4-96f25ca3036f	CONFIGURE_TOTP	Configure OTP	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	CONFIGURE_TOTP	10
1ed33f7b-246f-4f87-bce6-b0148f0b3ad7	TERMS_AND_CONDITIONS	Terms and Conditions	91cb1cd2-e133-4f67-9800-593c809120c8	f	f	TERMS_AND_CONDITIONS	20
41a69d31-e2e0-43ed-900b-695bac17d85b	UPDATE_PASSWORD	Update Password	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	UPDATE_PASSWORD	30
74ea3ae9-8f6c-4972-9cd5-3e44b01201db	UPDATE_PROFILE	Update Profile	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	UPDATE_PROFILE	40
2c308640-d650-4ca7-9d2a-8d24ad220cdd	VERIFY_EMAIL	Verify Email	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	VERIFY_EMAIL	50
cb28f5da-3e1f-4cd8-a34a-c37e107ff7ca	delete_account	Delete Account	91cb1cd2-e133-4f67-9800-593c809120c8	f	f	delete_account	60
5dd9da91-f2e4-4151-8015-6042e99fc545	webauthn-register	Webauthn Register	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	webauthn-register	70
53f9fe37-c4a6-446d-bcc6-4862b71a77b2	webauthn-register-passwordless	Webauthn Register Passwordless	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	webauthn-register-passwordless	80
de4b7f95-84bb-4460-aa5b-6db20e6a47b3	update_user_locale	Update User Locale	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	update_user_locale	1000
b6cec95c-cce0-44fe-b0e8-553d29ed512a	delete_credential	Delete Credential	91cb1cd2-e133-4f67-9800-593c809120c8	t	f	delete_credential	100
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
f58aaab4-0c3b-46ac-8e37-024233f314f7	a7b274dd-9a69-44eb-acfd-8cf555ea369f
f58aaab4-0c3b-46ac-8e37-024233f314f7	3ca4ad7b-2356-42b6-acf8-623af878a64f
f58aaab4-0c3b-46ac-8e37-024233f314f7	dcc4ec55-a999-4c02-829c-829a3a16d301
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
f58aaab4-0c3b-46ac-8e37-024233f314f7	c5213cd6-5bb0-479d-b66a-36f347e8484c
f58aaab4-0c3b-46ac-8e37-024233f314f7	983d84fe-2326-43f9-b452-553ca48acd35
f58aaab4-0c3b-46ac-8e37-024233f314f7	e1a25b13-7738-4305-833a-d86a63174167
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
de37e667-e65f-4127-88b0-040889a26d6c	f	0	1
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
a7b274dd-9a69-44eb-acfd-8cf555ea369f	map-role.permission.14d449d4-e0d7-47fd-b965-d446a752b9cf	\N	scope	0	0	de37e667-e65f-4127-88b0-040889a26d6c	\N
3ca4ad7b-2356-42b6-acf8-623af878a64f	map-role-client-scope.permission.14d449d4-e0d7-47fd-b965-d446a752b9cf	\N	scope	0	0	de37e667-e65f-4127-88b0-040889a26d6c	\N
dcc4ec55-a999-4c02-829c-829a3a16d301	map-role-composite.permission.14d449d4-e0d7-47fd-b965-d446a752b9cf	\N	scope	0	0	de37e667-e65f-4127-88b0-040889a26d6c	\N
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
f58aaab4-0c3b-46ac-8e37-024233f314f7	role.resource.14d449d4-e0d7-47fd-b965-d446a752b9cf	Role	\N	de37e667-e65f-4127-88b0-040889a26d6c	de37e667-e65f-4127-88b0-040889a26d6c	f	\N
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
983d84fe-2326-43f9-b452-553ca48acd35	map-role	\N	de37e667-e65f-4127-88b0-040889a26d6c	\N
c5213cd6-5bb0-479d-b66a-36f347e8484c	map-role-client-scope	\N	de37e667-e65f-4127-88b0-040889a26d6c	\N
e1a25b13-7738-4305-833a-d86a63174167	map-role-composite	\N	de37e667-e65f-4127-88b0-040889a26d6c	\N
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.revoked_token (id, expire) FROM stdin;
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
4e55857f-d45e-4593-ad9e-2d7be47f9f53	a0e06c28-09ef-4efd-b3da-c099f95a2813
4e55857f-d45e-4593-ad9e-2d7be47f9f53	0dfb1ff7-28d1-40b3-b5c5-827fd8e6b88a
255e96f7-f58d-4d04-b853-009fefecd80d	6964e136-e8ce-49f8-b7b1-d04747ec11cd
255e96f7-f58d-4d04-b853-009fefecd80d	e975f04e-9d81-44e1-ae05-79af6947dc9e
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
983d84fe-2326-43f9-b452-553ca48acd35	a7b274dd-9a69-44eb-acfd-8cf555ea369f
c5213cd6-5bb0-479d-b66a-36f347e8484c	3ca4ad7b-2356-42b6-acf8-623af878a64f
e1a25b13-7738-4305-833a-d86a63174167	dcc4ec55-a999-4c02-829c-829a3a16d301
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: max_admin
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
is_temporary_admin	true	3563a569-70b7-4184-b025-9acac5e14bc6	140d8a6e-b73e-4f57-8962-59c4e7e93da0	\N	\N	\N
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
6a150b95-7664-4c21-8ea8-a6dda223829b	\N	f326bd3e-f74e-4790-b352-04ac3ee5dff5	f	t	\N	\N	\N	91cb1cd2-e133-4f67-9800-593c809120c8	service-account-realm-management	1732018158065	de37e667-e65f-4127-88b0-040889a26d6c	0
3563a569-70b7-4184-b025-9acac5e14bc6	\N	9974385c-181a-4738-aed6-ad5f465d8f89	f	t	\N	\N	\N	760ef1ae-18ed-4a3f-90a4-48601a349de5	admin	1732018158860	\N	0
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

COPY public.user_group_membership (group_id, user_id, membership_type) FROM stdin;
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
c8281036-19c6-4d54-92e1-b3efbf04d387	6a150b95-7664-4c21-8ea8-a6dda223829b
fc408ff1-70b8-443f-a4b9-eefd833b0984	6a150b95-7664-4c21-8ea8-a6dda223829b
5c7eb095-2f10-495b-8520-d173b358bfcd	3563a569-70b7-4184-b025-9acac5e14bc6
9e1bac18-0ef8-4de7-99d5-ef531b8ede7c	3563a569-70b7-4184-b025-9acac5e14bc6
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
c6c2d949-ed0e-467d-976f-e582918a2ffb	+
d0ab4a02-8a6d-44d9-a014-8519d0ebca30	http://localhost:4200
d9471be6-911f-40fd-8e52-a2e7d561fb66	https://blog-pre.ghoverblog.ovh
dd60301a-3b36-4b7b-b7f2-538c72209465	https://ghoverblog.ovh
dd60301a-3b36-4b7b-b7f2-538c72209465	*
72cd9e84-8d11-4a68-a610-227c8d6cded5	https://blog-pre.ghoverblog.ovh
85a82e6e-ccb6-4153-8304-3645d119899b	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


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
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


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
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


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
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


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
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: max_admin
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


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
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


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

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


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
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


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
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


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
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


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
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


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
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: max_admin
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


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

