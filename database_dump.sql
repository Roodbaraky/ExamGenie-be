PGDMP      +            
    |            postgres    15.6 #   16.4 (Ubuntu 16.4-0ubuntu0.24.04.2) W   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    29092    postgres    DATABASE     t   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    ACL     2   GRANT ALL ON DATABASE postgres TO dashboard_user;
                   postgres    false    4276                        2615    29093    auth    SCHEMA        CREATE SCHEMA auth;
    DROP SCHEMA auth;
                supabase_admin    false            �           0    0    SCHEMA auth    ACL        GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;
                   supabase_admin    false    14                        2615    29094 
   extensions    SCHEMA        CREATE SCHEMA extensions;
    DROP SCHEMA extensions;
                postgres    false            �           0    0    SCHEMA extensions    ACL     �   GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;
                   postgres    false    22                        2615    29095    graphql    SCHEMA        CREATE SCHEMA graphql;
    DROP SCHEMA graphql;
                supabase_admin    false                        2615    29096    graphql_public    SCHEMA        CREATE SCHEMA graphql_public;
    DROP SCHEMA graphql_public;
                supabase_admin    false                        2615    29097 	   pgbouncer    SCHEMA        CREATE SCHEMA pgbouncer;
    DROP SCHEMA pgbouncer;
             	   pgbouncer    false                        2615    29098    pgsodium    SCHEMA        CREATE SCHEMA pgsodium;
    DROP SCHEMA pgsodium;
                supabase_admin    false                        3079    29099    pgsodium 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;
    DROP EXTENSION pgsodium;
                   false    15            �           0    0    EXTENSION pgsodium    COMMENT     \   COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';
                        false    2            �           0    0    SCHEMA public    ACL     �   GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;
GRANT USAGE ON SCHEMA public TO supabase_auth_admin;
                   pg_database_owner    false    21                        2615    29399    realtime    SCHEMA        CREATE SCHEMA realtime;
    DROP SCHEMA realtime;
                supabase_admin    false            �           0    0    SCHEMA realtime    ACL     �   GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;
                   supabase_admin    false    16                        2615    29400    storage    SCHEMA        CREATE SCHEMA storage;
    DROP SCHEMA storage;
                supabase_admin    false            �           0    0    SCHEMA storage    ACL       GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;
                   supabase_admin    false    11                        2615    29401    vault    SCHEMA        CREATE SCHEMA vault;
    DROP SCHEMA vault;
                supabase_admin    false                        3079    30276 
   pg_graphql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;
    DROP EXTENSION pg_graphql;
                   false    20            �           0    0    EXTENSION pg_graphql    COMMENT     B   COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';
                        false    4                        3079    29412    pg_stat_statements 	   EXTENSION     J   CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;
 #   DROP EXTENSION pg_stat_statements;
                   false    22            �           0    0    EXTENSION pg_stat_statements    COMMENT     u   COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';
                        false    8                        3079    29443    pgcrypto 	   EXTENSION     @   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;
    DROP EXTENSION pgcrypto;
                   false    22            �           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    7                        3079    29480    pgjwt 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;
    DROP EXTENSION pgjwt;
                   false    22    7            �           0    0    EXTENSION pgjwt    COMMENT     C   COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';
                        false    6                        3079    29487    supabase_vault 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;
    DROP EXTENSION supabase_vault;
                   false    18    2            �           0    0    EXTENSION supabase_vault    COMMENT     C   COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';
                        false    3                        3079    29515 	   uuid-ossp 	   EXTENSION     C   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;
    DROP EXTENSION "uuid-ossp";
                   false    22            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    5            �           1247    29527 	   aal_level    TYPE     K   CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);
    DROP TYPE auth.aal_level;
       auth          supabase_auth_admin    false    14            �           1247    29534    code_challenge_method    TYPE     L   CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);
 &   DROP TYPE auth.code_challenge_method;
       auth          supabase_auth_admin    false    14            �           1247    29540    factor_status    TYPE     M   CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);
    DROP TYPE auth.factor_status;
       auth          supabase_auth_admin    false    14            �           1247    29546    factor_type    TYPE     R   CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);
    DROP TYPE auth.factor_type;
       auth          supabase_auth_admin    false    14            �           1247    29554    one_time_token_type    TYPE     �   CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);
 $   DROP TYPE auth.one_time_token_type;
       auth          supabase_auth_admin    false    14            �           1247    29568    app_permission    TYPE       CREATE TYPE public.app_permission AS ENUM (
    'questions.upload',
    'questions.delete',
    'classes.assign',
    'classes.delete',
    'sow.update',
    'sow.delete',
    'sow.add',
    'classes.unassign',
    'classes.add',
    'tags.add',
    'tags.delete',
    'tags.assign'
);
 !   DROP TYPE public.app_permission;
       public          postgres    false            �           1247    29594    app_role    TYPE     F   CREATE TYPE public.app_role AS ENUM (
    'admin',
    'moderator'
);
    DROP TYPE public.app_role;
       public          postgres    false            �           1247    29600 
   difficulty    TYPE     x   CREATE TYPE public.difficulty AS ENUM (
    'foundation',
    'crossover',
    'higher',
    'extended',
    'other'
);
    DROP TYPE public.difficulty;
       public          postgres    false            �           1247    29612    action    TYPE     o   CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);
    DROP TYPE realtime.action;
       realtime          supabase_admin    false    16            �           1247    29624    equality_op    TYPE     v   CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);
     DROP TYPE realtime.equality_op;
       realtime          supabase_admin    false    16            �           1247    29641    user_defined_filter    TYPE     j   CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);
 (   DROP TYPE realtime.user_defined_filter;
       realtime          supabase_admin    false    16    1247            �           1247    29644 
   wal_column    TYPE     �   CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);
    DROP TYPE realtime.wal_column;
       realtime          supabase_admin    false    16            �           1247    29647    wal_rls    TYPE     s   CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);
    DROP TYPE realtime.wal_rls;
       realtime          supabase_admin    false    16            {           1255    29648    email()    FUNCTION       CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;
    DROP FUNCTION auth.email();
       auth          supabase_auth_admin    false    14            �           0    0    FUNCTION email()    COMMENT     X   COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';
          auth          supabase_auth_admin    false    379            �           0    0    FUNCTION email()    ACL     f   GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
GRANT ALL ON FUNCTION auth.email() TO postgres;
          auth          supabase_auth_admin    false    379            z           1255    29649    jwt()    FUNCTION     �   CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;
    DROP FUNCTION auth.jwt();
       auth          supabase_auth_admin    false    14            �           0    0    FUNCTION jwt()    ACL     b   GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;
          auth          supabase_auth_admin    false    378            w           1255    29650    role()    FUNCTION        CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;
    DROP FUNCTION auth.role();
       auth          supabase_auth_admin    false    14            �           0    0    FUNCTION role()    COMMENT     V   COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';
          auth          supabase_auth_admin    false    375            �           0    0    FUNCTION role()    ACL     d   GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
GRANT ALL ON FUNCTION auth.role() TO postgres;
          auth          supabase_auth_admin    false    375            y           1255    29651    uid()    FUNCTION     �   CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;
    DROP FUNCTION auth.uid();
       auth          supabase_auth_admin    false    14            �           0    0    FUNCTION uid()    COMMENT     T   COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';
          auth          supabase_auth_admin    false    377            �           0    0    FUNCTION uid()    ACL     b   GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
GRANT ALL ON FUNCTION auth.uid() TO postgres;
          auth          supabase_auth_admin    false    377            �           0    0 D   FUNCTION algorithm_sign(signables text, secret text, algorithm text)    ACL     |   GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    493            �           0    0    FUNCTION armor(bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    462            �           0    0 %   FUNCTION armor(bytea, text[], text[])    ACL     �   GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
       
   extensions          supabase_admin    false    463            �           0    0    FUNCTION crypt(text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    494            �           0    0    FUNCTION dearmor(text)    ACL     �   GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
       
   extensions          supabase_admin    false    464            �           0    0 $   FUNCTION decrypt(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    495            �           0    0 .   FUNCTION decrypt_iv(bytea, bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    473            �           0    0    FUNCTION digest(bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    512            �           0    0    FUNCTION digest(text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    496            �           0    0 $   FUNCTION encrypt(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    513            �           0    0 .   FUNCTION encrypt_iv(bytea, bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    514            �           0    0 "   FUNCTION gen_random_bytes(integer)    ACL     �   GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
       
   extensions          supabase_admin    false    497            �           0    0    FUNCTION gen_random_uuid()    ACL     �   GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
       
   extensions          supabase_admin    false    515            �           0    0    FUNCTION gen_salt(text)    ACL     �   GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
       
   extensions          supabase_admin    false    516            �           0    0     FUNCTION gen_salt(text, integer)    ACL     �   GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
       
   extensions          supabase_admin    false    517                       1255    29652    grant_pg_cron_access()    FUNCTION     �  CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;
 1   DROP FUNCTION extensions.grant_pg_cron_access();
    
   extensions          postgres    false    22            �           0    0    FUNCTION grant_pg_cron_access()    COMMENT     U   COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';
       
   extensions          postgres    false    539            �           0    0    FUNCTION grant_pg_cron_access()    ACL     �   REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;
       
   extensions          postgres    false    539            &           1255    29653    grant_pg_graphql_access()    FUNCTION     i	  CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;
 4   DROP FUNCTION extensions.grant_pg_graphql_access();
    
   extensions          supabase_admin    false    22            �           0    0 "   FUNCTION grant_pg_graphql_access()    COMMENT     [   COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';
       
   extensions          supabase_admin    false    550            �           0    0 "   FUNCTION grant_pg_graphql_access()    ACL     Z   GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    550            �           1255    29654    grant_pg_net_access()    FUNCTION     �  CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;
 0   DROP FUNCTION extensions.grant_pg_net_access();
    
   extensions          postgres    false    22            �           0    0    FUNCTION grant_pg_net_access()    COMMENT     S   COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';
       
   extensions          postgres    false    498            �           0    0    FUNCTION grant_pg_net_access()    ACL     �   REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;
       
   extensions          postgres    false    498            �           0    0 !   FUNCTION hmac(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    499            �           0    0    FUNCTION hmac(text, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    518            �           0    0 U  FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision)    ACL       GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;
       
   extensions          supabase_admin    false    501            �           0    0 ^   FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone)    ACL        GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;
       
   extensions          supabase_admin    false    470            �           0    0 G   FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint)    ACL     �   GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;
       
   extensions          supabase_admin    false    471            �           0    0 >   FUNCTION pgp_armor_headers(text, OUT key text, OUT value text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
       
   extensions          supabase_admin    false    510            �           0    0    FUNCTION pgp_key_id(bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    502            �           0    0 &   FUNCTION pgp_pub_decrypt(bytea, bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    541            �           0    0 ,   FUNCTION pgp_pub_decrypt(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    543            �           0    0 2   FUNCTION pgp_pub_decrypt(bytea, bytea, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    472            �           0    0 ,   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    545            �           0    0 2   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    544            �           0    0 8   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    503            �           0    0 %   FUNCTION pgp_pub_encrypt(text, bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    547            �           0    0 +   FUNCTION pgp_pub_encrypt(text, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    546            �           0    0 ,   FUNCTION pgp_pub_encrypt_bytea(bytea, bytea)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
       
   extensions          supabase_admin    false    542            �           0    0 2   FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    548            �           0    0 %   FUNCTION pgp_sym_decrypt(bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    549            �           0    0 +   FUNCTION pgp_sym_decrypt(bytea, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    351            �           0    0 +   FUNCTION pgp_sym_decrypt_bytea(bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    352            �           0    0 1   FUNCTION pgp_sym_decrypt_bytea(bytea, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    353            �           0    0 $   FUNCTION pgp_sym_encrypt(text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    535            �           0    0 *   FUNCTION pgp_sym_encrypt(text, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    536            �           0    0 +   FUNCTION pgp_sym_encrypt_bytea(bytea, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
       
   extensions          supabase_admin    false    537            �           0    0 1   FUNCTION pgp_sym_encrypt_bytea(bytea, text, text)    ACL     �   GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
       
   extensions          supabase_admin    false    538            �           1255    29655    pgrst_ddl_watch()    FUNCTION     >  CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;
 ,   DROP FUNCTION extensions.pgrst_ddl_watch();
    
   extensions          supabase_admin    false    22            �           0    0    FUNCTION pgrst_ddl_watch()    ACL     R   GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    474            �           1255    29656    pgrst_drop_watch()    FUNCTION       CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;
 -   DROP FUNCTION extensions.pgrst_drop_watch();
    
   extensions          supabase_admin    false    22            �           0    0    FUNCTION pgrst_drop_watch()    ACL     S   GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    475                       1255    29657    set_graphql_placeholder()    FUNCTION     r  CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;
 4   DROP FUNCTION extensions.set_graphql_placeholder();
    
   extensions          supabase_admin    false    22            �           0    0 "   FUNCTION set_graphql_placeholder()    COMMENT     |   COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';
       
   extensions          supabase_admin    false    540            �           0    0 "   FUNCTION set_graphql_placeholder()    ACL     Z   GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    540            �           0    0 8   FUNCTION sign(payload json, secret text, algorithm text)    ACL     p   GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    504            �           0    0 "   FUNCTION try_cast_double(inp text)    ACL     Z   GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    360            �           0    0    FUNCTION url_decode(data text)    ACL     V   GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    461            �           0    0    FUNCTION url_encode(data bytea)    ACL     W   GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    511            �           0    0    FUNCTION uuid_generate_v1()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
       
   extensions          supabase_admin    false    527                        0    0    FUNCTION uuid_generate_v1mc()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
       
   extensions          supabase_admin    false    528                       0    0 4   FUNCTION uuid_generate_v3(namespace uuid, name text)    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
       
   extensions          supabase_admin    false    361                       0    0    FUNCTION uuid_generate_v4()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
       
   extensions          supabase_admin    false    362                       0    0 4   FUNCTION uuid_generate_v5(namespace uuid, name text)    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
       
   extensions          supabase_admin    false    529                       0    0    FUNCTION uuid_nil()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
       
   extensions          supabase_admin    false    363                       0    0    FUNCTION uuid_ns_dns()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
       
   extensions          supabase_admin    false    364                       0    0    FUNCTION uuid_ns_oid()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
       
   extensions          supabase_admin    false    522                       0    0    FUNCTION uuid_ns_url()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
       
   extensions          supabase_admin    false    523                       0    0    FUNCTION uuid_ns_x500()    ACL     �   GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
       
   extensions          supabase_admin    false    524            	           0    0 8   FUNCTION verify(token text, secret text, algorithm text)    ACL     p   GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    530            
           0    0 U   FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb)    ACL       GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;
          graphql_public          supabase_admin    false    552            �           1255    29658    get_auth(text)    FUNCTION     J  CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;
 2   DROP FUNCTION pgbouncer.get_auth(p_usename text);
    	   pgbouncer          postgres    false    13                       0    0 !   FUNCTION get_auth(p_usename text)    ACL     �   REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
       	   pgbouncer          postgres    false    476                       0    0 ]   FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea)    ACL     �   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;
          pgsodium          pgsodium_keymaker    false    468                       0    0 ]   FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea)    ACL     �   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;
          pgsodium          pgsodium_keymaker    false    534                       0    0 !   FUNCTION crypto_aead_det_keygen()    ACL     I   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;
          pgsodium          supabase_admin    false    469            �           1255    29659     authorize(public.app_permission)    FUNCTION     R  CREATE FUNCTION public.authorize(requested_permission public.app_permission) RETURNS boolean
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    SET search_path TO ''
    AS $$
declare
  bind_permissions int;
  user_role public.app_role;
begin
  -- Fetch user role once and store it to reduce number of calls
  select (auth.jwt() ->> 'user_role')::public.app_role into user_role;

  select count(*)
  into bind_permissions
  from public.role_permissions
  where role_permissions.permission = requested_permission
    and role_permissions.role = user_role;

  return bind_permissions > 0;
end;
$$;
 L   DROP FUNCTION public.authorize(requested_permission public.app_permission);
       public          postgres    false    1235                       0    0 >   FUNCTION authorize(requested_permission public.app_permission)    ACL     %  GRANT ALL ON FUNCTION public.authorize(requested_permission public.app_permission) TO anon;
GRANT ALL ON FUNCTION public.authorize(requested_permission public.app_permission) TO authenticated;
GRANT ALL ON FUNCTION public.authorize(requested_permission public.app_permission) TO service_role;
          public          postgres    false    477            }           1255    29660    custom_access_token_hook(jsonb)    FUNCTION     �  CREATE FUNCTION public.custom_access_token_hook(event jsonb) RETURNS jsonb
    LANGUAGE plpgsql STABLE
    AS $$
  declare
    claims jsonb;
    user_role public.app_role;
  begin
    -- Fetch the user role in the user_roles table
    select role into user_role from public.user_roles where user_id = (event->>'user_id')::uuid;

    claims := event->'claims';

    if user_role is not null then
      -- Set the claim
      claims := jsonb_set(claims, '{user_role}', to_jsonb(user_role));
    else
      claims := jsonb_set(claims, '{user_role}', 'null');
    end if;

    -- Update the 'claims' object in the original event
    event := jsonb_set(event, '{claims}', claims);

    -- Return the modified or original event
    return event;
  end;
$$;
 <   DROP FUNCTION public.custom_access_token_hook(event jsonb);
       public          postgres    false                       0    0 .   FUNCTION custom_access_token_hook(event jsonb)    ACL        REVOKE ALL ON FUNCTION public.custom_access_token_hook(event jsonb) FROM PUBLIC;
GRANT ALL ON FUNCTION public.custom_access_token_hook(event jsonb) TO service_role;
GRANT ALL ON FUNCTION public.custom_access_token_hook(event jsonb) TO supabase_auth_admin;
          public          postgres    false    381            |           1255    29661 8   fetch_filtered_tags(character varying, integer, integer)    FUNCTION     r  CREATE FUNCTION public.fetch_filtered_tags(classname character varying, currentweek integer, recallperiod integer) RETURNS TABLE(tag character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN query
  SELECT t.tag
  FROM public.classes c
  JOIN public.class_sow cs ON id=class_id
  JOIN public.sow_weeks sw ON cs.sow_id = sw.sow_id
  JOIN public.weeks_tags wt ON sw.week_id = wt.week_id
  JOIN public.tags t ON wt.tag_id = t.id
  JOIN public.weeks w on sw.week_id = w.id
  WHERE
    c.class_name = className
  AND w.week_number >= (currentWeek - recallPeriod)
  AND w.week_number <= currentWeek
  LIMIT all;
  END;
  $$;
 r   DROP FUNCTION public.fetch_filtered_tags(classname character varying, currentweek integer, recallperiod integer);
       public          postgres    false                       0    0 d   FUNCTION fetch_filtered_tags(classname character varying, currentweek integer, recallperiod integer)    ACL     �  GRANT ALL ON FUNCTION public.fetch_filtered_tags(classname character varying, currentweek integer, recallperiod integer) TO anon;
GRANT ALL ON FUNCTION public.fetch_filtered_tags(classname character varying, currentweek integer, recallperiod integer) TO authenticated;
GRANT ALL ON FUNCTION public.fetch_filtered_tags(classname character varying, currentweek integer, recallperiod integer) TO service_role;
          public          postgres    false    380            �           1255    29662 B   fetch_questions(character varying[], public.difficulty[], integer)    FUNCTION     `  CREATE FUNCTION public.fetch_questions(input_tags character varying[] DEFAULT NULL::character varying[], difficulties public.difficulty[] DEFAULT NULL::public.difficulty[], limit_value integer DEFAULT 20) RETURNS TABLE(id bigint, difficulty public.difficulty, tags character varying[])
    LANGUAGE plpgsql
    AS $$BEGIN
    RETURN QUERY
    WITH filtered_questions AS (
    SELECT 
        q.id,
        q.difficulty,
        array_agg(t.tag) AS tags_arr
    FROM
        questions q
        JOIN question_tags qt ON q.id = qt.question_id
        JOIN tags t ON t.id = qt.tag_id
    WHERE
        (tags IS NULL OR t.tag = ANY(tags))
        AND (difficulties IS NULL OR q.difficulty = ANY(difficulties))
    GROUP BY 
        q.id,
        q.difficulty
)
SELECT 
    f.id,
    f.difficulty,
    f.tags_arr
FROM
    filtered_questions f
WHERE
    input_tags IS NULL
    OR (
        NOT EXISTS (
            SELECT 1
            FROM unnest(f.tags_arr) AS f_tag
            LEFT JOIN unnest(input_tags) AS input_tag
            ON f_tag ILIKE  input_tag || '%'
            WHERE input_tag IS NULL
        )
        AND
        EXISTS (
            SELECT 1
            FROM unnest(input_tags) AS input_tag
            JOIN unnest(f.tags_arr) AS f_tag
            ON f_tag ILIKE '%' || input_tag || '%'
        )
    )
    ORDER BY
    RANDOM()
    LIMIT limit_value;
END;$$;
 }   DROP FUNCTION public.fetch_questions(input_tags character varying[], difficulties public.difficulty[], limit_value integer);
       public          postgres    false    1241    1241    1241                       0    0 o   FUNCTION fetch_questions(input_tags character varying[], difficulties public.difficulty[], limit_value integer)    ACL     �  GRANT ALL ON FUNCTION public.fetch_questions(input_tags character varying[], difficulties public.difficulty[], limit_value integer) TO anon;
GRANT ALL ON FUNCTION public.fetch_questions(input_tags character varying[], difficulties public.difficulty[], limit_value integer) TO authenticated;
GRANT ALL ON FUNCTION public.fetch_questions(input_tags character varying[], difficulties public.difficulty[], limit_value integer) TO service_role;
          public          postgres    false    506            �           1255    29663    get_sow_id_by_class_name(text)    FUNCTION       CREATE FUNCTION public.get_sow_id_by_class_name(classname text) RETURNS TABLE(sow_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT cs.sow_id
    FROM classes c
    JOIN class_sow cs ON c.id = cs.class_id
    WHERE c.class_name = classname;
END;
$$;
 ?   DROP FUNCTION public.get_sow_id_by_class_name(classname text);
       public          postgres    false                       0    0 1   FUNCTION get_sow_id_by_class_name(classname text)    ACL     �   GRANT ALL ON FUNCTION public.get_sow_id_by_class_name(classname text) TO anon;
GRANT ALL ON FUNCTION public.get_sow_id_by_class_name(classname text) TO authenticated;
GRANT ALL ON FUNCTION public.get_sow_id_by_class_name(classname text) TO service_role;
          public          postgres    false    482            �           1255    29664    get_user_classes(uuid)    FUNCTION     c  CREATE FUNCTION public.get_user_classes(userid uuid) RETURNS TABLE(id bigint, class_name character varying, created_at timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT c.id, c.class_name, c.created_at
    FROM teacher_classes tc
    JOIN classes c ON tc.class_id = c.id
    WHERE tc.user_id = userId;
END;
$$;
 4   DROP FUNCTION public.get_user_classes(userid uuid);
       public          postgres    false                       0    0 &   FUNCTION get_user_classes(userid uuid)    ACL     �   GRANT ALL ON FUNCTION public.get_user_classes(userid uuid) TO anon;
GRANT ALL ON FUNCTION public.get_user_classes(userid uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_user_classes(userid uuid) TO service_role;
          public          postgres    false    481            �           1255    29665    get_weeks_with_tags(text)    FUNCTION       CREATE FUNCTION public.get_weeks_with_tags(classname text) RETURNS TABLE(week_id bigint, week_number bigint, tags character varying[])
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
  SELECT w.id as week_id, w.week_number, array_agg(t.tag) AS tags
  FROM classes c
  JOIN class_sow cs ON c.id = cs.class_id
  JOIN sow_weeks sw ON cs.sow_id = sw.sow_id
  JOIN weeks w ON sw.week_id = w.id
  JOIN weeks_tags wt ON w.id = wt.week_id
  JOIN tags t ON wt.tag_id = t.id
  WHERE c.class_name = className
  GROUP BY w.week_number, w.id;
END;
$$;
 :   DROP FUNCTION public.get_weeks_with_tags(classname text);
       public          postgres    false                       0    0 ,   FUNCTION get_weeks_with_tags(classname text)    ACL     �   GRANT ALL ON FUNCTION public.get_weeks_with_tags(classname text) TO anon;
GRANT ALL ON FUNCTION public.get_weeks_with_tags(classname text) TO authenticated;
GRANT ALL ON FUNCTION public.get_weeks_with_tags(classname text) TO service_role;
          public          postgres    false    507            �           1255    29666 %   insert_weeks_returning_ids(integer[])    FUNCTION     �  CREATE FUNCTION public.insert_weeks_returning_ids(week_numbers integer[]) RETURNS TABLE(week_id bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    
    PERFORM setval('weeks_id_seq', (SELECT COALESCE(MAX(id), 1) FROM weeks), true);

    RETURN QUERY
    INSERT INTO weeks (id, week_number)
    SELECT nextval('weeks_id_seq'), w
    FROM unnest(week_numbers) AS w
    RETURNING id AS week_id;
END;
$$;
 I   DROP FUNCTION public.insert_weeks_returning_ids(week_numbers integer[]);
       public          postgres    false                       0    0 ;   FUNCTION insert_weeks_returning_ids(week_numbers integer[])    ACL       GRANT ALL ON FUNCTION public.insert_weeks_returning_ids(week_numbers integer[]) TO anon;
GRANT ALL ON FUNCTION public.insert_weeks_returning_ids(week_numbers integer[]) TO authenticated;
GRANT ALL ON FUNCTION public.insert_weeks_returning_ids(week_numbers integer[]) TO service_role;
          public          postgres    false    479            �           1255    29667 '   update_sow_week(bigint, bigint, bigint)    FUNCTION       CREATE FUNCTION public.update_sow_week(old_week_id bigint, new_week_id bigint, current_sow_id bigint) RETURNS TABLE(updated boolean, rows_affected bigint)
    LANGUAGE plpgsql
    AS $$
BEGIN
    
    UPDATE public.sow_weeks
    SET week_id = new_week_id
    WHERE week_id = old_week_id AND sow_id = current_sow_id;

  
    RETURN QUERY
    SELECT 
        COUNT(*) > 0 AS updated,
        (SELECT COUNT(*) FROM public.sow_weeks WHERE week_id = new_week_id AND sow_id = current_sow_id) AS rows_affected;
END;
$$;
 e   DROP FUNCTION public.update_sow_week(old_week_id bigint, new_week_id bigint, current_sow_id bigint);
       public          postgres    false                       0    0 W   FUNCTION update_sow_week(old_week_id bigint, new_week_id bigint, current_sow_id bigint)    ACL     p  GRANT ALL ON FUNCTION public.update_sow_week(old_week_id bigint, new_week_id bigint, current_sow_id bigint) TO anon;
GRANT ALL ON FUNCTION public.update_sow_week(old_week_id bigint, new_week_id bigint, current_sow_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.update_sow_week(old_week_id bigint, new_week_id bigint, current_sow_id bigint) TO service_role;
          public          postgres    false    480            �           1255    29668    apply_rls(jsonb, integer)    FUNCTION     �(  CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;
 G   DROP FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer);
       realtime          supabase_admin    false    1256    16                       0    0 7   FUNCTION apply_rls(wal jsonb, max_record_bytes integer)    ACL     <  GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;
          realtime          supabase_admin    false    505            .           1255    59020 E   broadcast_changes(text, text, text, text, text, record, record, text)    FUNCTION       CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;
 �   DROP FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text);
       realtime          supabase_admin    false    16                       0    0 �   FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text)    ACL     v  GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;
          realtime          supabase_admin    false    302            �           1255    29670 C   build_prepared_statement_sql(text, regclass, realtime.wal_column[])    FUNCTION     �  CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;
 �   DROP FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]);
       realtime          supabase_admin    false    1253    16                       0    0 s   FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[])    ACL     �  GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;
          realtime          supabase_admin    false    500            �           1255    29671    cast(text, regtype)    FUNCTION       CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;
 8   DROP FUNCTION realtime."cast"(val text, type_ regtype);
       realtime          supabase_admin    false    16                       0    0 (   FUNCTION "cast"(val text, type_ regtype)    ACL     �  GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;
          realtime          supabase_admin    false    478            �           1255    29672 <   check_equality_op(realtime.equality_op, regtype, text, text)    FUNCTION     U  CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;
 j   DROP FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text);
       realtime          supabase_admin    false    16    1247                       0    0 Z   FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text)    ACL       GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;
          realtime          supabase_admin    false    508                       1255    29673 Q   is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[])    FUNCTION     �  CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;
 z   DROP FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]);
       realtime          supabase_admin    false    1250    1253    16                       0    0 j   FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[])    ACL     n  GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;
          realtime          supabase_admin    false    525                       1255    29674 *   list_changes(name, name, integer, integer)    FUNCTION     �  CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;
 v   DROP FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer);
       realtime          supabase_admin    false    16    1256                       0    0 f   FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer)    ACL     V  GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;
          realtime          supabase_admin    false    526            �           1255    29675    quote_wal2json(regclass)    FUNCTION     �  CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;
 8   DROP FUNCTION realtime.quote_wal2json(entity regclass);
       realtime          supabase_admin    false    16                       0    0 (   FUNCTION quote_wal2json(entity regclass)    ACL     �  GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;
          realtime          supabase_admin    false    509            A           1255    59019     send(jsonb, text, text, boolean)    FUNCTION       CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  partition_name text;
BEGIN
  partition_name := 'messages_' || to_char(NOW(), 'YYYY_MM_DD');

  IF NOT EXISTS (
    SELECT 1
    FROM pg_class c
    JOIN pg_namespace n ON n.oid = c.relnamespace
    WHERE n.nspname = 'realtime'
    AND c.relname = partition_name
  ) THEN
    EXECUTE format(
      'CREATE TABLE realtime.%I PARTITION OF realtime.messages FOR VALUES FROM (%L) TO (%L)',
      partition_name,
      NOW(),
      (NOW() + interval '1 day')::timestamp
    );
  END IF;

  INSERT INTO realtime.messages (payload, event, topic, private, extension)
  VALUES (payload, event, topic, private, 'broadcast');
END;
$$;
 U   DROP FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean);
       realtime          supabase_admin    false    16                        0    0 E   FUNCTION send(payload jsonb, event text, topic text, private boolean)    ACL     �   GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;
          realtime          supabase_admin    false    321            	           1255    29676    subscription_check_filters()    FUNCTION     <
  CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;
 5   DROP FUNCTION realtime.subscription_check_filters();
       realtime          supabase_admin    false    16            !           0    0 %   FUNCTION subscription_check_filters()    ACL     �  GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;
          realtime          supabase_admin    false    521            �           1255    29677    to_regrole(text)    FUNCTION     �   CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;
 3   DROP FUNCTION realtime.to_regrole(role_name text);
       realtime          supabase_admin    false    16            "           0    0 #   FUNCTION to_regrole(role_name text)    ACL     �  GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;
          realtime          supabase_admin    false    488            �           1255    29678    topic()    FUNCTION     �   CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;
     DROP FUNCTION realtime.topic();
       realtime          supabase_realtime_admin    false    16            #           0    0    FUNCTION topic()    ACL     n   GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;
          realtime          supabase_realtime_admin    false    489            �           1255    29679 *   can_insert_object(text, text, uuid, jsonb)    FUNCTION     �  CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;
 _   DROP FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb);
       storage          supabase_storage_admin    false    11            $           0    0 P   FUNCTION can_insert_object(bucketid text, name text, owner uuid, metadata jsonb)    ACL     s   GRANT ALL ON FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) TO postgres;
          storage          supabase_storage_admin    false    483            �           1255    29680    extension(text)    FUNCTION     Z  CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;
 ,   DROP FUNCTION storage.extension(name text);
       storage          supabase_storage_admin    false    11            %           0    0    FUNCTION extension(name text)    ACL     @   GRANT ALL ON FUNCTION storage.extension(name text) TO postgres;
          storage          supabase_storage_admin    false    484            �           1255    29681    filename(text)    FUNCTION     �   CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;
 +   DROP FUNCTION storage.filename(name text);
       storage          supabase_storage_admin    false    11            &           0    0    FUNCTION filename(name text)    ACL     ?   GRANT ALL ON FUNCTION storage.filename(name text) TO postgres;
          storage          supabase_storage_admin    false    485            �           1255    29682    foldername(text)    FUNCTION     �   CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;
 -   DROP FUNCTION storage.foldername(name text);
       storage          supabase_storage_admin    false    11            '           0    0    FUNCTION foldername(name text)    ACL     A   GRANT ALL ON FUNCTION storage.foldername(name text) TO postgres;
          storage          supabase_storage_admin    false    486            �           1255    29683    get_size_by_bucket()    FUNCTION        CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;
 ,   DROP FUNCTION storage.get_size_by_bucket();
       storage          supabase_storage_admin    false    11            (           0    0    FUNCTION get_size_by_bucket()    ACL     @   GRANT ALL ON FUNCTION storage.get_size_by_bucket() TO postgres;
          storage          supabase_storage_admin    false    487            �           1255    29684 L   list_multipart_uploads_with_delimiter(text, text, text, integer, text, text)    FUNCTION     9  CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;
 �   DROP FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text);
       storage          supabase_storage_admin    false    11            )           0    0 �   FUNCTION list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text)    ACL     �   GRANT ALL ON FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) TO postgres;
          storage          supabase_storage_admin    false    492                       1255    29685 B   list_objects_with_delimiter(text, text, text, integer, text, text)    FUNCTION     �  CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;
 �   DROP FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text);
       storage          supabase_storage_admin    false    11            *           0    0 �   FUNCTION list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text)    ACL     �   GRANT ALL ON FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) TO postgres;
          storage          supabase_storage_admin    false    519            �           1255    29686    operation()    FUNCTION     �   CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;
 #   DROP FUNCTION storage.operation();
       storage          supabase_storage_admin    false    11            +           0    0    FUNCTION operation()    ACL     7   GRANT ALL ON FUNCTION storage.operation() TO postgres;
          storage          supabase_storage_admin    false    490                       1255    29687 ?   search(text, text, integer, integer, integer, text, text, text)    FUNCTION       CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;
 �   DROP FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
       storage          supabase_storage_admin    false    11            ,           0    0 �   FUNCTION search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text)    ACL     �   GRANT ALL ON FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) TO postgres;
          storage          supabase_storage_admin    false    520            �           1255    29688    update_updated_at_column()    FUNCTION     �   CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;
 2   DROP FUNCTION storage.update_updated_at_column();
       storage          supabase_storage_admin    false    11            -           0    0 #   FUNCTION update_updated_at_column()    ACL     F   GRANT ALL ON FUNCTION storage.update_updated_at_column() TO postgres;
          storage          supabase_storage_admin    false    491            e           1255    29511    secrets_encrypt_secret_secret()    FUNCTION     (  CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;
 5   DROP FUNCTION vault.secrets_encrypt_secret_secret();
       vault          supabase_admin    false    18            �            1259    29689    audit_log_entries    TABLE     �   CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);
 #   DROP TABLE auth.audit_log_entries;
       auth         heap    supabase_auth_admin    false    14            .           0    0    TABLE audit_log_entries    COMMENT     R   COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';
          auth          supabase_auth_admin    false    253            /           0    0    TABLE audit_log_entries    ACL     �   GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;
          auth          supabase_auth_admin    false    253            �            1259    29695 
   flow_state    TABLE     �  CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);
    DROP TABLE auth.flow_state;
       auth         heap    supabase_auth_admin    false    1223    14            0           0    0    TABLE flow_state    COMMENT     G   COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';
          auth          supabase_auth_admin    false    254            1           0    0    TABLE flow_state    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;
          auth          supabase_auth_admin    false    254            �            1259    29700 
   identities    TABLE     �  CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);
    DROP TABLE auth.identities;
       auth         heap    supabase_auth_admin    false    14            2           0    0    TABLE identities    COMMENT     U   COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';
          auth          supabase_auth_admin    false    255            3           0    0    COLUMN identities.email    COMMENT     �   COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';
          auth          supabase_auth_admin    false    255            4           0    0    TABLE identities    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;
          auth          supabase_auth_admin    false    255                        1259    29707 	   instances    TABLE     �   CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE auth.instances;
       auth         heap    supabase_auth_admin    false    14            5           0    0    TABLE instances    COMMENT     Q   COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';
          auth          supabase_auth_admin    false    256            6           0    0    TABLE instances    ACL     �   GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;
          auth          supabase_auth_admin    false    256                       1259    29712    mfa_amr_claims    TABLE     �   CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);
     DROP TABLE auth.mfa_amr_claims;
       auth         heap    supabase_auth_admin    false    14            7           0    0    TABLE mfa_amr_claims    COMMENT     ~   COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';
          auth          supabase_auth_admin    false    257            8           0    0    TABLE mfa_amr_claims    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;
          auth          supabase_auth_admin    false    257                       1259    29717    mfa_challenges    TABLE       CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);
     DROP TABLE auth.mfa_challenges;
       auth         heap    supabase_auth_admin    false    14            9           0    0    TABLE mfa_challenges    COMMENT     _   COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';
          auth          supabase_auth_admin    false    258            :           0    0    TABLE mfa_challenges    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;
          auth          supabase_auth_admin    false    258                       1259    29722    mfa_factors    TABLE     �  CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);
    DROP TABLE auth.mfa_factors;
       auth         heap    supabase_auth_admin    false    1226    1229    14            ;           0    0    TABLE mfa_factors    COMMENT     L   COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';
          auth          supabase_auth_admin    false    259            <           0    0    TABLE mfa_factors    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;
          auth          supabase_auth_admin    false    259                       1259    29727    one_time_tokens    TABLE     �  CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);
 !   DROP TABLE auth.one_time_tokens;
       auth         heap    supabase_auth_admin    false    1232    14            =           0    0    TABLE one_time_tokens    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;
          auth          supabase_auth_admin    false    260                       1259    29735    refresh_tokens    TABLE     8  CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);
     DROP TABLE auth.refresh_tokens;
       auth         heap    supabase_auth_admin    false    14            >           0    0    TABLE refresh_tokens    COMMENT     n   COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';
          auth          supabase_auth_admin    false    261            ?           0    0    TABLE refresh_tokens    ACL     �   GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;
          auth          supabase_auth_admin    false    261                       1259    29740    refresh_tokens_id_seq    SEQUENCE     |   CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE auth.refresh_tokens_id_seq;
       auth          supabase_auth_admin    false    261    14            @           0    0    refresh_tokens_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;
          auth          supabase_auth_admin    false    262            A           0    0    SEQUENCE refresh_tokens_id_seq    ACL     �   GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;
          auth          supabase_auth_admin    false    262                       1259    29741    saml_providers    TABLE     H  CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);
     DROP TABLE auth.saml_providers;
       auth         heap    supabase_auth_admin    false    14            B           0    0    TABLE saml_providers    COMMENT     ]   COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';
          auth          supabase_auth_admin    false    263            C           0    0    TABLE saml_providers    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;
          auth          supabase_auth_admin    false    263                       1259    29749    saml_relay_states    TABLE     `  CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);
 #   DROP TABLE auth.saml_relay_states;
       auth         heap    supabase_auth_admin    false    14            D           0    0    TABLE saml_relay_states    COMMENT     �   COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';
          auth          supabase_auth_admin    false    264            E           0    0    TABLE saml_relay_states    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;
          auth          supabase_auth_admin    false    264            	           1259    29755    schema_migrations    TABLE     U   CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);
 #   DROP TABLE auth.schema_migrations;
       auth         heap    supabase_auth_admin    false    14            F           0    0    TABLE schema_migrations    COMMENT     X   COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';
          auth          supabase_auth_admin    false    265            G           0    0    TABLE schema_migrations    ACL     �   GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;
          auth          supabase_auth_admin    false    265            
           1259    29758    sessions    TABLE     T  CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);
    DROP TABLE auth.sessions;
       auth         heap    supabase_auth_admin    false    14    1220            H           0    0    TABLE sessions    COMMENT     U   COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';
          auth          supabase_auth_admin    false    266            I           0    0    COLUMN sessions.not_after    COMMENT     �   COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';
          auth          supabase_auth_admin    false    266            J           0    0    TABLE sessions    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;
          auth          supabase_auth_admin    false    266                       1259    29763    sso_domains    TABLE       CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);
    DROP TABLE auth.sso_domains;
       auth         heap    supabase_auth_admin    false    14            K           0    0    TABLE sso_domains    COMMENT     t   COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';
          auth          supabase_auth_admin    false    267            L           0    0    TABLE sso_domains    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;
          auth          supabase_auth_admin    false    267                       1259    29769    sso_providers    TABLE       CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);
    DROP TABLE auth.sso_providers;
       auth         heap    supabase_auth_admin    false    14            M           0    0    TABLE sso_providers    COMMENT     x   COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';
          auth          supabase_auth_admin    false    268            N           0    0     COLUMN sso_providers.resource_id    COMMENT     �   COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';
          auth          supabase_auth_admin    false    268            O           0    0    TABLE sso_providers    ACL     �   GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;
          auth          supabase_auth_admin    false    268                       1259    29775    users    TABLE     4  CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);
    DROP TABLE auth.users;
       auth         heap    supabase_auth_admin    false    14            P           0    0    TABLE users    COMMENT     W   COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';
          auth          supabase_auth_admin    false    269            Q           0    0    COLUMN users.is_sso_user    COMMENT     �   COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';
          auth          supabase_auth_admin    false    269            R           0    0    TABLE users    ACL     �   GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;
          auth          supabase_auth_admin    false    269            S           0    0    TABLE pg_stat_statements    ACL     �   GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;
       
   extensions          supabase_admin    false    247            T           0    0    TABLE pg_stat_statements_info    ACL     �   GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;
       
   extensions          supabase_admin    false    246            U           0    0    TABLE decrypted_key    ACL     A   GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    245            V           0    0    TABLE masking_rule    ACL     @   GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    243            W           0    0    TABLE mask_columns    ACL     @   GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    244                       1259    29790 	   class_sow    TABLE     \   CREATE TABLE public.class_sow (
    class_id bigint NOT NULL,
    sow_id bigint NOT NULL
);
    DROP TABLE public.class_sow;
       public         heap    postgres    false            X           0    0    TABLE class_sow    ACL     �   GRANT ALL ON TABLE public.class_sow TO anon;
GRANT ALL ON TABLE public.class_sow TO authenticated;
GRANT ALL ON TABLE public.class_sow TO service_role;
          public          postgres    false    270                       1259    29793    class_sow_class_id_seq    SEQUENCE     �   ALTER TABLE public.class_sow ALTER COLUMN class_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.class_sow_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    270            Y           0    0    SEQUENCE class_sow_class_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.class_sow_class_id_seq TO anon;
GRANT ALL ON SEQUENCE public.class_sow_class_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.class_sow_class_id_seq TO service_role;
          public          postgres    false    271                       1259    29794    classes    TABLE     �   CREATE TABLE public.classes (
    id bigint NOT NULL,
    class_name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);
    DROP TABLE public.classes;
       public         heap    postgres    false            Z           0    0    TABLE classes    ACL     �   GRANT ALL ON TABLE public.classes TO anon;
GRANT ALL ON TABLE public.classes TO authenticated;
GRANT ALL ON TABLE public.classes TO service_role;
          public          postgres    false    272                       1259    29800    classes_id_seq    SEQUENCE     �   ALTER TABLE public.classes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    272            [           0    0    SEQUENCE classes_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.classes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.classes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.classes_id_seq TO service_role;
          public          postgres    false    273                       1259    29801    question_tags    TABLE     c   CREATE TABLE public.question_tags (
    question_id bigint NOT NULL,
    tag_id bigint NOT NULL
);
 !   DROP TABLE public.question_tags;
       public         heap    postgres    false            \           0    0    TABLE question_tags    ACL     �   GRANT ALL ON TABLE public.question_tags TO anon;
GRANT ALL ON TABLE public.question_tags TO authenticated;
GRANT ALL ON TABLE public.question_tags TO service_role;
          public          postgres    false    274                       1259    29804 	   questions    TABLE     �   CREATE TABLE public.questions (
    id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT (now() AT TIME ZONE 'bst'::text),
    difficulty public.difficulty
);
    DROP TABLE public.questions;
       public         heap    postgres    false    1241            ]           0    0    TABLE questions    ACL     �   GRANT ALL ON TABLE public.questions TO anon;
GRANT ALL ON TABLE public.questions TO authenticated;
GRANT ALL ON TABLE public.questions TO service_role;
          public          postgres    false    275                       1259    29808    questions_id_seq    SEQUENCE     �   ALTER TABLE public.questions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    275            ^           0    0    SEQUENCE questions_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.questions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.questions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.questions_id_seq TO service_role;
          public          postgres    false    276                       1259    29809    role_permissions    TABLE     �   CREATE TABLE public.role_permissions (
    id bigint NOT NULL,
    role public.app_role NOT NULL,
    permission public.app_permission NOT NULL
);
 $   DROP TABLE public.role_permissions;
       public         heap    postgres    false    1238    1235            _           0    0    TABLE role_permissions    COMMENT     V   COMMENT ON TABLE public.role_permissions IS 'Application permissions for each role.';
          public          postgres    false    277            `           0    0    TABLE role_permissions    ACL     �   GRANT ALL ON TABLE public.role_permissions TO anon;
GRANT ALL ON TABLE public.role_permissions TO authenticated;
GRANT ALL ON TABLE public.role_permissions TO service_role;
          public          postgres    false    277                       1259    29812    role_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.role_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.role_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    277            a           0    0     SEQUENCE role_permissions_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.role_permissions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.role_permissions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.role_permissions_id_seq TO service_role;
          public          postgres    false    278                       1259    29813    sow    TABLE     E   CREATE TABLE public.sow (
    id bigint NOT NULL,
    year bigint
);
    DROP TABLE public.sow;
       public         heap    postgres    false            b           0    0 	   TABLE sow    ACL     �   GRANT ALL ON TABLE public.sow TO anon;
GRANT ALL ON TABLE public.sow TO authenticated;
GRANT ALL ON TABLE public.sow TO service_role;
          public          postgres    false    279                       1259    29816 
   sow_id_seq    SEQUENCE     �   ALTER TABLE public.sow ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.sow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    279            c           0    0    SEQUENCE sow_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.sow_id_seq TO anon;
GRANT ALL ON SEQUENCE public.sow_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.sow_id_seq TO service_role;
          public          postgres    false    280                       1259    29817 	   sow_weeks    TABLE     [   CREATE TABLE public.sow_weeks (
    sow_id bigint NOT NULL,
    week_id bigint NOT NULL
);
    DROP TABLE public.sow_weeks;
       public         heap    postgres    false            d           0    0    TABLE sow_weeks    ACL     �   GRANT ALL ON TABLE public.sow_weeks TO anon;
GRANT ALL ON TABLE public.sow_weeks TO authenticated;
GRANT ALL ON TABLE public.sow_weeks TO service_role;
          public          postgres    false    281                       1259    29820    sow_weeks_sow_id_seq    SEQUENCE     �   ALTER TABLE public.sow_weeks ALTER COLUMN sow_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.sow_weeks_sow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    281            e           0    0    SEQUENCE sow_weeks_sow_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.sow_weeks_sow_id_seq TO anon;
GRANT ALL ON SEQUENCE public.sow_weeks_sow_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.sow_weeks_sow_id_seq TO service_role;
          public          postgres    false    282                       1259    29821    tags    TABLE     y   CREATE TABLE public.tags (
    id bigint NOT NULL,
    tag character varying NOT NULL,
    category character varying
);
    DROP TABLE public.tags;
       public         heap    postgres    false            f           0    0 
   TABLE tags    ACL     �   GRANT ALL ON TABLE public.tags TO anon;
GRANT ALL ON TABLE public.tags TO authenticated;
GRANT ALL ON TABLE public.tags TO service_role;
          public          postgres    false    283                       1259    29826    tags_id_seq    SEQUENCE     �   ALTER TABLE public.tags ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    283            g           0    0    SEQUENCE tags_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.tags_id_seq TO anon;
GRANT ALL ON SEQUENCE public.tags_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.tags_id_seq TO service_role;
          public          postgres    false    284                       1259    29827    teacher_classes    TABLE     p   CREATE TABLE public.teacher_classes (
    id bigint NOT NULL,
    user_id uuid,
    class_id bigint NOT NULL
);
 #   DROP TABLE public.teacher_classes;
       public         heap    postgres    false            h           0    0    TABLE teacher_classes    ACL     �   GRANT ALL ON TABLE public.teacher_classes TO anon;
GRANT ALL ON TABLE public.teacher_classes TO authenticated;
GRANT ALL ON TABLE public.teacher_classes TO service_role;
          public          postgres    false    285                       1259    29830    teacher_classes_id_seq    SEQUENCE     �   ALTER TABLE public.teacher_classes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.teacher_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    285            i           0    0    SEQUENCE teacher_classes_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.teacher_classes_id_seq TO anon;
GRANT ALL ON SEQUENCE public.teacher_classes_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.teacher_classes_id_seq TO service_role;
          public          postgres    false    286                       1259    29831 
   user_roles    TABLE     y   CREATE TABLE public.user_roles (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    role public.app_role NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false    1238            j           0    0    TABLE user_roles    COMMENT     J   COMMENT ON TABLE public.user_roles IS 'Application roles for each user.';
          public          postgres    false    287            k           0    0    TABLE user_roles    ACL     �   GRANT ALL ON TABLE public.user_roles TO service_role;
GRANT ALL ON TABLE public.user_roles TO supabase_auth_admin;
GRANT SELECT ON TABLE public.user_roles TO anon;
GRANT SELECT ON TABLE public.user_roles TO PUBLIC;
          public          postgres    false    287                        1259    29834    user_roles_id_seq    SEQUENCE     �   ALTER TABLE public.user_roles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    287            l           0    0    SEQUENCE user_roles_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.user_roles_id_seq TO anon;
GRANT ALL ON SEQUENCE public.user_roles_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.user_roles_id_seq TO service_role;
          public          postgres    false    288            !           1259    29835    weeks    TABLE     N   CREATE TABLE public.weeks (
    id bigint NOT NULL,
    week_number bigint
);
    DROP TABLE public.weeks;
       public         heap    postgres    false            m           0    0    TABLE weeks    ACL     �   GRANT ALL ON TABLE public.weeks TO anon;
GRANT ALL ON TABLE public.weeks TO authenticated;
GRANT ALL ON TABLE public.weeks TO service_role;
          public          postgres    false    289            "           1259    29838    weeks_id_seq    SEQUENCE     �   ALTER TABLE public.weeks ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.weeks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    289            n           0    0    SEQUENCE weeks_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.weeks_id_seq TO anon;
GRANT ALL ON SEQUENCE public.weeks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.weeks_id_seq TO service_role;
          public          postgres    false    290            #           1259    29839 
   weeks_tags    TABLE     \   CREATE TABLE public.weeks_tags (
    tag_id bigint NOT NULL,
    week_id bigint NOT NULL
);
    DROP TABLE public.weeks_tags;
       public         heap    postgres    false            o           0    0    TABLE weeks_tags    ACL     �   GRANT ALL ON TABLE public.weeks_tags TO anon;
GRANT ALL ON TABLE public.weeks_tags TO authenticated;
GRANT ALL ON TABLE public.weeks_tags TO service_role;
          public          postgres    false    291            -           1259    59023    messages    TABLE     w  CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);
    DROP TABLE realtime.messages;
       realtime            supabase_realtime_admin    false    16            p           0    0    TABLE messages    ACL     8  GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;
          realtime          supabase_realtime_admin    false    301            $           1259    29848    schema_migrations    TABLE     y   CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 '   DROP TABLE realtime.schema_migrations;
       realtime         heap    supabase_admin    false    16            q           0    0    TABLE schema_migrations    ACL     �  GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;
          realtime          supabase_admin    false    292            %           1259    29851    subscription    TABLE     �  CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);
 "   DROP TABLE realtime.subscription;
       realtime         heap    supabase_admin    false    1250    488    16    1250            r           0    0    TABLE subscription    ACL     g  GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;
          realtime          supabase_admin    false    293            &           1259    29859    subscription_id_seq    SEQUENCE     �   ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            realtime          supabase_admin    false    16    293            s           0    0    SEQUENCE subscription_id_seq    ACL     �  GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;
          realtime          supabase_admin    false    294            '           1259    29860    buckets    TABLE     k  CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);
    DROP TABLE storage.buckets;
       storage         heap    supabase_storage_admin    false    11            t           0    0    COLUMN buckets.owner    COMMENT     X   COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';
          storage          supabase_storage_admin    false    295            u           0    0    TABLE buckets    ACL     �   GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;
          storage          supabase_storage_admin    false    295            (           1259    29869 
   migrations    TABLE     �   CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE storage.migrations;
       storage         heap    supabase_storage_admin    false    11            v           0    0    TABLE migrations    ACL     �   GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;
          storage          supabase_storage_admin    false    296            )           1259    29873    objects    TABLE     �  CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);
    DROP TABLE storage.objects;
       storage         heap    supabase_storage_admin    false    11            w           0    0    COLUMN objects.owner    COMMENT     X   COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';
          storage          supabase_storage_admin    false    297            x           0    0    TABLE objects    ACL     �   GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;
          storage          supabase_storage_admin    false    297            *           1259    29883    s3_multipart_uploads    TABLE     j  CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);
 )   DROP TABLE storage.s3_multipart_uploads;
       storage         heap    supabase_storage_admin    false    11            y           0    0    TABLE s3_multipart_uploads    ACL     �   GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads TO postgres;
          storage          supabase_storage_admin    false    298            +           1259    29890    s3_multipart_uploads_parts    TABLE     �  CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
 /   DROP TABLE storage.s3_multipart_uploads_parts;
       storage         heap    supabase_storage_admin    false    11            z           0    0     TABLE s3_multipart_uploads_parts    ACL       GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO postgres;
          storage          supabase_storage_admin    false    299            �            1259    29507    decrypted_secrets    VIEW     �  CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;
 #   DROP VIEW vault.decrypted_secrets;
       vault          supabase_admin    false    3    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    15    15    2    15    2    15    18    2    15    3    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    15    15    2    15    2    15    18    3    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    15    15    2    15    2    15    18    3    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    15    15    2    15    2    15    18    3    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    15    15    2    15    2    15    18    3    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    15    15    2    15    2    15    18    3    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    15    15    2    15    2    15    18    3    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    2    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    2    15    15    2    15    2    15    2    15    2    15    15    2    15    15    2    15    2    15    18    18            �           2604    29898    refresh_tokens id    DEFAULT     r   ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);
 >   ALTER TABLE auth.refresh_tokens ALTER COLUMN id DROP DEFAULT;
       auth          supabase_auth_admin    false    262    261            �          0    29689    audit_log_entries 
   TABLE DATA           [   COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
    auth          supabase_auth_admin    false    253   D�      �          0    29695 
   flow_state 
   TABLE DATA           �   COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
    auth          supabase_auth_admin    false    254   a�      �          0    29700 
   identities 
   TABLE DATA           ~   COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
    auth          supabase_auth_admin    false    255   ~�      �          0    29707 	   instances 
   TABLE DATA           T   COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    256   E�      �          0    29712    mfa_amr_claims 
   TABLE DATA           e   COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
    auth          supabase_auth_admin    false    257   b�      �          0    29717    mfa_challenges 
   TABLE DATA           |   COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
    auth          supabase_auth_admin    false    258   9      �          0    29722    mfa_factors 
   TABLE DATA           �   COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
    auth          supabase_auth_admin    false    259   V      �          0    29727    one_time_tokens 
   TABLE DATA           p   COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    260   s      �          0    29735    refresh_tokens 
   TABLE DATA           |   COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
    auth          supabase_auth_admin    false    261   x      �          0    29741    saml_providers 
   TABLE DATA           �   COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
    auth          supabase_auth_admin    false    263   :�      �          0    29749    saml_relay_states 
   TABLE DATA           �   COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
    auth          supabase_auth_admin    false    264   W�      �          0    29755    schema_migrations 
   TABLE DATA           2   COPY auth.schema_migrations (version) FROM stdin;
    auth          supabase_auth_admin    false    265   t�      �          0    29758    sessions 
   TABLE DATA           �   COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
    auth          supabase_auth_admin    false    266   ��      �          0    29763    sso_domains 
   TABLE DATA           X   COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    267   r�      �          0    29769    sso_providers 
   TABLE DATA           N   COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    268   ��      �          0    29775    users 
   TABLE DATA           O  COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
    auth          supabase_auth_admin    false    269   ��      �          0    29240    key 
   TABLE DATA           �   COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
    pgsodium          supabase_admin    false    240   ��      �          0    29790 	   class_sow 
   TABLE DATA           5   COPY public.class_sow (class_id, sow_id) FROM stdin;
    public          postgres    false    270   ��      �          0    29794    classes 
   TABLE DATA           =   COPY public.classes (id, class_name, created_at) FROM stdin;
    public          postgres    false    272   S       �          0    29801    question_tags 
   TABLE DATA           <   COPY public.question_tags (question_id, tag_id) FROM stdin;
    public          postgres    false    274   �       �          0    29804 	   questions 
   TABLE DATA           ?   COPY public.questions (id, created_at, difficulty) FROM stdin;
    public          postgres    false    275   �      �          0    29809    role_permissions 
   TABLE DATA           @   COPY public.role_permissions (id, role, permission) FROM stdin;
    public          postgres    false    277   �      �          0    29813    sow 
   TABLE DATA           '   COPY public.sow (id, year) FROM stdin;
    public          postgres    false    279   z      �          0    29817 	   sow_weeks 
   TABLE DATA           4   COPY public.sow_weeks (sow_id, week_id) FROM stdin;
    public          postgres    false    281   �      �          0    29821    tags 
   TABLE DATA           1   COPY public.tags (id, tag, category) FROM stdin;
    public          postgres    false    283   
      �          0    29827    teacher_classes 
   TABLE DATA           @   COPY public.teacher_classes (id, user_id, class_id) FROM stdin;
    public          postgres    false    285         �          0    29831 
   user_roles 
   TABLE DATA           7   COPY public.user_roles (id, user_id, role) FROM stdin;
    public          postgres    false    287   �      �          0    29835    weeks 
   TABLE DATA           0   COPY public.weeks (id, week_number) FROM stdin;
    public          postgres    false    289   D      �          0    29839 
   weeks_tags 
   TABLE DATA           5   COPY public.weeks_tags (tag_id, week_id) FROM stdin;
    public          postgres    false    291   +      �          0    29848    schema_migrations 
   TABLE DATA           C   COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
    realtime          supabase_admin    false    292   �9      �          0    29851    subscription 
   TABLE DATA           b   COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
    realtime          supabase_admin    false    293   �;      �          0    29860    buckets 
   TABLE DATA           �   COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
    storage          supabase_storage_admin    false    295   �;      �          0    29869 
   migrations 
   TABLE DATA           B   COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
    storage          supabase_storage_admin    false    296   *<      �          0    29873    objects 
   TABLE DATA           �   COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
    storage          supabase_storage_admin    false    297   A      �          0    29883    s3_multipart_uploads 
   TABLE DATA           �   COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
    storage          supabase_storage_admin    false    298   2x      �          0    29890    s3_multipart_uploads_parts 
   TABLE DATA           �   COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
    storage          supabase_storage_admin    false    299   Ox      �          0    29488    secrets 
   TABLE DATA           f   COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
    vault          supabase_admin    false    248   lx      {           0    0    refresh_tokens_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 940, true);
          auth          supabase_auth_admin    false    262            |           0    0    key_key_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);
          pgsodium          supabase_admin    false    239            }           0    0    class_sow_class_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.class_sow_class_id_seq', 1, false);
          public          postgres    false    271            ~           0    0    classes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.classes_id_seq', 41, true);
          public          postgres    false    273                       0    0    questions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.questions_id_seq', 7, true);
          public          postgres    false    276            �           0    0    role_permissions_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.role_permissions_id_seq', 20, true);
          public          postgres    false    278            �           0    0 
   sow_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sow_id_seq', 430, true);
          public          postgres    false    280            �           0    0    sow_weeks_sow_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sow_weeks_sow_id_seq', 1, false);
          public          postgres    false    282            �           0    0    tags_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.tags_id_seq', 69, true);
          public          postgres    false    284            �           0    0    teacher_classes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.teacher_classes_id_seq', 12, true);
          public          postgres    false    286            �           0    0    user_roles_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_roles_id_seq', 6, true);
          public          postgres    false    288            �           0    0    weeks_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.weeks_id_seq', 1599, true);
          public          postgres    false    290            �           0    0    subscription_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);
          realtime          supabase_admin    false    294                       2606    29901    mfa_amr_claims amr_id_pk 
   CONSTRAINT     T   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT amr_id_pk;
       auth            supabase_auth_admin    false    257            �           2606    29903 (   audit_log_entries audit_log_entries_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY auth.audit_log_entries DROP CONSTRAINT audit_log_entries_pkey;
       auth            supabase_auth_admin    false    253                       2606    29905    flow_state flow_state_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY auth.flow_state DROP CONSTRAINT flow_state_pkey;
       auth            supabase_auth_admin    false    254                       2606    29907    identities identities_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_pkey;
       auth            supabase_auth_admin    false    255            
           2606    29909 1   identities identities_provider_id_provider_unique 
   CONSTRAINT     {   ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);
 Y   ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_provider_id_provider_unique;
       auth            supabase_auth_admin    false    255    255                       2606    29911    instances instances_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY auth.instances DROP CONSTRAINT instances_pkey;
       auth            supabase_auth_admin    false    256                       2606    29913 C   mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);
 k   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey;
       auth            supabase_auth_admin    false    257    257                       2606    29915 "   mfa_challenges mfa_challenges_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_pkey;
       auth            supabase_auth_admin    false    258                       2606    29917 .   mfa_factors mfa_factors_last_challenged_at_key 
   CONSTRAINT     u   ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);
 V   ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_last_challenged_at_key;
       auth            supabase_auth_admin    false    259                       2606    29919    mfa_factors mfa_factors_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_pkey;
       auth            supabase_auth_admin    false    259                       2606    29921 $   one_time_tokens one_time_tokens_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY auth.one_time_tokens DROP CONSTRAINT one_time_tokens_pkey;
       auth            supabase_auth_admin    false    260            &           2606    29923 "   refresh_tokens refresh_tokens_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_pkey;
       auth            supabase_auth_admin    false    261            )           2606    29925 *   refresh_tokens refresh_tokens_token_unique 
   CONSTRAINT     d   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);
 R   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_token_unique;
       auth            supabase_auth_admin    false    261            ,           2606    29927 +   saml_providers saml_providers_entity_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);
 S   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_entity_id_key;
       auth            supabase_auth_admin    false    263            .           2606    29929 "   saml_providers saml_providers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_pkey;
       auth            supabase_auth_admin    false    263            3           2606    29931 (   saml_relay_states saml_relay_states_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_pkey;
       auth            supabase_auth_admin    false    264            6           2606    29933 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 P   ALTER TABLE ONLY auth.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       auth            supabase_auth_admin    false    265            9           2606    29935    sessions sessions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_pkey;
       auth            supabase_auth_admin    false    266            >           2606    29937    sso_domains sso_domains_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_pkey;
       auth            supabase_auth_admin    false    267            A           2606    29939     sso_providers sso_providers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY auth.sso_providers DROP CONSTRAINT sso_providers_pkey;
       auth            supabase_auth_admin    false    268            M           2606    29941    users users_phone_key 
   CONSTRAINT     O   ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 =   ALTER TABLE ONLY auth.users DROP CONSTRAINT users_phone_key;
       auth            supabase_auth_admin    false    269            O           2606    29943    users users_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY auth.users DROP CONSTRAINT users_pkey;
       auth            supabase_auth_admin    false    269            Q           2606    29945     class_sow class_sow_class_id_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.class_sow
    ADD CONSTRAINT class_sow_class_id_key UNIQUE (class_id);
 J   ALTER TABLE ONLY public.class_sow DROP CONSTRAINT class_sow_class_id_key;
       public            postgres    false    270            S           2606    29947    class_sow class_sow_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.class_sow
    ADD CONSTRAINT class_sow_pkey PRIMARY KEY (class_id, sow_id);
 B   ALTER TABLE ONLY public.class_sow DROP CONSTRAINT class_sow_pkey;
       public            postgres    false    270    270            U           2606    29949    classes classes_class_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_class_name_key UNIQUE (class_name);
 H   ALTER TABLE ONLY public.classes DROP CONSTRAINT classes_class_name_key;
       public            postgres    false    272            W           2606    29951    classes classes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.classes DROP CONSTRAINT classes_pkey;
       public            postgres    false    272            Y           2606    29953     question_tags question_tags_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.question_tags
    ADD CONSTRAINT question_tags_pkey PRIMARY KEY (question_id, tag_id);
 J   ALTER TABLE ONLY public.question_tags DROP CONSTRAINT question_tags_pkey;
       public            postgres    false    274    274            [           2606    29955    questions questions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public            postgres    false    275            ]           2606    29957 &   role_permissions role_permissions_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id, role, permission);
 P   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT role_permissions_pkey;
       public            postgres    false    277    277    277            _           2606    29959 5   role_permissions role_permissions_role_permission_key 
   CONSTRAINT     |   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_permission_key UNIQUE (role, permission);
 _   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT role_permissions_role_permission_key;
       public            postgres    false    277    277            a           2606    29961    sow sow_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.sow
    ADD CONSTRAINT sow_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.sow DROP CONSTRAINT sow_pkey;
       public            postgres    false    279            c           2606    29963    sow_weeks sow_weeks_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.sow_weeks
    ADD CONSTRAINT sow_weeks_pkey PRIMARY KEY (sow_id, week_id);
 B   ALTER TABLE ONLY public.sow_weeks DROP CONSTRAINT sow_weeks_pkey;
       public            postgres    false    281    281            e           2606    29965    tags tags_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            postgres    false    283            g           2606    29967    tags tags_tag_key 
   CONSTRAINT     K   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_tag_key UNIQUE (tag);
 ;   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_tag_key;
       public            postgres    false    283            i           2606    29969 $   teacher_classes teacher_classes_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.teacher_classes
    ADD CONSTRAINT teacher_classes_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.teacher_classes DROP CONSTRAINT teacher_classes_pkey;
       public            postgres    false    285            k           2606    29971    user_roles user_roles_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    287            m           2606    29973 &   user_roles user_roles_user_id_role_key 
   CONSTRAINT     j   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_role_key UNIQUE (user_id, role);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_user_id_role_key;
       public            postgres    false    287    287            o           2606    29975    weeks weeks_id_key 
   CONSTRAINT     K   ALTER TABLE ONLY public.weeks
    ADD CONSTRAINT weeks_id_key UNIQUE (id);
 <   ALTER TABLE ONLY public.weeks DROP CONSTRAINT weeks_id_key;
       public            postgres    false    289            q           2606    29977    weeks weeks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.weeks
    ADD CONSTRAINT weeks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.weeks DROP CONSTRAINT weeks_pkey;
       public            postgres    false    289            s           2606    29979    weeks_tags weeks_tags_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.weeks_tags
    ADD CONSTRAINT weeks_tags_pkey PRIMARY KEY (tag_id, week_id);
 D   ALTER TABLE ONLY public.weeks_tags DROP CONSTRAINT weeks_tags_pkey;
       public            postgres    false    291    291            �           2606    59037    messages messages_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);
 B   ALTER TABLE ONLY realtime.messages DROP CONSTRAINT messages_pkey;
       realtime            supabase_realtime_admin    false    301    301            x           2606    29983    subscription pk_subscription 
   CONSTRAINT     \   ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);
 H   ALTER TABLE ONLY realtime.subscription DROP CONSTRAINT pk_subscription;
       realtime            supabase_admin    false    293            u           2606    29985 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 T   ALTER TABLE ONLY realtime.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       realtime            supabase_admin    false    292            |           2606    29987    buckets buckets_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY storage.buckets DROP CONSTRAINT buckets_pkey;
       storage            supabase_storage_admin    false    295            ~           2606    29989    migrations migrations_name_key 
   CONSTRAINT     Z   ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);
 I   ALTER TABLE ONLY storage.migrations DROP CONSTRAINT migrations_name_key;
       storage            supabase_storage_admin    false    296            �           2606    29991    migrations migrations_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY storage.migrations DROP CONSTRAINT migrations_pkey;
       storage            supabase_storage_admin    false    296            �           2606    29993    objects objects_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY storage.objects DROP CONSTRAINT objects_pkey;
       storage            supabase_storage_admin    false    297            �           2606    29995 :   s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);
 e   ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_pkey;
       storage            supabase_storage_admin    false    299            �           2606    29997 .   s3_multipart_uploads s3_multipart_uploads_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY storage.s3_multipart_uploads DROP CONSTRAINT s3_multipart_uploads_pkey;
       storage            supabase_storage_admin    false    298                        1259    29998    audit_logs_instance_id_idx    INDEX     ]   CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);
 ,   DROP INDEX auth.audit_logs_instance_id_idx;
       auth            supabase_auth_admin    false    253            C           1259    29999    confirmation_token_idx    INDEX     �   CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);
 (   DROP INDEX auth.confirmation_token_idx;
       auth            supabase_auth_admin    false    269    269            D           1259    30000    email_change_token_current_idx    INDEX     �   CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);
 0   DROP INDEX auth.email_change_token_current_idx;
       auth            supabase_auth_admin    false    269    269            E           1259    30001    email_change_token_new_idx    INDEX     �   CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);
 ,   DROP INDEX auth.email_change_token_new_idx;
       auth            supabase_auth_admin    false    269    269                       1259    30002    factor_id_created_at_idx    INDEX     ]   CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);
 *   DROP INDEX auth.factor_id_created_at_idx;
       auth            supabase_auth_admin    false    259    259                       1259    30003    flow_state_created_at_idx    INDEX     Y   CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);
 +   DROP INDEX auth.flow_state_created_at_idx;
       auth            supabase_auth_admin    false    254                       1259    30004    identities_email_idx    INDEX     [   CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);
 &   DROP INDEX auth.identities_email_idx;
       auth            supabase_auth_admin    false    255            �           0    0    INDEX identities_email_idx    COMMENT     c   COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';
          auth          supabase_auth_admin    false    3846                       1259    30005    identities_user_id_idx    INDEX     N   CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);
 (   DROP INDEX auth.identities_user_id_idx;
       auth            supabase_auth_admin    false    255                       1259    30006    idx_auth_code    INDEX     G   CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);
    DROP INDEX auth.idx_auth_code;
       auth            supabase_auth_admin    false    254                       1259    30007    idx_user_id_auth_method    INDEX     f   CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);
 )   DROP INDEX auth.idx_user_id_auth_method;
       auth            supabase_auth_admin    false    254    254                       1259    30008    mfa_challenge_created_at_idx    INDEX     `   CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);
 .   DROP INDEX auth.mfa_challenge_created_at_idx;
       auth            supabase_auth_admin    false    258                       1259    30009 %   mfa_factors_user_friendly_name_unique    INDEX     �   CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);
 7   DROP INDEX auth.mfa_factors_user_friendly_name_unique;
       auth            supabase_auth_admin    false    259    259    259                       1259    30010    mfa_factors_user_id_idx    INDEX     P   CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);
 )   DROP INDEX auth.mfa_factors_user_id_idx;
       auth            supabase_auth_admin    false    259                       1259    30011 #   one_time_tokens_relates_to_hash_idx    INDEX     b   CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);
 5   DROP INDEX auth.one_time_tokens_relates_to_hash_idx;
       auth            supabase_auth_admin    false    260                        1259    30012 #   one_time_tokens_token_hash_hash_idx    INDEX     b   CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);
 5   DROP INDEX auth.one_time_tokens_token_hash_hash_idx;
       auth            supabase_auth_admin    false    260            !           1259    30013 &   one_time_tokens_user_id_token_type_key    INDEX     v   CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);
 8   DROP INDEX auth.one_time_tokens_user_id_token_type_key;
       auth            supabase_auth_admin    false    260    260            F           1259    30014    reauthentication_token_idx    INDEX     �   CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);
 ,   DROP INDEX auth.reauthentication_token_idx;
       auth            supabase_auth_admin    false    269    269            G           1259    30015    recovery_token_idx    INDEX     �   CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);
 $   DROP INDEX auth.recovery_token_idx;
       auth            supabase_auth_admin    false    269    269            "           1259    30016    refresh_tokens_instance_id_idx    INDEX     ^   CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);
 0   DROP INDEX auth.refresh_tokens_instance_id_idx;
       auth            supabase_auth_admin    false    261            #           1259    30017 &   refresh_tokens_instance_id_user_id_idx    INDEX     o   CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);
 8   DROP INDEX auth.refresh_tokens_instance_id_user_id_idx;
       auth            supabase_auth_admin    false    261    261            $           1259    30018    refresh_tokens_parent_idx    INDEX     T   CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);
 +   DROP INDEX auth.refresh_tokens_parent_idx;
       auth            supabase_auth_admin    false    261            '           1259    30019 %   refresh_tokens_session_id_revoked_idx    INDEX     m   CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);
 7   DROP INDEX auth.refresh_tokens_session_id_revoked_idx;
       auth            supabase_auth_admin    false    261    261            *           1259    30020    refresh_tokens_updated_at_idx    INDEX     a   CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);
 /   DROP INDEX auth.refresh_tokens_updated_at_idx;
       auth            supabase_auth_admin    false    261            /           1259    30021 "   saml_providers_sso_provider_id_idx    INDEX     f   CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);
 4   DROP INDEX auth.saml_providers_sso_provider_id_idx;
       auth            supabase_auth_admin    false    263            0           1259    30022     saml_relay_states_created_at_idx    INDEX     g   CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);
 2   DROP INDEX auth.saml_relay_states_created_at_idx;
       auth            supabase_auth_admin    false    264            1           1259    30023    saml_relay_states_for_email_idx    INDEX     `   CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);
 1   DROP INDEX auth.saml_relay_states_for_email_idx;
       auth            supabase_auth_admin    false    264            4           1259    30024 %   saml_relay_states_sso_provider_id_idx    INDEX     l   CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);
 7   DROP INDEX auth.saml_relay_states_sso_provider_id_idx;
       auth            supabase_auth_admin    false    264            7           1259    30025    sessions_not_after_idx    INDEX     S   CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);
 (   DROP INDEX auth.sessions_not_after_idx;
       auth            supabase_auth_admin    false    266            :           1259    30026    sessions_user_id_idx    INDEX     J   CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);
 &   DROP INDEX auth.sessions_user_id_idx;
       auth            supabase_auth_admin    false    266            <           1259    30027    sso_domains_domain_idx    INDEX     \   CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));
 (   DROP INDEX auth.sso_domains_domain_idx;
       auth            supabase_auth_admin    false    267    267            ?           1259    30028    sso_domains_sso_provider_id_idx    INDEX     `   CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);
 1   DROP INDEX auth.sso_domains_sso_provider_id_idx;
       auth            supabase_auth_admin    false    267            B           1259    30029    sso_providers_resource_id_idx    INDEX     j   CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));
 /   DROP INDEX auth.sso_providers_resource_id_idx;
       auth            supabase_auth_admin    false    268    268                       1259    30030    unique_phone_factor_per_user    INDEX     c   CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);
 .   DROP INDEX auth.unique_phone_factor_per_user;
       auth            supabase_auth_admin    false    259    259            ;           1259    30031    user_id_created_at_idx    INDEX     X   CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);
 (   DROP INDEX auth.user_id_created_at_idx;
       auth            supabase_auth_admin    false    266    266            H           1259    30032    users_email_partial_key    INDEX     k   CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);
 )   DROP INDEX auth.users_email_partial_key;
       auth            supabase_auth_admin    false    269    269            �           0    0    INDEX users_email_partial_key    COMMENT     }   COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';
          auth          supabase_auth_admin    false    3912            I           1259    30033    users_instance_id_email_idx    INDEX     h   CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));
 -   DROP INDEX auth.users_instance_id_email_idx;
       auth            supabase_auth_admin    false    269    269            J           1259    30034    users_instance_id_idx    INDEX     L   CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);
 '   DROP INDEX auth.users_instance_id_idx;
       auth            supabase_auth_admin    false    269            K           1259    30035    users_is_anonymous_idx    INDEX     N   CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);
 (   DROP INDEX auth.users_is_anonymous_idx;
       auth            supabase_auth_admin    false    269            v           1259    30036    ix_realtime_subscription_entity    INDEX     [   CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);
 5   DROP INDEX realtime.ix_realtime_subscription_entity;
       realtime            supabase_admin    false    293            y           1259    30038 /   subscription_subscription_id_entity_filters_key    INDEX     �   CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);
 E   DROP INDEX realtime.subscription_subscription_id_entity_filters_key;
       realtime            supabase_admin    false    293    293    293            z           1259    30039    bname    INDEX     A   CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);
    DROP INDEX storage.bname;
       storage            supabase_storage_admin    false    295            �           1259    30040    bucketid_objname    INDEX     W   CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);
 %   DROP INDEX storage.bucketid_objname;
       storage            supabase_storage_admin    false    297    297            �           1259    30041    idx_multipart_uploads_list    INDEX     r   CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);
 /   DROP INDEX storage.idx_multipart_uploads_list;
       storage            supabase_storage_admin    false    298    298    298            �           1259    30042    idx_objects_bucket_id_name    INDEX     f   CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");
 /   DROP INDEX storage.idx_objects_bucket_id_name;
       storage            supabase_storage_admin    false    297    297            �           1259    30043    name_prefix_search    INDEX     X   CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);
 '   DROP INDEX storage.name_prefix_search;
       storage            supabase_storage_admin    false    297            �           2620    30044    subscription tr_check_filters    TRIGGER     �   CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();
 8   DROP TRIGGER tr_check_filters ON realtime.subscription;
       realtime          supabase_admin    false    521    293            �           2620    30045 !   objects update_objects_updated_at    TRIGGER     �   CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();
 ;   DROP TRIGGER update_objects_updated_at ON storage.objects;
       storage          supabase_storage_admin    false    491    297            �           2606    30046 "   identities identities_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_user_id_fkey;
       auth          supabase_auth_admin    false    255    3919    269            �           2606    30051 -   mfa_amr_claims mfa_amr_claims_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_fkey;
       auth          supabase_auth_admin    false    3897    266    257            �           2606    30056 1   mfa_challenges mfa_challenges_auth_factor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_auth_factor_id_fkey;
       auth          supabase_auth_admin    false    3865    258    259            �           2606    30061 $   mfa_factors mfa_factors_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_user_id_fkey;
       auth          supabase_auth_admin    false    259    3919    269            �           2606    30066 ,   one_time_tokens one_time_tokens_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY auth.one_time_tokens DROP CONSTRAINT one_time_tokens_user_id_fkey;
       auth          supabase_auth_admin    false    3919    269    260            �           2606    30071 -   refresh_tokens refresh_tokens_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_session_id_fkey;
       auth          supabase_auth_admin    false    261    3897    266            �           2606    30076 2   saml_providers saml_providers_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    268    263    3905            �           2606    30081 6   saml_relay_states saml_relay_states_flow_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_flow_state_id_fkey;
       auth          supabase_auth_admin    false    264    254    3843            �           2606    30086 8   saml_relay_states saml_relay_states_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    268    3905    264            �           2606    30091    sessions sessions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_user_id_fkey;
       auth          supabase_auth_admin    false    269    3919    266            �           2606    30096 ,   sso_domains sso_domains_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    268    3905    267            �           2606    30101 !   class_sow class_sow_class_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_sow
    ADD CONSTRAINT class_sow_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.classes(id);
 K   ALTER TABLE ONLY public.class_sow DROP CONSTRAINT class_sow_class_id_fkey;
       public          postgres    false    272    3927    270            �           2606    30106    class_sow class_sow_sow_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.class_sow
    ADD CONSTRAINT class_sow_sow_id_fkey FOREIGN KEY (sow_id) REFERENCES public.sow(id);
 I   ALTER TABLE ONLY public.class_sow DROP CONSTRAINT class_sow_sow_id_fkey;
       public          postgres    false    3937    270    279            �           2606    30111 ,   question_tags question_tags_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.question_tags
    ADD CONSTRAINT question_tags_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id);
 V   ALTER TABLE ONLY public.question_tags DROP CONSTRAINT question_tags_question_id_fkey;
       public          postgres    false    275    3931    274            �           2606    30116 '   question_tags question_tags_tag_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.question_tags
    ADD CONSTRAINT question_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.question_tags DROP CONSTRAINT question_tags_tag_id_fkey;
       public          postgres    false    283    3941    274            �           2606    30121    sow_weeks sow_weeks_sow_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.sow_weeks
    ADD CONSTRAINT sow_weeks_sow_id_fkey FOREIGN KEY (sow_id) REFERENCES public.sow(id);
 I   ALTER TABLE ONLY public.sow_weeks DROP CONSTRAINT sow_weeks_sow_id_fkey;
       public          postgres    false    281    279    3937            �           2606    30126 !   sow_weeks sow_weeks_weeks_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sow_weeks
    ADD CONSTRAINT sow_weeks_weeks_id_fkey FOREIGN KEY (week_id) REFERENCES public.weeks(id);
 K   ALTER TABLE ONLY public.sow_weeks DROP CONSTRAINT sow_weeks_weeks_id_fkey;
       public          postgres    false    281    3951    289            �           2606    30131 -   teacher_classes teacher_classes_class_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_classes
    ADD CONSTRAINT teacher_classes_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.classes(id);
 W   ALTER TABLE ONLY public.teacher_classes DROP CONSTRAINT teacher_classes_class_id_fkey;
       public          postgres    false    272    285    3927            �           2606    30136 ,   teacher_classes teacher_classes_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_classes
    ADD CONSTRAINT teacher_classes_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);
 V   ALTER TABLE ONLY public.teacher_classes DROP CONSTRAINT teacher_classes_user_id_fkey;
       public          postgres    false    285    269    3919            �           2606    30141 "   user_roles user_roles_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_user_id_fkey;
       public          postgres    false    3919    287    269            �           2606    30146 !   weeks_tags weeks_tags_tag_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.weeks_tags
    ADD CONSTRAINT weeks_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.weeks_tags DROP CONSTRAINT weeks_tags_tag_id_fkey;
       public          postgres    false    291    3941    283            �           2606    30151 "   weeks_tags weeks_tags_week_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.weeks_tags
    ADD CONSTRAINT weeks_tags_week_id_fkey FOREIGN KEY (week_id) REFERENCES public.weeks(id);
 L   ALTER TABLE ONLY public.weeks_tags DROP CONSTRAINT weeks_tags_week_id_fkey;
       public          postgres    false    3951    291    289            �           2606    30156    objects objects_bucketId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);
 J   ALTER TABLE ONLY storage.objects DROP CONSTRAINT "objects_bucketId_fkey";
       storage          supabase_storage_admin    false    3964    297    295            �           2606    30161 8   s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);
 c   ALTER TABLE ONLY storage.s3_multipart_uploads DROP CONSTRAINT s3_multipart_uploads_bucket_id_fkey;
       storage          supabase_storage_admin    false    295    3964    298            �           2606    30166 D   s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);
 o   ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey;
       storage          supabase_storage_admin    false    3964    299    295            �           2606    30171 D   s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;
 o   ALTER TABLE ONLY storage.s3_multipart_uploads_parts DROP CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey;
       storage          supabase_storage_admin    false    3976    299    298            >           0    29689    audit_log_entries    ROW SECURITY     =   ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    253            ?           0    29695 
   flow_state    ROW SECURITY     6   ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    254            @           0    29700 
   identities    ROW SECURITY     6   ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    255            A           0    29707 	   instances    ROW SECURITY     5   ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    256            B           0    29712    mfa_amr_claims    ROW SECURITY     :   ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    257            C           0    29717    mfa_challenges    ROW SECURITY     :   ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    258            D           0    29722    mfa_factors    ROW SECURITY     7   ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    259            E           0    29727    one_time_tokens    ROW SECURITY     ;   ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    260            F           0    29735    refresh_tokens    ROW SECURITY     :   ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    261            G           0    29741    saml_providers    ROW SECURITY     :   ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    263            H           0    29749    saml_relay_states    ROW SECURITY     =   ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    264            I           0    29755    schema_migrations    ROW SECURITY     =   ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    265            J           0    29758    sessions    ROW SECURITY     4   ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    266            K           0    29763    sso_domains    ROW SECURITY     7   ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    267            L           0    29769    sso_providers    ROW SECURITY     9   ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    268            M           0    29775    users    ROW SECURITY     1   ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;          auth          supabase_auth_admin    false    269            `           3256    30176 (   class_sow Allow authorized delete access    POLICY     �   CREATE POLICY "Allow authorized delete access" ON public.class_sow FOR DELETE USING (( SELECT public.authorize('sow.delete'::public.app_permission) AS authorize));
 B   DROP POLICY "Allow authorized delete access" ON public.class_sow;
       public          postgres    false    477    1235    270            a           3256    30177 )   weeks_tags Allow authorized delete access    POLICY     �   CREATE POLICY "Allow authorized delete access" ON public.weeks_tags FOR DELETE USING (( SELECT public.authorize('sow.delete'::public.app_permission) AS authorize));
 C   DROP POLICY "Allow authorized delete access" ON public.weeks_tags;
       public          postgres    false    291    477    1235            b           3256    30178 (   class_sow Allow authorized insert access    POLICY       CREATE POLICY "Allow authorized insert access" ON public.class_sow FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE (((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::public.app_role)) OR (user_roles.role = 'moderator'::public.app_role)))));
 B   DROP POLICY "Allow authorized insert access" ON public.class_sow;
       public          postgres    false    287    270    1238    377    287            c           3256    30179 &   classes Allow authorized insert access    POLICY     �   CREATE POLICY "Allow authorized insert access" ON public.classes FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE ((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::public.app_role)))));
 @   DROP POLICY "Allow authorized insert access" ON public.classes;
       public          postgres    false    377    287    1238    287    272            d           3256    30180 ,   question_tags Allow authorized insert access    POLICY     �   CREATE POLICY "Allow authorized insert access" ON public.question_tags FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE ((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::public.app_role)))));
 F   DROP POLICY "Allow authorized insert access" ON public.question_tags;
       public          postgres    false    377    274    287    287    1238            h           3256    30181 (   questions Allow authorized insert access    POLICY     �   CREATE POLICY "Allow authorized insert access" ON public.questions FOR INSERT TO authenticated, anon WITH CHECK ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE ((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::public.app_role)))));
 B   DROP POLICY "Allow authorized insert access" ON public.questions;
       public          postgres    false    287    275    1238    377    287            i           3256    30182 "   sow Allow authorized insert access    POLICY       CREATE POLICY "Allow authorized insert access" ON public.sow FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE (((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::public.app_role)) OR (user_roles.role = 'moderator'::public.app_role)))));
 <   DROP POLICY "Allow authorized insert access" ON public.sow;
       public          postgres    false    1238    279    287    287    377            j           3256    30183 (   sow_weeks Allow authorized insert access    POLICY       CREATE POLICY "Allow authorized insert access" ON public.sow_weeks FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE (((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::public.app_role)) OR (user_roles.role = 'moderator'::public.app_role)))));
 B   DROP POLICY "Allow authorized insert access" ON public.sow_weeks;
       public          postgres    false    287    1238    377    281    287            k           3256    30184 #   tags Allow authorized insert access    POLICY     �   CREATE POLICY "Allow authorized insert access" ON public.tags FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE ((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::public.app_role)))));
 =   DROP POLICY "Allow authorized insert access" ON public.tags;
       public          postgres    false    1238    287    287    377    283            l           3256    30185 .   teacher_classes Allow authorized insert access    POLICY     �   CREATE POLICY "Allow authorized insert access" ON public.teacher_classes FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE ((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::public.app_role)))));
 H   DROP POLICY "Allow authorized insert access" ON public.teacher_classes;
       public          postgres    false    287    285    287    377    1238            n           3256    30186 $   weeks Allow authorized insert access    POLICY       CREATE POLICY "Allow authorized insert access" ON public.weeks FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE (((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::public.app_role)) OR (user_roles.role = 'moderator'::public.app_role)))));
 >   DROP POLICY "Allow authorized insert access" ON public.weeks;
       public          postgres    false    1238    377    287    289    287            o           3256    30187 )   weeks_tags Allow authorized insert access    POLICY       CREATE POLICY "Allow authorized insert access" ON public.weeks_tags FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE (((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::public.app_role)) OR (user_roles.role = 'moderator'::public.app_role)))));
 C   DROP POLICY "Allow authorized insert access" ON public.weeks_tags;
       public          postgres    false    291    287    1238    377    287            p           3256    30188 (   sow_weeks Allow authorized update access    POLICY       CREATE POLICY "Allow authorized update access" ON public.sow_weeks FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.user_roles
  WHERE ((user_roles.user_id = auth.uid()) AND ((user_roles.role = 'admin'::public.app_role) OR (user_roles.role = 'moderator'::public.app_role))))));
 B   DROP POLICY "Allow authorized update access" ON public.sow_weeks;
       public          postgres    false    281    287    377    1238    287            q           3256    30189 *   class_sow Enable read access for all users    POLICY     u   CREATE POLICY "Enable read access for all users" ON public.class_sow FOR SELECT TO authenticated, anon USING (true);
 D   DROP POLICY "Enable read access for all users" ON public.class_sow;
       public          postgres    false    270            r           3256    30190 (   classes Enable read access for all users    POLICY     \   CREATE POLICY "Enable read access for all users" ON public.classes FOR SELECT USING (true);
 B   DROP POLICY "Enable read access for all users" ON public.classes;
       public          postgres    false    272            s           3256    30191 .   question_tags Enable read access for all users    POLICY     b   CREATE POLICY "Enable read access for all users" ON public.question_tags FOR SELECT USING (true);
 H   DROP POLICY "Enable read access for all users" ON public.question_tags;
       public          postgres    false    274            t           3256    30192 *   questions Enable read access for all users    POLICY     u   CREATE POLICY "Enable read access for all users" ON public.questions FOR SELECT TO authenticated, anon USING (true);
 D   DROP POLICY "Enable read access for all users" ON public.questions;
       public          postgres    false    275            u           3256    30193 1   role_permissions Enable read access for all users    POLICY     e   CREATE POLICY "Enable read access for all users" ON public.role_permissions FOR SELECT USING (true);
 K   DROP POLICY "Enable read access for all users" ON public.role_permissions;
       public          postgres    false    277            v           3256    30194 $   sow Enable read access for all users    POLICY     X   CREATE POLICY "Enable read access for all users" ON public.sow FOR SELECT USING (true);
 >   DROP POLICY "Enable read access for all users" ON public.sow;
       public          postgres    false    279            w           3256    30195 *   sow_weeks Enable read access for all users    POLICY     ^   CREATE POLICY "Enable read access for all users" ON public.sow_weeks FOR SELECT USING (true);
 D   DROP POLICY "Enable read access for all users" ON public.sow_weeks;
       public          postgres    false    281            x           3256    30196 %   tags Enable read access for all users    POLICY     Y   CREATE POLICY "Enable read access for all users" ON public.tags FOR SELECT USING (true);
 ?   DROP POLICY "Enable read access for all users" ON public.tags;
       public          postgres    false    283            y           3256    30197 0   teacher_classes Enable read access for all users    POLICY     d   CREATE POLICY "Enable read access for all users" ON public.teacher_classes FOR SELECT USING (true);
 J   DROP POLICY "Enable read access for all users" ON public.teacher_classes;
       public          postgres    false    285            z           3256    30198 +   user_roles Enable read access for all users    POLICY     _   CREATE POLICY "Enable read access for all users" ON public.user_roles FOR SELECT USING (true);
 E   DROP POLICY "Enable read access for all users" ON public.user_roles;
       public          postgres    false    287            {           3256    30199 &   weeks Enable read access for all users    POLICY     Z   CREATE POLICY "Enable read access for all users" ON public.weeks FOR SELECT USING (true);
 @   DROP POLICY "Enable read access for all users" ON public.weeks;
       public          postgres    false    289            |           3256    30200 +   weeks_tags Enable read access for all users    POLICY     _   CREATE POLICY "Enable read access for all users" ON public.weeks_tags FOR SELECT USING (true);
 E   DROP POLICY "Enable read access for all users" ON public.weeks_tags;
       public          postgres    false    291            N           0    29790 	   class_sow    ROW SECURITY     7   ALTER TABLE public.class_sow ENABLE ROW LEVEL SECURITY;          public          postgres    false    270            O           0    29794    classes    ROW SECURITY     5   ALTER TABLE public.classes ENABLE ROW LEVEL SECURITY;          public          postgres    false    272            P           0    29801    question_tags    ROW SECURITY     ;   ALTER TABLE public.question_tags ENABLE ROW LEVEL SECURITY;          public          postgres    false    274            Q           0    29804 	   questions    ROW SECURITY     7   ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;          public          postgres    false    275            R           0    29809    role_permissions    ROW SECURITY     >   ALTER TABLE public.role_permissions ENABLE ROW LEVEL SECURITY;          public          postgres    false    277            S           0    29813    sow    ROW SECURITY     1   ALTER TABLE public.sow ENABLE ROW LEVEL SECURITY;          public          postgres    false    279            T           0    29817 	   sow_weeks    ROW SECURITY     7   ALTER TABLE public.sow_weeks ENABLE ROW LEVEL SECURITY;          public          postgres    false    281            U           0    29821    tags    ROW SECURITY     2   ALTER TABLE public.tags ENABLE ROW LEVEL SECURITY;          public          postgres    false    283            V           0    29827    teacher_classes    ROW SECURITY     =   ALTER TABLE public.teacher_classes ENABLE ROW LEVEL SECURITY;          public          postgres    false    285            W           0    29831 
   user_roles    ROW SECURITY     8   ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;          public          postgres    false    287            X           0    29835    weeks    ROW SECURITY     3   ALTER TABLE public.weeks ENABLE ROW LEVEL SECURITY;          public          postgres    false    289            Y           0    29839 
   weeks_tags    ROW SECURITY     8   ALTER TABLE public.weeks_tags ENABLE ROW LEVEL SECURITY;          public          postgres    false    291            _           0    59023    messages    ROW SECURITY     8   ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;          realtime          supabase_realtime_admin    false    301            }           3256    30201 2   buckets Enable insert for authenticated users only    POLICY     }   CREATE POLICY "Enable insert for authenticated users only" ON storage.buckets FOR INSERT TO authenticated WITH CHECK (true);
 M   DROP POLICY "Enable insert for authenticated users only" ON storage.buckets;
       storage          supabase_storage_admin    false    295            e           3256    30202 2   objects Enable insert for authenticated users only    POLICY     }   CREATE POLICY "Enable insert for authenticated users only" ON storage.objects FOR INSERT TO authenticated WITH CHECK (true);
 M   DROP POLICY "Enable insert for authenticated users only" ON storage.objects;
       storage          supabase_storage_admin    false    297            f           3256    30203 (   buckets Enable read access for all users    POLICY     ]   CREATE POLICY "Enable read access for all users" ON storage.buckets FOR SELECT USING (true);
 C   DROP POLICY "Enable read access for all users" ON storage.buckets;
       storage          supabase_storage_admin    false    295            g           3256    30204 (   objects Enable read access for all users    POLICY     ]   CREATE POLICY "Enable read access for all users" ON storage.objects FOR SELECT USING (true);
 C   DROP POLICY "Enable read access for all users" ON storage.objects;
       storage          supabase_storage_admin    false    297            m           3256    30205 @   objects Give anon users access to PNG images in folder 15k0kst_0    POLICY       CREATE POLICY "Give anon users access to PNG images in folder 15k0kst_0" ON storage.objects FOR SELECT USING (((bucket_id = 'questions'::text) AND (storage.extension(name) = 'png'::text) AND (lower((storage.foldername(name))[1]) = 'public'::text) AND (auth.role() = 'anon'::text)));
 [   DROP POLICY "Give anon users access to PNG images in folder 15k0kst_0" ON storage.objects;
       storage          supabase_storage_admin    false    486    484    297    297    297    375            ~           3256    30206 ;   objects Give users authenticated access to folder 15k0kst_0    POLICY       CREATE POLICY "Give users authenticated access to folder 15k0kst_0" ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'questions'::text) AND ((storage.foldername(name))[1] = 'private'::text) AND (auth.role() = 'authenticated'::text)));
 V   DROP POLICY "Give users authenticated access to folder 15k0kst_0" ON storage.objects;
       storage          supabase_storage_admin    false    297    375    486    297    297            Z           0    29860    buckets    ROW SECURITY     6   ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    295            [           0    29869 
   migrations    ROW SECURITY     9   ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    296            \           0    29873    objects    ROW SECURITY     6   ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    297            ]           0    29883    s3_multipart_uploads    ROW SECURITY     C   ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    298            ^           0    29890    s3_multipart_uploads_parts    ROW SECURITY     I   ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    299                       6104    30207    supabase_realtime    PUBLICATION     Z   CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');
 $   DROP PUBLICATION supabase_realtime;
                postgres    false            
           826    30214     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;
          auth          supabase_auth_admin    false    14            
           826    30215     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;
          auth          supabase_auth_admin    false    14            
           826    30216    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;
          auth          supabase_auth_admin    false    14            
           826    30217     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    22            
           826    30218     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    22            
           826    30219    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     y   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    22            
           826    30220     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;
          graphql          supabase_admin    false    20            
           826    30221     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;
          graphql          supabase_admin    false    20            
           826    30222    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;
          graphql          supabase_admin    false    20            
           826    30223     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;
          graphql_public          supabase_admin    false    19            
           826    30224     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;
          graphql_public          supabase_admin    false    19            
           826    30225    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;
          graphql_public          supabase_admin    false    19            
           826    29289     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     r   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    15            
           826    29288    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     o   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    15            
           826    29286     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    2            
           826    29287     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    2            
           826    29285    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     u   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    2            
           826    30226     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;
          public          postgres    false            
           826    30227     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;
          public          supabase_admin    false            
           826    30228     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;
          public          postgres    false            
           826    30229     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;
          public          supabase_admin    false            
           826    30230    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     y  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;
          public          postgres    false            
           826    30231    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;
          public          supabase_admin    false            	
           826    30232     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;
          realtime          supabase_admin    false    16            

           826    30233     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;
          realtime          supabase_admin    false    16            
           826    30234    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;
          realtime          supabase_admin    false    16            
           826    30235     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;
          storage          postgres    false    11            
           826    30236     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;
          storage          postgres    false    11            
           826    30237    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     }  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;
          storage          postgres    false    11            �           3466    30249    issue_graphql_placeholder    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();
 .   DROP EVENT TRIGGER issue_graphql_placeholder;
                supabase_admin    false    540            �           3466    30287    issue_pg_cron_access    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();
 )   DROP EVENT TRIGGER issue_pg_cron_access;
                supabase_admin    false    539            �           3466    30248    issue_pg_graphql_access    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();
 ,   DROP EVENT TRIGGER issue_pg_graphql_access;
                supabase_admin    false    550            �           3466    30241    issue_pg_net_access    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();
 (   DROP EVENT TRIGGER issue_pg_net_access;
                postgres    false    498            �           3466    30250    pgrst_ddl_watch    EVENT TRIGGER     j   CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();
 $   DROP EVENT TRIGGER pgrst_ddl_watch;
                supabase_admin    false    474            �           3466    30251    pgrst_drop_watch    EVENT TRIGGER     e   CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();
 %   DROP EVENT TRIGGER pgrst_drop_watch;
                supabase_admin    false    475            �      x��ےeǍ%�\�2�N�1���@<����*�J"�$%�����v$�R
M����Ύ�h�`yr�p`,���Wz����7^&��L�7$��7�Tm�~�2����������~����������������_�?�?����+�����_������������X���?�����������_v��/����?�����_���u��������_����~}����ß�����O?��˟~���������)���߹W�f�iA�D0Yٖ��j� �~�����~�?������[ɅR֔�w�^P_
<��ߎ���������l���uj�6J꣖�6#��:V��^㧿���ÿ�_[���淸������w���<������/DV�b�ǃ�����X�US+u�Q+t��}��?�?�k߾����~�����aF*�@�vk�R�D�G2X�ۆ�(_��O��~tC�?�_��������.NM�&�٪�����P\�KE~���P ;b��Qh�^a'��_!���-��d�?�������8���}�:�e���!*�$�P�?{���t��lS�������;���Ю���I�Nw����6ܠi��	%�9Tr~�;N��d�����?�������߿��<K�Z�AL�&�OB��O��VNcoP�V�書@B����ၹ�_�Bg+YʐD2��?�(2�(s�[@�����a т�I���	,v,�eJ&M�v���5��~\4(dP&}��O>�{u������V�����Hr��Y-a�� �`}����P��D�����Q͜l�J��"8懀����C��A�oMGi�����<a.�H��9�ǀ��G��t9��s��7r�!���4Omz��۝b��㙌D��5�{֙�A=/��S[ِ�tj��Zy��E_``P9ɸ��h��v6I��r3�6�ɭ졼}��0O���`[���cC�v�F��z����H�v#{�Rf:p�����L���v�ԳR���ɽtX�V��/P_���Br�\&��?���<iL�w��f��=|�A��T�f���4f���y�{��p�&�L��w�޼� �$_H<�S���~jj�y�=n�jOQ�\mu�+��>àPO2}�m���5?�k2�ٕ�٩�.�Je�P��\Xx�� �A3�$C�~0f�%�_�͸�������	�!�9P&���(�����V��/@:�T� ��t�V�D����F���މ�N�����͛��+m�9�葻�-��V�oe�����T.B@T�\�N�~0jM&;�Ѳt!n8�F���G�� #�Nn� ŝW�dm놬�������!�����`}���n�5OB�T̜d6h�0�x,��q)���q9�J��W��%���h���=�>��c�|���W0惢L�<�&X�^CG��DI[V%�ը��؃�`yA|���=������=dlŸ;��;r���>�@��$'��?�ŞtI����I#/��	���_��}��S_2yrj�ǥ�lL�{R>")����Si�+L^k�[��F�iW����N
�z�h���v������������N��Jv C+s�N�l�a ��̊U����yE��ϣT�S����-���p��V'�h�߾�=|���]��v&Aq�E���n�˱ X��덲S^��K)�Z�i�z&n�,ل]h��[EQ˰�O�y0������n�jY�"S�O�ˎ���� Q�����s�G�38�C�T���\ڦ B����:e#��\~}����6IY4MO�v��Pг�1	�F���{���J'�qc>J��q:�d��\����mE�ܦZ�5���n����	${��Y���S��i��of�Oi%ǭp��Kd��G�x��ŉu�m��m��E�����k�'��o``�'�be�I(ү�<^x��t��j�N.�މ�(��q�brR��W�Χ�N��6��i4**�ӱ|�p@`T9?0g>��y�v�n�8"��gJ-�>Q���]�W��@�Ы�E�XB$����6sI�#���粸@�(�9
J�W=��A�c*���3�q�Z�l�ƛ���+��:���P��ù�n3�@u�9���L�+�S� �����e:���']��Ej�҆��8�^��[�'���0 �|rۑ+��D��@[�?�$q+8Ŝf��2��$�� �ˉ��p�����ȁhŉ��h�yK�������<�J�3�����巻�l#��µ�trq+{�/x�������Ǘ���#��9uh��9y�7�xR{���R`��S:V��L���h&������;�C\KԩX�7�侖�gt �4��W�v�����/0h������W�$-;k�5'���;���R'��8�=~�q���_Z��?�'��ي�gR����s�`��RI���~������?����ߝ��9��IŻvw��3K�;�3��%��?��� ��s��� ]�o������� �Ѭ���иD��M��Z�����zӓ��������(��dޣ2�v���ܱR�_�D?Tzt.�ӕ<���4*��=�$+�^�w�{��Gߚ������_�D�	�r��	�?�A��K��^Փ�|��i#a6���{���¡ ���S
�m��Q��h�B���c@���/�?�_���6��Q�Q�g�Tj�=����\���E��۠��A�_� -4;8�t~�'Cr�]�u#XwWJ��G�	x)�R��+'Sase%�·?���Z��יD`��uc{o?�s�P�b1�^���3ӌ�u�=�L�d����x��"ʥ�S�K9�0�-k��o�Ǣ�(i�5ain��Y�{V���1����g�81����I;Q*y�UO����<�������'�nk�#qM��ٙ���ڗl-�o��g���8h)|�#�����*w���5ӎ���}
$��9�Fѓ�f�{�{�ݣ�h2����w�хt'�����I�9=�B�5>ĩ�r�-�et�p�{��,U;��g�+�D�����Sq)���]f��A������ŒkO���UH��N�!�^QLU�����C�#ۃK6;H4��-R��c�ڿj�Xj4eWʂ�V��3X�I�Q��V���D�p����\p[�s|O���J^�)1TZ0�I��<�t*1��6��Z�B;��1�����n�E|(�2R)'�Y���m��1��lt�T�Xb'�ߓ[�>5����%��0�!u$��<s�6=�47�q��b�J3V;��{�IsGs�h�HI��F���ʴK��#�$N����O����"%Om78>sR��lk��yw1�O�x�����A��Ŀ[��9�t�i���;]71��s)��">(+��C���s�.N����jc�:?���K}X���� �*0���UOS�u&j3�����h���ד�#�#�5T���Mj&�9�[�*]���~
G�>2�z2�X�'��2U��-��h�fyr�����&�#o 
'�I��{�k$G��5�d�)�ٜ ջO�G#���F̘��}�TB~�����li[!+�3}�C��o��'7�ƪ�S�
��^u���7:z��^���z`�b���(�O7w�!��B<S��w뽡�G,1���aq~0��܋�	�a�mD�Q��D�p������[�}.,������'#���P�r�����f���g�8��8`1h}D�p���3�>K"[qs^r�A�p0C�M���0(�;<��N�46�nn?F�W�9�l� �7���s�=�*d��6�DW�GM��1���.ֽ?B�}Ň���x"g�
:kZ+~�ګ��1u���s_ߓ��>�%�H��P���L+Gj�YR���1d��7��
{�g��Y�#��h[�C�'��v���_{$ͥ��@��~��Ա����A��Ҕ��K(�Zv(~��5�@����y��Ä��Z
,{:�v�N�&�~6Z�BH�{����#/��-7'�
����dC�ui\�lwD�:�E��#T>�    䱒����K�9S�㩭Ow
$��,E���)>�C��E�VR���2��vv�	yˡ��TH�S��*W�^L��l�%U�T�"öKf{#�h���{��.���C1��n�s��^&m�ѡ�_����j��~��c�CN�A���I�e�!+I�����p���̃�h��p?\�Rܣ���j�������4G�礕�	�uЏ`=W�w�^,p�[��p�ҒǰPڌ�\�wZX<��u���]v���9��R��熅D�r�nHUg�5��o���|���s'����<��QV$�Š���8Gm�à��S@MN�4E��9��J\�M�����u��!B�`����If�4E];����P�F<;��?@��+<$���夯�������nL=�����͵��w�[�O	�SO܁OWk\t�����pŌ��Q��m6*|���m��~Zr�&�2�%km�S!��:�1*�v�̓a�~'Á@Od�Bèl�u��Y�oE�K37�=��p��i�0r&�r����?��#˰��;5�+-wb%���{/�\82;��%d�(�Q���7�賐��෯���C`r>�\���K��A��oc�X0v����b��[����)�����	�ۘ�&+U�!����㧍�T��e/K��ӠwtA��t�C�Z*WX��Oo1�����+g�'$P���A)�$ZO]z��sבy�;���%��1	V W:i��$H��S�k�l����f�m��s���	}2�Nt����UYRk9��J��8K���
��ߞ	~A�<��)�*�E��%�{[����m���?|V�����̤���ae���ɸu��xךy��^h��k	k:��-��a�i�ZnP��Z�70;�[����
 ��/ŉډ�P���l���uۂ�/��I�.[X��A�D�=&w��!��j��!���Xl���)�^���8Q�W���J���{�_�\����=|��������]�V�	q5�n/�=����Q�g B�8�\|�Oq���C=S�h�1�u��"�?nd�a@�'}�ʽ�)�j,�t7����Ҵ�ŠaCo$��ѐ�����@�DzA�N��85�BD��p����?�}�x���dh
�ds��b���:�/ ~8�,�9�)����=<,k>鰝�tx�����-8' BM8>���/0 �I�am�]#N^�A�S+f0���:��c�� 5�`DRy��J�n̡j�sI-��{J�����g���慍�H�hF]�%-z��b���F�\0nҢ���d�G��93%��r�"�#p�����N���z@'� �%�
O7����-�`k���d�_ ^R-�d㵁�!�#�E��[�.��|��w���^�Z� E��s��+�H�Q���]+i�M��5�z®����IdŖ0����iMۦy;縑��~n����x[J^M0�UB����V��u$�6[㾆�����6e�{NV�9���:�J*�x�E��{�Gbm��(.��v'�D����>�� ��z=w/���գ/i>�b����&����$�� 6g�Y�5��e�]�Ǣ�[E�d�⺫����Τ8;�к �<�Pv��!�'d�)�&�D�d���gt�c�m�e�nC=�6n��e���O�LJ��C���$s`c�;u�FHzKS��F+^)�`��'Wr����s�.�Ƶ�s_7��	�i�}V@��-m���Tj�1g/}+8�Y+� �ߛ���q�ؐ�1[�IgT���W%6YZXI=�)�'I���S�����5�|��<`�/i=� �.�l1��,�q/{ܿ����K��� �D %Z;,�0vYn>b���A�`�mo/t�<L�* G��%�lcn��1�����g�<��"&� �@�gFG���xh_����U��b2q��<�۝�C�'Q7rʋ�N�RW�Jl�,���uɽ.sG��N��3�IN�KO?-�	mp7p{� ����k�~��QBU���V8��  Έ�w���$5��><5�V�{��R�Iix Y9�u�]<��T%&b�f+�-�RV���m�oӑZ]�#��<Ձ��<�?����gț[D��4��<̲y�sR��&�Z��c���Og���]d�͂����b����m�#f*�������l�\Cȿ�{�[��8���Q�TT�`a���3�_���v���u���<b���*?s�����J�k��r�����'�����7��&������T{gM��Ƕ�-VAb+yܦK��O����<]�ɣC���\V+�����y)����0��X;�F堂�v�9����KL��ET�x	�X�L|��9�ڄr��tt�[���:m�(M�RczR�X��I�|���9��W0�4o��p�D�ih'?��PݑB�lߨ��z)�(���e6O��X�jA=n2`**���s����'��zp,jG)�sr0(T�wL/���U�>ڽxT(.]{��0�\��*h*0;vjOs�+d�N��u�R V{`��$�J'(%�(Gho�㮦��s��m�J���ˉN�,."�)Ì1%m��0��'������>%�Ȱ>b�)Tb��x�v�B�}����,
NM�̷�s��>À�(^�>�
S���(2cClO2��$�1�'?�j��N�1P���z�z�e$]�g�N�3�|���mklo�W�����=��8��z����v2^Kts��F�o`0>Y����2:JK�G�N-a�
���|�{��q'�M���Lr�k��H\wx<M�V�lς��z׆qsJ�RO0c���waȩi,h�$	�hS[�|B�(��Z�lW��Rw��t�����J��z��Ӕ���>�I�]�*6=،Yͽ��4$�T� ��?u�=���ս3�vR�9��J�Խr*���<���=���)���x�.K�g�]��9F���d��d�ˍ� 9��.9��E���Z+M4�Kğ=���*m[Y�mb�����;�ul��cK����#��,�HM=i�|/Gy58~�失`�=�����#=���[KV���lw�	�2fqo�P�|�o�&s�LQw�����~-͛�n��Lp|Cœ�PY�!�=��,Ŋ���}1j�����&H����_�B&p�ep�O��EwOi�f�r��Wt�q��H�۠Bs@�GY��W�j��>�Ǖ	���{B_����g��OZ��4�+$��p��W�Ƃ[�F�zn|��k��������V$�U`��
.d���Z?l�e��+>-�h�h�
�{':�4�n�/�$�/?�y}�x��|Г_rx��z��Z{(}@��ᡫ�p�m� g�����7�qc�OZ��ߨ��fO�B��� �IqMaK����pG��s��g���~Ƃl��x햤!�uw4.*�q5�7���I�%􀹾��p/|p�6k���V�|�3`�.1�--���t>�\�L�+���j䇡��^)O�*��{u��E��\�����ְ�^)q.�-:>ˏ����gڷg2�I6ڳj�
'}Tu{"��i�0�{IQ���I��z�����������V]�h�4js/C�M�2������_/�*1�,J�|R���ر���h=�zm��̽��i��#��EO�	�E3VC9�fIZ�;���M��u��@���vy��-��@Q��hU��\e�%�~�)���3�3+9�-.��o_۞isd��̷7�<�A���X@��UA��s7�F%�?|�=a�Y���r'����󪣦}�k��i�Q�/^-W���#n�dU����R�Q,�|b&k5G��9B��#G�F��*NX�[ʍ��$����^M�r��a��,;�<��A�2�JLګn�r����a����A&�a�<t�.4Ro������]yJ��/�T�D��~!�E�����'t:�0��nӻ�t4���l����v��D��J�Paf�`!e�E�B�9̟��kX��:�$Y��[ٙ��#!�e{I�}���Z��	�|4�酤݌I�`f
��A�Ɗ�?���Wx�_�4��U�.    )$���ڕ�H���ޡ.|+o�y}�m2��I�#0���P��-�E���V%���y�/0�≸�gk�wK�b5�]�;��Jj2l�MNI�y�� n&x�W��+��y:-�>�Vm��:�&�f/�g�3���$��{M�B�/�����T4���N��Ǿ��O�H+\�h�� �ɘ�mZ��e�i�fy�i���rtz���he\~�sZl{�� C	ݼ{[�3���y��|P	�	8�r˵?����Hy�>zho��<�=\˞E���C���p¹�Ec�V���XC�.�N��$F+��"'��;�ʔ
u��X�_e�>�h�fP�δ^�3܉w��R�-w�r�n�F��q[ ч~21dܴ�D;��$���{9�^X�`��3 �	G� T8�i��l*)�kc����3���pl��Fu�/0��8�@q���Sey��q5�l��i�ʞi������YN2-w(�rb�P��쩅y Ժq4��J1>Q����N���S^iI��7kn�)�.��e��[���i��uZ$V?�K��\"(7�؈��Б���P><�yぶ�ɭR_���;a���fNJ��$�s���:�:�W�2H=Y�3G��PNժ��Qg�I�4�*f���C���'k�p��2Z'O�w�c*4<�k=��P�X���7�J��pu,s��9��f]�O���~2=��Ҩ�0�v�y�Wxbb��P�T]�-S�X9�CU(�J��6)�ڲ<>��rx(�lG���Y�/L����ؓ��ߒ�,��?<�凰��+6�-Zb@{,�r&��9�R̽���!\3Fe	�5_���5lf�1�݊��D�H���;�(��� V�j���c'J��X(�C��&���%q����t�<N��P��N�.&��*�JH���THka܂�>���6��\םU����딦r,� M]��a���}oS�M����rb�xBs����,��򎍉3�e�Vi���Ѽ-<Ţ��9)\�1O]�S��MSL�������5�(~t8j�O�s=0��;��� $���,#�4��^���h�	x(nRU��v����q]�!�7����F�:`�N�#J�]�ѧ�G����5�6���;E�Gc]�n��￶�5��9�zR�j�
���@H����ލ��]��q�����b����5��]bx�Nv��>�����Z�����]p��pt�Q����7�v~�J	V(tl������ʀ�2�>�z����Ԩ�����!�,I+ڍ��Jj��Ztx~{�&�����%X�IE��p�V���(��y��9aӲo�/x�� ?��6[(�����ꇜtAN����Z�?�Ѣ���q6Ts�Ⱦ���m�R�X�l�L��� �+:��%�oD'���pd�6V=բ�E�n=���x-�po�����άV���zL�-r��=��ہ��n�����G]_#ɘ�o�����p����&���ʙ��E_�y���Dىm4OI!��g�3��ҍ+�D�9[zSI��v�`��D�)�15]:O:��m�v���Ȼ�#)=�4̨`��Ր��7#y&Fl�VǏ`=�tA���<�
�.�N{�G��=�7T�΂r��%]��)V
�I��O{���9i���Zsό���|�k�Wx�%�E�DX�M�t��]J�<c�x^j!y�)ز��$����2�|��Y�-�r'���T������O��������م���|�����M���#l�����U�b'[�k0�L�#��0�Yjj[��yc���.xB�3?���H�EI9s���(�quH�%zZ�����O�Od|4w>�`���Q<�{�e��֝EY��h�����C
�mㅵ����Kb��C:���=l���36�;�Q�=톈����2Hв��"n!ߓ7��i	=��μ�r�q\,y`O��U?.k�Ĭp�=b��ǀ��4u��'�vX�k�"☿o��i�5u���z�b�3T�'խ�b3���bs�S����\��A-��4�1D������8��!��e��!�>��o9�$7b��z�XT�J&�#cY$��̮�!P�+�m���nl*�;ߣ�,D�;���y�A���MP3qg"��R٥"u�Ӟ�W��GA;������`bq�A���l�<�T�����d�����4��d:�-��ډ�%ݿ�u"9W�m��J<�ѹ���I��uR�b�̙C�a�X����4� !Oܓ<@��u���᯵r��6l��5�X Uj�7Ji4�)=��6":�-0'��6KhD�2�0��R���6b�Ͷ��aP���b�z��i�NO�ݟ�:$�nܻ0���/x���I��/8Z��;w$%_h�#����3�,�oPn�c�
ϵk(���`js�e�$�s��iU'����������i��B\N�=�oɫ�dW�}��_mw9��LE�=�/"�>��V9R��8":�l���.'YUu<#�<���{�~`���֥��)f2<���b�Y\m��5�����В� �����wf��3��s�3��a����$�_�������/Oc�H4��;� qh�앺J4���b{-x���'���PJ-�3��"����ځq��Ł絈��+Gx�rP/r~����#Qזl�/9i-w�'�g���8p9ZIV�zvv�Cb��Ĺ��n����E���U�7��27?�v�Ig�&*ib��֤7+%Oi_����s@ZGym�u��r�iMW��Yk�mJ�����(�!�zҍҸf*i�+g����AWޝ��;�_Ṵx��K8Yȝ�����T�9����,-z���ܷ.�����Ș��D�>�����Cez�ƙ�P���K ��OQ@�;Ǔ���G+��k����$Cj��!�y��<�蝿��A�B�J�O[�t�'�W�&�����)�٥�k�;�q�Y�VO�4�����NI��`����[���'�}u�ɔ�T�3�2�� y^�<����F���@8�Eӓ��:�7���3�o;�"S��Ѡہ����ӏ������������˯������Ԙ���++�><x�N���P_Ť���~���_m<�����(>�ȳ��pL�U�rbIT8d�J���#O��ˑ\=;Yr��:}p����zr�!����@��Ј��?�#�Z�ޔ�}R������J3{$!9ɡ��VC]��<��cI��ҁ�`p[{�m��REM��u���[w���?��]�s}�#��XJ[��\1��0��X��O�v��P��?���������������H`} :��ف�<mi3��@��ت�$�����
�+d��5���'�$A.R�ȡ��{�ș��U܌�����a��<�v'�f ��JuG��xh� ���3���7��K\B�Cb���L�!�u5/���s��ˮ��}�ܦs����b��Si՟�������>�7g'�y��졼`��<*��[�n�p������3���s���h��N��:j���4#�0$����O���5�~6�����ԓ-�S/V�J�4n�5:��X4�~����+<kY2�l�"	���rh�����8��Y���=����p������ 9bP�B�%fWB�N�F���d�	�Y��G�o�v,�ᶣ;�z�@�:Ԙ���6}ơ<�������S�Q��h9��_���=�m����]:T��'���yi�$h:���������U�O5�~+�|��իܦPO(�ؓ��k�V�g�D%��f���{7v?��Ui���?<�㈱рĞ���hLc�ݕ�+�~por�(=�W�k��2gr���nd�NC�tZ�R��+�œ[k��ʡQ��B�JK�����!��>z*�?�P.@�&��%�8�<�����]�4[��n�kR���� ��w�u�#K~p&G��J4r�����&3��?�7ɛlsIK��y���4WsG��}�z�PP����Q-%iX���Kh��1��A�5�j�Ұ�a��@�WKu�X�t�[p��Px"�I%4�ܔ̩���u�y�O�PtW:Rt��rlj�56�P�����jc�    �Ɋ?q�A9C>a�\i�c�3�`	�mC��&W�p���;	�c�삒T�[I�Hj��*����r#�� �)2T�$��$
����>7��)V֦�#^/�o_F<�=|��f<�%W����l�=K�%�1S�v{��O�\M!�]O$,v�b�F!:�����9��J�Q��WO>����EO(�;��#��{Z� ԑ<&�Y�GH  �oVϏ����Z���� ��᪶���SeY>D~q]��$3��t��V��C�aaj��my��W����Oy�����dRy��;>g� �K��A����P���{>����ݓ=��s�#��l�w+���$�k��a�~������_�yU�w�Cr`>��1���]�6�P? ��~{�|��� ��0FW��J�eϙ�p�B9�����h4W��,�Y�R����������S@z	C�F��K{��]�.~�ſ|*��V�ByD��I�ɜyΑ)!C<���M_�C�K	4�t�2���DI�ri{�NJ�#�X2^�peh�)�?���q�h��\�dYiͥ��������1��2��X���^�K@����������m�&�I��b$��x�h��^u��c��;̇�Ŧ��y^��+�o�4����I����C�W=�9Q��l+{,JpU��'m�-Iq�l]	��	��j
'�^�l%��Q��KH�N�!O��սn?v�	�k7�ډ<����\6�P�N!ޔ�\mVq��#dG7G�!�r'C�C�F��:�= �[N�-j؜��ך}�Ǣ����� ���n>2��������ziX��~��+<X"�g�\�!��e@���.���8�X;��0���J%��#��'ɣs���KL�;Q�+e��9{����~��s��e�l	��M��;����[7w.����4��3��d��O4Gw� �:[��n��Ƕ��1�����eJ�k DNv�ug���H�Ct��[Ƃ��O�Q#�ǂ�B���Ln%F�d�[r�����Q���7*��Mz�S".Da�ɪy�h��#њ�ʍ�h_��V������SOj���%��R�Ʌ��4nSk��zr�UZTM��(�:�lCdu�1,���V� DQ��'+iw]�$Uۜ�[�yqf�B�v�y#{�C�G�Z�����54��kP�.�'	s��M�+<��gjv��I��mX�5��!�{D��-�)"�g2�(�������^��%�F��%*��M���:�|{��I����4�Ն
K+������ J�l����<n�8|����!j�d��@�Ʃ��&&N�!�m4래�����=�)]'O=Y��	JU���l1Ml��wZ6��!ov:>�7����<*ۑ�����)�KqVRm�طӌp:W���|*���F��s��ʰ�~#����{C�����<��x� ND;<[�{͑
�*�P��h�@�A��ɷ�=.1=��� �����)�� �N��Kn'u�lR�FA)�)u}C�'�Ph9�H��q�S���q{�:��(����?�g�OR�Z�>=���C� b�'�s@1Ӷ�/8�v�z-���'����#���LB����tI�1��w3�f��[����,-kY��Lw�V�g��d�V��^�>]�v�0Ȧ'mf����G��.���a�!�T��Nl�tR ou�bl)�
Cڨ%�)/���"OkC��Ð�aNF�@�Zy�����m���/lMf3�Rs���I��{�]	�d?	�O��HW�{�I\8g| �L�U{��}�#ɱ^��R��띸�gb�����f(��@�g!�	7�JO��i�K��!ɟ�SӃ`1�vG εۨ!��!�������۝�a �KЙC���`�(7�C)I;�ӿ�>��5�������qo��_�������O^�z����g_��ʰ߫|�''Z����?��c<�&�5�l�\����o�P����*3���
�K�
9��{��ʵ�M��0M�bA�Bjn�yLw���XN��*��6��_�P O��Z�3��V��0�	���U��ˀz���W�3T�"�dDzŝP��b�j)���ަ=��,�����\]B&m�jҭ�)����G.��`��=����Y��(
��Tr�����IvF�݉��QBS��=$q��b�cq�2��:㞨�v�P��������s�䔷G	�4SN��e���F9�[������p��`�-�	w��i�4jo/�xn{������D�UWƉn��{nWb�c57���W�t�N=?_�`'awh{{Zg�W���I�}.�Ko�m�n��+dH'J�y*��Pn#��l������v���/0P>�r�Q��'��Q������R܊����	G��^�� ���!�����kl��c-m8�
�_`@>Q�*�<۷��j�~�IeJroa���w)�
��G�2�dv:�����3�{I�\��0�|3>�	9�o��,e�%��b;����;.әAn?^�<d�h=��ù��:��-�k\m���}��I�����
��!i׺�b�8Ҏ�Q"�n&m��]u`�vZ.
�loڻ�ұ�������I8vW0��e_D�-MO�լ���L�.R�m���U�����[U�3�KU�����ͦ�v8��$�Ĭ͕���'�-�<f�9�>b;��*U�vsD�ߟs�I��`A)p�޹�j2k�=�@��TrKXf�d]P��O{Z���1�&�� �e�y܀����=�i��ZG��}�?�V<�i��p*�l�p�y�S/�ҤF�,��D��'=��Pp��fn
q�1�Y#��j[�3;�L{����/�W!�!I�;��#oX{�����@�(����vM)ny�uG�zj>�l�Zk�����8��ѝ<��<�p�����Y����펝����I�Jy�r>�Xc�luz�����������'�P�9a�O�=eHA@,b����U��
\����'�z�Al@�^k�-�q(�)�?~�Vm㽲q��I��"��%
�K|s�ҏ�*8�qlކ��큭T8 ¤+�N�!���gA&��aCv�|�a�/0 �txz�*-$XU$�t��;-�l�my���G�b'#�.h��&H���@�% yI��o�.��I�٢`��2���ߏ+�4</�<��Ɖ�@8��z��B�RqB�!�>-�9 �����@���I��3�z�K<b`礶FrkΥ�w���4����<��a
��[N�e�(F@Q���v���0P;!RM�p�䩖tw��Kj�r��/֧�{u
��0�zP��Y��EQ�c���M����좮ꄤߩ�+�d�0p�3��C����t�d<�b�f�{]u]@xΉG��3���b���b�j�k5�z?1n ������<XpVu�t�RVg�2��Ⱥ��n����h��,^4<J�!�Zsy�z��d�A����(�`�b���:[O�!��b�0��p��t�~;Fy!t.
�5�ӊՅ_w����#ݬ�p�;5�|A����	��J��X�ˢb�M��֞r��=���Me<�8V�@ub��4�C�ǫT.���X�e:���=��>��&���N'x��̪���8/ ��3������Q�-=�MEG��R�.!]��On��tNM�5T:Ҙ��^8}��t�$;{(R�m<�iK��G(���� �,;,q�Z��|�6P�������G1:Zy�����S���2� �yk��}�G���H�U'6�D��p��<�jտr��r�=�v�;%��L�d~A�n����͡���>�ٕ�]ƶaw���p>ѭhmz����9�ŮrO�JPxЄ�/��K�V�Iuͳ��#m��sZ�B�Xt텶�����. 
>�����W�=�
g��#�o؈���Ѕ_7#��0`��-{�T�4�گM=�6��<]�9�%�x���?��ֵׂ(�Ī��|f���z,�l:�͊��`(x�f\8�{ٽ�{W4�re[�3��>�������hڮ�G�`�h�Q �b�zzR�nW�����<k��H���F�%�Fj�-(��    ��@<�q��*'z�Ur��c�ӎDu8��A>W�t������A���� 撡��F�Z�t��|k$��ilYk����O0 ��+�R"�J�ľ�h�TCP:�<5m��y;;J�I#��KsR5Co���1ԝ��yJ�m{xn 8?X)�L�CV�{jg����H�}')S�lA]���Q��T�'��Xishn�r�[�!�����%���ޮnC1F$�fx)��qDc9��ؒ?���c�x���̮��#њ�9%�P�	��8� �����LS^�<rf>����^D*�Rц%5���@2����\�ґ�Uq��{c�l��a��A�\o%O���[�M�r�%��z:�fw�Sf���hu;�y-���d��]��Q1�ũ�Q�ԊR�h�vt�6�O0���M�"u�Lt����[A�IX����������%#	����֞v�ئ┻�����h�Z�W����1��"��`9���[D�$�P�C�����F� p�E(N1'��H�g���b��u�1+oӫ'�~d��M�!�X$Y�M^���;U�Qt˪t'�/0��>������cڤWe"0��l�V�Zߖ�|r{��F�� �����4�j"}K=*���J�*��|�s塊G�VE��'�ɲ�Ehh.X�IeA+�k����+�(fVNf�!��zM���Y		�Y<#��[��#�Ȧp҉��4�=�+�I�-����Yf_X�}�QJ��,j��>���(���ˏ����o6<�	,'��ã�A	K�!��S3�S��g�8��������x�h���	)i'٣r�����{[���q����Gٖ~i��Νb��υӧ�e�Zͳ�����]�#�Y�'�]<r�$\)�b��Z��t����&��'bғv����ʵF��[r��;{"�Or�'�#gqq��l��e)Izl��.ĳ{s_�}�ȸ݅�+|��azN�}O�u.��k�XL�L$�a=&���De ��C�?{���kg�v?Wy���D�����^�.y;)N�cF�o?22Y�v�D����'��|{QM��
L�T A�k6{���*Ͽ=?�֣R[K�9�_�!��C�GEƩ�ݦe��h��f ���X,7R��9�VVG�v-�R�Ϧ]��k�	i�k���Oű<'n,�jܬ<�
Z��9{��}2�P/y�yI�8����Ǹ�v��O�<���H�5���ŮV��,��5�r��]��h�WG��s!N�G��iN}PI�͓1"��^��7�N4Y�C'�Z\��hI=�*����lzns�!9�g9QmZ��ꧡe�ѮMI�J��V���uǺݶ}� �� �"%֯�ICWw��Ӿ4pp��ރ��K�v�r�x�N�a���s�����1J�ݮ��'�d�,4��������D��ݬV���w���n��xL�?��SW��4��Wi����0ԓs��#%7{ok�'h���Q�ͻ&��f��)��>zp^�ck���v�"v퉴�ˁ֞��aw���0dd���c��")`����֐���c���_n��μ��d;U�?�A�/GV��j�h����xP)�$
Z��)��V�d!���F2gA�0?�3?���m�*c/�4�ϐ�V���|Y/�=i.�q�nZ��(�Ͼ�t���̽�ێ��qP�U.�uC��?���k<�h6�r���tc8����fs)*^I!/��N~�i�G��v�A�%rN)�L���bJOU�- b�QM�Q4�,�w��}��#�X"���F֢x� ��CF�v��2K��@dՓ�[*=�k���(vu���̆���C��'�zGi	<,�xϝg��[���T�e�m:� ��f�9�X�Sɭ<�۬NAݜh1��W�|�v�78��"��[���&��1S�Jq�.e����q�|K���轳�W&E��\�Bg�79*��H��A�.�B�"n�>��M�$�Ƿ�{�LZ�hJ&��1�@˝!�nD���j�q�0�w��=W���C�~6Y�'��������n7~�!�brx��F��0]��Ɋ�"u�ڇ�T�<�}�p�c�hf��Vu��bH�m�PI�A��y_G%�-�C"��hh�5����U��=>.Z
�\����`�|27�r���q��l.�� Cja��*]־�d�ߘx��Z�d�V�"�H���:�U�։z)��qa�dyx�?�E�xc򽜩�5o����ܧ�F��k.�YT�b'GՄ�2�+DD	�I Q�/x[j���}�w J,I�x�ܩ�N�/v��'z�FߠSڤ��h�;�dAk���g�a�:\��H�yYUp[����bg�v�"Ć�����0h5pI�����%L
���5-KڐGh7#��a��OE�}��|$�V��/�i��o��h)�е/jV����aWR�|���G�Cz8��n�#N!��/hu�sަA�-��H����7"�k�w��,��1~�u]����Q��Sb���Nj�u�EΚ�#��f��6��[�nh0?� �l?�D4�A�L�S��r���\#�ו�'�XN�y��ZO�H�Q���|_	)ڪ�!��%����N⡛�\#b���5��C%����t]���R~�XЉ�D�ҚchC�׶j�	\j憸r�B�m�����$>c+3�B~iQ|"�-lx��Qʎ�H/�����/�)����e&M�;�o��UT�κ�6��w �f>t��m?�|���ޡV��J̠��t�����\��T�!���p��`�JhĨ�,���Hꢞ�[+;+�%�/ֳ�p^���D����l��vӕ�J*)I���m�*��C���\����SLK�_Q�ٯ�;*� {n�Bc� ��=I�ߔ�5�r���w�=8�D�ʫ�����]L�S���
�t���)�o(�t2��n�n˧dZ�n�Nk�Co㘀!㫐t�c�mQ���� u�P�{l�\/���川�����������jD�����m��8�+G=`ڛͲ-����%T^9ST[�=ƻ��~�P҉B�����!M?�'EϮO��2E��>#��Y4���d>�cL�9L0����d�P
����e�:?`�'��5�ח�̵�P� ��)�/+��r�B�_i���1��oz����r��Jq����ȋǃX���?�6�k�J4&������L��(�H�n|b�b��}�<2��~v�H]ݶ�9G��\��P���1�2�eA+y<��[.
e����[�/����Hn���@j��i�e�`krHE7�Qy�]���a�x�o8"!$�7�~
!a��"�e�n�/�6I�d�©UO�,Q)m��Ai�n+�U�T����I�/�����x��W[�>]J�j�><�$�@էDJ|�x�;tr(g���|)#�T�;��~�Sc�� ���0����h3h��@U�V�u��w��za�n�D��-�~�@!�\C���+IY&h�n�w�D7ǘ�$Z�㨮  �P3m����}az��
''ƷShQ� 4��T���!�8���2h����{��@��X�� �h�}�QDˈ��j�:�J�ϺYK�@,p�iR����M����k���\���prٙ��Ɨ �>��{��F�ے��q�w���I���o�꾇��P[)av��y�u���X5s�1;�;p,>@W�u|�[+u�fܷ͍��\��p�-��]Uuc6C�	� �$��� ݷ��KG;x�(�5�\;�r��A�pL�����w r��䇸�����jrI#���>���֍�œ�(�d����e�sUd�KԚ�md���d�D'bߥmg�dr�l��h��8�f�]���	hn�U�k���l5"�6�M^��:��"�B'BJ��� 3*���f<�o0'�e�,��/���Dy�&	i��w7}�[Q/8�I��ƭ�q����OVM'K�4rm�sp�p�^�I�"o�%7�.?8��I�5F?�v*��B�هXx�J2^ර�w �_�I�[���E)��B�X�n��Li��_�[�x<x�u��3$�+u�*u=��CO�b�9��uB����(��*-���x�)�|A�J~�ې9,��z��    z��9Z[#��|�]�x�[�j�q_��{��ւ���k� 0�>�γ�MJk���1ƃ��ɖRw���HO���ޚBZ»��yH�ƛXN�RְZ�HR�{��J��h�l2'����^9�0�y\���r�߶⬡�cJo��N���6W�D�9�<g�uY��H��ￏ6f����C�'���ʢI��uw��<�$J����:ys���A�'��ғχ=�Rr�	"�shmN�cnT����)�l���֒�<z�;=�����%��H������!R㬬e����1#
椸w�w�V����,�i������P�2�ˌ�m��y��ڥ5�����'�u$�X�V�ɻ��]}ݢv��`����|�%�#<�z$�Y��5*�%O���:���$�<��k�^�m� y@�ٽ�h������Xr����w @��&U�H�{��J����S������e�|�`��O,��/6�,I�j��F%���Q��m�J ��ä�rrz�sч�5�	�Ƴ��o���]�e�?`���-�F#�Ȫ�4�����d�:���x����Z�D�bq�$J�X�'nћ�>d'��u��0���֎+��7�Pv�o��MC�7櫣ʼ�tF����.'��k�#���S�}�����|��ڊv�4�7�ɢR߻'r���Oo�Z��X��:��u�c��<bu;�}gp]�B8��\U'u:�mP�z*���a�\O�l�gG�
�6��\�I��f��D׵�u�V>����r5v/B�H ��a����5�z�xx�8Ȓ�Q�-̖9d*z5
K�7"(w��Έ��H���4"Hc�� (��aXt+o�y����N2(����N��R�dD�)�,��놅��f��Nf�iY/��]�aj�}t1ۙ����w��78���6j�OG�iʒ�*B+p�֓�&�ac}N�'��Q�oqiʧ˖%fɭK�0�6�j]C哙ʉ^�f��i+��;7��X4�����B��2�|2u�eӤ�B���>_[	23��r�|����\��L�9���!�v�F"R��F�a�'9��I����{��@�'Z�ZVs-��Dɠ��~�p��X�Y���V���-�B�A�q���߹�����;�o)�")$�5^s�b+����4林�>|����|�M��(�����vH�c�ay]{Q��8)ۉ+cSj��	?���Q�%I��k����o0��dI��� O����b�f>�.���l��_;��^�z'�~��#/�5n(�y>�Z^��e���a���1��[j�K=E��"��IIG����+O�~��W#����3��-�nF�l��`��y�l��z��hBh43>�h/6�T���	�z��~}����P��SDO4�#�S]�|! �l�U�F�Z���.�������A�W���@������=m/s�����3�@��硕ZCF���ڜT2!q�ˎ���p4SS���J��)m^1��,t��N4���������Dw/����7��%�E_�h,{ܭ�ˎ���@G�Q�/�#?<�_o�׺�{���ya~�k�"u�È'o���e���"��#&Βo;��C:���ֲܬU}C�o�'�Ռ܇֪�k��W{�M�tR.fM	��E>!�=�>8$�7���F\v:��z�^sSw|V�㻛˜���O��ڞ��ZN.7���
~�*>�[��(e��7�H��>|C�F=qun�l���e��I�Pr@�d���֮�̲g��6Q'�z�k,<:y׭`ծ��l�5��ʗ�UC���������IC\/�o��ܚ�[�u��VM�!t2S��v�M&�Mn9{	R\��n��C��3ڱ��1��0J����"l�k�
u۬\��]wa:ȓ3i�:(D<(�C�Ș�dR����z(�e��Gvk��:6�>+�=_l0��a��,^w��@��:��iE�1��h� B���Dz�u�^�u��0$:Ơ��X�0n�m`Q}�T/�n�ה>��^��x8>8%;҉0�F��t-���ls�8��}&��DKD懏A����h[��0|I)7�i�
5+��tv���w��e���]�:����?��JJ�G;���m�@�4���a�v�6�m�.��y��0ц��K�����u��;
z���~J֥�L�$('�	���{�ޯ[l}B}a�D<d�ڂ<ed�V�Cr��W��2���POd*gZD���e��h.�=�gײQ>v�mr@�n�\ē6tsjS��m�Ǩ.3�V$��Ӡ���뙩W��w�D͗HWR��V\=YDM��c�4Kk�Q���bt=|�<��$�x��!ha����km�ֆ�t}�C9��GM-����6|Ow�Y���y���;���$J���w�#�r�:	���R�Y�wi��A��:�F��l!eW�����ͮ�ش���9_;=L������W*m�iSC��p����`Y�m�����,�Ǽ
 i�4*&��B{A�'��Z�:>	 �Y���xؕ[�=�O��؃����}w��z�䓉keҚ���W򻾧�� <2郎�o��\��T'�\�s�(����e��>?��Z�����+��;�ĩ���&����e6���~'2�ED�m��o�>�ԣ�ߜzN�(T�Q!�#Z�0��䴴_6��#���2v�5<v^�@�����hu��u��	�J�/�]fc�`^*��;��w��X��/���K<X�:Hc��rC�l��:�^'s �?���?�z{QF@��>4��뼄QV�2����<�;�Nt	G��VI��e�[B�lRg��8��FK߁P�t�/��͹���� ѕ(���m�ۦ~�`�d�)rT|>$ch�,�����ZZ�r�4@~Κ����RA}��E|�x��L�C���\˾���\���>�j�Ͱ��%��	��D� S��w�O�[Է�H�\Nf��fd�1B�'�޵h�g�>L��y#,�M�!?a �9��l�(`�z14��B��4�]�!��7��R>�U�N��a�܋�t��՘lW�/�?aH��Ɍ�n��5�}��s�z"Xd~�&�s:����>.z�2��j���Z����B�xco�s�|."��	�96�J>Q��i+�ً���,v����]p�W^_�s���'z:x�8���{�9ͬ`�Bms��r��x��������vK'�*�"�z���;��h�DO�ֺc���0H99��x}�:��d��.ǩ�05���w�5�c�@�؛����S߽�����(�X~�9v@�V�c��70�^q�Yk[�a���g�Cjr�`�-�;�@T��0r�z����+Uԅ@y��K �XR�c濲������->�,���j��>C�UW/ET�&Շ�.��7)W�<9�DZ������=�����/L�������D�OIU��x"9���[4��q斾>�z�x0/�Q�������̩6s�Ι[��ܧDZ/9��&rrj�bZ�G
�D�7��l��C)St��nQz���7�DY�D�n2�N���o�ԩ �!/_�����ߔ��`g:���@�6�~�7�u�AA-��,�W�w ���J��*���:���������p ���.�/~� :��E��KBhs�{����ϳ)�J�b�,���?Ư�����ߚ����?�?�鷠��7���5�g`'���e�j�_����w������?���N����7� ��4<���-C4�x�IOS}i|�ߚ����B��C���忀폿��/k���_ �?��o��P�0TJ��ua`a�Ѩ�Kl�������D�Mbj������S��=�zⲰ�Fҥ�6���`ehݶ�[�i!����WVw.�����C�ͨj��ȍ®uA;�����?����������_��ٓ�ַW��fqB������(3߆�9�A���/1����G���wr��+�̵�qB������zp
ŤW|��/S�ֿ��hy����?4�ƌ�NGB����\!uU�\B��M��P���d�ߏ�q&��=DK9��]7�+ ն\���!�QD�J&���LԤ�    �B1tTTD}V�Vu�$�ɾ��_�w���q�KG:���_T�)�;�J~ՓJ�/S��٭�S)*�4�$��_R���?H�ID�`���r��	����4��0�j�����t$����o�$��7�H�N|��Q'w�#�U�[E��=B�kV�
`���U_�1'�TNi�R�|�=�#�谖8י������l��]R��%g�s��-w��ɕ�;ޮ��jL��o_�~�X�7�`Ċ�ճŔ���@w����� �U�(R�zP�e?��@ -�#K�=k���Se�]�=��� �/:���]7=�h�z�+�22�h3�i �>#��a��Aj�r�C��3
9I�}�*k�਍|om����0�#ID��a�US��:��#*�ѬqO�r��,-��\�N[����z���B8�ZmJ����26�F�e����Z��|��H��<�|��(�����N�1|�R2�}����șDb_�U��'BiR�w���wt���r��`���gկO�Z�*�DBhYSB܄�Y5��-��ns�g�q˥�g�OV��l���3X\�UXM���+j5��k���Cz����r�);2��RCWE�`d�.6��B+�<I��������GlTІ���
�~��)���.)uQ�+?�7�~�'Fj�09ya���JN)�_�'��-�L�9�px^�(����-7c�d���'��|֌������|�b���dѐȗS�}��"RT4Kj�LG���&ə5�0�\k��G�:�6�=�B1��M;��ûW "�ETO{p�|$��v�A��(gȩ�f����n��k_�a�������iCנ��>c0b<� ��җŃ��G��N�ot�n�	B]��|��y[�W��<�om9_
�vB�rm�IFq�=_>�LW`�nm[[�wN�|#AÙN�5Y�e�A.}���v��98����>�/?Q�T���bYmp@ 8��%�*#LM��=��h�㵗���ѷ��[�t��S�o,��ϩ|Ǳ�w6�q��I��s}��9�#'�A�P��k������X,Ȝ}�tS����d���M{��}T%�s�=�W���,���C�e��QNfU��<���.6e[C���ؚ�R��Cs�0�c���'�d`�M���)r�.t�k��z۶��X~H��'Ks!��Nq�N�>7	x��s����x��E=�c�}H˨�������+�&���=�5�� ��|���B�%��zᗛe6�Y67n�%sXe/R���x��d=iB�VF>@V���Y�!���w��#b�ͭw ��2�p���L 5�u�>=������A;���i���'���2xBO�z1(X�.���Yg��&~ atLGK߻qn�k��	t�H]��^�������^|���,"���L'����ݍ~����G��z��)��
� �?X�l++��fl6��B�4v[(����` %<��JK(�}.b����X����\7���;m��+?����<42�]ϔ泇x����lu����?
<5���<�P�,��;�r�E�R�!��6�M�$���U�#�"d���.4�!��Jx���kMپ�]��M>�`t��FiO�>����mمҋ]��_:��xx�������"kt^�g}��mq%�Oָ4��Wn_4~�PO��EM�
m��B+��L�@hm馷g�����Ы)��	��&�Cew;��Ь��W�efj�𰏞�uqMԓI�R����'Y&X��ե�	ii����<�VJ5ǀf�%�6�n�.�8Yg-�����ï���:���_� �ć�ߤH�#��i����Q�&�(�[�k�U���$�K��9��[^U('vQ+t�[}��ͯ�yQ��3r ���@M|r�@c����8��.7e�/�&��+6.�X�>�PˉIC�������sKOn���ʜE��ޭ�$?u��Ʉ��5��Wi���.�0��f�.K�H'�۞�s���b6O���9���o�I{c)���#�+���y$z2�T{����yj#�"-,���\��"|$=��b�C�bc�a�eM"�`ivMm�����j$ϝ$�N:T��i�5&?�G�Ԉ`�QGo`�{�T�~≳�h#�-l��s7�R��Ѡk�Q~ QAd]�XNT��F6�	,_�ܳx�M����צ ��`0�����@`e�e�T��q���=��@<��x-���0��z�
�dɡ�Y���kD����>����2@�l;l��^������ֲljվ�|�x���X�x�R<�l���.�;}���=��4u4�׌M~���n�4nn�ˋ�e���.B���Wಷ�yzX��|��$�G&�˷�kY�V�˴�F]_k-�,�j���f�ԣ��T{�E/�`�,I�.%
o�F��#	=h<���+�5����㡂W'CW���V�]��H,���A���1��-�|�g��xh}�~��zW<|�,��>�Jҙ�YHR���5�RS�����w/�h��;h8�� y2C�ć1k����:ot��)������#U� ��)�!���ᜂ�Q�p���}�z�ļ��0X���Q�V�_RC����c	�Z,���|�Ń��G-$'-A���V^�?
��]�x�k\3(�	������3�Q҄/��������j���߁x�IJh�N\�b���8�������$ţ_�ț����-''*'GY2o����eIT�%pɍ(����0~4���6&�@Ht��@�9��B!I��k����V+�ɢ��R��m����W?��a�1���R��d�'t��֨����|_�#3��6b5�F���bR�uB�G��]�jn���O4[Ut�(x�n�H&?M(ͧ.�^v��m�^xm���D"IX�4>���C�C:�K��X�O)��x�T���_�ۼp<d~�$�yq���P��+ �v��men�
b�f��%�ݽ��+�ǅϘl��ֆ.�d���J�]gٷj���O��6
��}vkn���v�gr�ޣ�Ul2ŷX|�|�Nj�@LKj��N��E_I��(S��Hp~�����Í5�
=��Eav��:SF��Iw�I ��=��Fonê+��&m��I`�}ۚM�0dP��s���n?��K0�x��v�u�]�@>ݛ�!1������J �vǊ���k�k���E��`8;��bV�a��}��ܛ8�z��:K��,��RzP���S=�Ѩ��� *xT�ÿ�H4S���;����w��Ӈ��29$��e�S��aep	��z�+������OLX�^���:q��;���� 6Q�]�֛��>��OVh���[#����
�b���9�U/��o'}��D�����N#jhk��^5���\���	J'�0J}=�#m���/1T��/}��~��rW~`�L�QR�r���Z�R�N�jE�)��U��6��Z��'�սJ�.S��=J��w_�-[\ c�v�>������w"|�B�j�-�(��9T"d7��c���|��p:H��jD&H�i
%�]az�\9�S�I}�	���Ga��čv�������/K�r�qDk�e�|�5�ʉJ�t�<�n��-,|.f-�ܹ���q���e'��J=1��q���^s^m ����5Ӫ��kڋO0h9a�\zn�����Ӄ��澘h����������YuuGσco���Sr�f��s� �K�91�k�>� B�∱�o���lA�ّ%BWPK��������Cz_~�W�	'ʡ<�[%��6ª�
M��ר����S-O�=8g�F�Y3#]�\�h�	x�;R
�m7��I{Q����=O텻,/�Iw�T�k�>�`|"�C;�]�����9C�b���-����.������&��?^�=He���Qy��־e	�3�	�b'i�bm�urԌֻ��@\3��dSʫ�E����� ������-��rqЪ�-./���opS~�	��=���� �&�F���5%�R[�t�T1�P���� ��D�j��.9j���i���یaG���5כ�    `HG�4����H�$�>�B�ȕ�k�{�}��"�(># \0�DMcqm�~@(�D@�5� R*LB[�[-i_���OV[�<{Ag�F�h�z�W90���-���C�{��tb�k&j%��\��5t�R�i}���p����| ��Q4��K(��
Xs����h|}���� �"=�-57%<�� �y��ɐ&Q6GJ��#�M���;i�f�s�����] 0�vu'��b����ppg���ݬ�H�؋��갨���kS���Y���}%�x� ۉf{K�է�%�r�5�=m��Y_�m���o��N�,�^�2�CLn&]C���G�K�v͐�'4���X`Rd��C�+[���8%WIuf�Z�e�!=��K9�}00jЮ����d}e���D�$����z�p���Ă�����%�y�7����fkz��K[&2g��'C `�Ȑ�Zt ����"��ٗ��l~�A�dD(��^'���HP��UV��c������l<�7��|��7h�C+{�q�[�f��U�hv5�)~��1�Xc���M��G��P����Q��b> �R�9Y=�X�8|�WB���܁���f��n3�*�E���|bL<9��D;��Us�������4^uVM���g��p�����H�n�QD�!�z��uk�f4�#�����D��t�	<��.r�Oy�g��"iqŃ�ߒ�UZ>���j�z�w?��TBuv9�n�KK�Ӈ08�<�Y�֛� �;Hq�V�-p�½��v�7�S�AI(u'��m��G�o,�;�XQ�QCk��ě����f��4:�tW�]Ž~*���R�P���F|�Ս}衕�ffD:�4���T5Y�e�P)�վf��j'�q��kۻ�2�z?���4P\�v��7I���,�k�V�t"�%j�~�?��^4u���$`��j��f>���$?���H��i�KDE>\�\����z�ȵ��<*W;1EC�I
��-w-|2ꌭ�|�i�O�-ё�(C�������y�7gJ3[��^�j�;B|�h����%V?�,��v�y�>$V8"��=V�aP��S9<6���3
t�����C�ׇ�/�FO��Z8���O����EϾ&�:�*5��ʜ��kV�>����D�_�u�w�Hڷ~s������fO)G�/P��AK9��m?�T��!��� ��%��Is_�>����#�)@SB�41oh���$&e�qӬ���A��5Ɠƛ{��ϧ���s@��5������d'�K�����i���f�Օ�d�������o�b����� \�{�f��u� <D�W�t�y�'�����p�E"5���V|�\rr1��W�^6�-�7��e;��*2����޸���P(\Ū(����#	m���A_�$d;����M�Jw�M�V|�x�o��d��4���-6i���'�*�M|�R\i_ܺ(~�P�6�Y;H5YH���	�쯒�.0wW<�k��Rb���իk���x�^4��1�W�>�=�՟`�O����2�6�Vk/�4�@�G9�y�����(���W'��@ίQ=�tv���P�&�����O0�)g�c��c��扯D4�04+w��%�XI�'��$���Ф?�5�d�;u���ۏ0(œ!�x�V���K�,[%�C���e����;у���żG��j�%�VqC�\��kQk,j�� �	�zt^���Ȃ�g�2w��{<�U�m^$M���"�F��5ʉ#�Pb��a���ɡwT�U����k��?����y37�3��}w��Es��ʹ�>��m��ƃ==�ʃ�R98��2���zj��;��NA�s
D[�:Q�h<��qp����ml	[�;¬)!LsA�A:or:P_C�~��P�NDQ�_'�(�E���i�ɥiMS�E���ZOVܫ��w�bV��ЉS�v�2bZ�O�������
�I�d�6iJ(�b=�Y����K�exH\?a�x��պ��P���%tp�0d���犯�~�'ON+�
gi��6>��K��E�M����=Z �`��l����a�V��N��M�lە}���������������1�N����Y�b񍷶��A����0ȉ�Z�O[�)�;��Z5��:g˺�\d_r��T�?����Rϙ��gQ�蘼#��'�O0$�_���f��ң��Y)�d�K��Ժ~=E��� .���P�͉r	Nu�,�3t��H<U����E:q��ٗ7�慫��gWob���HF��94���Q�IO:������Tw�@�Մ���+]#5���d�;�����
��m��� �޿�T��׬�e㡸dsN��b'�(��F�z�&�a�,��v�)�2�� y�x�	Ñ@o�TG�(�mD��׻!�UuX.�i9�1���l' �4"8��\&	bb3>�^��N�?�PN�<3p��>'��>Bų�c�|P�8dgR���e����9!�ӠeW��I	�藧�/�a�t22�G�2wخ���Pսqܔnq�M�vz�p ���\1��1Z�۳�!g�6���et˳ԯQ^4~�`�h�!�e������-@��&2���\�%SD��3�E)�pI�y�����H�����Nl��5.�`�e�P w���R5u�WAo�\�ZkrU����gH���Vs�����=�L���F�R��梛�(H��M�9���f{�$��f��>�;�q�f��JR!u%�%�γ��zHO�F�]���Kk�{̉?��|�E��m�����������_j�W���oOC�GU�'�z������n@>B��b"(�.���}�E���*'�Y�u�א��Y��U�ZL)���&���+In0���G#��M:���J�wr�;�Xdx���|�x�C�'*�`i����Q6+`(��4[_Ɣ����+InX-�'�a#�:x�P[����I��^,��,����O00����!jD<�o�s̡S$p�I|�UV�$4��|3+�Hh�m��Oap���4 >VpGޕ:���U���.x�l�
�(!M��ޣ1��'�Vd�}��E�$�7JWa?���1#M����L��4�Y��r�g��#�&74*�Պ��e3�$����^��%��Mw�Cv�������� B<��}&�L�Q���I%�������wr<j/b^]c�a <���K�A�V��n�.��B�*]x2��Z�-��%��_[�[:������x��jL�-ǰ����.[-Ay�V:�--��@!Pk?�/�\�����ه�d�`���\��`�|S<��m��@�Z������f7Ջ%��S��f�N��o��������C��.����V�(v٤����k�����0��,�����=>�����-��R*2�U�P]����#�px�@e,�k��k�v y�a.��i��7?��A��z���lL�jj}��b�va4)��&�8>*����4{E�=%���-�R�+Iin(wQ8�����$[#>q�Z�]�g�zc]V{��qS<�hF�|xH�(�"f�J�W�}���p�jA�l�i�f��VN<�|����y��#i�lf�)eM�*���(1��bO>�19���(����P��@$ko�LJ�V�!��P���з_����t��c͖�y�i5���.����%i�"k>u�A��i�[�([��ۼF7��H�;�(�A���a��
R�4jY�Y���_Hu�E��J��C��UH�H�.Ě�F���9�����dj̝B�	��f��U�І/>��]ف�$�ܢ&�w���z�A�;��`�M�V��Ћ�>�P�d4j����'B�B�B:��s���z$�e�!�Ir�j����VW7�G;� �0h� ��S�8�縉=������ ����?s�>
��Cò�(�(�]u�I�&ѝ��Y�@�-�R~.u�����E�~�U�T��P�E��;c�'dr�QUP&��E�\qǫŹ�-j��<�hVw�F��s��w��4�?��=�M�����3�Eg�    `0=q�u�UV���o��N������'�����x�;�f<�=?�v�b����]�vN_1���ߵ���/�����P�)=��z�w�ZZ������&���r�h���o]�~1 j��)��iV���rnê�n'6����ޟ�����_����o�P�ן���[X6�����5���~�r�%��}	�; �����/�O"������?��������������������rh���|W?�K';Y�Wbk�}H�7�$�nh�������>\Cvr;�27?��`>���Ŧa�<h�r�<��g��/�ϫ�����)@��=�I>�`^Y�ꡯ=ޯ�_��hue�a�I�	D�7���EO�veT��Z!N��9��=l0��h�� �0�'�ʣ}ol�ǐ���o(�s�U�i��<w]�4v�U���MBB�g{7�}eA"��m�]~�A�dzYR�
�x�a�)k���7������ҙ��� ��:�eY1�&O��P�����r϶�',��[��&"?T����:|N����E�_OY�j<��
4�<�
��x�g�s�7w}����s7�*3�kt�>��G-��t(�5��--L�����t|W����w�d�D�^�(���eY��FIs 0�ċ��?�`GJҲ��-a���TH����H�"�y��F�@.o�h�M҉��;�m���L�*(v���v�T/G�	Ce:���.2Ś���ޣb��f�Vu��5�?J�
4���O����\d��}�$�Э��'Re���#��O����q��~2�UfX-mA�����z�x����F�� G���ARY���ȣN�:����ݏo��O0�|r�e���l),u=�(�Q.Z��C�M/�M�����\ 7*����QJ��(���IϮ���=>e�`��%0��|��:�o?��⬡��p�9���_6���$}0[>��Z5�,C~���<|zW˚.�xM��C�#;G��i�?�>��ٖM����N4�����SqܨY�h�����}�9o�vuGY��܄���C��V�ƌQ�B<� s�K�kMw��#�D����We�s譠^��^���\�o�/��0�t�8�i����n��Қ��� =��S�W���=��#Z�%�,�W�V�9M�)i�o���=6�`�x��!d����5LZ�9�P,.n��藚/��G1nSf��(e7�=��k�ȓ%qXdM�z�q�G����j�R�E,4"?�d���Z���}�/g���G��@s����3ck����&�1�4����E���|�)Pt�<]�5/�����x��礥�qU<�7����F)��ø�1(eHہ؆z�6�'He�[����#('n�l!R)au�Fϡ,��[������ƃ�����H)r>�씢���AQ/f�li�sY������0����2��׈�]�+��mjk���j���^����'; �i��\�e�����@.z����{\�>� 5��O'�e�7>����z��⌨!��@��`���
��u5t���˨H�����muC���5�0�`�|bkY�[[}�>ȭ�iTsy��'�V�E���7���Q\=C�����'>ήr�6�m�2��}x�_T/>��&�D@ �۠������lֱ�̎�I���~s`{0Z�x"K�N�i,ݿo7PI�0wO�m7Ջ0�D'�Ok<�Q?�aJ�[t���"��x�>W�#�蟜G5t���J�{-�����m�3zV�����	�|r�o���[]������YN�f/e׵�>�y�xď��>�/\ud�Q�]�^]����Uz�����ċ��O��d\�sH�!N�Z|r�r씶�m#�]��o���c>�S|�Q�j~�ϫ'�κ�il�q�u�R>��$��*~�S�r�����<$��.����5�Z�Mt$C3���� ���6�jD����bNM�|���)OD�Ɛ�JQ̇Ē���<C�[V�y���A���*'Z�u�ڊB��i؆h)���ݷ/�Y�������e<O�Pu�2�6��Rj�ڟ�e㡺����M�cFc�\8;��i��*^,�����O$�spF^�m����������.?��z�������+r�aԑɭ��"E&�V��!���t���UO�>����%�Tu��� :�Ib2K���U�/���e|$���@�h�*}��F�ŃWXItM<�V=�WB�H�*��[@���QZh��PxS�k�5׶W�ɥG|���H�A�X�?�I!>�j	QQ]�4����#_D)�����A�m�8�B�k[*�rÿ{�:ɪ^�^}3I�O�*Z��c�TKj-0� 7�J�a�:��i�x��G��ɞ����b�^8#��&�s�i����{j/��h��K�rr�'{�7!�w�mc���n-KW�)�A�0 �#I�V��h��S����f��]�]W�r��0��Q�����p'+��(�H�(���hιx�{�����6=��c7>�#ͭ����k����_���%}^����tv<96E�Mï7sCrhRǸ(���Հ_2<=��pzh�������Y�ʛ��P#r�pd3?��z ���3E��|���ءQsWt�h7�pn�!�e�=�`����XW�"=�.��/#�8i�%���p=��J���=�a`*rb.1J�vW��z�"�u�sQ��y����S�傎0��"7�~�
4�a�H_���ͮ��`�|pn�C�����<ʴPk!P�A��z�=���^vE�G�x������/�x�s%D��aY[q�����\�h�O�iG��{�3���t�W�Rމ�j�����ꪖN��)�<���)q!ܧ�!�fj�ִu���G
�#s	�:���>��ZZ���`DJ�|=��񀢩>_mYK<���ZѪ��V������d�؇���M��'�m�GI��E�\�.�2�+�h����]�A������rp���6�h�e��d���&�FY��j���Q{��L}��H���7�$�¹D�r��e���R�v;�9��,���#iq5o���F�`��*u���������/L��κIB"��
}��G��C�W	>��ɸ��e�m̰�a�8�꾀V�:�5��?��M��N�i�}�q��k1�>Ԍ5�1����&��|=�_E9��T�j���6ó��"U�̶Gλ�}m�G �	0���`J*�Q���� ;~p<�[��Ա_��rC���8
�-��@��-���Uk�毅e��ï0�hp���d%�s�aC�	��᫔z�tQC$Ӄ�a��:̪���3�%����S�tG�3d��M��;t�35D����i��.���v����W���A._Y��������|��K��������PcǼ8H�'~�!�HΪ�e�&��j%��05��9M�S�?6BH�+�զ�U[�2����܁C�cىP|�h����0T�� \�#��P�ۡU��>��IZ&\�Q�A�C��P�9���FG��a�ֵ�J�z��e{�=��4�g<q�U�UHv�g2SG���uF���"J����F�>8t�؊�O�2S�8�Rd�]�T�����|����^�qcG�"=�e��46�h���i�.��!�#'�mn�X�4E����m)i������.����&/��LB�W��Vr��9��c��YJh� >�j=R�7
Rͧ�n���&�E#�.ʇ_a0���Ve{����YR����m�Z/p��Hh� ?*��]��1�F���؎K�����š�G"�%�HrqSבS��-EmL�6���\R�V�듮g1i՜�䶻�̣�N}�إuUk�2Y�z/��s���'6k{ϲi��=��&ՓڋM��.��0���>:��H1kY�^�.)i-z)٘� u\t��#"'#f3j"�5o\��	�Ef�i�{�i#�0�b'|h�{�c�(��|��ƚ(�_j�	C|�����K��MH^�$d8!�    �����e��0e}�e=��+��ky�,�b,�F��זu��B���|��� V]>cB��wϚ�>l�,���z����d��E�<:��6���/F i=9�x���������3�O�)���)+�˽VfM����l��\�E��5�Y�Ձ���m��Ԇ7N�P��J׎'��IG�Q�C9r���{���Gs�R�����kg�*W�? ~�j1y}�|��$>P�4�WG^(�z�He���}����zB��(O���k���6S����;��>��~�8|:������nAK���o�4J|�Z��-d��0H9�2��%����0y�x1dh��v}/&���@_E��>�ēq�֞���CE5F���� ����C��;B'7"kY	W��^����!f��bڴu{3-����υ�5�U��J߱�}-�8g��M��+��0�����,b�!i�=kj qrok����|�b��C�'{��iL�Pm�q���γ���[n8_���DV���Q���∖%n/�4ʖXݭ�.�?D �qz,졦v�8����	iW
�^�V�(u�Л�����0T�1R�.���7����ŬS��Ҋ@���c뇢?�ɶ��+,����7�����M0�n�Oڗ(p��D�{��
@=�Ť��{�h�Q�������!�G&b��/��˻;�n4|����1I3�=�/a�P�ylIc�URP�/9��X۪wU��Y�m��>m��9�Y�J��}���i�jyS:|���IOr�ۿ��.EϜ�߇^�2�,��]�>q��<��]�Na(�%��]��7r0�Z�kݲm�3���R��9r8���U�SW���fy�L���!y ���^>Y�B�2�0�I\�L����Әn��z	�>ٮ�\�y&KOG9ǡɑ�$�����sT���< }�R����2%����}ǲ5�]�����K
哫ϖ��5�c��-��
F��bh.9>D jh`~@8N����Cw��8���E8F��@�5 /a��A��9fK�=�Oc�i����_tV큀�H$9�l�`���K�k���|�D�ؠ�ޯ�c}	����Y�um�x��bU�� %5J᮶m�W{�x�� �y��<�+�A���E�l��D�eO�Um�� �k�^��OsP&k���ad��U+�&�i*��F߫�#����<�W�t"������ir�� "N&a�
r�*�K�ġ�v���н�����E��A���X�=��
��Z>�~�;\�%�K�fN��Ї.�m�?��N����̴Z� w��;k1�5n7��IV*���Ov�0W��Ds��\�k8��*��i;:�)~�Ar>���f��K�:�k�#a3%�@�WG)IBr�̬��{	��紻�.L�� a8�r�^3�ˋ�0T<*�yM�uz:����%�I3�,;���ߊ�M���,Z� ��Ŏ��c� �/v8���m͙/7���pb�S��� =�̣�T'`z.
!3�}�fuB�Bڞ#z���s4G�k�P�N�GK�z�s���i�����_�=k�[���L[��T���]�f�e7OpT��Z������0�Z�d.d\},������;:���F���L��,�@�#ʻ�C�
7���rr}�;�^z[cGL:�N{��[���;�(wBr��Щ� ,f��Ӽ-'�=wa	�қ���
R�$z���@:ۢ�O*n��T�4,�4���>3~�툉�����?��`]��1خ1�"��V�GQ���6:9��ߊ����s�?z�=���w����LZ��'J:{a�1o�S�*��U��Q��!�k>h����0���_5��H,D�kr�F�5T��?|�t�)��#m�d�K��3B�ɮ�
�{1�
'L�I��KJ��Mo�q���ƚ̘��Kxh>�
���O�&-����XXּmvLswY<���EǓ��\�r�@>�����'jpH�/FI0���f�|	����SZ��HSaw@%z=*�Z�#�9�E��s�C�Y�I �d�rQ;v��f�i{'bkK��͇�0T=q�fَ�'=$z�z����NUu�2�����Q�N|�h�B�-�籽ix�����D���w���t��xrhOyo���Br�o:1�;�8����Ǧ��!j�D�w�^���)��� �00�J�v�f[�g�����N�F��8���ʡ���VȲ^$l�࠸�>*U��@P�����z;3�B��y����00�IV���@-)C�q�s����z���ep����Q���&��� R�q:�PS��=�����8�M���(�#C���b�3X쒰c��[ѻ�@������>6J0ܑ���LW.���D��<$}ל����p��{�3���%��q#ͱ�TVL]kH��as���]� �pG}�C���I�
9{n3�˓s��܊�v�O�k��\�!q���
y=��a�!y�{��.4��sR'i�{%��2HIa�� 歡y,�����Q�rtǫHj�Ċ�;�E^*�����eӅ������D�������1��L�iK�g�˸9.�(�χ|ry1V&/�>bxy(AF�(j��*��v�!H(\�HDP�C]u9r���g�w#�'�]�ܻ���|�BH#�t��4'(]�6r��vGhk���"Y
�Շ�����i�X<��3wI�����D\sw�9Q�Ci��Q��[k�ONdhR/2݌8@�0=�A���u4���]�u�ŕ�j��E2 /a�#Bs^�u�p��g,���[��Y�~s�._��Bt��`kl�4���{m��;֘I�<�"4�#�����:�CiO��t���������[�x��#�Ab
K���1��M!��o���>~\��a0:Y��0�{�A���츒����P�S��|�(��aA�� ��qF�xv\�*RI�4�'ߔ��@YN�z#8G�����CHa��aH^�p�{|#� �'�G��t�y0`֚�o��}��+�-����t~�������S�S,�Y�f���&O�v���D���S�I}X��(���v���6��{s|zQ>|��؉W��F�vP/H�	�Tp��І���M��8���n-���汆��C	d;�n3��e���ߛkV���2�ԇ*��do5Ti���	�kJ��U{Nq������m����#8(س%�aV�����_a(^�NV@
���.9��2%�J�*ZW僅�A������5����B���f����8H{8��x�e�w�d%Ȑ����[P���M�i��VK( ܕ5$�>29><(�}[eq8�-8I��ً��Kw�m`K�Y�	��	�ʌ&�$%�$��˾��?䱰��&^$4AI��{�J��M{(:4&1tԸ;�h�{ӝM�'�E�r?�P�0��H�ł�!$�U�쵒%�㪻n�P< zd�z"K��q����l�{���"Z{�ٮ�X|�哮�h:�BF>u1��R)-���*�(J��#�fVkq<Ϝf/�'��=�OM�/ڕ��Jx����EAK$�Nex��+�(��ڕC
��S��k^�=�`�_��?ɓ�S02N2����0H�'V�;�%�4W\o�_�6W��i�x�h�Ġ$E�GU@>����
������AKO-��[�}n.�O�&?1^�@D'�(�;��ʂ���䑴��A��h��L~l>@H`y���'�)��70�0���Nx�D�X��g9�%�|�Z�`ݴ�Z�[�8������5�?`p�B5��!�_�59�5{o�j��Ϯk^p�I�K|T>9�����9��c�|wlÌ�s��5_D�����G
�j
���:9�lXr\o��bq�N:��ސ'#�k,�_àGr�9;�}$���a��Hr�
�H�	�c�C��Q�w�\M`��Ƃ}�I�؆�m't	�ͳ�M��;&'D^����4�8;���I�W�>�E�Q    ����*g��\��kjxٛϜ`*���nd��f����	��d-[.)ϭA�o�¼|lu��C��|����ã���j��#�6!.󚗆�3-�� �k^��~	����YQ���!57	)5hi�#�5k�|��	�i������G�X!�X7���Y��j�;����͇�0��k{c��D�������,�����~���|+�P\̀xd696p+%u�"5�ԉ�*c�������w��l?����9Ni)�/��g�h�gX�^O�c�~����a���s^�wIT��K�I>�o �m̙�5�/a�|�&G#�%�Jc`�C��p��A����^�惣��ƇԇνM���I���$���hOP0���!㼄�ȉ��^�jI�g�s�r���e���_u�q(���ʉ���.�q"���|tQ�4�p_�-~E�T=����R����ʒl��t(��7����R$�=P�[x�ı�r�h6f
Ww���Ӈ�0 -?�2����l�˘�,f�.Y�������AƇ7�zBq.<�Ȏ����)l��؞�����8���������{{�^6ӟ�u8���'5"�h���R(��H_k��k�!��av���O�]I��e��0Ħ�ɴ�lST���xAM�n���<Z�����C� ��B'K�e�7>1�&���AӜ�w�׾�ʇ�0�-Ì.;[�VC�|�![��L�+E�]��������s��������A�s9��;���92���.ʇ�0 �A}�U�U,�s�Ts��Z�� ��I��< ~P�zf�N��b"��R�� ���E��+B%��g�^97L�PΧ���FR�0�]�$���6-'�f����*z>���D2�SZ~�U����+5�f���sW����z\�mo�.�hy�������PNn����i*X�2C#��AslXw�p]t��#O�a*�F�,y����YS�T�����b���>6j���$VN�u͝�H�T���F.�� ��q��<�a�c�=VO[{xi��ϛ�:(&��6�����ArG�� �{�iyC�O���vK�Vf"(A����e��0����s�T�a1���UZiz��z����� ��]u �`=���\��iq�+'-\=����w8;>ᠰf���Q�R]c���O���}�vb��îZPN�i��/ ß=�=6%�Y��O�֋��a(x����	�2������A��W֫��0X(DaW�c��lOڮ��w�~��E�gH�gm�.�����ys�Q�N0Er�	˚�$�۰j��E�,�������{�FU&��l��R�:����w[��g��A���@a��S�"�8q���cA݌V���|pT��Q9�5/�y������q��/��)��a�ۯ�/^ ZN��L"�O����.s�x��vW>�j�* �4�Ukn^R����&��r���f��1�5��%X��.*,��Q$�c�	��R6vpe:|�*�˟~�p�5���_��5T�N�U˛|Pٻ�5䬗0�Hhm�� #���t,��n��f'����P�PK��0R9�[&)�4��oqW���EB��x��K*��jo�E��h�R�T6�cy�mL@�X\���g�B�b'6�0W)�o¨�t0�ϛ��-�P6����w��h��*�֋5�X��7	��ɳl�k���.�0����<�l�.=�� \�!��ם�'����aP�vM��A�ϕ;�HK�s`*��ܗ�w��t�/����4��O(�~�`#Uk�t0���?����t�C��q��B��5��=: 9����K	�\OR�P@Bc/�ZO�iA�^�w�䬉�mo���hc���&8�+�'Ӆ��[pڣ��;zXIb���z״Y��C3	��H?��u�mZLl>�W��d�ʹ��ܔ�aN�A��kJ_��
�"�������6G�s\t�IA; �=�#j�::��)a��!�asj��9��!2�K�}f:���	���|�ꐼ<�>��08��(Z��o������x��c8q2�z�9V�����0Ŋ�^s\s��9:��t�$#����-�bV�V�tR�.I=
e8���>�#��u2�*��m�	���E�?��r�c�"���.���u��?�|��y�����������m�����?������?��������������s��{������= �g5�+*,�̡�c�8�!�^I(�RO��MZ^�)����� u�����]=U.z]~��f>a���
����EF�X����~�uޅ�($!�X��囎�gKXW��&��/5��j*��>4�àxb�W|������2J��%|����)�$��Qf=����mޞ ��9vxai��v�Y�{��͇_aP:���
ٷgP�#�����Z#Eۼ�w������(�Nד�+k�V�����i!�]���ޮ�C��W
���@�l2Hu� ��#ԴV��x��Ś�����T�:9��C|�� ;
���P>�d-���ָ��%��[����R����)t�w�܋n.����@{��#���G��F���z�TJ���^w��~l>�#O�0�j��9�\=.w��.AP���Ȣ��~�!
A�(��O������'��I: :	����͇�0��'��ݻ����A�N�h�e����q)H[���]���d��%���ԁ��$ۄ�#g�FI�%5���
�*.b��B����%<��3��.����=L�NH[���u�:�M̖W���Z��L�����a�#��rB�yS���o�� h��2 ]u����0��O'Ƿ�*ɂ�b}2����� bV��{���̇a�|�E��⺒���E�#Yΐ`���Am�%�>6½9�E��\㾶nR�B�8�Z>}K�P6.V�-��0�|����WȚ�{RpWN}RN��gCi��I�/�?�È�>��bq?��x���=3L%W	O����C��W��w�Z��w��U�ϛm�����s&�]K7i!P��8t�ba u"�D9{�(�[ܽ44
��^, ���a��k�ں�9�^q�#�'�S0�]�&�V�cz+��񠀧�p*>h$Ύ�Ļ�Թ'��Y����a��]��w���ԙ�:��O���U{�ҭ֋�e�s�yk&=�46���sh��{؊I�29�g�����B'E�Vs.�0����'�O;0A�uә��E�+��! �(�5:�=�0�9���1�"�*X\�\3m����d��{�d�! ���3�G�
����A�E聃�E���p䧅y��S�8��}k0S-l)$!�!2�DA�̛��u��(4�7����oX��&�����wV;Q�)qj3�&o���sEP%���^]�Y5��|bֻ�����B����zCU�<���8[D_�PLO����1�۞�jΌ#\��?J���`�k��A��qp�飕��^Z�4�@ߞ��|n-7��s0���L���9�8hJ�i#�����s��H�_���9|x	�ّ9+�y������.)����M�gҫ�!��Λ��-�w�R����a�m)M:4oRaޔ��|�������6%܎�jMk� �/��&����v�,GgQ�k����$ٞ��+y0��c�Zn:{��g;Y�^��	�^%q5�6�c�Fۇ���<�cӡ� b���@�p����p�a��#i�A�8�����:��m�->T�
��&)l����=c�S�rB`y��'��P|:�
I�C(�5��J�X��\��kt�~���DA�"Ň���}��0�l��J�U� ����p�<҃�J	�:(�����Л�u�2ܳZ���r�~ �c�����%/!!���m]V0� �v6lj�y@j��L����:�S��57Y?�P��k��_(-�PY˔���Icaǵ3�]�@AQ#�t@:���QDr� ����Z|��j[;�Z�����08@X�1�Jb�:�^�*ĉe��1��� ��^ޥ�    7���@j�=��yq�#d�@8r���������w*�XiE_��R�ه��:�%�7�h�s�������D�;)^�������p����*�̱"v��ŏ0�r�c��Hv��u�7M�n�4��#g���E<=)�X 9M�.�I�]����+$b*<W7s������t���χ�al]��N�j8�j�0�8�Z����U�J���>h�A ������`ҟ�A5�Tg�
����^�P��כe���ye��zjM���墣(�@����t�?a�4����竊�'-�ʘ����g��x��ii.
'g�m�B��EV~��@��J���<a�{Q�}1��`rr�+M���9��^eS{��eׅ[�C���KX�+�z �P/��o��GZ�j�r��Ҹ
�=��/a�Z���JV�g
-�1��(�>���	>d�$>�A���U��(�)��gP�E��3�L�a&b�(c�]��Ù�ZiP���BB��XB�܁T�l��q�M�ċ_�'�9+��Şh��_��>�7^�㸺�E�r?|"�&Y���^�J5oJ{��k�����c������� L��
���rF>a��d:xX���w �iN.q�-	*�:�,��eq^ghI���X�N
�\p��y�p)nkXʑ,��&��v'���G���P�bnI�y�1_�NӡK�ZD�"�;�>5��@��[�My>8�� �7��سΒ�\t.�#��KfH	���ЋlQ�O�l�b�p�7J	"N�؝4uuB����&�\��)���coP��2�ཀྵ�'��KOVUf�Z�JB<-b,�2lm��d	*N�؝��|�gֵ��̩h�yC��k�cOD��y�%"G��[K3�$=�'�G�>y6�V��^/:�/A�)9v'�7��^#ޫ���(��ɡ�O[e��ۀnʇ�0(��Y���9�R�r ���6Dޥe�I�"�P�����=��9�6�ɿ�!�c�Vħ��Mlj�0_ �O�B�U��c5�㬶��QSo>�^4_��Ⰴ�9�_O�&0���^�m���gq1�@"�ٮ��{	�ɮ\��D}�,5Pd>v�ع��-���M[A%�8�aj��� f8����x�4/���Ϯ��A&�k�/^�P�D�~��=' ��b[w�g�1��뜣��(j%�8�z���ɋ���tƔ%80S�
O�h��'܋͇�0X>��
�ʌs8t�cV@���A���� r� ո��Y%m���r�WZ��Ґ1�k�/^�@xr�j�����}���?�Z>}	��E
%�8dOSs�xr�)0�b�8DBF��qcW�eI�z����0T8�s_Td�\!�\>�C�r�=����?6�������q�b�ŭz��s��{\_�4t��v�k�y_ G��kq(I��W�X��1 ��[��~��S��Hrx��&�M���a�}Z�3��Y��[����՟�?��S��C��wȴ1�7��F^�W��pd��� ���y11> 㬌�y��i!�6fK����hv)�L�"��#5�	JCY5Yy�X���z���QG��o�?6��rx���	rr���Zjۿ?�qF�Isww�bO����
i�uf�w9�2R%�46̢������M+8���y�Hn
�J���t���ǟ�?~��_��������/���i��_���V<����E���I'��maG�&RD�_�-�������_����5ϙ��_�����f1t��c���.9u��_86�#;�۟������������?���O�U�8+cf;�{f�^"=h6��`(��x���^�c�}�}��yS��	�%���"�jfI��wjz���0Xv<u�[���E�y]����c�vX�1l�Q�]��Bj�i7�zb����o��_�2�J�T�I��kU^�`G�LS{ع� 	ǣ�4�,am��ޤ�T���U�aR�ɹ�,Rdp*�j�10�6�'ͭ9O���%&'���1B�4ή��wm�?��)�}j�h=���8�f�r6/�_��q�;��u9%eD-�g�׬_����IV���� ���&e%G��۪��U� _�zX��N�?p�|J�g���s�F�A�年�Y�~	C-'ף��~�SnaOX�_��4���QV��y����.��[�P����z�-M+��k7��CMa9���7Ao2����'���LՓ7ze��9|tg�֑�ը��~�ck���LƇU�z����ܐV�6aj�Z�^x���C�y	��� ���X�K:�)<QV�:�]Ca��@cJ�Ih��g��`�ܹ��ǟ�ZHP�S�=�<�����k�T����[�r������td�5~������s�k�Ǘ�5�U�Np���k�OX�$�,�,H������1�'+J��\Ї���������;��}�Yv�bu1����aP8j���	S�6�s��V�hT�a������C��l��D��?o<�4j\�ְc�W�K�ED��~G3���p�@����"о���o:��|�)�i�����vd�.-��Q<	�˴���YT;�F��%
t䧂*�ΆI8�TeJ&\R�,������ǦCȀ;:�A �еx�(q�3i���ox:�i-��.�?� �O����
j�߃�dAz��0f���>�/Y}l>`�/�>��|"3�c������HM�cJ��#'Ջ�ŏ0 ���<G��_g�]��#�tx�]S��K���DV���h��l���Tv��yf��R.:��=�ރQ=pD	-G>4��J2��-n�ޓ���Y =|���sk�2GZ{�xK�Y�D�v�n!>�ݒ/a�#�gGO�f��haA��%g���k��ʃ4� ���/=���zp?W����򠸠n�\���>I�-X�[h�ƣ{�ʠs�ms�E�h	hX��G68���DhA���l0�6n����\��������Uj�c�0�~}����]��Uˇ$P5��q���c��Y�r�i3M}�JY����u���KO���Z��@�릳�V�%eY^ s�y�[�3%����Ř#����j{����7��0
yS��������	7���G��j�YPz0���W�ix�{�)��ո��'�UM�o��!��V�,U�<�H����C��;�G����(Nc��d�@K�Zsc�|Y}(_�|1>���'��š�b	4�;9K��6��?L���{�A^����e�e����3��e�é��-�n0[\�\,A
.�����d'�d>_����0�83C" Ұ�.���0ؑ�j年��$/�VV;���c��ko,���_��8�p�'��JL"�����$"�C��r���w*����OƲ���#(�)��n"?J���z,��|�/:p�g c�Kb�+?��r^���>|�A9�X����uI�CInc���K+�d�\�� �
f7�!jT6bv[fc`�u���<|����9��g���3��d1h.��J�oCb��٩��j �y\u<	ٻ�c�G�|�Dm�gfN� ��g�����6��c��:z-�͢��~�^Ʀ4�_�� ]�1�2���C�	g�6��NX�s�ƥ�N-l�|�Z�n�����Of�u�R*�֟J}�?{�2�]`��y�t�C�j������O\%D:����8�+<v���|���	c@�9v�ۋPj���!� ́[�:}x��}ey(�ɝ?N���pj�b��Ȳw�I[���e��Q�L�dq��AlV;��g�>g��P��/]c�B1�$({d_�>���|,��ʹ��P�K���O����)���wTO�Ci�y���H�x-|� i���>~��X(�=�/�1�8W�ͺ�����1��6�ra�z��ŏ0�#e��e�R(m���85�!�U�^m.Z���0�;AU�� �4"��}SN�b�ktD�1��.��A���X ���Tl���O���3��L��@��q��U���}�H��}Ԍ�i-��an��H�Jb�9�ɛ���]x�ڷ=@7�aSs    ˴�����/���!�@x�����=`��9�uM��w���c_�$�J��?�����bE �� &����i��܋f���|���>�Jn-���OZV��=�Q�M�g��m%Vi�V�>|Lf9Dو>qb�ܢ>x������"]��_n~h>|�����F�+������K�?{�IFlhC��\�4ViB��8�h�<�t���ml��W|܋��kv�^TO�Tz[�U�-�������gV�?h�҂�����Xz�P/-����X)�������k�x�����X6��zy�t�b��m��J��TNc��;�w��H@j�i��hX=����j̘e9�f��%E��&c�kq?��!�A���>w*��+�U�+N��C���A>�1�y�?D��5N<o]2��5�8/a 9��ǎ�7�� �Gw(�}�����u�?6.��rV8���K���&�|����G��ɇ�B,7��0��iT��bc6��
<b�;&�ĕF/�&�A���l�����*8gO��0�3��~���^,��9�{	��	�.mU�ڂ��1f�u��I��vЕ/��X�����`T>9�^<&���È����������$��S�?4~�!.�����88>o���9t����+o�Ojp�2>�Wy=��*c����1q�S4��q)��|ͭ�K���9�$�-)�R�Ji/�֌�{I��M�^.��s���>��}f��'�hL]�l��`}	�ԓ�BP�^�S���.�3��?�{��h�؝6�=|Ȃ�����}�5�+�:B�H�Unʇ�0����6mΉ����{�Ȏ&*p݋�z����Pj(�7���qTk�l���aF�p:�!�K<V�K�5�[?�P�����0�^���<�����>��W������d	�A�����3�F+-����2����G��A���2k�-6̍���s�!J������PP�������o3�/����{�-�8����͇�0�z�CZr�L�V��`��]3+�l�����[c����^�����d�I�;{}�����sFhӊ��G�>|��ё��lpHقg`!�S��5}����M[b��>����T:��m�d>,��F�~�m֏0��P� ��T�7�({��61�޳��w���#�@N��<y�dxB�恈k�/(��ͳ�}��%\N��B�|��A���0� �ɘ���w?@y�Vg��I>t�қ?�ڭ�¼4���B�˔p��(~��d<�� ��>`9f��ε�z�l�ئe+߅$�zD4�'RbY{��3Z )G��N�Ľ����|��p>�~0�%8j����La��d��C���l>�SHa�r"TܔK�0y �����ߔ4���_*j��o���N�C��S��Iڳ�S�&և�FWGŎ�T`p�O|�FM��Y��v�j�s��qxO���|��9��aeV��Io�k�qu��rs��{���͇�Q� $>��>X���������x%�vؒ�U��wH�
�8Vڨ;q�~ё��my.j�=��S��SRA�'�����5���Pȉ�bΠg]��a@�G
9qub�uj(�h�:� eR�^��,�*YB*��ʉ4LL�m�s�ܟ=�l̑�T���\�'���d�����)�H	s�RZ*0=�ڷ\�<�8�yh)du�v��b�tY(�Tç7[aV�vUy������J`��T���|�J6y�^P��u�?6TC(iU�#e��Rq�����ge���,T�V�]_��鑀�,kH��zb��R|n�TlV]ߓ,���/�����ȍ�������r��r�C��k��^�P��>8�tص����)ӡ���ҴZ���_��a�BA� 6<�����P��j0/�)�3c����K��8YV-^�B���P����Z_�r�vW>`��3=���'���[VJ{����>�%l�j_}��(��`x�;	U�L�U�'Y��Q��)�-Ѧ�W��=ˣ��������mR"-����f�t{t�=Z?���p�±���9�̐xvs��g"`}e֛�7-X(a���?�ɹ����j��b�"��J��5}��y�5䋗0P�2ΨZZ��v�~ѽ�ʊ��UW���{��͇,w�G.t�6��A�Zh���@2��;��vQ:|G����5
%\�4�z״�q�y��Z������t� �CyT�#�Y��V�a��C���vC��c�En�/a�|"���CHYcIfw��=�{�5���t҂�����l[N����U��ĕw��� /��}|�G �#��
�P�J��&Vb�,A�(�2n�~�`�@��B��9-g^2SY� b'J�s��[t����wX�Dr�[6ƒd��d��M��}����K��͇$w,9��/XV&	������\��E�qU�i����q�f�v�TK)!�'�9�a��D��`�?h����`����>8[ K���Z�N�k�a^�P�ɴ�1|g���^��#�OY@>b��<@0�Bc��F'��|�}Z��hy��X&k�Uy�s����'&�T����{�X�]>hz���e�R׮W�I����D�}<��*4�O�ɜ��� >x�6������0��x�����D��-v�C�z�k�3��v��\dd�:�{�
r"=)Rl���[�>b5~ڏ�d0./~�!��O8g�\v3`�`K��'�b�r��� ch�jxrU�v��a�ț�6+SBوL��~��C��a�|x
#�,�g��+o��"���S*�Ȯڂu��Sc���H�ݴ6��"��G�Qf���A�ν_tZ�#R������-ڦ'A�%#Ao4���+&}p>��P~8��u���p��b���:��s����Q��D<qq��j_<Ӟ�
��p<�=�5���{	����*{F���G�p4C�9��h�_�c[��q���K�Q�(Y�u�	
;���ȁPRX�m�U��㯿�~|۬��;�ӧq{�5U,O'����ǟ�?~��_��������/'hc������􏿵�����|����׿��o��o��+��_��� �Bz��|�F�NO�y�X�h�a����=��������_�x���F�����t[�Be�]�,�#
�,z��#Gul�C~�e{���	|���P�=%�c��<
_��a�����4��a|�ÙZS��`�KY�7��A(z"��<M��r$���xj1N�e�w����d��3*'n9���5�2}���R]m%bB1���W">4���U��
e-!�huqM5u�0�.Ay�6�E:J��GEѓ�ٗ���g�g��9VN$�0���|���G�5�*�Ë�����V��n����6nb"X0t8$)�w;'2ΝJ�6���<��$���#%_~����{��Aq���t(�(n<���>��ڷ���k���P0~�8<�AX:�DR'Y���)�b�pz��X��uQ:|���ĢV�i�z�ƈ�1��Z�-m�������[�  x�hsa�>@�T��?]b�h>�J�v��]�I�#TN�$�c�8�K�׶XAw8٫̖'9ʾh����a� 䝨��_�b�����Pq�$\���?ѣ��|x	���9t�%x\�v-�	9)I[�w�����C�� ��zB�nm��O�.m��%q U�������A��v��p�U�޽4��X�O/��=/Z���!B�XN�rp�ń��?�9�X��hS���/aP��\������������Qb��[�����c�B  ��^'Ov�z5A�5�\�ϾsK��%D�:�n׬
��A��P�gn�AM�\b��l������t�j0t��P%#��1�9CGiԡ���xY�%��B��wO�!\Ȫ��Y��M��܂��Ν�u�uU>�P ����p�*�`	�{W�����a#���*n=�^3o����^��RI�t̙�L�����^E�E�!5(:X���N����8juzy�F��{�P�ML��{t{_�pt    Y0������3G�����@e��k0tP�u>�⑉���Z�q����0��u2<͹��v�e�K���<X�q[�iho�}��[`��!(ԩ�����|�/�Ri�z1/F��3�T,n/2{�2u�e.�
N~���I��N^�u���͒LU�- V����w��<��89�b��c��3���N�aNi�-��[��a%�_!���~��%x�8���Yh��߽��mq�]}�J��5,��	e�Cߗ�(�[���ݓ�0��aPvT!�!w��?����y������#�g��Cy�U���D�f�m
l��v�O��ĉdFH���X���b�9aB�a���7m�Ԡ���'�*'�B�+P�}�k�w�.©�aT.X�lc����dC�5)�%K-3n>��Wz�k�-��+��6�_���n'� T0�õV��|�gQ�\���t�����d)��=ǥF�X<�	=Er��Շ1�~��W�V�z$N�\��e9���R��D�Oy��k2^�!~�A��Q�tY��w���|b�5���]ˎ$�q��3x�B�+}҇�	-$q�ŋ��y�p{�Y+.b�;���驴�t7�p7�JQ��)/z������ٸ�G�z�Fǭ�П��w�vc����c2y���b@$I'-�����`mu?�Up���ҍ���o�#�çW�QR�?[�Ԫ:4X�V|�`+�Hi��W�/s��+�H'��e� ,��l�4/h�@�R� d��9�5^yވ�Ø󉃩�M(���B��`�^H#W�S��θl���ά�i���Bc����B[�=Lk�Ӣ *n��Ϗd'���\FЛ�O��#G(Y@M��גf�戫���88Ԗ=z�\�s;�h ��X$���n�ݲ��̎�s��x �4^��a3�{��A#�2�,�d��k@a�" �	�OZFx@U�V�`�h�K��S(�~:wJ;ދT}��ĥϧ��2T���w%p�+�KHTP����,&����!F��Zٛ��bE�HuCn4�C�,�+�4V�\������Ĳ�s7@������1�W�����{U�O J<Y%A��P'0�����ٺ�PT�m�}����pLd��~�p9)��w�+��G�Z,TM9lE���ֻ��WB�t��IH����D�dQ|��m�3����/��Ƈ��'1ѪZ4N�����~�5B.3�IR��ԫQ�Z�1���o�~61�o�6(t�I#/p��D�Y`��2�h�D�[���/�\`���L8δ�uw�ec���Gm�u���ڮES/�Lo�q�a�K����/G����0Ivґ���A�/��r�O�D�0nk�����$��N\ʨ�7��!n�	/F�~p5[)��ܬv��_q���vZ:�J�0�b�_r��;J����R�J���#��;��O_ô�����S�"���fGV>��TJT�$c�i�o���u\9��54��FM[_7�_6$>��#�s�d�_ul	�\�'�Ƀ� ��YLȇ�[���X(0Z����G�Y׉*:6���(��μ];�Rn5ь��'�6��*�&�`��'��F�s��^<����������p�y�e��%LhR��z��ޑ_�'&Lb�0m�W7���rx?�#
�k������3ŘN�hjA�Y�n�7|4��
���]
ʻK����`Δ�
�l��6S��%�
W��_�_8&�/�>J�v�D��Ds*�Q�_�#U�&r�"�S�ec�ғn��eS�b��th+�6)�l��(�N���u`,�Hlz�9r�Α�P_b�˺��<o��5�G��Db9�eW��@��/E��g�lW���'������z4�!��$tF�>��~��-�F�����sw1 (�I��XH>iѷ#�rSǊ�1O�S�[L�7��>b�'�kBv���Q|dx�)�gY�4�FΙ�*�8��A�dN��Cm~JcP�u�aU̽v��Q��cÔ���3�n�xZrWö5��:�_��w[��D�Kd��C�N��54Y(�K�j�7b^����1ݥ� O���l5�~P���&�LmF���1�	B⠆��`NPH0nM��^w���֙��JG��a~.B�'��T*>l����u����is�;5ͷ6]�z��VG�7����P{vun���g�Erᘨ>C���A���|T���m�u2޶s[ۢ�+O|��h�xZ6Jg4��Xb��	��ę_f_7&|N�ߌ���p(ތ^��@��!?��WF)))/�!�F=�?�R=iڮ��P��y��%�j�Z�Gm`i��.�P��E
?��\�1U,�ݐ(�q@ט�2�D�T��w�_:Z��Q��Y&C����è�7+U� �{�^
��H������F�O0m�{/�B��4NMH��:��"�z4$�cQ�Q@}^���; �c�[�[L��G�'	�xbiu�����|K���� �R�{����\�"g��u�l԰��h�"
ƽ��<�.�5��pL��ù��t�ъ�B���u���R{�;�%�FC`?Q��F�VK�ּ�ЉՖ��z[�h��fVw�p(샼o�b�n���l~�gŷi-g��>���x݃x٘����t��5e���R*��ԋ0/0�v�<�>�0��������P<#�Fк� ˷AV���}�ec���I��H{0ކb�|šE�"�$�

=z���"<-z���ĺ�f��h������CFU5Zc{w��ŀ0:Y����V�,�C�-��$����D�����-G>sA��^�e@ݢ'���)����e�V!�	���M9���؃�t&�sl�ԕ��VƼ��CQ?�}Xz$uc�b��*eig=�BK_���|��\�*&>� 8������!�&��%�wvk������^1��#>mY��0:`�9��l�V$7��B�k����j�_�̫��o��r���D��m��}��3>|1�w�	���ѝ�I��?��&�c�FEH��;G�#ݫt|� 1��f̘���������"�v��4����J�O�G{$�#�;R�@���P�V�����'-ުA�7@��v�ZB�j�RA�l�/?�@x�%�i��V��"�ĉMiE��9=>���[�F��ٍkJ������:!��H��eG�-��\�!�6wï7�	��z��U�v@'�	>�O�N_�V���\i��i�L�ܫv|���{�&K�� ���� �xv*C���j}���1�m�s.�ބ��ڑ[,�\zT�M?��f�t'Z5+��r֛�N|��d�.��>K������2�C����dS�5� �����G�f[���l+����u�K=�I��_�PO��gt[X���~ӳ
e�`J9�EK�6��ߡ`�gz�(�H�;5�+�]�d��o��"�>")��@�lL|�ʉق��ׯDG���0�g|��]�m���C!>Z���TJ>�"�-��f��'�M{����r�6��1��Lq����X��<� ��I��Yi��:��x�|�B}���Y�ɴ�$T��VH���Bt���v��({&�I��_���N��j۲{ŧ�-O�F��xA���"z�0����`c��A�׃S	+�M̡lo�p�ܞ��7_]��S��T�O;儗C�Fi�?s��,]��jG��z���|�z�B%۷�v��m�aԖ7M��.�[�
�����'�!��I5�*�����b��'RE���,&�F�t�W�hsd6pII�OT|�n�СPi���&�__� S:q����U��ݳ{�.(�vp�Uc�u÷i��E�_���)�N��k��><�N�#t��iQ�F�|��p�;r���&>�(�=��|�M�aY�Z��ns��
_�����쫗Olc�L�\�/yN͖�m�a��Ĺ�?�'>��L'�p�i�La�[�k�P7��O̾X�8o�w�
B�㶇QՓ�*y��jH��@��V����!� >ƭb���Kѹ't�o�-A}��z���`�]Jj7��#.P��}��ZT�b���t���ާ�U��׫/�Q�CM-�i����E�&�-j`W��9�Z�j.�����<&(f�9H���Zj�7@fl��V!�+� �  r";d�Q��ۭ�(��cq���o�fq���v��Gr��*�:�x|��l��ܿ�j�m��z��ec����A@4��%s%:� ]SfD���^{A^8$�Ӈed��'oG_�{�3s;���q��j#�~���!�	D:9�I�i�,�=c��b�����譔v�+Q2����Qj*w���l�1��s-�`�(a�A*1�k^uِ�ġ�̷�*�N�*�Q*���0)�4�������Q$r�΅�Dώ�����,_�#2i�E�{H.�@�ɤO�jM@������&Q_`�K���]Q����,z�0`����:��~;�9��髭>�qym-}ِ�"I��lf+D� @2�L��Cr�]��1~��?�6�����?�[��K��O����������?���������
�<�xS��b�%�m���kF�<o�57-<��y�}��<��'��v�ף�ݹj2��ݼ�$	!��ɒ�o4!�w;K.���,�gGe��;��!Jf��������ǯ����Ew,q���{ T��[�x"��;��% �>sY���z�q�"�|ǉ��Ic�`�5�hӗ�t���p�aM�������`P��"u�LU���9�iu��=�a+�U���U9�=Km��(N1�t��:�Ũa��xЩm�l���.Jw:��-9'99���,���7���*rD�y� ۷:�2��������L+w�����S4����]60ʹ���C~ ⨃�?�d_3�4Ի�;�r�mv)�4�g��w$�ހ�}�f>��n�.�s�����B�?�F^�^i�W (�I��j�b�	*��A�A����(�Ez��4I~7����G)�x��	�좻3\���&h����[����~���Y�����*��@i���1h��;d����=_o���K���AL�"�ޗ�隂ק%���V'��ń���G�*'-Ω�.���]�M����P09cL���W ��Aqm��s���f��"&�T�X���t���P$�a7yT9Y�=���n~þ�m&��<�Cۍ�Y *�@����@�5�l^q��&E����}fm�C�<����h�N�cư��j�PҞ��ʓ�)ߨ�� �d'���9���zoi"�J�m�fm����?�̂��K�&�|bIݑTv�a?�M�2��B\p�1׻�ʗ�����
k��K�Bj��P}�*�J�b*(���\�]˻��C����Pm}pi;��k!(�>��W��V9ԡ`7���A�?�dUk��Km��(�I�[E␇���j�����H�������pWC��ֺK	MZ9�W��ou��P����#V;����@�ׂӆ4�f�5#�II��h�7q]�
�\N��Bl��a�EN0Ľ65솇��Sǝb���dM@!1����GWG��%�
�V���⡌z���p�TO&{�H���e�!�:�V����dc��;���p��{/�N��Q*&14��4�v�&!��jߩ6����W �lJD�U��!._�0�3g�~$�x[֖���m�
HSr�a=:'Y�N�}�.��f#��ɹ�b�W $f>i]�4RD¤��I}�y�c�-��b5�b�c�=��>��#��-�w��9�j�r�yH�`�1'2i�6l]
�dIN��N9;w��\��`ds�J���9�@����ܜ�&M�����5�2=�R�I[�T����R0���r��� T���%$�)s����V�k���B�#�#Ԍ�Ql�!3�z��s8��ޡ8��{Lm��"�C��vҝ=r
��ퟒ�>b�m3�ڇֿsfs�����O[�#�s��@�$-����x�x�:����.�"����0�0��Ɖ�"�+���������O��Q����H('[�ߘ�?�W�iCo���1k��J�{��� ��[�:1u�^R��N�3Y8�E�@#�
J���xȯ�-�љ1b�����x�՗���2d>�rz���1��=��T�s-'�Qg�3l	z7�M]��B+���ݛZ��oj)�֓.I�s.����.I�/�w���K��.���P�� �Y���A*�q��]p��,U2���aBqo{ynxA���{|F?@mae?SO�B�s��hl(�7�i����4J�*'�lx�v��}]sZ�o���MIm���|B����lM+�Z��T�9���{�6h۸]�(Ϸ#=X��Z6��Et�"M��t���xIY^��^6&~"A����q5�!�gm��]���sCn��7t՘Hϥ��cE�� e�Z9���M��&n}S�
�Qg�z�Y�/@$H���`�����;Q=�zYF)o����o�n.�Ozd{i3oP��}Eŧ�k{�Ҳ�^7��Bc��ڱ5A��~ʨ�,�>�3퐐 ֚��v+G@���P�}#"s)'��jC
RD��`h}�4�����H%�e[�W ��:gG��!-�(���K��ϓ9mE%�SL|��r;��$䉃�`�<Z�ww��Z�%�V�@�T�._��z���(cq�n��|�wˤbj�p���������2G�n�	Z�s����4E�E�:}�c��+�.�"{��A5?�
�@���=���[����	ʨ� 
`qrZ��F@�,�tZ�'�'����\�.=_���<�2|�й�'L�ߜ���#��O��7(��tj_�p�z 1@�h���>0�T{�Ӷ�)����}��ăc�9z�^5��B�(���?���֝L� ;(��t>��hQ^]��wO��n��Z4����]��}�%�h�A�����Օ�h�������v+>�N�|�>�b9:���� �M�[�|��A�PHѾR�˼�W ���O�D<��ټ��,�xN:"5)��'���?~�?퟾�Ο�
�۟�_~����;�������g�v	���?�����ұ�So��k���]�ڠG��Y!�U�8�29��lI���7��_�������%6�E����U4}�y�����~��I T      �      x������ � �      �   �  x���͊�FF��So����]�Z̓B����+�3!��S����M�o��H�G_�b�h#V���5I��QMZ5��!n��ڟ?�~�����_w����/7�.�i9���^���SYޮ���t�V�����i���rl?_7h��X�!Άg�'�b1�R1.�O}.��5��P��\ �9۰�ȱ!
�u������a�.0�at5��^=-K��^�|z~�R�;4�3�ɉ��ݤ����4ls��rR�T�^�f�ڍ�G9�7��^�" ��s%�9�����-�mI�G>-���냋�qg�Z6�0�W��!w?�M��C�S!H�3�Ξm��������)��JW�f��kl�X�ð	�J�B�������T�-�/�v5���ղ����F�m�9e{?�)�|Yg=�bc=�!f+��V,�҉Stb�Qw�9v��l'6AW�[��:�/���M5=ة�Mf����s�pem��������CA�f):�&ȅXrN7�e�<&��w���A��K��EjGt����-���q�L/)��kz�Skv��gO{�㪧7i�wC_\�Txa��n�Zxi=[��q��lF�8u�����mHH��H�at5��^���~������tl�;��g'� ��u�ި��4�*)I�|���؂~�C�%�ȻD�o�8�� �l�      �      x������ � �      �      x���ɲ$9�]�m_�{�=�<ķp�q�-$E��<�":���SXU�����)��^�B}�<K��q�3��Ξ�9C˭�C^�?�q�4���~�����}������W����������a���F{Z[���g7=�n�hw���x�܂�����"����Í>��~w+,�����_���|z[�7���$_s컜c��<���\5�hGk��#T��,��p�nYL��S̈��Q������O��������rZ�v{�lV=C��l��3��'�~g��J�ǳ����d϶�g?�2s��Zx(��?)�P��r�ҿ�)���FQ[;˨��ˎ�v+�#�Tg\�%%v����\N�s��n���~��6Yͻ��gβ�:��tg�~�%�MƳґb�~�>��xB��,a�so�e�e�T_�9�+�_&�$�����|��{c��s�>ϰS8{�a�s���f�;\-ь�Ξ#��k.c�gvh���J��l��/~BHΗ��|��]�2۸��9SA��1��۔�A���c;�
�����Hy���W�3�X�ˆ_���P�{[�w�����me�#gI��ǹ���=11��XӲ�p�����~v7|�c����^Ǒ~����q�1��?����m�Ch������Y��/�ĝ�[��V��z&E���վ��#̹��u�,6ʧ�?.$c���w�ߍ���+��5qs��r�U�1�%���k�ճ��s�� :�
�C>��-�!��C���i�b�g�)�����h�|L\h��Ν
	³�5�%ش�V���T���K����rҿ��v�6f#�d�O�l�1xo�����a��/wb��h��lm�s`F��D�������X���\�S�w9q�f/�1r
Ѧ�i��V\�#���D;줟v;~h��}�4�K��U�w'�2�(�c|�>��)�m�]�	��;e.�v��1ll��u8���F۱�K��,F�{�m�K*,������Z�,�!���'y'�B$Y�E�ĺ��Vܛ)��<]v3����Y���p��C�R~($;����!|.�)�m's0IB���@Ɗ%��%��cG�J�霾`�(�ݒ�\����ϕ�����Zl�_v�)��7�.�����V���8�K����q����JF�e8�H]��LV��c9@+OBJ��/�yJoS��@Z�4u��v��¹ںءqx2E$Ҝ��h@����쮸4&�-<F�0���e5��;;L��70��Ŭ��.4=�:�z��R�|�h1��;�/��D�19�ſ���x�����ېkF�Ѝ���͑rS��W�ɹ� �Fgo@a�PY �p��]]������(	$�R���ҿ�	-v��87@��	��l�HZ.�#�R��%*�{��͙,�@�c����r��gg�G���]δ��	 %H�u��`���ف���������(��`�T�������_.�x��ߗ�<��_��ya$��<Ɋ�U���Y�E�G gb�hY���kO���uf�W�`&7?���c9_�7*��/����;n^}9�I�C��� �N2�!cmbr����+�![��rH1�Z�n�Ez��2\�d�8���J��<��~����s���o�(v����=��aΤ�mw���c�����*;F��ׄ�:�g׎�pN y��X�8|�� �����9��+����|��A��.Kn�N�=����=��D>���.�؎X���*��9gVi�������q��r�{w�i 6�M2�ЫEp�@�D�3����+nk��H��N��C��C4B����~j*�#c}��]N�r�~�5%����R&�ϽL��p�\���0 3x�:ٲ�f,v٧�8P9 �g�����ޝMr 3aU�XP���Ľ�,��c;�ɉ��I�$�PM����z���{��TX�29�����+A�	.C^�+��C-�f�>�x�^�Ӟ�:�r��$v:�a�t�#���	�_w�!��c]��5��E��C	�L>�Mjuͺc=[�봓E��>� e)9ƽ�[��_h/���3I|��9���Cg޸J ����<��{�)����>!�`P9��De�^u#�|Ke=V��O���)��]�6f�.FS��.�Ql?w��Ru��n7poo�0u��{ �8��f�Q
I����Y�rXO��;`Ȏ&)�W������\@�s �GnD@D��e�h"Stu���
����>?���E/��)Ν�8:>������B%.�;ca��p�"�u�@�(ۺ�M�%a_Y	\V?��)�+)$�N:���d�g=�iFA���җ?�Q���S
�7Z�kH��T�ןl�qߖ��5���XX̰0ːȞ-:�M��!B� ����n������g��wup��T(���-��Ho��-ܻE�����F��^V<*�?�V9����G�(�XNT�l��VuɤO�|~�g���rޤ/��C�W��o-g�)�|�����M��ؐ��=�' _<��΍E��5��;^��'%���<�w�Jї^U��I�0(�2�ϼZ� ��&�F��܄���0̯���a�/�	��b���<�7�.���kh9Œ��\p�V�(�a�`u��Y����η|S	׾Ge�8(g�x>�����3�l$����谰Z`�J��#n�i]X:7%[N�VMq��� ��B��)*'�����z�7��K�J|m�`ωT��,﷤_��^)tC�*���� ��M_�e�����p�\ͧ�N�dO�]�Df_� �"ۮm�8L�G�)�;;(�3�����Q}"� �1���<��!���Z�*�hM��Ap#�S�6�fT�I^I����	�;/�U�����ef�T|,����� u�bJ�h��>�(.�g/1<Uim�"brX��[ ٕ�J��M!!7������z������}�\��	�僛����Ň-�!�}$�2AO�I�	���'���	o���/� ڟT�-���/�{9�Q͊������5��/���:e�8W��;@.���k5S�K�	�X#c��=���|����NR����]�Ļn�g.�7k�ׂ�	N�_�0�Z����W���
��5�G!��.��U���v�:5���ky�T�����đ1��4-��tL�xC@6�{*��W4�ݗ�<�/�(oJƳ�� ����s���`���� UUFV��m.��Bw�S���*��Ŕ'�c�i	l�jl��7�
����R��2���͆�?�\}��*˛B��.
����Fߥw�U����l���R9E�����|<�LXQe9N��.�F>��3���_FE����>�M_�/�t�2�=�P�;g�&ݚ��q=
Ѯ�O�Vk0�X�r?(��y��
E\b�y�.�M�R�����N׌(/'����`��w���i���	HL��]u�Xv�|�r���;�4!���<�7���8Jld���OxzR����:2��ηA��'\�A��1�r)���7��a9���B\�f�s�.:8�N_� ��+���QV�q�N� �8K züj[����<����������n�!gC.����E���.��k��� =樜��9?�n�a�C?�*3�!']�;��_?�S��R�p,ԃ!�}��b�\��0V:�k������*h�$N?��_j�Q7�!�[S���Uz/����^���oUjRayF����~�ͶX�TLq��sQ"���xS�N8��Q��*��i�������^�=���0��W;�* �N5�`;U��F$�O��ܨ5<�zaQ�G"��r��۳�{�Ѩ��"�} T��P�Z�9`��ƫ7CVf������zSXT�&	x���XΧ�>�#�#�)5%}p>����4��ї[f�����UO�ڢ�d�]]~*�}Xbr��rҗ��غjp��F@h��|*u�ut��ċ�f��<�'�U�v�6�@��0��V傯җ���c��gt=��a��4���!��7W-sxu�lxa�\���s�Ma��PX~B��~�Χ��5m5 F	��9~�Q����V�6��@�    ��Oq�N[!F��TX���$�/�yHo,kS?<�+I�M��Þ�HĀO?��m�ְ(+�:Ahh�c)~�4F*�P^P�q|ٝ��ƂD�m-�b��CҰP���,� aŞɭc9Ў@��D�j���i�0�X��P8N���/��.Z���tZeG�K<K2�T�WX�:q�p�ε� ��i�b��Ԗa�o����!<CH%=��)��N�N����1l\^�hhm"����1k�����G��R��SWK�\���r��u� �#g}�އF���`��	��L B��cqdЮ�Z�HY���J�!�EySxqp�@V�>��)�w��ev��N"S�z��M@hv8�� �|'T�xrvjw�Zr*� ���@��T˄�� _�w�r7�*Ij�*J�ھ|�,d��V؇/ە6�F,k���f�f����^*I�t:������6eH�uj(s��*�t#���B�����nL�4M=s� �+,��x%��0�<��p*���"�k��'�P- ���Z��i��^��G�hRA!�:�<+�On��3�^G|S(�����>r�W����Ng^������j� ?B��=��f-E��0Z���6��4�@��T�{�rx���K_Sk�~���&Ց�	��$cJ��h5�0
|0��v88h܎����7���J�������E�'n�؝��;۪F����Sn!������}=�gk���g���>	���)߄7��&�MtF��h�څ!yg��@3Y?�LZ��Xp
2V�g����,=�r�B��j��;��A��̺#F]3�?�M�{wu9;�+�����k2���v�Ƈu�9?���^���6�W0���j���*�R��X�W�K���S��e^�8R���M!��J���>����ڎ�sX�vgO{Q-R<�+�=֪A�_=gfo�Ǳn  q�m����
����O~֧���j�8SQ�O�_U���c6�O�y&p[���~ ��*�@�������	*�8g�������Ed�FC��()�8�Ȟ�rp�y��sD-��1�Â�(E�=]�
����tϘ�E�R�).4���B*8d�`q�j͇w}ƬzX���]�]�Ԧ1
{*T��䏞����^�^J�F�G/j�N��9�뽷c��G��\STL�|�3x���X9s�O��H�~8cc?<�Szw�14e�.���H�����'lL���� �r8Ў�5I�u��z}*$�����_<�)}��ڹԑ�v'�_p���-��G���7I�"σ��	C�\� �5ފ��^9)�g��7�>m��3�bxA2W�a���ԒZc>�2��JҴ�����q����~��@x��&=���KL��!��� �U��)���
�u�f*�����cşI�x���U�C!,ʻ�P�-�s9O�K�"�ژ��SF7 ��sm2X���1bo6�07����E��%����Q��QE]O�<�/ֹ��"�E]o�NR9l8��fw|4E�V�չ(R�o$������
	s���ͭ�Z��w�e~S/%��Dؓ�0��M�5	�_m�Ѫ������J��w�/1'�c���Q£����ň�*�|P��`2r��+/8NFq�>Mw��=�^�=�u�����_��#�=���<�wU���FyF������ޭ��JC:�.����|ʚ���kM&����0Xݷ�l�,�)�3�Yc%N�x�9 >Y��?����ш#9��+\��	�PB����q���Sa$���������`�٧�{��!)5m�A7k��.�6�e����a�y���,����O�U�����rҗ������T�P�W�4A�	�+���j�쭤�*�����/I���l�om�����HQ}?_��&��܄4���t=yhʊDS�USgL*�A��zd�.��`C�`�f�L���Bb��?�x��r���vj/��_����β���@�3�J��~�L>���EY*�T8��+�7��KE��9ѣC��PK[�I��х��z�0ֱ���tM�%��N������ْA�F}��ȉ���ܛ/�{9�N˞Ŋ:Dc��9��C����	�zT��KM�t��`�����Z:6o�,�)�����^J�ڝ��ԝ">F���u�'@t��/pnP��B<�+���*����������T��Rh�*c�a*���6�P *8lgCgp��(�lc�16x�C��>�Ċ�~Y�Cz�C�����+�AV��nGޅ�<� X^�^�]7pzS8���,b�O���`����җ��� ���aM�A��2�Q�`#; �}!�
B��T��9N��k�ť0��׭$�)���RSg@���c$�V�jkXH��s��QTū�0t� v�6��ő��I�n��ǁ���a}J��=��V�Кz�Nx���T<0�>Ta�����:E��f$��9���
=��0�9�ې��҂+HW/��+y��Q�kz�F�#q���t�}f��P�K�~��m֧>+�Q�����v�=���Yտ�'%�x<���1�m��Z:>mqz��!Oʟ��e;���Sa�B��g����aAo�7�	�x��U,��D��8T�p�Ik�0�Ha�+���u��_V�Ч:��L�_��)�q���Z�����:,�F��Е��.�������ә<��Y��ސ�.@��~.�Sz�����% Ku4TG�fAQ��lG�+5\��mZ`t����̛=��C���,��*�U�­�np�(DX���eZ�ZC&2GŚ��*Fud��L���w�����rʟRL.�'��"���/)rOl�g0���g:�BiI��`(����n� �Em���H��S��
u�qqK��}�Χ�!yb����6�Lρ��
�J6>!`�mv�F��L5?+���0�����|@�O�u6�]퓮=:WtS���IcW[�L -��E�i�L���y�0^��\
�1�X��'J�"�m'Oܛ|p�rec X�~�_'��סE�s=�����3`�Y6�g�J�����v�����"��o��Yʆ��S��P%�P Q��|�\Af&��f�f7�t��0�T��o
�5<"���M��Ez��6�l�L�TI���Q�Ii�(ħ��]�
�*�Zs	�Sג_/�%\Q/�
��ф��|���A�$W���NeFE�~�ӀҨC��c��J����7�"��8L~*$���5y��r�;������\�s�E,׃��3	�^�m����#��hI�6��[#xڛB��=�J��}.�SzW7�t�p����aNmL9��D����>�%����ł�$}]��tW�Y�~*�:r5�b�W�}X��U��qX�"�E�'y�Hh�p���1J"|�O��"�x@~~+��Vx������,�!}I��ԥ�g�¶��Ք{-�-��vgw4�@�=�AfXa\󎄑��
���G�Rw4_�wt�8�'-=�ڸ�.��"1�gD�� ���]�C be�x��o8�Z�W7�l|&��/����8�n`pIϬt���D�O1��#��MmjrP'����h�����Tx��e����U�w��j8#3_o�Д`�P�܉�.V�MW�t�y
������ȉח�BEM�I����J_�,�� ��._oe�l�56�k:,�s_��Ex�)�#�wk�K���P��z8s���>�/�{p]!)T��`@0����쐩%�#����ehrt��j?�ЋC��C��dZ�qV|Nʉ�u�f��������&��M3��83���W1�)�;�Y��=A��M�խ�3���g��|J5&e����J�j��;8��=o ���a*Tj�6-`YhHo&"NJa����CW��S �=n��J_�0V���N�2\�
p�|'��7���)�"<��!������գ]���P�*���e_»�2����5���V��L?LJ,~s&�D�҅��ӓ�u�vɶ��ӫ>݈{��p��ܛ/�;/�n�į�Nת�^�>V����t��.U�z{k��^d�H�I^'�T~�����G"�*}���=�Ō-�"\���    Ե#n�@�^�AqzW���r�z>�'��7��cLI�6�E��6c(��]�R$Q-#��g2}�#��B}��3" P϶ ��@:�K��7��׸�����w齜Y�RIɶ�y�8"�QZ ��k�#��<�)t�X�C�yصZ'��C����>?�ľ���җ���=	M�	����f�b6�r��9�����#U9�t)���2=������e9�9�0�x��j� �
�#�1���pv�"Q����.��G�j���tO�I/�T�x��.}-�� �;�^�=�ː%��a�[�kA=L����M�R*����Vpr��yX��y��b�,�)�+uǨ2>�J<�UG!��s�3�v���:��[��柗�A/Ļw��J���kjׅ:���]x���jҸy椽)g�-GT5�v�J�����(B���3ڭ�dCy�g�����J�\ͧ�FpJ<ݕ�4w��d��&2G��H=N9������q�����.�R���Scq��>�w�Ѹ(FQgzUnA�7�~@|<<<4�?���ABW������yg��UK��v�!}��0z���/S�.�&��v[��`�8�Q��[s��\�u�8�ޟ�Uπ��	�l%������1%�knE�l��, a8w6�l7�
���+�.�F|~�X-L����O/_��s�W��˃�a���1�8ʋT�-�6���q�zn}���ݮ��S����n@�j9�#F�e5���&q&��5��v�vV�����g���=W��F��g��i2� �>���+zG���һr�^O���ٰ�8�����-p����+��'8D�A��YS<+P�։��7�WO�K?u(^�)�Ӄn�=N�o����[%Ͼ?݊!=XPrш�����;�%T_�J��Gx(���s.[�S�R�5�s4���Y��5�����NC@����j��@�d�M"(?����?�Sz��08�ˈI�
\9�@�<��j\��)��!�S��RS�d��(�����L����m��9��;"3 ������x�h�f�ZWᕇgæ��Tײ��X]O�a���ThUA*b���rқ>�"~�wc;lL�u"9s���~���h���r��G,p��ͯ/	�(�nZ}4�}��O�m;�V�H�w"4^�њb]�� ���smM�d����r3v��ӳ��;N��a=�wL֜���̥YU��F�XF"9�\�J���2�}���I�/��<8/�cz*��P* �/���ޔF��"�r�fn@?U�Y�ub��N��z[�;&L�ER�p�>��Ε�B���&AB�x�Sz�r��ݩv�K"�Y�D�+s��������!��j��Sc�=�M�pTi�����EZb1��:����xG�K�T�P�qг�[��x8�l�Ԝ�*YTPQQ?� 4K|Nݾ)tW��i�����O�� ���tŬ�Ob��#>f�Nca�ٹ�nL�ݱ�Q\I�+�W��/e��
�;ZH����d/�<A�IP-^�Z 6��y��:�ܑ�_cEsfMrЬ1�GW*��Q�;��4/��7=}~�����U��l�B��zW�b�g��)�;Փ(S����'�P�J���8h��)T���4S��Ƙ�җi$;9��zͦ3��pu�mx�i�|lW�nF��C}�zѢ2Gd��R��}w��n�?�wv�Uz�qH$����W�E���*÷��U���آ�_�H�D���Zs�5��Y�
+'��S4�f�)�k�I\����TFᰊ#o�0��|1�[�M�B�#�Wi@Ȥz�k�T
�����;�һ�U�`[x������y]��0a��X;	�U���7���>�\���W*�&�BH�_��4��Pz�9�$��5i�������v�Üz�V".��^�]ȹKO�A�&)�%?��S�RF��a�b�����i��?ىï#���fr�me%� �8yj�ibͧ¤_�a���)��g���aO�����24���-O`ws��!ͬ�u�3�16�'�_�&j.�#��i�z|U�_V�.�SL��r� 6ZB;s�U�f>C�R
�z����	Q8�R`�}��Oe�����j�җ'���'���Џ��z�$7=���9{�6�Dv�n��`�����*�?�L��1}����e�G��8�*�A���kF����� }�0ӯ>�k�[���3�����
�u�����O�]Fim���+4��W�>��s�amχ:[�����X`]����H�0���(��BQ?bR��s9_�/)5�;�W�L��e�� ����i���Dz��E���`���p2p��\=��r��ٟ/��o�kN{%� �`���b�H�?�1�
��iꍰ�`ʶ4ӫG��n5@����UWox�ߤ7ȱ�׹����a򙢺3È��ޅ=�Ю��G�`�s;qS"�����ª��l�\&~���|�jczٓ��')[	: �b҃���`�D���Q�x]�Ѯ��}{QU��o�oG�_]UT���업��8ܛ�Ռ��]wQ�pHɩѻ������U��(z^�5v2��MsRF��"��G�u���q����|^�U�κ��z�"��:���8�Fik�	��w�)kB\�N�]a��S{U%���B&���M�M�Ro#K_T\c! ��X�ɬ�55��E�I_Ѱ� ��o�*�=�l&���� ]�띯[�7�M�
��K-�ꗯ`�S\���	��h}�
ܜVC&��qQL������_�6��U׆��QܿIo��tU��������E�⶜\� ����8*�5PUw 5It��1�\̟
�
�����7齜��x�W;�B�r��,�vB��!H\�X�E�nmXN %n�3�,�߭0����BD�)�	��f�Y@��5�O����f �� �8L�ج>���a�
�u�9�!v�)�WW�����7�}?��N���n5Hr�<��5�:���rz����Z�ƶ�h��U� ��
u�b}o��7�]�.��<ة2��m*"0�|V��m�ש,��PC��S��zu0���^�?Z���<�/���nN�/�y��e�L�sͰ�a/�Y֟��E��@��i�Y�o
5/�4G`����O�uL[[^b�]�͢�i/������y���δ��l���]�l����ݿ
��HX����)}�&�+R�8�}��d��{��ou�����+�����Lu��4�+����k���mʿIo�ד�4�_u�]�5��^à��'��tŇ߯����z��Άd��Bw%k��p�O�Ki=�@r8��!Wu��8�F��J:JW�'�[UB�L$8��I��WS�8J i_��r�Jo|�<��&�N}�˩��!�l���С���C��S,L�!�lqL���&J����,y���җi^@4]�qM3 g�64aR3�áq���l��430`�S�z��޼�?#�~�F������K�08��r&��5�5f��t>x�-��y�[�%�7��8�Q�ݖS3��Au�]�5�Z�[��.�w�Lz<J$S}��l�B/���i}�w������n��ZF�Y�߬��:��o�U�`t>�D�v~ߝ���ыs]#Ac�ڀ������,���At����a\o2�r�42�����XC0�8����uz׿Jo��2�Q��K�s�y�f��I�o�Xa��/���z����e4����aӷB��p��qD�\^޿J_ *זլR}�B�Y_�vD��iY͘���ZE��X	�0�aVYN�f��߮�����J_<�@ ��Aυ����NT&G���:�4j���|'�X�H�<��`ڐ�_��{��p���r�K����R����V�Y2�%��Wӫ���.��V �C~P3X33��I���s�Y���_�B4����F�җ7�Δ�/*�j\�%lK^_�0�������X��uM����tS�A_��TX�b��{y��җÊ�w���*U��F�8���**��fs���A#A���2j͋���d��f^���Mx���[�aD�J���N5W�$Z�����J5 �   �*�oβ ��ԧ>��1�܂���ɽ&�	� x}���F�HQ{��� �e�ԫ��[,���~d�A�ɏ~+��
s�����^��]z�D�ׄ橉�l�J��P��b�&Q5��7��T���w+.):J��
U>����}�\�Sz���B�IT0��������Y9������� H�g      �      x������ � �      �      x������ � �      �   �   x���MN�0F��)�@*�I�+��l�A��f$n� ��g�}�m��Bf^�ZZ�" ɂs��9�i�404��-�����"&�Z��������ӱ?^���'@@���ơ��GHxd�*+P$��s �tvlS>���_�.��˲�u"���%�w�7����@��̌d�mM��֖U�	J�ju�jf�϶s����.�
Σ9��ė�Ɓ#GedUn��S-�ksp��K�"[楬DA��2��'�kt�      �      x��}Woc;���:��?P�^�.�5qw�X�v��n��j9S��bٯ�͞=����zD�|(���_���9D�>X�κ�z=(��M�c�!�(�*D���Z+�x�*X�ȉ�)GX#*���_T��*%����������8���!Wxq�2dDD��,�	���ɠ��n���6ظ�S�U>j�{�
���/ʞ���S(�R��`-5�>c���#O)�B�M�#&�B��}���(w���H_�ʿ$��3T��c���u�� D�֠�_�<1�8�����@A�B�ry��]?��q�d@������l?е�;�w��5d�ݭ�1Tƙ�W���^��ǁ�N��͔�]�'Y��5Ħ�6�]��/,~q�Čf���;����r9��C�'"~@�ȧ��GA�|L�ζ�R�1��2�aw��f<���J�/����s �R ���0���8� �h�c�}��7	M�tR��~]V���Bƫ����_�?I%��@N� ģ�s�2D�F�$���	BDTI�'�e�ٴ_���2iF��k-Z��m���?a%��lى�0�B�E�w�N4,��C�׋h�}��r�ƠB���K������0L�K֧���?�4>�%��"�OXP��7E�	D�@K	@��Ji����_�P';�Yǹ�r̺�LX��>_�ś7�q��`)��5=�ɩ���q�8
�OB�!��$�a:���p�hǝ���L����f�U��U��_~�:W��,����O�qy�\WV���d���Š3�~?{���[����_�W�����E̓����.O�!v�K��v��,��R��'w����	>�D�Vq�D5�&Vݕy} :�fy���B�������?6���h}e���S�c��/x"�p&��ʼ>u�ϟx��������k���{L�?�g���'�Kؐ�G�qe^��9�����#��ϛna>{.��]��;~c�:pW�r=%�d�2�D'���i]\F�~�҅qgY�݃��_��|�D�ӅI�/�1���7��B7 w�0>�=�4��"��Zhߓ&!��Qu��� 5�eI�����]��"��c����#a���X\Y T�r^���U��u�n�1Ƽ<G�s��O�I4{Yze^�N;��J�����w�r�ݮ����/���s#�)�8���5��7��F�
a� �(EF�
U�]����2!Ko7jRl�__���l��5nwc?�J�I�d�f�(ʓPZ�؅_��ǡ���j��O�Ѫ�6�6E��I����a�):�G�DQ=��i} 8���<3x�f��e�9D����{T�w��r
�����.b/veZ��:L4R����5_ֵ"m�3�L߅���%aF��`?����W������g�{���r&*��6�ݵ0�����۰ ��$� _����#����诂�ɠ��a�߽����"Z���H����	�#vo?K�f1�nVv�r�P�����S˯@w�SAN�1�թxb���>)�ԧ@9D�����ė*Ԓc�c	�H����H/jԆr��_�`t;�9V��?�D,L�-�"�Уy�2�D��A�;�Ի_�5
I����%[�ـ�?��8E� ���$O��!��y} :����Ԫ�q ��T:�6�]w?�/~+	�u�D��&�W�����S���h6X���l9T��N�.��?|3;E�~��P�����ʴ>�N�?��bᰍV����.t�/46'�l|#�W�V�2�DG�0���"{i���N/F�������o��1�e�y} :����Ym�Ycx��wr�ɦ�ᚐR�1�Z�;��#
�E�Q�1��������x��`rj2m�)~a^]�;������3{I�s=�Q�)��4�QB$�y�ޗ_4�˛F~�w��(e�YnG�g��(�_Qj�i|i"��6��+s�@t��Lti��h������|p3���9AG�/*apR�#�2�D'�֟��[�Q���j����A�w�
��H-����O�Ï�y�����SD�I㹽Y��3e��:�o�c?�/Չo�֭�o �!�?^T\���S���s��a4��
t�F�򺺾}��;~�%����t{fN5��O�2�D����Y�W��"��gF^�~���Z��L��+��;Z�+��8tD:��iևd4۲h�	�r��9��{�H���� �I��a�xf~���q��8�hm&ӷ���3��,K�ܵ��jGHiN�	{i�͓ :}<���j�;N��4�߶}V+�Z~��~�z��fF���%g+�\ze^��:���n6~�;tQs[���2�'�O��\�So~Aj3B�Q�30��F�32Ƌ�b!��H��H�Sٸ6Y�
��A�M+o�LhAΐp{��9���Djs��أ��$��Jn���S�y>c~B$�i����g�Vv릡�Co�p?�!QvM��쌃�Km�؁�7!����y7@�
���=��Q��%���m�j�t������_�a~���cO������S�M���{^H�u�'Z��u���o\�=�E�L!�+��W`ՋZq�Pi���������'���2�2b�4�1�+��q���W���%x�����5#���,����\<aj$=�ҹ�D\�`����(�`�=�A7BR�JᆡN�ޔS�ҷܮ�R��o՗Լ�|�z��j�!h�f���=b�]�lX��A�4������|/�E�N}�A�5m�b���=����"�'5��DR��J�L�#S�"v�u1�X����s��&K��8��X�M��֛��X,ԟWwY3i�̩zmR}�Υ�$��$
��L#��GB�H�]Q�&�a�����/��nv��\��]�@أ3)9Wg�Ź4�Nu������.�y@�P(�T&N��8鰷������(�ڦ[_����yPǱ
BH����Djs�\O���H".0�J�<@�A�0F�	���f�R0��۟���E�;m�i[O�Rs��Υ6a���mΦ��u��Gm��W�D%�/�9<�)��j�w4h��/h��e�n���g���$��\�'�R�+#�|tBx$���Ғ+�9��Pa���	w�,��n�ݜ�v��X]Y�S'�y$0����\j}	V�P�k^_r����f��7L� i�u�2�V��6ݷjh�/�e��$N���#W��(�����`|)�!���z)E�C�{k���"3��i����+�TX7���~��v���'P�g�KYR)� F�����!F�
�
�#7�]D#_l�I�H��=������u�a��y�3V���9��0	�c���+S�@p�i6� �a�s�K��o��b0�o4>����+��@t�o�h�u?��^s��n9k��n?�qZ��@u\��x���F��
3��Fg�<O�H�Գ��6zN��8�J�3�()x�Ť��<,��=\�8V`�Br�N��) $c"��� �= i�"��AB$;�[�S��^��v�7qӴc�x�R���R�|B��H�AD&X?o�d8�rfI���5c53�=6�]^o���0V[��l���tr*���/�y��:	!"�A�|��ƞ$NmJ�p����վ"K���/jv��Fa�a�����R���� ths�o��)_���/���_2g7(�a�U�����/���=\�8V!!�R��\����xF^ ��#X���d���P��M��;���%;�>9v���I�p/�K@��ʙ߹ ��� r���!��5���"P����BB$�q{�En���~VJ������̎�X��N������J]� z�-�v�����a�>�$̨����)<-\4��Y��.��ܝ��ښ  5��K��Djm��50_��e�0_ *��T'�yɵ_��b�qx��Oq�����,>�6�u*�Qr[C�� ��}��G�B	E.�^J��;�t�q߽�맿L#�)�ѝ���_�<i��1�V'�Z/�C�]����t��pJ�获�̋����[�    ��p�/�;�@����R]�ɩ��.����ˈǎ�����q���	O�v��O�i��.n�To�%:��=��>���� ^p''B��w�K��fQx�1-������B��%<�Sġ�YO���G��Ky���xmޥ���7�U��3 �ң7�}l�$�WJ!(����P7�	��N��ݿ��c��j��yP��b�{�6��"����s�E�8p	C۔vLR��7O�Y��5nBN���͡8~�%љ�x�=VZwyb=aO�pA�X׹��V�S���)�����0i�G��=�p�+lE�y���&�|Ayw�n�ń�¬S
��̛�Km�l�-"b@.�.�@���524T�~Q	��T?a�m��Cu���Fwya8�'a'��J�7a�]a�M����{u	�`�0����:��W����y?y_����B��ْ;�	���';A^X]�R@bd@����q��o�F@1�"�I�(�ך+֮�Rꃔ?�U�=6/�[����A�-f��C����.-���:�m����a��̵��$��W��m&咯Df6ΰw�}w+��{Q��U���G�َ �Y�N�42�������B;캞Kz�aU��=q�5�w�6��\E�GzeZ�Nc'���骳HO�l�v5z����|�8~n�&��K�;��S���a��(����6��e!�%d4�8��":��E��JF�)6��X�����T�܏]��,�N���,�H��ڇП�Pp�(!��ԩR���¹�h\�S��k��j�ݝ��'��$'��1G>�=&��!Eܒ~�|.}nO��VI�0�u�b���%ך��W��g���o�b6�������8Eb�꙽A�wJ��?đ���K�@	�P($0p�2�	�_4w&n��o�P�v�ܘ�ڭ�v��P�՟�8���yRZ�cʕ)| :��8S�ts/3��]�|�w\��;~�s'��W����3��>���>3�:������ہ����z%�1�0��j�bC��CG��Lz��H ���O�+,�v�
8i��Z�eO�^��PJ;��.-߅��X	?uD�@�`J�wؕ| 6�d2��,���|/�t}�g^�.lǯ�<[�:^�ǶB���<��f��d�O��Zϼ�m��J�'{��9=�b�
��RO���Wf�q�v���a��q#��s�B��"��ڜ�F{�c�t=B�D�ʼ>qp�e����x���W-2�Lxsy����7��Ά�bgD|��2�DG�ܮ���re��0�1�޲ꞕ�w����M��#Ɔ�6C�X�ve^��9�|����em�л�4|}�����菟ڔ�+��@t�)��k���2�K����{��d��_	�$�9-��1�{Bh��O�
Ι�~���&J	��'"��8�	=4�i��A�Z�#>��TMv?i�iR�� F���SQ�qC)�q������#�i��ω��]7�9�Ne�4×fn4m�3��j����S~L�kq��c�|�Fhߤ\Y�S��N����f�ռ�M�����-�3~�1����+��@t�����q��O�Ձ#���,�8~i��m�B%/�;��p%pI��_��b`��E�С�.�^%���nT����G��|=<g%A�����c*6��,;�\S� *Q�ah3�L��-��m��Mz�g�#�w���N��,xΤs��C��X��Sъ��ݣ.K-�_q�"߀N|- �af�� ̒9���2y��k�9�׽�'�ݾs�иk���;)�?K��6�*BP��Q� �-;��h⮬�Q�f3�w�u����׆��)�e���#�Y��s�)#�Өq��P��؄^_Dė�$t�g�R�>�ݝ|���Kn}�|zG	5���ŉ�Z0���˴���ӏ�J�=bB���<�1�A����UI�P'�\�#\@��>��������:�w��	y��)|$<��u��\��	'�v���*�2i�6q���6���h��4�V�JiP�M�Ua�<��H�0؏|7az��ff�Qz�1�c������X��ă����%w.���`�3�<0�`��k�$����S�I�'J��NׯnZ���o� �ˀF�'ô��r*��J2�]&��հ�m�\)�Z#yht����KGӪ.v��t1��_/�������OJ���rPCXD!�\"��x>r���hn�g\�IkK�3���b�8���f�nS���4϶6X�4|rZyQ��QJW ���B�^���<p��B�%�l���Z��������|�'��o��I��VY���c�*�T+q6?�ϱ����C� �(�RX`\?AQ7��^b����lW(7�=o�O���U�U�]��`��g��\zeO2g�1�����d���2��t<zFwv7�e"�iEمN��R[3b�*��K�%p��>l'��l�DB�L�q*��;B�}oW\��[%j�wd�Ǻ��f�+�>��*NX"ODpm~g�,�"�jԋl	lD��^$]0�80I}��h@����ѫ��q}�}w�B9Պ���)����N�6��
ۄ���5DgV�B��K�ub@���ꧣe��5�b�(/l\}�����y�L��\j{�Z���+�ᑊR�*Sm�Z����JU����ܮ(�?���nv�˓R��R�o z��HK
T`{�k0��F�"�}Υq^�T�;/�[��6�a�_����&,ln�+yR"sQjmv�=��.��Z�ζ����X0؃��ڇ'�õQj������$�h�Kݵ�~�*	���{gA�-�ıɾ����qʳ�g*[����P���ln7�GU���'��.	��z-
r� �Q�q���`y�K
�P��D+��E-Xw�WZ��]A�?�ֆ�����<L�w'�+U�l�K��1�Q�f������+l3�ۙ�_ 0.e���#�2���ǜLc����
E��i����;��g��i8�㶵 UB�l�G�2ꄓ����n��g������.�#���F�'mZ���~H-�\-#�E�F�� ��.V.QQ�� B���Z�~+�[Ӽxym����s��.$#�.����'���1r��F�)���¤Rʔ>��n%}�C�x��iE���`����Tj5e"�zƠ�e���by� ��^�0�F'�t>��t�ΙI�u�`��ޗ��t�lOQ�����[r�f���GjJ8�S��0��bZ��I4�k���~h��t�&C0A�)[� ��^*`����6Y:D:$
��W���2���R�r��>gbT�c�߿����'��W�dщ��aO�aG���W��5E���-`a�����n܆��[_��ڟ 4�O�W&����C�s�u�[��ǿ���Yo��� ���+sr�zQj���%������%���3���B��F�P�pښ�j�L����f��Z���C��eb�B�F�A9�Z(Jq�
�Bn����^���A�z0k��gy�8M�:�lw�Fe�2�]����؎H:~�G0zr�wQj���ǡ/P�m��	��%G�p�RC�H�P���6�Oך�Q����U���n�P���.�2ʘbg��[�������,݄ړ.,�s ׸>�����$�5q�R�y�{�^=o$�Z�o��λ�'�D>���3��	-&��x>�m,/�U�bX�v�Ѥ��R��*�[��*�O�x�[���+�N�I?�#�Na\C���'�t5��<z_���$7X��[�_O��Vǧ�:.Jm�.��!#}P�S����`!� ���gʜ����t����<�SJ��\��[�
�CH|{LX�f�-��)�r��Mg��!ȧ��}l�w�� ����.J����	��s����.�^����r����%a_8�W�P�δw.�y�*R\At���!����=�$�iJ��O��t���U���|WQ��T-؏�	q!X7#�iZ�E�uH!qh����%��>�"���F,24��S�i�a�=�u�M247LϖIs�Ϡ�8��KPN���h7�a�<@80��=[����M�x�V6    �|d
�m�]f7�sq���?���ڂ]���s�5t�OD��Cj��\��(BX�{�S��&�E68|���I�����f�q�VL��Ȟ8悱PN��=�7	_$����F�K Eb"- �Mj�5s*~�]*�W��$��p�����]�M�G=�zb�R|۝K��`�i0^�I��<��l���Dn��d�a�ꢭ�o�pW�W|0*����yg@j�F���Ϲ4桑뻮� XJ�����BVO��LX�Lq�:��e�EW�Uq�J��K�ۗPl�bmۥjۈO�@� �wD���F~H	|����8�!�a�ޤ'>o�,_����:ݍ�Ѧ����h�r {�F�<�|Y��>�|�X�L :�`�1Dn�D�$?u��z�L>ˮ�N�8-f�B��W���^��������{�1f��'��V�r���(m"�-d�׻W�Q�<,��@��*�Y�m�>&]O�r�򞜅�cB1s��9|$<�Kx��:�e���[���w�X�L.��D-�V`d{�A���.q��p�=�E�K�j�pZ��<N��k��D��7=�s�,�N�0�gPΥ�� �G��زl���"�20F� �:�I��P��&͚�����}��/��v����1�V�O��绔�x"�\�W�a�F��`�E�D^�	�Z.��,iU<a�I��֟<���feS�����8i���tޕ��\%O��OK[jn�����<Cl�%l�+��+�����r=�UҢQ����_ׇ�z|,�A���y��^��Ƥ$X�Z9�ړ�*�v��Պ�_�[E���%�J��^S�f�#4�Ԗ��R����-�^7�cޥ8�Ĳ��q a���,�*JRGU��.��q���4��]-}o����`�]z:��,n}+��2q����$D4T��O�bN�v^��,�?�������|x���G��S�f�hc6�V�7¼�<�%f�L��)UJ�{��luTi�I��0� CΒ�/H�L�#!w��Q%��ڷ�+���_�t;IZ�v�!�a�Iũ� ��3�B��&!�m.:A8�Bp�ͮ�ƣ;�v������^���Z����e|Ǝmʅ�FFOˠ`��f��>���G�#R׎�6O�� 8�B(�I���Nބ�N&�~^�W��O+��N� �q,�B2��0�	X�3$��4�Ll+6��{�ݤW	�8�nV�i7�hy��\h�\�4/k}e�%�g\�l�>X91�+��j��y��{9w�<�R���j�[Z�
�3~Cؙm8�^��G�c���#3���h����f�����`/��}C�NO]���w�G|,(���b��$1�Q~'�&�O�,G���g�
�ڞMJ���vr�휌���b]۸���ux.��CQA��� �-1�x�J0�����S�����!�jW����-�ܛvƴ��B0����,N�6�,p���l� �X�B�m�@S� �5�"�|�Tgݩ��5��nc>�x�8�1˱��gJQ6ў۷r���O� p2[����l�P#�:`�K��ԍ*�ȚLW�l����׷�x���{���]A�|��׻/K� V�!��g�o[	2�CėT)��Z�W�	3�>Z����jg��.7�gޅm*w�m�,�����+�ᑚ���Ӥ^�زX/�ZE�[{�����5�����:1Z��]���*�.#(l�S�H!X��x��$�ab����.T��ԣ]*|-�ʝ�&����˺ �[Ϙ��?�h�����+k䑚�N)|ތ���
f"�����;Ɏ���9���4���A���a��.�fG�J�Km�֡�K�}I5���~N��?�<7�.�>��w��˺���i�f(�}u9Ȏ�W��#5����_^�9�*��lHS�2�3��6�RO�%O���=r�\W�A�o�l0���-Qh��_C�xO��yIէ��r1���[i�[���X�ta�Y4K�݉�5��E_���F�)����}�E��v�5�o��\��`�� 5g������>r!jg9r��e�Q�d��k��_w</r\j�o6��W����<
�=��D����D %p��� "�%]�;��E�7��MPo�.�Vw���/k[�J}�r��4~z���&��=�}#M]ex_��I;�͝�Vo��nƌ���.���9��7#FZ �PS�N���^�%!E�y�~�$F@+
�X�q����=©Upk�թן_�َ���~��.� �#[�N�9{8��-m� p!R�#�9/,0s���I�Hwޟ������?�D�|�>(�8�$�m�ϴr.���O����/=Q�MG�A�GI{?��JX���Ԥ�ZG�j�z�tG�q<X���l��s�s.��N��X��u� �#rCE��ʒZ0�6s�^�uw�n8iV&Er;SP��aׯs�ϵ�tq����c Ƿ�qې;R�(C!U�Χ,1�,j�a�k�F�4�������]���X��g[�\zm�`g�<���g+Tz7?����wm{���j��)�si���)ʕA����=��GƗ�<���K�jq>��֋s=(��[u(���2u��1�w|�>�Թ��g	R�)󕱽�=P|I�!�n=iᆡΰ����^�|>4�No���]���z Fi�/h�Tj-�%�s����5�5�L_���I��!�9��h�-.J-�����h\i'-[�a	h��f{�{��=�O�c��1��P4"��$������Q�%��f�_m���I��f��_P7i�������U�ț��d�96jW��脳���Q�-��tT��V����O���9^��G����#�޽��}�޻�q�����x�8~���Q�fMۻ?�(F[�C�4�"��N���
6��ԡLz�o�S�Fj��h�ƪu(����m�?��E�U(�W&�𴳝���2��$���ln�H1��nܶ����Si�ƕ�!d����{���e��������&�C2��t8�b��z����es��NMs���tQw`��<$l dire`K	1����>�F��N���v���x{K7B��O+��}%M(zp_����<�4�������}�(.����P�Sz)����")��6<�!��7�� v:1�����m&�L�tE�73�UnO�1c��d(�>�Q�G������j����m�]Tn?�?6~��Ady��Qj�kO�6�Җ�b�W�=*1O*"	�=��#���,����שh�\�9``$���b"m�
��ʷ�[(�щO�ȸL��W�6�T�L���cM�w(fN��-J�ɺ��X�����y����<�Y��O�ɶX;�B�����w���L�?�3c_����+���N��C`T*���i
*��k�SUY��Q��Z�R�S��P"�0��ZD u���f>G��,`�8c���ぇuq0�Κ�n>i�ϟ��C�G4!��N؇Wx�dʘ0$�:J����q�]��%�o���:֯�4�WR�����'ؖc�<�=���ô�$v��}��m*�(���\�ߵ�����=sR����l�O�\�ˏ�g�>�W(�������v^Z滷�*�~�}D��L�H�Xsb��~��ںy��(�β3o��a�y/��Z��A�n�� ���1Ƌ�k�@xʩ��uiJ�Zy��>��&�;� 8�����ۋ�����Đ Q���}�l��|����&��X;R�>k�V�0J���gg����Y�q��;Is����Ԧ��a�ښ���O\����(�@1�B1��R���v��G���Q4�7���K��ZvM�l�����Si���	Y�H<l_�� �ÿ��\���I�;�N>%��Bf��ױ�(��f��]Z��}؇W���,��R�^!�p�����Jpb�}�4!5��8h<���4믊���Z����~��>2����X�"��E� K�ٟ¤OyU����a�]l7�Ҿ�ꫤ$O�/i]bY��Z���Wm^��z7G�?��WH�`��8�+���.�Pg��aj5�7���,�~e������=�O5e�$XE�gvW��tG	s���}    �Yͥ���p6��W-�4K#�<|FO�s�$�2����N�a*�W�ܚ��Ez���VX�&p N�6d�|{�K8R��R�P}�*�~�Př�;���P$�b�������Jd�T�u'���D8/uW�}]F�d��;���G}wW�3c�A�C9�ګ=�)�]D�Ю��
 	���k��NK�t��6o�a~Q}���Xv���um�`���ƪN���i�M�XK��ЎIj{�����hz���D	��$u��uůY�������Cp��;ڶ��>�`���v��>��)�M��e�V9�^�e'K)�rQu6��i���ɓ2n���+k�qڣ�Ŵ��qqfZ�i�ko�ʠ�=��/ �2{J�.H�L�#�gn�t���ر�H�+lVx�w��:`��IA,e�x'R{NH�mE���-�`>B� �VģB%=ܣؙ�j���ow'Տj+��g�=&�6�M�	9}/�ؒ&lV�����9?aR{Ls0�>h%�gt"�
`�Y#��d0'���\����'_�z.=����O� $�R�.l���Jw�c�@�A���כ.���[��~u�������t���7=��U����9>�qe�<R{�A�:f�ϛ���`/~��}�W{����g[տR�6$f�W��#�G��ꥮ�/ݬ��A�e��t�������F�~��푸Q��9�9��E��8�o��&�3��0�٬J���
(�3�ؾ=��]���E�[o�����o]�����Hm�#K2����y�������m���/�2[�4Xޞ�rԅ��&�9������R[�9'n�BF|�:�tJ��I�����S��̡ʆ=?�q����B7�7s���`�K\�ܨPN�ָ�,/ak^��S�3dqŁ�'�T	�_(0�A��Ey��&:��6*ͬϷ�����%�����Dj^؞ FC�A��W�.,.{��M
�8���lQ
�R^�)q;�_�]P;���&����˖$1��(۳\�6�O�cO��GI;R����;����[i�+oŕ�o7�z�;�I��V�N�1��7|�O�N-�^M��~�
��a�_����.�e
k}�ҁ$�{;^����t�9�L.zi���D�-�\X�=\��u�d������G�q�>�MQF�ٺ��,�E�������-�^��s���ut��W����3߿g_ˋ�z�ѨQ��V/������K��Y�si\�L@|�L+����{����F��Gό;���Ps�[��Ƕ�'����h��`m�� ntf�ϥ��Vkj_�B�R�L"C�)�K}�.I�'N�p֤����/�ZP����sC�]����=�3��(��{����=@���ȍ�v������	�\)�΂��d�f2o�M�?�������X�5OXJ�����vF��D�m��hh��}�QB��%�$���=V���$���g�6�;�L;���(ج�P�/����Xa����L!�c��|�� �*`�S/i�ʈ�re7?n�|�bZ�[�I�\Π=*��6�X)��ڄP���抧����;���M��h�b}Y��M���l��m�'�>!��	��|U�?��Z���yȶ+EƅA��Rc�vK����|q��ٴn,s��/�C����ʸ�f��X�
gys �;�_�y���T'L�Ǔ�K:}o��7 �"�B@���J�L��Sy)J���k���x�U&�K�����Ԇ���T�`��?�!7"Ƿ'���#T�(i�0e������ƫy���Ͳ/�r=C���\|k��3�~.����!Sds���P�Q���L���U��.�Ͼ����|3_���ڸ_7�q���!ǌ7Fŏ��;W8~D�]y1>�^/�9m�[/�z��!ͯ�fW���՞�lX]���o���`��=���iO� ��0��g��nX���f�-�?�����j�硨������q���F�1�o?{tYsG��ś{z�����.�,�OJ�l�E�;�2T�g����h�ޚ2��!�i [��Iz�Ɖ���Я�,첍���ޜ�c��6�
���$>u��R��sG�ER������.˾���[���H㪺���(��+�6�V>�1@0�	��%5�9�ѻ�E/���]eN+�kK�7(�`Vϡ�J�,l�\/��2��4Ұ��F������e�f�݀����dn�o��C�m�|Z�K�5uil%�^`�6��<��#�XX�@e�B�����M��9e/��,e>�b�����E��R����G�[{�&�8r}M\���QNo"��#5(zٗ�gI�j�^�#�3($�O8���H��cJ��Y|�}r�* �$s���$Κ��A�]:�"�:�),K�7�N���
?6������T
��
�p۾zئ6!�?��%*��ʔkgS��ZdKLTo�i^%ûH������f.X�Si�����2
#_�^����|�B�\L-Il���V��r�=+l�K���Z��{���A�D�T�\�� \�>||�}��Jh��|Xa.M|�̱�G�9���'�������]Q��8���열���'[�Xnv%�`d. .)��z.�+�����;�P��<~�|	�'����5t�����~,��xI7�`�	����H�(�|2X+I�g��Z|�lv��ν�M!������.4;����s�ƾ�M����y����R���}�N�Q��{�׻{΅�=F�Ҝ�K�o<��f�����0X�k�m%�z������NO�H���/�mޑ<V�^Y7�Ԟpj����l6���T�k������? �ﾲ�Yzeb	O:�I��~�췆�V�|�֭޽��4��1��w"�G`����.��f�"	���0�-&�\�:��x8_���#�{�:�v��#�?����3(�V�C<+$P��^^9%}�Y���a�%k}u]�ÏNJ��6�N �tK�$�$���\�K��k ��>
Y��HR(��u�!���B4;nџ䛓u�.M�v�^B�ș�X�&@m����KI���+ ��>�I�DT���E~�bh*��/r�B)�����fo�`������`��6�͞�r�yL��2��'��~N�w�������+Q��k�(��lPa��#�+���{J'�S���+�^���񼝏��]���bu�G�e����="!J�}�Fʳ�pE� VH3���\5N
E8��F[��)�a��P�׏��e�,e��Un�K�L�#�1'�R��1�����ͱ�sC�u`۷���(cN��&�o'=����c2w�J�vKU��[vD�[���6����� %�g�O��>����튱z�E��w��G�Kv��:s�����y����+tk�� ���r�����N'�����1��x�e��}&��F���GZD�D^>�^x)��GPX�_����K�o @��E��\=iέ���>��Nu�����ښ�t:Ϧ_�H? h)��K%�����}$<��po>m>��������� 9��Ҳy��fG�reb	�:3<X�
�uZ�BT(Ov������@�'��R �8�X���>��E.;)�?g��*�>��L'=(� / ���K����'2�L�#�qg��q�%����v������' �9��e����ǾAW&����.�_yW�F�5+����6��� ��b����ۺ2���'�����ʭ�`�Zlw�&[ԛo�_<� �ȥ��SxeZ	N9�:Y��d�nvg>��SI�;:�����1�\֝��-KC�5Q�zQ�}ϱ�"y�S��RynR���|�h:klʅ�{w��7���ƃe_�e�E��6�wٕI|$<d�T-�[���>++6	$�b�� �m��Wy�z��L��i�Z����N&7�}n�-��]�q�R&�����,H"�ww�x!*�
j�RlB�Įm�Q~�,�:i��&N���zS��L�m�m�� i-�i����Jq��
��*yLտ2���ǜit�k��d��$�ܪ�˶�wf���������@*�G�    �:�j��.��ӳa4�����-�Hx�ڇܭ�X?��1�c�fb�&�1'�ʺy<a�gZ�s��r�F��-w��K��d��:��ɔ
��L��j�>�h��K]��5Ҍ��;k������(�ODc}<*�_X��)��/���H�$_�E�m^����' ��z������+��Hx�����#�3��Q��%ϯ�\�����PVl���m���T���>�v"�U��q�P��G����n'�|^���^�I������>�q��l���[�ѰV+4z�J���� ��e)�@41=��2��g`�<Wdz��%3�P�|��^@\v{��)}d�W������l[�s�W�:��f�i�ޚ��n���;�#:茉�_a��q������E*�@W?�f׾߰��1'Op^Dwe�<u^_��]8�����3�yaw��I<~� 2��X*�5��- �$r=�"��������#m_���s��p�\�(��D��н��{���խw���c�Е)|$8��ϯ�d��Ja۞�(C����� ��d����l�ܱϕi}$<�ԧ�5iԶ/����P�a>S�{�}�.���׾�������	��&���Ģ����E����&���������j��*
�J�z���=�k��rd��ue	O9J�W�<������Y��w����X�*�2��D���J�N�p��Y>�~����M��!�G��d���فZ��H� �Pj�?�n"`Li�%c���P�����j��T�7N���$��^R�U8`L���֕9|<�j�>w���K��ggSSݭ���� �����/a�8W�qeb	�8��Z�,�����a�������7 uy�P�c6�Y}$6�|�VYonJ�zQ7s�K�P��������w�1��N�H�����1�c���e�P��D^�L�AR(�)4T4���Wv]B�jf|0�����nA��K�^ٜ�Ⱦ�8M�[�7�|�^����J����c�>�nMY]��(�	[\Ώ����G�L�^�ס�����fu���m�_h/`�%b��>Qʾs�����C�Yl�j'��G��k����pB.�-�"hV��\��G��N��6���z�ά�يm��{=�o �]��*���k\��G�3�׼�����IT-{/ĝ�}��@��N�[M4����2��G���x��^�d�(���j��Ie:����xc�����Q�W����������|�*�7�m��v�+/��
�K[O�E�@��E�W<�#�G�g��X���1j��Ce��l��7�;Q��x�z�ʲy$<��������N+
g�V��^x� ���_ ��5F�&(�(Ò�P�H����� i�'��!�zyq_��w�Zc}/,�&(߃� �R�F�Wj�6�X�re	�;ak=�L�<��A^�vY>�s���γ
K|�+���}$<�?��g�߻~4m�
[Q�U��
 P�%��;�Ǥ�+��Hp��ҡI�go�ԡ�/���U���=����2[$�c�W&����S�af���jUY���jW����� 4���e��{eZ	O;��2��с5�ә���z�t�K��@p*.p��TJI�ms�L�#�ǯO�r|����z�h�_��6���.>�e�Õy} :
�c6�}},֣�>�_�������'|��<����C�w,��2���G�v��ȿMg}w:�M��F'�{���'��R�ra�O��L�#�Q������׎�<Ұ�y��`�s����A�9�W���;X��i-w1;���SU$��bU7N��>Y�ٴ1�	�+��sƟ�S�L<{i�$�uL-b������w鑐��/ ����r_�a���uk��\+�<�T�f�,�:������ >�K�F)V��~��I:J��-߀�����Nyu���ͯ�g�á�-���+���j��[���n��V�f5��Op���s�����s.��r�5�'�y;I��`ְe�U�V1O�M�}�	�ԧg�9��/����kO����h-k�=Z��1���V�uؕ�	���<���H�]q3|?�s��T)Aiז�A�o_W�E!W\��i�ӵRB�k_�F��k���ff@7Ms��V`؇�!��,�8dֺs���ν�~S��ӽ�ÂP/�)�n���bgR���=��m�<s^��5�[U��`��(�� w�	H�4X��@ПMe_a����Ҟ5۵�K˗~$��r���ڼ@u���A�exM��]����\yt���}����k��5�'����f��zF'���q�T��i�	EF�;k�eI!��G�n���M(�~â܎���L"������yTצ���5@:(LwZ@�T:KA��~��\����G��^��J=�창c�f�����6q���Հnr�aЮF�3��3GUW��d|�	����
0B�d�Rհp��a�����sg�W��dl�6�&RB*�����"`Q��vo|��d?~��SSX˄E��X���%L�2o��	j��E�v�Yb��56{r�d�a3�LM|r��{3��yu��IC�@�'��e�O�6$����|������~���<g�:�e���y`7&���\9���0k��3{��ߦ���/ �i?�F)$�sB�`M'��,2�I;��[��eSL����4?A�'oD�-�t��{�&���ir�m�h�Y9_���|^\THg�[?����3�Ue�x� �1i��Y�lXo�����Џ�ϷG,,�@Ww�c���]��I㤠����-�Cǯ�T���B�4�2?���uiťw;0-L�w�\o�j!=�b�}�&��cȹ��D?E��Q�t	wl��^�ݘ4N�X�FqkZBJ����� ا����{ V������U�u���G���l����O �iݔޖ�C���yR4M
�fh���v�XGw��vN�/,�v|̈́���]v�zV���ڣ�Oh�&�];}�<Pbv^D㷰�� ��C_�D��1'@�&���S�;���������v#a�>O���y��>�{�¤mb��8-Ƴ�P���I/zi���Iy�z������	�j���I�$�8��6��6�F�ƫ�H�k'�x�����RgG��k�6�5�|�����TXj�d+��m}"�6�&-ܻ
�&����Ғ�����}�o�K��6��/����뎔�K������aS"e����c֋���f���To�{(�i��F�w�� ��4N	�KxO�˓^>ycDD�KA��{���A�F��L7`Z�4N�c4#�\b���l�}h����q����Q��8�3
���)��Z��T����8J�b���7 ��S�7J�b�uik�8�wk�,ǚ����Nn��}~W�̏��������	'��Ԁia�8%�^���v�/�Wr�T76o��n_���s�-\�{,/�`7&�S�QwR��mh����`����9p� \~�{^�(�g��5�'!ط�+�`ؔG;��x"D��W����*���|^�L��� ���\O7��dcѽd�!	k�_��P6��1B��D���c�RSr�e������I4�\��<���S4�Q݅���k�8�=l9MY�"�mJ�Jv�8���`����OybΨ�2	��$��ia�81H�T�\ΓD��`��R�Xi�?i����s�m0"�+u`7&���t2�p���s/y�G�8���{PH>�{�٦�z�� ��4NZ�ݭ�K[�L��ms��N��1_�'?�)��#��4�h��0i��f&MڼΫ��j/Y/u9%�n{_���;�A>�lL�&�|zo�V1�.\R��:^E�ۦ@>y���h�z>
�,W����<����/e��C���%���Y����I�eR�r"�¤mr��&�GV�]��a<[�g;Y��&ן�G���ӮGܣ.��~�fc�6�}9+��ߛ%��G����|>����z4@�&�����\jl��q��:����I�A{z�1]���\(`Z4N���&���N�Ž:�J*�X    �n� ԧn�� ���{�J�ۯ�%���l/2�f,��{��e���5���+/0-�'��Y+:��r�7���t~[]K���Q�J�t t�[�0*��/��M�D^Q?+�TV�^�ܴ;uZ��rtT���S`�j�9�=�Ң��<��&(��J���� �,�vb޲�y׬l���42����u��A��Z�fcre� ��g��Yg؅��5Ն�����Y���~���F�s�pL�\M�)��,R�B=�:�a�/��Z�� ���%�@0�^=� ��S���V1��d欔��ƢZ텍~�>��� Խ�&�I<��Z�JlsN�I�CX������S�o�
.� v�`M'�ʹ�-���t����#Y�ۃ�xn���8x9{��	~Ur2bd�ER��Y7mFt�,�h8	4��l��Hщh�Ɨ�,,��\bs�Գ�ڑ��X�q��$��$��b�\o֯Y�G;v�=MM�OW�'"�H��bL���3�̦���y�4K�r6����ħ�u߮!ݳх�I<n������������x�އ���@|
GS�u��t�N� ����`r�oR��
s׽�s�\4�k���˷&�F9{�
�I:�	�SU��wCu���':��� A�WÔ=�� ��ē Y�%k�p'�(�[�UɐG�o �qpG�!�kO�Va^IέTf�M�m4G��*����b�z�K�� �<���Ǣt\�G}ͮx�^�2�^,l����g轠��U�(��Rzo��j���Q��S��l�lEo0��&V�ܓ ���&#�m�X�c�=���I:Ա��r��8�b�
��klFy?�O(�/�V�t+H�����^*u�XM�1����5�?u+�����$������Y�G��s?��W�A7��m�J�� ��gN��-�����I
9��:$���K����|��W�/ �߅$�Q�ׁ��޳� ���s����>-����v�da�h�0���M�Z��}h��CL�q<Ou�a�Ԇ�[�EGh`�c����H��W	��
�Y�����F^'�������X�${S�r_��V���� ��S �vbTM5:4��ɶ����^|mA�b�}p�Pq���A<���8ͬ�}����JL���
3;�3&��ŀt�\ʼ��5���>>>ٓ��R[�D��È]�h4�u#u:9sy4��p2Zj(�����_@!}v�����"G�<#>D\��;(�"g�Ak�&Ιe,�_Q�\�v{���N��hOO��hQ��T�qp����A�
�㑍]P)�_���@痎s�#]H���RD��� ���Z]8�R|2�'�BQ���c�(z]�>��Ǟ\���r�:Z!�~L���`*�(;�Wg�Z���t9V(]�v����Z2
�u�ę5ή騞8�N��m�x$�̸������A���n�C*B^��yT�)�
�dh�m�t3_��g��ƣ�!Ń�+�;��lE��V3�W�h�SMM���]隹�����Q��2 �8$�C����5��%���d#ǌ��+
Fc2���P$@i���yn�X��|X�c��������T����$��Zy��=��9ѬE�{�z�?_Ǹ �m'� �MSΎ�5����2�Ʈ^(��u��I������Y�B����W/Lɫ��Q��mD?��@N�t����Bh�G��7��k5A�w�`#��!8����S�Zp�|����׺B>�0���B������nJ&0~.(vcR{��Ψ�Zf/�V͛U����U������ϭ� {6�p�:G� v+��r�[<�6t��Vv���� !ȏ���LWFX=���5�GA7��d+x-u���Yd��km !+?q�\���j�\M�1��sy�z�N���)���=����%��OGݖr*BF޳� �����X,�N��*'��'v���k �Y��x�}3'o�[wkO �Z|���=������?>�CM�o D~[8����Et��N>@�&�$���6���M����rz�����������u�*ή�0�^9� ���S�y�_�Y�k��4agQu�k3�o �џ��#��xB��9N��m��t������&�PIbRc9b6%�QJ����heu�]c�u���}K^kx�R��1�T�ygB4���2��'�DA���JnW�������mqʽ�g�9��{��Y��0pQ�lV�yiz�΋;��#�<������.#�	OU;V�ݾx~&C�<�xeӞP?����|0��B��Q^���s/�^d���/�YG\�D��ŀ��	.�~�m��i��Kc�����Ͻ�҆\��U��Z��
z�g@�E�!n�_nX�tE��b�hX��n\�ZZ~fUR���I(#��g��Yori! v�l�VXV�־��O��_v} ��O��s�b�ԫ� X�x��ĉw�璬�j��x����ו��J?��[=�����^���E���B8q��*#~Y[�B�2<5��Zk�@1�ߴ�> X�x�j��<a�o�D���OV����Z ���1�Ͻ���2N�ch!g���!KA,dpL���(ܖ���>7�|�H�N����_F�>���d�!�GA�V����/Ɉ=ᬣ6��;+����&��f6��`1Q�7����=� ���e�Xkw�|,���A����x��Q6��U��h4��
��4(-��F^ �5����+�ǧg^�� ���C@���Y7��|n��z�Ef��%����u����"��F�Gu||2��ȶ��֌��B�m9E��9����R���"��E��9��O��ݿ6�~E!:4��N�J��W�: �9���pd1��;2:~����#AG�c�#J	8��S��c*[��|B���ec,)��Т�	����������J�����x�����Q�¸����5��M���Z�!u�!v,	$�?넂ζ��t�qt�twy�^��5����>�	8�Ƴ���Q�tiB�gW8}����Ё��a8t���tQ�-h�(�#u�WR�k�X\�K�ض<J�2��u���(ߣB4���x5>T��y|o[�.ܞ�K(���[�c(�����G�B0�C��Fc�R������>OtO�E�JV�0������%��eٿfټ����Ξ�|{>�:(#�ߔ�5 r�oA&�NF��\'12i�+�Cm6�P�O:�M�����!N+�Ӕs���:8�	���c9�Qιi-9�C��،��N��ns�n~Y����%�)�k��W��	�8�5��O�>��4&)+�?n����}ne�` 99{�5؎�s~�MS���9WG���Qpwn�iu>a7z���j��0N���H`&��9����⸦�z�*'6��&��X�Z��j7^���w�������Yv�f� �v���N��Y\��1�ıp�sA8u��HZ�@:�|2��ef���t�4��c���J)��8��W(�ok�i_^������O0�|������/�e�~.���_��yxT���T���\����d_o�4_�5ﰳ�wC��臼���v�o�g�]C�Ƥ�8Oئ�<��D�[�:�5��M;���!�ݶ��3�.W>Z�I��Wc8*ʣB�U%����z|��|���n��x���[@���Ƥ�(,����rN �&��#e���m{ӏ�o3O���/r`7&�'�iv����V�ۡS=��#ޏ~�U�O��Ι�>+lX�I�)0��G���8Kz	��n�!��^�C|;�$7`����Ơ�8�ѽ~��ZURt�ʡzb�C��h����'ݾ��q]ͺ3/�jj�#p��^�ֹe"-��ˠ5:�B��?���M{u�d�Ρ�{�`7&��������%_�A����i`Z	��K?β���0�q}�1��SvcR{�·x�f������&����GA���.����9K����Ƥ�(/�i�������:
f���    �Pos��C������Ƥ��6bV����7��RNZ�J/$ޗ~U�mA�Nu�v�NoO����`M�e���rY�+X���0��o���H����X�#��+� �1�=pIM8w$[��%��
g��ޏ~0U�ӱm�%���؍I�I���w���wĭ��d��Px��#���Bt��:�Xy�h��Ԟ�@N���:^Pv���-|rM����@r����B��D�#�Ի��I<N��^6�f�>�8eKx��}� H�K�vF�s��O|��ܫV X�xZ.�`�G�P��>3mX��ߍ�7��P�i��t�<��z���5�G )g΃��Z�\)9M&��8���q���I��s�um"�k� �����x(������g�sJl���ϲ/�O({Su_2���=s��j����)��-�����j���
�R��sB���>�RA�B/�8@�&�]�ގVig���h&*�G�m��+���	L�a�9.���� X�x����v�7�N��m�s�P��`�m�tK0]��p/� X��u�*�X�:W��ԋ�H�*��+��|W��'�,:�+�7jH�^���V�u��ɴ]Z6����8t��S��҂�HtMW򯂊�}>:b��z�'��y`��.$��J�<���&ƛ{&��� ���c~
�7N��LF���{�0-f?"�4��U���Z��;�����^]�t^���pD�w��o���Q�'��|�:��)�ݴ��P�ޏv�o��r�]"�'����A˔Lg��l�ƣEّ�/lo����~��|t>�5N��P�XM�!p�]��I�^k^s�<��v ���̿�9�I�{���ӽg�\M�aЖ�)�cs����Z�va���1Go��n����g��5�G@�k�y7)O��C�0�=fK����޴G���$B��^�%@�&�wz;�4a69J�$��T�J*���u�@!f�XЩ5P�w	�ț{�5�� o5�t�4��l�^oc��_�-�� �=O�3�-r��Ez��>�$��Z<�>\�vn]P����*����~��6�F�*��$� �]Ƈ~�P,�a�G���>��~oZ���{��t��j�N�)�����V��=[$��6̋�� �P�6���C��8�*/@�&�@��:��/Lz��i�8�⡶� �Rʏ��Q��w�
^��r5H����j_�����Ϫ?�geÙ���+,����S��T%%^�3@�&���^�z�Z�V:�G��h�q���lkď�t&7~���$�ɾ���=+X���Z-Ivf�� �2>z�M:'=g����k��q5Q��NNV�X�םx}�%����/�X�ׇ!)�t�^�`M�QА��l�&k�ʯ��ҩ5�!Nz�$"��8�^;�s�W�?o�k���5YM�Rfֲ��a���n��o �RF��~����-f^�f�`M�qp{L`�=�k��2���<�Ü�p�\�:x��DE��GkO u����=�)����b���T:� �g@s���{�����1@�&�$h���ʜZ�r.qmFK�e�N{? ���:C��AE �Ͼ��5���Y����l�.�jnf_��z�2�tc�����"�1]ǥq�� ���9:���3V���������9���/��F����zN?�$�)�F�1v�(� �s�tK�C��? ��M=�/5��`��ץ��I:қ��ZH�Z��bQXo���PS��9���ʴ��r6#wO�I:��X;��<n����a<Ʉ��������O'��&��n�3]"@�&�(P,ې5Z�F��o�+��cw�(����)}��D�@����I<���������A�u�S���� �Y�n�����б\��� X�xd���-��tV�����`��3��B�R��{OkO��!���7g�b[��d�8��:��X"���}m�S��«� X�x�v��a>���I1kœ�|��1�_ ���~<��Ű�Ρ�r�$���5.0ʯ�c5_Z��P����7�n�a�'���{=6�D�v<4G��= ���ܡ�P����c�#�^F���jo�$��!�,仨���Fu�=�2�K� #�?̺Q
�A�|� X�x4�é���r�-;�a�'�_�������ӕy!��+	 W�tL�]�0ȏ��8V�;y(�	5�~ z���_@u�o�2E���$�jkU����6�����%�J�	@�o��ܾ�2⬪�F1�5��A&��i��5+���9kje� ��W�5U�)���{a� ����z.�ҚN�l�V��}��}��gy�� ��B�r5I'A׺�(ǰ�I�O[�Zvq��� pD����7L�)��ּr5��@�2�N���T?�̽���(ī� Is=���:Y�"y� W��� hĘ�Yf����i79�\2D����/��0$t�S'��rι^~q�XM�!PX�6	�[�˩��pz�S�q�[� ���~r��Ω�z�r5��A����M������fW�����+ �W:��3�TQ�`�`M�Q����N��M}pݮ�[tw�=��~nɾ�����䰈���1�M����|���`|*O�h]]71	�%!�~�z3�x�xlz4�nL�Ip���e�d�]wJ��m[���2&ɛq� ��ȩ�P}�$��scR�ǯ��v��c�����=�� )_>��Q�^"�Q�73k�8[+�X��fw�Lc��Ze��n�[� ��g:
u6VD�N�^$�$��t<��ڭrt�ӭ�V!JϽ P� �x�o�����3ϟ�I<��!;����}q!�ԃ�B�}P��cR_Jcʟ��k���R����ڹ6J�����<���`�#��Î��/�)$»��I<
��y�:���.�$V���Q�4� ��q:�.D�X'�8�G���c W.w3�dZ74�v�:چ��zP�W�X|U�Q:˛zr5Iǁ�lp�l��̪�sD�1Jy?�/!���4��R���{�\M�	��b����a��j�8��-�? ʷ��-���e��;��$��-ϧ���j����Mb�?��� B��ץ�D�7mG���L9ӛ�vt:������`WǷ�V9����T��n)*G��C�~��o�[1��"�ъ�l7�G����ex��SW�,���1���o.�W������� X�x��0cY���H.[l,�Z5�7����%s�@ǣ�y	r5IG ��S��.?�N���ٍW�!
�� ��ǉg�(�6�94b5IG����D>(Rp؜���v(��K�@!���WAB�M�* V�tt��W�Nu�*�r��]'Ü~}?S�4G񬰀��l��r5��A]fRt��4.�n��$*ֽ������ݢĳD��$��r�5�'��Ӊ.��m���V�*.}^
�� �/?\�!�e���o8@�&�$H��������!1l6j+��7H䯘.u� }���%p�\M�)�X�
�������gYsqs�����6գX�<�w���Um�\�1�j�G�]sѬf����_ϡ�R�MyD_=`�I�R6@�&�h���U�ӫ1mNʵ��Z�����oד:ĉ��pG��w��5����M���?=5[�����s�/ B��R'	�KOA�lv X�xT+��5���E� ��ΣW�P����i�����}Qg	:ۜW��`M�Q�.���L���ݍ5��Y/����a�f��}ɭ�aC%���ς5����~%��n��oʧr�N*��o ��N��O4�B�� W�t�&�8͔���6V܊㙮�!�� 0Eߦ�.��խݝ�����I<f�\�k7.,������Q���9q���*s#�^`�\M�I���	�hj�q�*4������~!|�j�[C�wٳ=V�\M�)p�6�k��K�ʅV2��i�6H���.���-_J�m��5��!(f��U�S�.�C�!�j*�7�B���    6��ƝP,=� ���C�r�$-�֝驂��d��:Ds� ΅�%��=ݾ��gk� ���À�hzۢ�ti����u��	q�����s~�2}/Y�9tޛ� ���# ?Y�=<*�M�Z\,E/���� c����-�����9���5�GA�?]��t��g�5)��M��~ �?�+����0.(y>��(X�x���J���IyQ�/׽�&��P� �����^�G_�Kk������<[g҅I��A�\�j�}8���C"��\� �����ߒ�4�unt�j\�����������2�_6p��p-7@�&#Οx�o����v|�����O��ow'�軮�#�p�v�ӉJ�1�V}w���ψ�8���3j #�ـ������q	V�2kO��DB��qjy��b��ߺ �@�������X������?LÁX��Ҿs�ߙ� D�Y�����s����i�@���ZT&��c}L��jҋ��Y���S�r�T���`��@�0g�;���$Z����s͏���6���l�R�N ��|{e�ݺ��t�t��g�6�����J�V*q_�ʓsA�B�B1?Nނ��L��%�9��x��$G˭ǭ�[��i�{8��K� ��I��%�.��}r5IG@��.�lU���R-�3K\硔�����S��e�+�?@�&�(�+��d�-_��T�CB$��|���t[����k��^� ���c@���Z�X�~f�Lݎ^/"���7 F��LA�@<�w�ɰ�^��$�JO�Pw����0��+;NB�+~���~<�KR�WU�=��I<�v��n:P�F+w_Y�^+�q� pߴGui@*"�9����I<	����7�$���*6Y/(�|����)�'T�˔�<{�� ���S@�'����ֲ�u��jZ�FCi�@P_���;�n�Ľ� �ē׹��T�G����I:7LdCi�@r.�xB�d"� ����k�C|�;�CtR�guD�z9J{� ��V*���=�N�G(�5��A��Y����87����iE-Ci��2��ҁx��D�˨�4 W�t�br+7�s2�V���ۻ�!Զ��!��]A}���~�����$��4�_���z�0$��urY�x�@�����E��vtr5I��)��R�x�s����E!���AR:��~m�1N�le�\M�qK�fg�lj�h��lo�l�� &���j�/����2��5�'@�Z]dǉQ��G�"^'������ۣm������d��� ��ē S^f��b�2&#2��x�NC�Y}`�}݄�钪Pz��jN�G�ڵ���b�x���۲"���;����&���F���| V�x�9�Xv,}�Z�İ��չ�.B��7 f��t�V����u��j��>������ �M�A)fC��|����`���#�	�>Oz��j���;�S:}�]�̮����*;e�� �R�wXt�L�_���� ��ģ �@�s���M����s�Ao��"o3�}��~a��
;r5I����;Dc�~m6�{fm���Ŋ_�_r�F�t/:��H��.��$�î��B���I�����|�u��1M�?����nK%,���$� �l3zN�r��ύ2�Ho���/ Ɉ��ĺ��~��u�$��,X�xt;���j?��Gk�Hmk�����^��(�e�r�B��n~��I:ˮ�g9��p�>X�p"6���1&�1�Vt�͂C�|S Wsx��s�u{�&���%��=���I� #��L�Q���>�B�P X�xd&����v��n�Vn�\��^N�����ź, ����LMw��$v~Z���K1������e��S�@���OzTg��Q�:ۺ;1k���x�H��zOmJ�]�n{�C(�}0"����K#H#�� W�tDט�S�ܺ[<%�0}��PS��R���0}kE�C�@���?��$%2��zeY�3�V%�Bs6����q�q}m�G�����5�ǁ5>w�p{i5�8{+���x����W ���q
}m�HDr��� �����.[�%�r�p<V;{������������ЀNځ��g�ς5�'�o��äu��9znn���C�7 G�!?���F�>����kO�ۙx��>cY�Q����j�/ nJ�Ow��n=U
���0@���7{���e�\�1��{}�W ]�Џ�����]͐��� ���C�r���Mki�mX>�z��c��l�W A	��a}m��>Aϣ�I<�v%݌��1���5�D��%��~ ����Aw��:[;���2�I<�轗�Ǉhs*�tsMg�W+~�L�'�-��-�k���tܘ�s�b+c��ϩq;�����7:]�XgKE�7��j�����ziE�����Mi����{����G�n�Eu��z-d?��$���JW3�˴�H�{��k�}� ���r�_XgK8�ϳ`�`M�	0��3k��W�jw�w��s������ ��O=�#�l		�U)�j�N����|/a�u\�b��U��辿q_�U�p�:�{�~r5��@�Q�s�D���V'��[�����pf��x��۷����� ���Ρ$�V�i�b֌F��y�_���PH�����t��0!��0 X�x���|O�c�m�N.7�a��t� ����u�/�o��h	�I<*ptj�I�Y�O[�r�X
�_��8��7�}u���nB�&�|�I<��umi�7٨�%���m�oo��,� 8}����B�o��yok���h��S�v���~��^���Wy`���գ��~%�^�K�`M�10����|�T9!��=~Ɨ�Ͻ .ě���;r_GA�EZk��!���I�ў���Xw�;�ߍ��"�ƀ܎_n�]�Ë��$� �I����Ķ�����1c�V(� ._H�Q��(J�w��I<	P6��d�D���XJt��B��w{� �VwG���DLy7�5��@g~�ݏ�|�B�xU��"Q�ZZ��m��e���B{��5�G .��
�w�Z.����U���^ ${�q�G��<�"��R��j��]s4��T��|9��	�p~?w��6�t�~]�@�| W�x�Rd[JgF�q�OG[�6ڭ���@A��pJ}wDt��6�M��,X�x,��Ye����	v�7��[�����W Jٛ���E���O� ��ģ �r��>V�^`�R���y������w�ܖ_�?������9@�&�X���t�V���v�-d�]� ���/���۹��kqGkO��*��US�d��z�&\���7oy�H�)O�v�#T�g�g�\M�Iз��[�,*��e�?��[e�� z�t�/�q��X?S<�jO�F�9;1V˨�)qٮ��n���_���^pιD��0]��]wk�BPkr3r����^���zj��@�7<�h���p)�i	�I<����b��wF=k׊f�,�7��D��q]ב	}^�޲ X�x�L�\��Z�j�~�d+��q"�����t+=�� ���ȳd�`M����Fk6b����h_�L��5�~ �eu�/������� W�t�ӎ�^?�VY�5k<[W�0DF�����-�J_A�łx���,W�x�7��.͒�}�|�.n�Q��gC� J��t�/�����;���$c�-^Ӗ\��w���7��u\����ׂ@�"}u��~����^�\M�	�Ƨ��p=Z�ޛT/��̼ �B�G�;~Q]rH=��$�������ѼU|d�֩�H�F��~ �Ӑn��u=\�+��q�5���A�Z<�d�]�?z�m���� �Zmc���a
%(�R�k�9�\6��/V��!�e2�˸�w� �^$�Q��0�8���a/@�&���s_G]v��vw����{�@1_Nv�bqg����W��\M�a0開�~��[k8έg<D����;+'����~���զ�j����>�ʊ<*���ZtW�q7���    �9��7ۤ��HwU��;�k��Y��Õ6q���K��N'/��� {�z�?�vUr��5��I<���<R��qp�����|J{? �7�������jw��$�Jwo���ӍQ�ܻn�!.f_ ${-+�G��d4������j�N��#��2��nz��ԛ�G������_)�Guz�Θ��ٌ\� ��ē`��j+u;L.�-�nD�O�ݟ���x-J�G�.먋^Q���u>�$��h��c$˅<ƷY/�(�C�� �'�nF��T�Oڼ4� ���$�@j�S~b0��V��G� J�ۦ�2]�0� f����d���,)��Դ9oU���P��Q2��6��p��kI2L�Q�o��ػ�V��7ƋV��:7h����Q`���a<���[��5T�XC��X���H�_�!��u)�wN�S7/UUP�dE�^�Ψ~��>+�E��,΀Rv&��J<��-����z��O��^�O���J��l��x%���I<hm
������:{�V���7�}p����L��]�cn^M� ���#���H��YD[������r
�������k?�"C���$��hQO�K�~q����켜5B� ����43��]������5�ǀ5[��yCz�Tv��Zl;��� ��é�+��B����}�I<���`2�_Kv�p?fj��&��B�x�^��vq~��� ���@��G�x����g��G��'�?_��y[7���ӯ��3��e'@�&�$���>�l�J��ۙ�u4/�C�� H����ӯ���$��j�q_�c�^O=��KzZ����o ��eq���WE����� X�x�9�����Y���Q�s�d�d/Ժ����0���i�л;	�I<j��R�J�Q��m������� E�;u�v�s�Fa�|W W�t�X�/�2?t��z�&�{�����o����O?*r�"oW��I<�mH���6��m��W��{W� A�[�L7�r{F��N��5�GA�8�H�S�J���6/C�}8�O��4����=�t�ɛ��5���|�K��,�k{_{
�E�o N�/����5v{F)*�W�1@�&�8h��V�~�vKő=�ޚ�A�d�� �2_
.q���M�"^�=@�&�ȗW��\�c��Slt�Pt?�/y�M�K!�����^{��r5�'���=�c��wd�o�M����� p�ږ@�R]�A礮��� X�x
����l��$����������7 �\�i��Z��8x�I���A<	Ag�h�ܰQ��f˒D'���� *}�:D���4�q3����$��Ql��ِ⶷O���j�@_y�6�s�F)��Hk�܎��d�Q�_f�߭���w�}�R?���~Pwa�ώf�5�G�~euZ����<Ma�<o<&�D(�����6�nW�d�~fb5	G^'���r�ϩ2lf��h���f�/��1��E7���"��g&O�XM�1��_�t:�c��b�#]�O�!�,/ ���ۋO��CD�$�oi?�$� �¥��xM��[3='yE�o�9�N����zF����\rp�\�K���IU���&Z�P���f�]{���.����g�� �1�=n��E�/��U��%g����l� $oxD_j"�L>o�kOA ��Y���g�7��m{�Px� �G&����(B���k�M�YP�M��=����m�P�� �dox:2��L9��
�$��v��r&�ы�Oj��2̦�@B�?��7SL7q� X�xر�C����U�����,�C�7�B���~�/��)F���b5	G��;�X�<γQn�����>��~ �?�B�N�\��Җ�n�XM�1P�[g��*�iZ����8�Y� G�M{R7�#\7��.��j���+�O��j˺���;�I|��R���O)�������)ɔd^f�g�����b�_ߏ�C���W{]�C�}pg�P><�~�S���Z�`M�I���i�`���D�-vòq�� (�/�X�'�/����Z�`M�)�vL�(p)���x�D9D�o ���©��p��E�s8kO8��c�;��N)���]�|��C�� 0����n�om��(���$��2ON��pz������H=�,�� �g��nn#"Aw۵� ����`���[�Kv���0�������@��!�n7���Ly�t�\M��?��Ng�Xk6=�O�o!�� �}Q�ûD�"�PR��f�`M�Qp9�B?sOo�]>�\��z��D�PPr�N��M�*����^l>@�&�h.Y�GE����y}��mZ�������%�n7澘z)�j	��Ei��ڭ��F�\��Z���&�tG
#�V��g����wN��K���}WnvR�}�-�S���ꎃİzX"r�lk.�|^�+
e�?�q6��ӗ~H����1�h�՘���<�d�g<Ss�xO��b��~ ޞDQ�?����r��^c�ς5��1�ur���3�O�8=���~�_Y�����D�.�}���Ā�Q�ʓ��{��ݬ��O�������v����y����%Я�(D̻W	0�x
�7jy�oǙ,�͊+E���$� ��mW��N���\��I�$�m��{l�:V1GV�{<�w�����'��:F��#�m��� AkO��� �:��d��j4z�Pˏz��lu��]��ԯ�\�}6�x��}��θw-�����G��Px� 
Q�z������8�E���Iۤ ������>���r�Q�6O%B����>L���^Gٳm�^�)`V���Bc�J��W��WP�
/��������[E�����؍I<������5��,Oi�+w�ރ�@:��O��o�Nuq� X���@�z�ϋ��E�x�%鱔��H${1?�,��t���tB`.<�%`Z����2U]L,;_No�G��0��/�HD�'u���rF)�V� �1I��p�H��,5��;��DK�x����
R���[t[Y��f�\M�&�U�ڎ����Uf��������>��VK^�A�u�f�I��#W�����޴�}t6}O{vcR{���Un�"�{�����Ye���{я"���t��q��Z�vcO�zO$�k~<g�)���-��J_Y~_�C������u�X^�XM�)0^�c�;�O�B�R�ļU<��40�+�t���P��ex9�R5HG 8�r���P�n�	k��*�Ju� �G�[6��G�톂�s�s'^�\M�!Ћo6��v!
��9�d�
�@Wr��1��\G!����$����U9���c��b�B�1E�@�בk��Oչ�2@�&��,2f�t��mapڏ��5FP�Y`n)����x�� ��ģ ϊ�lr?� 8�M�x�P���sP��n����f���k��c�2IMڹQ�~;G�;���l��9b�9,�����O%����$�xZևqoKNʭ�[rjG�`op���
�a��nb5	'@�y�e�i�k�d���s=�i�p&�S�=��V(L�޽k��b5�'Aqyo�Tu�A�|q_�����@�;,� ��E@)�K� �ģ�[���`[�T�..��b��@N�(2����>:!ʒB8_:rd�1A��o27E�헡����?�����	iS���2�E̲Gx��l8�WM)Ѕ�X#��"���G��u7�,���ի�Q���EB,�"�FL�jJ��eΔ���k!�]�Xn
��ri��H�y�>�ҹ�\A����s�O0���|��1��j,����ać�NԿ�R�9?1<��|g�����vBͩ]�� j'�}����*���)E@.��7��Z�A+�J�$"[�7��|�yZ���;������r5�GAk��������jP���"��7 r�d�+�뫹j{6��9:��9S>V����>5���^+D�m=��CJg��bG��k;�M'��I,"0����`|E��	��XS����� J���8¥�Pk���,l����W�q��g��    
���Ȯ��x������q4@�&��e
�6��J���Ub�RA5BD-_��b���8"�a�0+LN=P��M^N#8�-�h�K�
��/ ���{�N�t�E��^X/@�&�$�f�G�bR�8��99M�ϡ����ϓ�t�?�5r6./� W�x
���6�%�2��|N�.g���`ؿ}�lno!N�P�\�1�1nNen4�.���1Fo�M4�	��d�O'�r%��gjU�\M�!PF�q4[	�U��}[^�v���/ �C����z��t֦{��,W�t��1T����}��^l�e���K��`������?�u-�j������%���6�l���w��to��e��Mل��IE���>@�&�(H�y���i�?/Ƶ؀���7_ �/[��=���B�I�Un��I:F�dzQ����Ĵ���o��vױ(����ü9眍K�9��Qr�m�	�]�4Q��f&�n�/�~�T� ��������ZA��"`�5L<� �P�c[��m����!dxp�F��#::���F�]ä`��u���|7�k�a7S:�{~�>�w����B΄��0�&��ž7�/ٽug�̞+� ��W ��/w-�\g!�����a�)po񨊖�g<K��r��l[��w��%��,��|0"� �iF��$r���I�3�L=@�� ��^?��»�BD��֥a��C@NИe��m�^�EoV4�U�+ ��^�]O6�Z�a�%:2�&��M�9�t��.�a�
4�<�_b�QyR����B\>�H���G@eS��oc��l���\�2�8��Y�NJg�s���2�����*_�G�)Lo'F���<&g�� T�չk��:1L�#`6L<�����~&oG˭~w���]�q� HD�k��u�OG��$a��s�,����RN�9�V�jC�I� �a���d{X��A�0�(Tk1�X���v�㷛��`x��dqC��������]��[�0�$赗�to_����kk?9��"�N��c����#<g!���4��I��ͮ���ӥ���;���� � �A�1�0}����3պ�]C�T�rn���<6�^�v�'j/ 
꽬��X�~$����a��C��\
;܌��br��给 Y^0�'��#��<��2&�:���0W���NO�\��
��P�c����y'�]ä#��pX��'�D�7�W�m-W4�<�?�ק��5��x=� k�t���S��q./"�|?������+���iK(�X;�w�0�&�mj4�g���z�L��itjT�� 0�>����B:O�g��oa���S��c�t��T^t����y	�6� Q�o�ڑ�3Ry�a�� �>�������q�WY�X�z����M���5�z����O��V��CJ�f�VbY�Wfg;��� �>/N��?�k,����;�4&��F����/�"����*9~���$D~<��d�����5� l�x��dZj�1�];�ɮ�&Ӿ��� ���T��݂A�0��W���z�E��r�l+�` �'��E�	ב�5����A�0�0X���Uf�Z^�<���� �� $���)�H��]Ǡk�x����l�����mb�JH&�
� V��t,����3'��a�Q0>%w����R�L�s�W���W !%~<���1�C	~8��������d���g�6�Dy��n�@ �1/}q�#
y��a�����@>CP�.q%Ngi[���^(�g��%�kNC�5�7���Y�즭�����R��'w����� �1�Q{:����q���A�0�$�[�<�uN'�n5+�!�ߏ�5� �@}O�#�~#�{�n6L<:�]���������4�N����)\S/לF"�p%3�"��`z����Cd6�;~�6��v�s�7 ����kN�!�s��a�!0��q����fif�T�^�i�/ L���5����v� l�x\׹B�$�� �G�ٴ�	2� 8���G��@α� � l�x�Hq�Φ���~����ҲRAf�'�p�t�ǣ���D�ݬ[{a�ģ 5<�תS���d}h�NE��U�0���vX��N��z�A�0�v���^���k�!��ݪp5���ǚEo�t.�,��]j6L<ڝ�H�K\\��X�n�+��_ �������ο=�A�0�hv\��|�)���6v�Ldrz�B~4N�}��N�Ιwa6L<	��5P���^͒k�:���@��*�>%ʍ� ԛ5��I�@�����J�K�Ti�U���y���,����pC=���ԣ�4ר��xe72���Ҏ��� M���s�	�Ջ�p	��f��g�5L<N�ZGY������2T�A�,/ a�)�>��Ӣ^�J�� l�xZ;��v6wo�f���%R�dZx�c`Ѯ^��+���"���æR�e�}�fg��/��m����4yF��> ���+ʝt�� l�x��y�ų��u�����7 �}��t]���pv�[�����J$�J.^�#[�:˖��O��o ����z��4�s�+5&S�ًH��I��:����>9���(���J��˵�Qa�� l�x�D�S�L[�x�\�V�1��a��{0���za�l���7&��>>򻼤
�͑~�ڨ�R}��J���d3�`�K�b6L<��6C9T��"Ҍnǖ*����٭�iw0�ԟgCaC�CN���j����z�]�-l�/,L� $��z�sD�,G!�[d�Ψ��_n�lc��yU^�r����~���I}q�uJF�Ku��a�ap�2�jrz�:kҪ�A�|�e���ۏI]�#�G����t�� �1[vF�*کnS��-��p�~�pV�~:m
u�b�z��A�0�(�\f�LN/�^��;�C��i�/ �J����ɵ��@�z���I� �X��2~éhq�`��l<
��������]�t��!���֠k�x�1�kgv�|+�>֏���=���M�A�u�(^x�A�0��n��#O7���y��>*v�Ԛo ����K��
��q� l�x�ӻM��S�A�P�n�Դ ���3߻�^A7\�Y�y�.a��S 5�Uxas�4j�A�ߵj�e�g5� #)>���:��{e6D<A�?[V�$�$���D�Wj����@��K�>��x	I!�)�� ���4�YK�i�V��n�v%��1���i�+�_���S��w�G@1r�0[i�ǍC�t)\�H 7�7 &�G�:5�Nԯ�#�� l�xG�Ql_����u�,ZL��yPNۄ�S��:׻S}�!�A�0�8�E+/$G��.��mG�dxzPΎ��hq�I��oQ>�����4�TO���$��U��f�L/ T}Dh�+�����i6L<���<�HF��>�M�r�Ҕ�� ԟ�P��W:\I�� d��a�I�N-Q��I^?T*���NJLi�����m{Et�����ڭA�0����՞w�v����|i �������B��N��WH�K`磽@2��!���%'U�~)�U��[/J�]l�}ݽ 8�?��ǟD�nqJ��6�a��C`t�uO�H;vhm�q�L-������
��%�k!��FX�F����t��mg2/�q�`�[-Y����s�+���xD�a�s�>�t��B|�C�yy{�%�ǲ=�fgb8_f�9O��PD'�eP<l�GAF�*w4�y�����z�5�6� L���1}o���Xy��a��c ���˲��Z�r�x�v���	 ���D��O�tV_��#]�A�0�8(���H%{u�]8�D�8��yAh��~�"gtq��-l�x\.�Ţ�;G:4��Dd+^��7C� ҙ��O��Y}����=��a�I�*d�E�/K-���˃Sz���`D~�)mO���
�0�3&�d��_񐞋�걓��1��S9zx����ܩ���K8u��������    h��H���YF���g�F��Ad���(ԙH��]��P�p͝��`�_x��V����+�H�)����;��H�5���}6^*պ����Z�]6@:�7 ���S�)7��3ɹ��A�0�8�c�x���<�:y�g�� ����S$?�N����x���I�@"/N��Ujt��mju�eFQ��ӏ8�MӋkQ?�S��н��x,�c�>+��={����ؠ�Z��ڑPb��S2/�/}�ZM������^���Z+}�m;��%�� �$�/O�Qj6L<�]!�<����ux��y<[�6��O�1�tzWD~���
h�a�MRY{3IH;���nk1L[�`tԿ�љ0���3)��\]�ē@n��/Z4r��:�z��6���pg���zLo��.�ʋ[1&��~v�]-+�͒��,���I:ȸ��^�]��[B�g6D<Ak{ʬ���.�9�&k+��� 1��R��ܽ�N�sזa��C`R��,U:e��nh6F;�@x$$���I}�@�S��n���s�tq����_���>Tp�UA��O ���cɢ�-%?�)�va��#�ެ�Zi9i�ʪ9^7Y�6NZ���k�P/h��m��5�&��}Ö�pMB�ƳK1�l�i�q4 PE>�t�<}�G�͂7pt����X��~1\Gz�=I�ؚ�� �M�k/��7 �m���e��\�ٱ�\��vz5�_�AF� �?6�zH��އn��O ���Ee�uk�h�:��� #���"�=�׾�άθ��� l�xTw�蕋r�kM�B�N��G�w ���.E����C8�{��oa��S`g��xk�ۍ����$�h��n�� ����zA
��z�@aC�����5%���:��ռ�� >������K�� �R�A��z� l�x���=~�|�����Ҏ7�_�� �{FX]J���4�z�a��à9?F��u?~�l���-�y������x�Y���s*��8�G�t
�Es�������Oe�8���� ���=�/��B�k<��a�Q ���2笍&rxGڙ�^�@��	���{B_4h�Q�ӆA�0��T+��<�9�n�u�Ί���� Ά�cb����q��)�A�0�8@�M#K���+��� }��R �' y\���*}р������ l�x�y1�����`�{햂8P����c�~)���D_�!$���'Ai�,�;��5w9E3�|���� xO �|η���y�=*���� l�x
�Y����s{��x�;qz���k��s�g?�YqzQWaC�t�~{�/,�[�=Z��d���^ |��t��t��y��#�A�0��VJ����e�R�k���
��@�'���y�>��I�A|�Z���F��&�o��7� �Q�7V��*�8�1�&��V�[�D&�,��49�]ω@=� ��x\�Q�&]<Ҋ�����x[�֪ݳ]�t��Tg�/ ��=`S�����c�V=�����dgun�V)���j�s��\_5�' �����b����
�v� l�xD�����Ё%Q��{5��A��̺Vt:w�Ry�� l�x�Պ��v�_*Z�4���P����٩s������5n��� l�x�G�\�*+�N��lDV�R�߂��^ ������$��yܙ5����a�)pP٫c��""������L{/ ��c��F[%"!��3"���Q(�4�N�6�.b��x�kG�4� ŉZ��RT0��o6L<�m��c���n����tdhy@�g���ġî�w;d�5L:��Q�F������肳<P�{��- �7�>eTS��p'��a��(L��c����F���-۷/w� �����#�;�I��� k�t,���&���O�C��M�:j�2?��O*��R���0�	��wh�5L<�& ���55U�m~݄��wæ�2���(%��S���8�0&�\{ت��U��'��T{O ,�G��<�:bB���^^�O�;���t�JƎ���T�_��, ��<}�2}uD�fTy�Ca�ē���܎2]��Kt3�갵�j�O ��G���ꈐ"���٠k�t
�Nv��d6�m_���!�=~9+||?y����
m;�3�	�V2�"���vY����Z��Y��7��`�_ �S�����V��cϥ� l�x��X�s4Om&�^��2���/ gJ}�z:�Z�Σ>�i��A��8�x�Fc�N��?wɩhR0��A�;D�k8�Y~���ݺ���ғ��;�#�J�j� x/ ��Y�T~�^�qo�i6L<
�lc8��R�Q����f�q� ��Ʃ�<�Ν�%Rދ|��a�1�^�[6�h�K�뤳���i�	���/1�xDg_�^�P>��a���Ҍ]庅��-峸�O-�A��' r��E��:w�Xy�A�0�H��PE�q?$���8��� ����9ҹ�|��O��-���-��kS�nv[T{ �B~4N�o� �)o��j6L<���d�Yu��n�ݓ�3�����@��%'��:R"9vK������P�|�v��z��¾�孺�
�9��L�:H�sE���a���'�O9^"�l�����v�I���ף��'z��)�xo��}��=�47F<�9Q��T.�\߾ܰ\�0�B�F��b��!�Xj("cA�����X��r��P����5i4��ҁ~�rQ7m*�I� ~|�r�<1�a���|IM�8w$[��9��
�N�$b�%�K��u:�gˈ"�Z�����m��7Q9�O��xZ���Ēǿ��W ��tD;�;��1���yԆr�`�P�"��[x #+���p*�$����N_�ێ}���t;��C��?�טMc�A�0�(�"�t��>��~ǻ����U���c��?Q�k��b�>�w>��?)�x��=v �j[�CAid����[�̦Y��έz$�Р�����������(n�����ed1L<��7��=��k7A�0���K? ��b?�ł�S�ę���&� ���:5;kxA%Q_���,�J�@H�I�lt��.� j�hħ���չU]
I˪����g:��}_�=[c��*�՟>�� �"#$�3);���@;�,bA8�~=\(�珩noN��s��st~���~,�T}�0�U�/*��E��a�t�K�+e��x*���R�徼����ҷ�����̏"�z�v]��C�YOEY���VqЬgn����Kq? %��(�L�&�<�a��à���I���Z���S�Tj�O Ω�N��k�!�p�5��ؑ�M��0�Y��V36�~�TF���Q:�9a�����/��X�
^�f�!
V���a֩b5�l�e���GĦv�B��ÔE$�\/K,�h;����D2��v>�'�>n�}6��������*g��j��ѝ�	���>#�վB��l6wѯ���Dm����~=xIk�9��y�|7���:/��wWB�Y�!�#6f�0�P�(��k82C����oQ�tw��^��u��z���׃���*�^����m$:�����A�0�8��[�seY�6���pe4��2^�@��os�,�֜^�ɣ�O����T|$iul�YO���(�����(�M�(����O�|ڔ3x؝�j�KF�Q��U� %�F��R����TwDz�� l�xT�ö�ߖ����:�=/����y�K̥7J��,tD����Eb�}B�0�I󾫔7�U��,'.����[���Gy.��c���0��8`��Y%}���+�e���+�/�D|�#��Uޟ�کD{���KC�	����ӌKk;5���=I&xZ�g~�7�7 f�%���� l�x����*2�Q��Ψ=9�h�}��@�wz���b*ufp��3�� :KI%`D��Ae ������BS�!{-&�k]�֕��K����3t#� �׫2"G�F��%\2Ka��"u��[ {  ��SHc�>��c*�Q�f���C����v~��)����oQ���k6�7��l]���v��k�>b%c��_꠰c����: x<�H4DED�h�~]+�l���z�xyU�&7Ve�*|y���c��Z3(�?ڗ���ΔD�"���`E���[QK�,�L��/3��&rNF���(\���aw�]����}� ��tu�R��)�34��G��<}8(r�Ј:Jqkd9�x#�#!��iD,��~�� �m��| ��N7����4��Z���)�(z-ឝ:+]�զI����6�//�z�v£�%��Ԯ����zHߢ|�I���i!����j0��r��X!?ރ4�'�P�u��r�Y#�G�����1&���:fr�)�o��AM3�����@p�zd�z+a}�D��	��a���)���ҮM���M��!�}ݽ}�|qJ]CL���<�ī:��a�Q�o^b�Vw�����Bo��%����ϙ��H��Ԡk�xl�+�?
�w�IԌ���o񎆁љY��M����!�#o�4�!�
���>�2���F㡵�˸j}���3�����o+]��g�����RĆ�H_ar�Ҋ���3�ۂ��)�ߘ�N�����2�"Y�:_���,R��H��a�JȽ�9��a�	���f���w�Z�2�U��X���r�o ��F���]��c�D��w�m+��O��>���u$ɕ��#nX$�Y��K�;�^F$X�&�Ef=���
�X������P����R�Ku3����ۥ�tO�;>�zdP(_��v�~J4v�o�| �F��i�D�~�q��k6<<�t�,NO�V�8�b2�ʝ�_�po �p��xKM���?����?9(      �      x������ � �      �      x������ � �      �   L  x�U�ɕ1�{�G�%��?�)Z��}��,�F�����7=��`N�����ML"Zb��)�e�_S<��䋮[N��i�v�Nv8�M�Dn����~�X�[ܡ�F�Ɠ�H���S� �v^Zp�_�W��͆��/*�Z�;rUk��d�9^�æ��#��`���i;/��p�����[�S��5�C�qf�D��͹���Վ�TsF},:�./������7�p�9�U�"QSP�C홆M�D�&hZ��w7�������Î��w^�AŏZu���"�sS��ܻZ��TS|Q��{_;�EЪ<8{>�4�Cծ����������      �      x��}]�%Gn�s�Wԣ�qd��d��b<^��~0 �'�am������üխ��y{�RUB���ݕ<� F��S6^z4�}15Xk|i�G�>�.�)s7��0�1%�h��%�ѭ�|ǖ���P|b~�����k�'��E�]\���J��ޕ����y�)��������ʷr�O�oD�=�����ӟS�>��<�����_G���?~+.�=��o��?��������c<������o����?~���[�p����?�Y~|��G�e�x{	��}���x祚Re�|���q�m����@��l�٧�����h+� �z |f�犆���W��i6�&�g�� �=��Ef�[V��P9yo��L	� �L��>l�C������=�͂�JO K�T�3~t��Z�=�0���$��b��	)�O���j��Ɏs���ᳪ�Ol�9<~Ff��K ��o
-/�M�14�5T�'���#�E��Rx������;H��g@�Ք9CɑC
��Fl�}��|�Y~��#P�]$n�g@"�-�5x����ɩTS��(�q��M��*��#��h���	�/X{��N\�}�fNo���r���d����\��n���:l+�?�\�e���ّ��VV��HM|�Δ^�I�֘]mε��Cu���_,D6� ����9�,�C^�7����C���8�V�K��.�c�O���	���e�S`[e�c2���B������/p�����Oջ�fX�����w��?���'?G��̐����M��`�U|�U;�:�번������K�`*�:_�`GB�I�L)s���S�G�"3�������$$��؎�H��G54JN��-�iB葃��r�&³e����U�	�[���V
�U#��%D���q�"g���6]W�C w�XIπ�s�����Q�E�ޭ�6���Z��@f���SwLb%<��ؖ�Ԉ��3)r��/``��p0�\#AT�=�!�O��_x�,ޮC�����[q�Lw	,�'�Ti(4��N��!C	�/9&��;�3���ŵF�H�Z�@f2$�VR�cH0?�p	��]Kπ�+U\��<��Ă�[WA�8qh�9:X�y�U�-�����q�k���% �׺�$EBӓVY�^R����	��^�a�����	;9�
� ?tkL���P�r�z�#6�,�i �;H��g@�<#[��D��d���@E���R"�X��?]ȥ�nr���d�ݐr��dy�,��0bӒ��OX�\��e'�?�j��ڟ>�[YK�`+߹�6�'��lr-�dn��PzH��>#�$N��q�Hπ��,�1����>@I��6�Pl+-?���M� �����H؂<5�jB�Z��(��p ����#�Իg��>�	�*���&����ەH�z���X��V�������<i)��r�u��^ĳ%�5����"4zvΚ8�����"���N�F�GtE�.p�Sّ�	�Ҩ��f��<���Û�D9���=��f��Y$"��59ߑ����d֌�%���L�}���)d���{�vkJ����l6��g@�>v�vס�=�-K&R��Ў�8TWy��۴�����	�c�gY�, ���d�3ٗl�ŗG��p�A�:w�������^�0�Wr^�3��F�#w���!�p���V�Zz
$x�f���D��I=6��S�i���&p�%:H�v�1��S 1�템!��J	�4Q��,��Zl��8�R]��E]"m��Vz$�K�U��c"��MA���ȭ����rm����Fv�f��2��`e��@A���(9���>и�h�/Δ!���Fz$��i�=8[���ʅ̄�p���!{pڝ��Ѧ�i#<9tv�f3���a"M/x?�E��%�G<T�?$Ǵč�Hx��:?�6�W�ir�0Rt�K,3ǃH��Œ ��8����vW�l�B�u�/v� �y}���ʐ^����1�.�al���B���^�r�6�:UI��%f�[��}���*i���}E8�^�rF�U
6\u�&tU��r��P�;��o���Z�sٓk��V�@�M�!s�0�;�d�-m�A?����7��������|�NL���榊$�T��S���mQp/��>�Gy���JπD�ERx�Gi���S��0��ىԣ��k�K��)����1�'Ͷ��	�+P����!фA�brr�m�H{�t�(��ne�B~"_��v�9�oj��d�
�1G��s+)p�$:s���6�<aM a#~�ݺy�q�tI�{���(���g*qFA_-��7�S�y�s�W��(}�jK���l^'���3x� I,�|gh�[?����$��\JKa�i
HI��~�f�Z�N����A��-@�R����껧��3!O���B�-[�
���w��㟿]�۽��ÎL	��W'lf�\
���	,-��<hf�,���6Q�����&�&G���Nq��RZQ{�	)s�;H��g@�;��D��K<,���hCJ%�~�&�1"�VY!�	��˳���i��H��)Ʒ:��(#�uc�qŤ6��쵦0��V�D�ƠۯV�]�L%x�Bh�>@E�ᶊi$=t?�L6v��%B����y�I�j/���;�{����XI/4� �s�`��b���)i�1�M�hн����9"/;��g�����8b����L�.j�i�C�����Ϻ
�0�]$n��@bZi�g3[V��HTPy�,�n�uG��U׬�)h�g���H�e�XB�Z��:5�i%��XX���EW^����l�XKπ�������ꐸ �5��Q{�~9��4�'V%U�=t��(Ѧ�|�A��'y>�q�) �>�8�)����el��ms��Y���6m�g0����� �
� G���/p~�8I��O��	7�Dn�������3�K2�u�B�՜�9�؏V�]h&�N,;6���	|l7$}���L���SB|m�Ky�&��}pvv~���HπD)K�pa؄G\M>H��ep�R�RR芄5j��?7�u�A���7#(�<Ga/���P�K�-e���/u�3i+��.�k~�M]�y���+=���>K+�Ю+�٤
n^%%7jh-�G�8g��CW�$��3 ��C�p�\���dJ�:CA��=?\�N`��������t��~�� ����C��w��6��l�z���!Gt,���̊�@�-Bk�l�E$E�^��Ϋh}�R��g{4�.uv�'چ�U��8 �J�>�6�ݵf���4X��18{���{��,I�J�xĎ�H��A�#D�k�-��09����2����5��-9�i��JϰI7]ͤS}�h�q�Ӕ���T*���۫����f�+$�(�ӽ�H��ow�}���j�Ԭ����t3S�&X�EƯ�X�� V�"�8�meGz�U���TT�Z�]�[7�k2�I�G3���J�[8��-�j�B��������a2��d�\�S���{������(S�qj�y�D٭:�w�g���.�B���<G2�4d}�;�j�2��z�1%^��w�o�D�W�>�X4�s4�� �N乵���$��[/WU�3��2�6�v�' ��+#Q00����X��D���&�xޤ[T��a��b-=9Qu����M���@���WJ���8A�].��w����� �$Azn�#O=B�IYw���A��9��p�Tu��R�,���@��rLN�s:BeSS�(�+&�ҏ󫪤$L�9�&S�JO D��l(����+!jDD�Q}.|�#�jPU�v��-���m�H����T3�Jz���"U9R/�H=��$�\�h����@TW� �7%�e@#5������ag9��E�n�Ko~�`�q�Vz �X ��)kl4�*������5��G��$�۰$�EИl�[�}.�7k��>9S�fM�L�� ����\��4^Jy"z26�h+=�.�7_�R���:���xi�ƉmrG)碫Z    �n�T��3 I��(�I��Y�I5���Sh��X��OK[����HL�fgK����b	�y����R�9�p�|�U��8p��9ؕ���]��J&4�t� ���?r�����:��E�ɮs������2>��i����=뤸&�Zp�ς]u�� ��u=gGz
$ZtHœ�V���LE�j8�샋޹�l�k/��z�Ѯ�HdWb�1FM�
sH.3ZJ�Z%����ˤ���=$V�3 �v�i�����=J�K��mGs���zn�b�d��[��h��V:���Wdh���8c-��R�B0���E*5*�"�����4B�X�pUucDu�z4-��
�$d��bޮ�H�.\�M^��><%��)�ɣ꺤#1D���ю�HаRbF:F}b��H�̢þ��*����/����XIπ�wA��M��fi���-�H̎v,�r֍�w��k�� ��V��X=����Ѓk)��E�q�7v�U������-k���ΉM:w���&��Ȗ���A޶�������z�tGz
$$ �b���w�{+e�	�]L2k=^�Ԫ��$���c�Jπ,����x�M�΋��䢹"��CH��_]�����;�3 �f����hi� �u���W�K;�9��KZ�H]�zOlGz$O��V��N��M�zug���5JG�Y]u]n��H[6{A;�3 ��|q�R:��JZ a�A�Xs=�+��f��G�����赤0k1�}�~d�D�dB(6���t�O����G\��k�)�ȳq�ٌ�t��+�2	z��CNG��]�H.����[�p(=_!Ջ�R��G4y�Z�����.吤S]�fWz��R��t�껎������H#+�x�s�z���JO�-f�C�pz�����
+�i�@/j��K�n��8��'��<K�>�iM��JL	K�J(F��?�n%K�[O��� ��ƌb�IKU�R'����I�G7I��`�`/�F��a+=�c4Mœզ�M���@���@��ma$,�f�e
��8����n���[|ŧ���lr�:�MY�{�[�#���;�rhh���#�b+=���@1�e���N�@�fB�]$7�0Uu����۬���@j\��a��c��6��T�Zٷ�c�UA'�_("��D���@p��Ʀp�ugA�:�d$a�ͣ�-Way����M�6��K] ���X��E$CA�P��̤�̞�����e��߃�ĵ��9�N�d=�swT��A~�#fW�j�s��В�1|�fK��\�MC?/��E�U~��Rt09]B�a���yP�����,h!�-�P����JA�.Z�㽳e.���w�_5�B�� ʮ7�w�o���u߬�Y�GE��~�ҭ5]Xk�4{����2���EZi���m�X,bR�ł��U�wE�	:���=%B���@z9'��7�f�l�'�!�nF�j��q�k��:��YC�^�ISx�����=l�' �k�� I�v��z[vE���j�Q��b�k�y�B~���@ ��\�権<4��z��̎E�|s��/�B�W��<�ﰎ���C���J7��jm���&6��Иn���
��]�ə6�k+�K@�2#_NH�uY�*�Q�|K��p� H�[�3(���ܷ<o�zy�kA:Rɺ�7k�΃.��#�~�I��e�}#OM���4�e����=�E3��tq�<�oZKO�6|��أ7�A=���ݣ9�Dm����4q�d������O���ۄ�]�I7���_ji�Mw�*�EU����juWz� ����)YTG�ґ�{ʾ;���E���gqz�z���+=�EP�#;ѳtJ'gs&G,�?�g�5|	K.��4��R�X�����uNN ���:�K�/�c�w�V.�#�茩���yA2KHR3��JA�iH"��W�������e��L��@����l��I���^]/�[��d-P�2�7z�6��w�,�>|��Tn��H	����ň����h!��`�?�Ů?��3VQ��(���cٜS���C��v��[���2l�-?�_����[���� ���V�u�31L��5R���i�#+�-Y��������"~$-"J_�ɳ��a<F��N��i%���yu�1/���:�*�M�y�A��_-�nE��^���P�}�1t�a��3E� Gk#W�~]"��hWz��!�f�^�G5 ���b�)w�Ц��r�X
��bh�t�KC�.pq:%�_=�כ�����9CEl�sf��e���d,�Nuz���K��������Ĵ-
 ��S�)��+0���N���o����kq�����g�2���u^4[*�>JJa���K&������ �^��m�nn%6���>���,l�D���@8�-�&LPR���LYƌ�@f/~:p��EU����"w�XIO D
Ds��:�����Z��{c]
`�?�מ�ȚȎ�XKO ���K�SϱM��9́tI����w>V=�K"ڸ�&a�5�*\�t׉��o�;F�5�?8��H��sFj��$܌��µ�f��-e9Lx��N�ރoPI�F��ю��0��2,*玵t�5�E���3ҳ�R�JO��&0�)U/$�z5��HI�!0���@�����)'���Vz �;������}��������Zg���W��z���`�{@��' �d��	���N��tj��YZ���;����n��f����@�c�QM�[�l�g��\jp%e����Ui���"� V� ��	�Q��S���z�e0����g&�!�Xz��'w��Zz �^�k�S/��Cp�-��c�ԓ=5�:����%�JO DM�sO/�g�HFA�d��ذ:
ǃב������u@ڞE��' ����rT��m:j:���{�x�G`�-��6"K_V��I����\{	T� B�k�a���M�9ף��_��^���"󆒓�m�z���b�΃.��5~����|s�Ai����@fR�."��N��R�� �;@�
_��B�.<���&NFZ��kft��ͅJ���eG�/�j����W���,5�e�:���,lJ�9h�nU�X����f�ng[�HY���p�A'i�mu�,�\�k�^o�'#��Lr�u��?���r��G��?�����������?=h�^�M�F���(P���%"e�j�ԭn^j℃v����YpI��nܷ{��[�o��;y��A˫/��Q�LU��s�-f�u�\LF�F�J�G��_?��p/ڥ�7��3N{��]��S�����!�]v�.%ⲅ:fКD�#�7$�~SRB�,>�qtc��"Њ~��o��"u�(�1mc����v���<{�ְ��y[����ɭƊ\&���ZZjH�>��7�/�a#F��n���\k�����lø`aA��&{;~��@���(@-k#�eKk���-�q�!���G`�r[�&��d��#N1j�G����;��J?oj�wD��V�@���2�tE��p�H��6\���Ǳ����ޔp5�B�E����Ճ�_R�2`dg��ڌ����|�c��o���j斣#z�,H�_���`%%D���{���@-���ߙ��וt��R���0�E*��H�%~�`�a�D��;�\b���T9��O1*�}�T���H��%n�'��5�&nZ3tNx��<򠽍jk���������]8H���I�u2�M��΃�V>q �CB9MM���D�H@I(����[�=7�a�)~Y���:�~�^y��հy�~q��_�n�A�Y/U9��PI�Y,|�t�IB�w�!�h����&c�jr�*���?�%{���x��!|�"wO����������?��������'�������{"�=���2���dD��r�zg�ǤMϹfS,0hY"�g�c
"C��rʲ�̍��H�t5 a��� J�D{�G����wi�X�k���&�Mҫ4�E��M�?���>~y�t��n�ƾ�+����������?�3����������uĻ� �  �wѾ>^��L%�
O���[Ĝ�^��w��Ȼ�4E&�{����A���'K@d����'�D��1&��3�J�������㻧���y����
����tU����B��_~��5~����������>��? 1�[��\��h9��H�����U7�ROzQ���O�n'sA�_l��P�=	�z�f������ucB��,��omZ��a����&آ���Go�k�����O��w���bءk�d�%����`J���Ԑ��I��ͮ����r��z��7^j8N����5�t��=��5߭����m���R����D��H�sz��]/|�/�\��gsX��]������cfPy�3mW��B��_����?P��K�	�~Ӄ��]uq���������e%��,<�� Pt$�&�,$"�G7�,��Ck��e���F��N��y0Rx�� �q�2��W��m80��M��`��H�����E�&�G�5�r��m���/?=�g�@r��1��x�G�������B�J�z����������H{��������gf�k��8g�M��	���k�7qҍ�owx�0j!"빳?�yP�^U>��9�h�0�����u�X��Ep��Ї��*rϴ��m�'(�;'���h�<��h	���,��	�Ϛ��h��J���U[�dssĝ�_�-v8F�k0����/:臫����#�P���+}���k���@?����fm������DoĂ�.�򯳬��^�3�r�:�z��)��&��X�%�y-v}Z��K4����r���#����(�[`�2ZL�/Z�EIz,��a_ɖa�1���ki6���7Xm�_q�o���?�?�� 滧�>^�f�+P�8!� \0��JȠ
%xCrA���m�v��Qb�^6Y�P�M7�`_�ZU�����P���4֦��ZA`��Ik\�AP�x ��/.!�p�r���p�H�h������o6MxN 6��bUmU7���3I�g��ș]�x�1�ܨ��V7����]ژ�����Wxm�n ��E�z流W�m�vpOG������)n��,���9�����̓>K�����"d��z�z"7��lC�Ӭs��Q�X��젻�H��3x٦�Q!�(w��d�wm�`��EQR�}j��71�w=�У�m�
������� ���/�]X���/�!ۈ�b��/�S����4�k�Ln94��nt|�Iɺ�k����\�k�^o��-�� �����l���fѝ�^�v��I���O*}���2\_�q�C<��d2�^������b���.�C�4��!~1���~�Gt�M�H�ڼ������/��x��������J:��:�ew�]���,E�dj`e:�gAZ�����Q��w�֩E�;&�����A�G�&IڤB���� �@D��#M*?i�cA���vl{-}]��[��!F���D�\�Yb���T|�c��:j��]zh��Q6�L��W� �SHlr�����6��+fyw� ��N�&/*���w9m�TL-��iJ��Z�G�����Q��=�VX�Bڄg���Z=��W��v�Z�3id�����Ӛ���=�v�T��h��
 �tq�v:�7�R�y.������Կ_����3\��      �      x������ � �      �      x������ � �      �   $  x����R�H���)\T�v%�{κs&	'c0�lm�F#�>��w����a�lUYj�����!�#Xr�kR;D�H �$3)�� N�����L����A˚�K^����y���}�jtL�.�yg��@>���v���qvv1�*����V�{�K*���A�=<l�����W�-���5$���������σ*�񗓵��CF@1YD<��q����E"��!�La�n���Q+q����ኹo�Y�^���=_������"�=�㌟�,uh����Zi�%>45w}WL��gn���I��)ר��Y.�R���M�Y����i��k�4N0	XbE�l�^u:��v�I߆��]h��m����E`�׼���D=4·{7��ǝ�����tpq]�jK���|_�K���_�v��S�����Ȉ��B�3��H�P��/f:�j�8� �{\��.�ͼz	�4���Z��M
�A�$����	b�@�/#��$*foB�����V����a�X��Z�>�tn�����^NN��V��	���}��������x{�ߪWų L�8�	K�p�����:j#I�4�� L*�
z��Ј�iH>y)bN�H���
�"R��c.�o&,rf�#J[C�%s��b(�䊌3�����,����J�B��*�����E��D.�o���A�m��t��d@�_^��!}���y/�7{[�|�:O���c���Z�ߎN,<��ˇ�~�5i��j��V=I��?_�1�9�*����@��7�/�F	|��&ߩw ޢ��ADi�	�+�h�x�����O���߁PD���P)�FS�į9K���~���
�B���4�a�d.�,��7�K�n�w�zv�6����q�������rv|���������%�y�*��!H�
�$I�k���Û�DT��@$T���+��X6�m�Z�r՘�N�T
fqA,p)��RI�s\�%O��E��w�P^�u�C���'	�k��K��L�z��2s�|���{�:=���גF���+^����uy$�p�ﰲ}�{E�Ľݗ>H�Ј����·�5.�q�ӸT\,oLg�qZ���-�Z9��*G))������0DO_Ҙ"�蛑 p6V�q��� �%�$����}���~b��c��ge ����u���*v�=��NӲ��]����q��N�f�+�w���'��n�@*������ͥ#��O� P.��L"�QRti��m���%��
,�Ǵ�w����kάx��f��j�Y"�Y�������s�l      �      x������ � �      �   F   x�5ǹ�@��T��㑠�_�����\9�ei�@�%�W�8���,&�������\p�4��> >.��      �   ]   x�3䴬H�4202�5��52P04�2 "3=33C.#N��d'|*�9*��bTR��SNCC�����7Ŝ����NCc�
b���� #�5�      �   (  x�]��q�0E�PL�?���_G@o�`o�5G0N)vJ
f1�?�j �����a��	���1���ʊ证��i�������|R����"�OY�`s� f]�y�/�'��"'�IB�M��ɪA�",��1~�nڛ�"��"��	/��/�/r���/����n�P�ds�|�EƄ�ىs]�k���o7��q�o�Ŷ���*_�!8]����֑g,�e����I(zygs�^7A��9�JMw�S��Ω���ʳ�*ЃU��ֹ5�DupA�ּ<﫚��W{g�{����?L�      �   �  x���In1E��S�Z )�u�l�L��؉���j[��}@��>_ .�g�y�р��~^�<�����|�"׋9)rZ��y��"�P�
V�`�	V�`�
V�`�V�`�-�|{���^�~��h)f�-�츥�����Rv��Ɏ[*y|���-uLh��ԗ&�t0���	-۟в�	-{�в�	U��{�q�4Ε���Q�@q>_�3�&��6B���f�g�Ϛ?e���NF@ҌP�P�4a���g,4͸C䙘��d�3j~�[�����<C��f�/&y�1��5���<#��GE���0�ښR�~���L��c:(�x� ��Y�w�e��@Zf��D��9��T�G��R>�ʌ����z�kCt�#�9� G���D���U�����x��)���D:����c=:��}�dIyT@9�ۜ�g��'x�Hq߸y��8�o�M�5��o��>R>�D�N�Jxoc?���|i���/Q1��      �   w   x�e�K�0�u|�i��.�X�B�BLq�^��BӍ�� :��Gg�i��;A��� ^N�d�k�!�����ʷ��x+��b�k<��O��Ҷ��&eY(���Yu�XZ��J��W +avO1      �   [   x�M��C1�K1���^�yV,%G��0!m�l��e�EB�P�R�Ϊ�_P\��5��.���~n�y��t��J�?���:�����R      �     x�m�K�+D��b���^��u<vg���$a]��Ay���=���X��Y_�Y:�Y!6=|�����5G�uf����$�L;g,�EV$Y�$~�?S�c�6G�v�b�S��qt���;��\���*P��?w�W@�tO�n�
T���n��{���{���+`���V�
X+`��U�
V�*X�����@���oQ��z�U(Xk`��u���:X�`��u�6�� `l��6�&��`l�M��U�:4�yu�	]�=P�*Ԡ(�v�]`�v�]`�v��`7�v��`7�v��`7���=`ػ���B�Ѐf��W���
V�
X+`��U��Y{��qB��3�q�=����r��o��?N|S>7�$9��ȉ�k��-N�o��p��X\.�˅4��7-�c��b�UYo���R�v��Q��'[�-�Fk�+�
^��yq����v�*���Ӧ8��S�8����)T�B�)4�B�)4�`k`��5���:X�`�3������k�};�y�i5����L�g�q��I>��1>'�p��ܐ�-���^��V��_�8�������'�,7GM��i<'㴢M"[>�xg}�]R6[�m�4��{�R�$E�n������+�z�گ�L��Io�k*��|�����GS2��z3|s��yes�o&�w ��䜙�3sZ��v*�Ukʖ�%d	GK��lq�4c�$Vs?h>��*���2�I�!Gء��*�P�g�=�(ʦN1\�c(s��	�5�F�6I5S��	�F�w9]'��(������{}{�&ϲ�8�%���I�����<	'G-J��eo'��}��G���)�M�΢I�h*NS8��$Y:�U�+��rv�H��ol%��Z�,ί(�^�<H8�{s��(i�?n���M��](�i|s��M�h�-My�'�i�@ͼ8��Kx���ZM��'�i�R�d��w �r#�B��q�b�_`�#���8�s墊�<� ��é��Ҿ��s�ln�M�m.���~���{|'?�=�w�q�'ǝܨ�����YR��Ge�Q)xT�-ca�����������7��4�4*s�:v�^����ܨ��8�N�kG��Q��Q��QW�q��wO]Y%��H��X��DIZ��EhZ��EhZ�aEXV�aEXV�aEX^��Ex^��Ex��s�W�;������oG�����Q������fW��"��,"��"��,"��"��D}��>�F�h�O��'��m�6�th@��׼ƚ�2�����{��A�;�����Ú�
i^cu�����A���      �   �  x��Z͖�8]�ޅ9�_ �9����C��n��|_����[�z6uR��Ȗ,�ڤ��^�rJ.rj�/ϋ�_���W;?�^��ܾT�J�������r�B����'c'��d��MZz��^���	N^0-�Y�ff��K�K7�c�f��K����Þ�H+�%]{S�_���v��鷸�Z5���'��w=M?�ӋM&��U5�Sv�O�ܣ"sN/>�U�f�_J�xɿ��o'8	��S����j�N�_K���q~Kk�fJ�x?��ai���Y[.w5<լ��kh�e�~�g_Y&^C�<U"�+�G���>d���9�pM���WV����C�Y\�,�2,ʂ�\�tӘ$&��x���Jʻ���>��s���]Xr��8�Fv�Ѵn��L�o1�Js�͸��_��r�e@���}�d�|�y.�Ҏp�}P��Q�,��a)��oG��'�=vI�������_y%�Z� M2��᜸fbH�Ix�y�	/%��Y�������'�)x���f�[����N��q���7u��2K�\l�O�["���M������X����oB���k����LV����'�������C��Y���4�f|D����[��$��}D��c���aPps�]�0qۣ̄�*Q��9�p������W����*��/�EI�e�d�ؔW��P�3.���4����4S;1�H�++&�'��fB�w�g��[DӾs��'�V��ĝ�#f��W4R�a��F^�y����u���S�s�!9�
.ާ�S���n� '1�2Y�Ǖ@!�6�B���b��𴖿����փ����YR�[EZ?
y{��[�H��������0���0(K�ٰ���U!~=��ЏT���Np����V��S<�� �I�����Jj�7�������)ԩx4��k�H/�u�$?��[yM�aE�XSR�,��Y�S��}�Of*�K�����ݍ�N�����_O[�5c�k�LXs���~2��Y���[H��l��B֢�"B��,��̔G�X0[��sU�d��IL�0W��	%���M�v��R�?�v�{��Ӕ�]�����uA��v��mK�R����p��駖~gk��Pi���<��̦^���;�S�l����D����u�'T�$b�@'-�cA����}��j�ב�[/�I+��pC���=���
����:Bɤ�Mz��;RY��>������Y6�0� 6��b�P�����X�ٶs�m�-�p[�"2�<�l:}�����#v7�}�Xm]vLX�`�ȓ�/Z ZT;�`/�[yA�0��ꆆ�y� �]�Gd7���	F�m����&� ����J�JRo��~СJ!Gd&�@Frn||�%��� �,o��v�{}Cb���ja;C��#cQ�=^
��z�C�l؁���(��O�E�'G�l���iE}��ߺg	)��h�F�P�}���	r��0���1�#&�c�#&,zZ�.���.�&�Z�svD=Ӱt���n�Z ����e�����Wr1��)�f�,
mb�|c=*�yR�'?y�IK1c�:CGL��ROδR��v�L�=�,W2	�b�F��^��I5;tM�eP�jX&k]k�1�G,�EvHI�4��\���Gmвڨ�(�Z
v��&����6+��`(_�?j����ea�7����+C1�;7"��j7ш����e?m�u�iS�/��VI"�f��x(R��5np��k`Z��:��D��S2��n�!G*'�� �.<���Jl�5(��dn!� 5\�:"Y����ά/-=���ؘORR�26w8+YF�YhL�Tg���pv�0�9����=���;�@v�iY����3�AV�n�!3s��s/νM>��>�x±q�9��y�G
Zto"�D����8)�}>f���h^��D�8*�x�Cj���IRpB��i�;�`�,���Gybgl)���*�,���9Pc"p�5Xo��@'K��"�~[��Qd�r�����^��g�	��k�`�+�Y�<��y�u�s� {�NG���D�����UB��W�L��	��Y!�9�*S�lIM�l�a����%~˪��W�˝��	{�1c��3�`��5�X�{����Yl /���^�^6M��t���	�������
�Ĭ<����N���`�N�,����P���� �U����=ʬI"�N�P�H�����0[ϲ�9�=�0�`y�,A���-5�qT�G}��t0m; Y�����B����v���*�=�߇~��۱o�t�j�;@�[��VO� :"�c��:R�KK�NK�cjy�i����Q0)���n�m�\\���ML��L�m"G��O䷇+WFv'�b����]Q�p�.�9��C�-�-��<��[k�e�@D9�8 ��,9�:5��],�A��]qD�&�כR "27䪥�8fMa��z���R��E6Va���P�arJہ>�������q`y ju�lS�p�#n;�g��R=�x7�81\�ՙF���;�g�5�����nL�����<��u��C{�Ύ9&1�E�!��[(B ]A�h,�kM?�h)�����R��CH�ᠲdm3����O�������PZ�~zk����8~�;`��Ȯ*�x��tDkd1��i^BdEN�C�`������3W���sFl�i��u�pW��z�;�~ؽ	���YL���_	�*�S����3}bL�v�,x�1����S'mZC�?ݹg �����UN�]F������0�� ;y-&i����	Qt�n��AnU�p��Կ-@&K�=��	�*�K������K�ף��1y���go�҆�i�=� �E���o��O�
j���U��Wmn ���@�-��>��+)+@�~��e	=�Ӂ�z;��V�qPg�qnt;a<JQe��h�8��V��&*�c�"�Ow$�Q]7���!��#�k�V+1k9s��M�g�`n�/��zbA)3e����Q+����璃��.0}V��r�[���}�t���I��m��������?�eǕ      �   p   x����!@ѳ�BEz�ED�/!;�`�o���n�.�)vQ���2���M\�A��YJ8��.�%]<�4�dj�TE>I�3QOɃ2����>L����9�_�� �oI2?      �   �   x�M�1nD1k�.�0���KFJ�Yi��+�H�����f�6����`����[�I�F�����M�-A�Kd��;^�EL�<Uf{�����ݥETy�uɘ Qt��`�ig�����JtX��,U
�Eģ����V�e8!D���D��D]q�|Կ��?u�@Y      �      x�5�K��@
C����|���_GK�zbO*)�Z��g�g����q��õ~�k������Ͽ��j�������?��=��{���>?Cߟ!��~� �~�(��(��Q�Q^�Q^�Q^�Q��Q��Q��9���Q�Q���D��^Q�~Q�Qb~QbQ��=DI����x�-���xs��9���`�w@0�; �����w���
�"���OP�����;<<~�gǯ���xt@u<:�:P���GTǣ�����	���g�g�g�g������G�^F�^N�^O*ġR�ġZjġV��6qh�~��A���E���C��09���89��	q��)q��q����aM��a�8l�æ8l�ö8�î��}�g����$�/$�/%��$��%�o$�o%.�$.3�˜_�q�_�K|���@ ��
���6�&$�$�$�$�$�$�$�$�$�$�$�$�$�$�$�$�$�$�$�$?��!
>$�$>$�$>$�$>$>$>��2��L�"�,3�����2��L�L�L��L��L��L��L��L��L��L��L��L�����%���@��� ��Y�%��+Ɨ'`����s��	 �%�Y� �%�Y� �������������Y� �*`���B �
	QQQQQ�T!�*D~P�����o|��/�+"���x��5�!�L�k�C���+<8����C0a�	�LX�`�"Q�@�x p<8	��E&,�0a�	�(LXDAC a�E$,�������"Zd�B���Ȅ���P4��fN�˜�S�x(�τ���3<~�bN⁘�x �$�9����C����@�PT���Px p(<8
������� �P� p(� 8R ʴJ�i�*�*U�U�L�T�V�r�R�Z�ʵJ�k�*�*ծ�]�o���v-��Z~۵��k�m���O�o?-��������O�o?-��������O�o?-�Z~;���懛1ʰl:n�Q/�(×N܊Q�/ݸ�_QX"��5\��)*|�
��§��)*|�
��§��i)|Z
��§��i)|Z
��§��i)|Z
���g��)|F
���g��)|F
���g��Y)|V
���g��Y)|V
���tc�cB��X��g��+�j��� ���)N�"��[$'u��n���-��e�C�Lq�)�2š[�8u�(�-�P��B�"
u�(��Lq|B�8>!S��)�O�w	!\B��%�p	!\B��%�p	!\B(ZQ\i���+X9X=�z4`�h��рՓ�'VO��X=�z2`2`2`2`2`2`2`2`2`2`2`�2`�2`�2`�2`�2`�2`�2`�2`�2`�2`U2`U2`U2`U2`�'ÕK_��ʥ��K_��.}\�:��uj����ש��SK_���N-}�Z�:��uj����ץ��KK_���.-}]Z����ui����ץ��[K_���n-}�Z����uk����׭��[K_���-}CC���0PS�>(
�� ��$Ԃl�Z��Ua`ӂ_�i��!(����AJ!(Ġd��A6-�¦Qش 
>��P2�B� 
%�(��P2�B�(lZ�M���0��0P2�B� 
%�(��P2��}�!���UW�E�'�8�߸&p,�~qm�Xf��ı�z�Xd=p,"а!bа!�0��Y�(�zD����B.L�	Q�0!
������F��E��L���Q�rf�f�bf�e�Rf�d�Bf�c�2f�b�"�a��`�9]㤾I��U�|�Y�KS�z*\�]*����T�^�=��-sF�R�����3(Π6���h�(̐.S�L�2%ʔ&S�̼�@}����c�'i�$�zW��0�.I�%�DX�`K�-��:�<��Z��$��>���+�{G���[>���{>��ӛ>�j��5B/�����F�}#��z��r��9B/����kG�#��z�H�z��=R/�����G��� J�� J�!J��!J�-�쉋�+{�*��U쉫�W�'�fO\���Z=q�z�j���ꉫ�W�'�QO\���F=q�z���5�k�ר'�QO\���V=q�z�Z?�'�UO\���V=q�z�Z�ĵ��SOܟz���7�W&s����	�Ô�QRӺ������Un�*�{�ݽJ�^�w��Wޫ�U��*��S�ϧ4�Oy>�}>e�|J�����)��S�ϧtOB\YE��WV�4V�4V�4V�4V�4V�4UѴ���K_U�tU�tU�tU�tU�tU�tU�tU�tU�tU�|���TE��Sͧ*�OU49�B�!Da!BV"�)>�S4�,&�~��5D��@N���5N7�_R�[�[�[�[�[��L7�VY�s�{ɭ#ZF�Wf{�WV{�WF{�W6�>�l�d��ͶO6�>�l�d��ͶO6�>�l�d��d��d��d��d��d��d��d�ʹ��!��ѷ�J�S ��9`N�S �������@I �$ {�=	��`O�'ؓ �I �$ 	�B�� ,$ 	��ѐ ,$ 	�B�� ,% K	�R�� ,% K	�����!��Hbu�ˊC.+��8��ˊC.+��4�Ґ�JC.k��5��[�5�֐�ZC.k��5�֐�ZC.�l4�ѐ�FC.�l4�ѐ�FC.�l4�Ր�VC.[�l5�Ր�VC.�Lq�`�Xq�`�?��`�?��`�?��`�?��`�?��`�M�7�4Xp�`�M��<����n,�i������,�k��.=�K��ú��Oz�'=��I���}��>�a�q��E�L=lP����A=lP�Æ��!=lH��æ���W��M�aSzؔ6��M�aSzؒ���-�aKzؒ���-�aKzؒ���m�a[zؖ���m�a[zX�ϸRK�+��C=�P;����C=�H;�Î��#=�H��î��+=�J���n^��v��]�aw�N~��ϮR~~��{W+��b��U�O�&�5p�]'�5rB��	w�p��	w��p��	wv縱=Ǎ�9nl�qc��J�7�踱I���ݻ�t�է�Fwu긫U�]�:�5븫[�]�:���qWÎ{ޚ���׷���[V�o]�W��
?\�W��<\Q�+�p���Õ��J;\�+���yK�b�孅+G�r��>�*�r�w�*W��:\Շ��p���W��j?\�W���<\]���p����5��;\�K�;\�k�pM���5s�f�~�k�p�.�o!\,ͼ�pm׎p-7�&�k��-��P��i��h#��>��h$��N��h%��^��h&��n��h'��~��h(\fC�V�� .z
⢩ .�
�sM[�ւ�h.���B���̋�{��/��_|�����y�Y�g�a��qFd��8%2z�x����p�'\a�+�p�;\�+�pE���s�bW~�+�p��|�+�pe��Õ}�rW���p����U�pU���Uu��W͟��?��.fo.\,���pu
W�puW�p�&�$�57��)��	m�p�M)hL�knRAk"\��k�õv��׾õq�6����>\;�k���
qѬ�ʓ��$�hY������Z������[��ƅ��\x3yd.�=�d�dK�d+ek9eYe�����Yv �慸�^L�[3 ��=qq�����O\��'.n���������]|��6>qq�e�50m�3��@���/\oW|�+�p��x�+�pE���}�b����'\\xs��'\y}E	W�p����U��*;\凫��8\����pU���U�mq�_���-��W_���~��빸�/\}]�������޿p�u^����ދG �k���! ��t�����Z��l�	����ڰ�>l�ۿNl�ߊ���kƾ�n��kǾ�~��kȾ����kɾ����kʾ��x&���]_�S���:3��a<�ތ'p��gp���p���p��' �  q��gq���k�x��x��x ��x"��t$�75j<�� O����T��#9�Ԯ�H��a����z׳�X�p�um<�s���m<�#\q��W\���9�׽�p��o�����{���q?_��8��W^�}}��丵/\u�7�������>o�總� +\�	W�p�W?������u��W���=\����5~�����5�����>\3�k��s�_��\�vo��sGP��\=w�k��sgP��\=w��ۃ���A��!qq����Eț\=�9����E�&W�-B0�zn��v��{���MB��.�f�v�����ōB��N!qq����WH\�,$.��5"�s��0�!��MI��kB�x�\=�Ԛ��s��TkV���sZM\�W�;Wϑ�pŹz��+��kl͛\=��r�[+�\=�����sl͟�zέ�+��sr-\y���k��s��^W����Z��\='��U��9��:W�)�pչz'a�>W�#%7X:W�c%����y�D��\=��W����s�<b"\#W�3&�2r�<c�#W�3&� W�3&�����p��z�2�=W�s&µ��y�D��\=Ϛ�O���ϛ�Fg��yℸx䄸8+&.M����sbL\����Ź�Fq���s��kg��9?�<���s������s��(.W��zr�!3���s���?�z����3d����8E&.�������s�L\�$�;W�Y�pŹzN��+��s�,\q��e�s�:8�xq����+��� �p�z��<Wσt��y��Ɨ�7�<W��t����4��\=O�1D���4�\=O�i�y���鄫���@�p���c���:��s�<U'\}����k���d�p͹z���9W�M�5��y�I��\=O6	מ���&��s�<�$\{�����k���p�\����߿�e��H      �   �  x�5�I�,'�]��Kf����9h���Y��1�Y��W��|`ۿ%��[S<�������5~��c�:��y~}�}�u���O}��s�o��+[�ů�j���]����~lb̚��*��}.���A�O~V���-np�l�Z>��j��d�y�o����� >��o�����}��
H_������Rx�b�yϻ����*�{����������@�Q�﨔�;��Rq9y_�#�OE�)����
C?�A!�"�FU���E��R����/V5
� `�<�9*�u5�d�r.jH�9�*�>D�d]�P&����C?�"O��Py�۔�z�<T�6�-�k�!�p�Ґ����"O;4�-�����AJG�b��*�uu��z}>T�v�m���Ł�ͺy�)�~�<�衛��x�<���7�C��T���Py�;�����y�u'���P���M����H	"��B�1��C���E��R����Տu	�,+ȺDN����p�=q@&0/np&@��z�{�<�=�c��"��.�P����P�L<��ص��!�/����W�@D-˰�[�����'���e���g�����E���/�O͐\8�R��+��.4�"��"�64�y7z�s�ݥ��f��?e��h��e[��_7�p]�y���FvA�s�z��aaV�ٞ�ލt+	������7�N'�$j�,�@!3;�ꩋs��X�j����PÜR��j�I�`���c��-� O�D(_w6��$U�k uu���^ s�����PT6��~j������^�T�1�����fءwI&��υ{>��A�g��|�S���n�2?��A�������9������)��O�B8�Z��'�=Q:G���g�IV8K���O�$�$*!��IS��,%(���������aG~�B�hz)��#�~�M�%��O���$lv>�вR���ƺ�+8�4V��w�*A���!�P'H`��|\���RA�� #$�4|)�X�*Hi�'g	Hi��MvH8	Hi�DO��o
J��y"5�`��3����G0H��Y�@���N��"�J+�દ[�}YD� Ă�AҔ]pZ����_�fe_e��7b��
��1�^n5��r|���\I���i_[l��kv���ژE������csr,���L��*�z���${+��(T�ׇ25�i~1��z�b����c�f��豤�
gq*~�:À��R��Ij����Wj;SҴ4@�)�JI�g*�S^��L�[�*I�����T��&#��^I��w�OVE�&	��cvݱ՜�Rj���X�	��'���.
�'��֠�Kpȇ���㏋���`��X�b�F����|�cߵn�Yѯ�5��J��C�;5"P�B'x����+��`��:����͖��O��Zx�xaC3 ���\;U,��Ë��:�t� _�*��B�:e����>I�G�����q������}Yd��B�p^��4,w����I�m��n�`�+�䄥Uv�wM<)5PA�׀XI۩��`F���x�K����6o���ƍᄈLf*���,�IYMjF#����u���fu��o�,*UV\������Zu_ܽ֋d���Q�|+��}_��{�Mv�#�����=_Zn�jq�F�ٷ�a�~ҽt�
���vB��@��=l��h�t18 ��?6g>��e񍂗a�I�;L���j�3HS����Ҿ+���Mo��o_G��6y�S�l�B��1a�Ƿ�u߅��G�н��v�b�C�~���c����ܓfvK���vz��br�v�ެ#1�[F�gI��q�ק��q�Psv2���ҋ*�h�	N%y�EtJ���	�_���_:b�Ӱ�E
�ZÆ�T��"�4y�j��9�E����B������q�ZO��"��vൕT���jX�6��s7���w@��!�` ��Py���X����c]��J���C�������y����!�D���;�\�cݡ<����X7�p<D���j�(��I+%��C��4��`�<֝�c��*�uqHdQ�~��W��`{�<��J�W�">uyfS��5�s�FЬj#h`#T���5��'M���m��#�UA�L�"�	��ಪ��ǺGy�gcT���Q��0�<���h��0�R3.��f\�� �}䋬�o�|��o�\�m�/��y�y�y�y�y�y�y�y�y�y�y�y�y��.�����}�AnߥyΚ�о� s�4�xdΞ��/O����E���\���<�ӕ������;�%�t����l,ޜGx�كڻ8]�vu'�o�T`I�b��3�*��'ui.כg��3����_8o&~�՟����ɠ��j�gnX���I�r ��;UTǖ�K�'t$O������;�#o�W��z(�?�y;��>�Ze�7��Ff���I�`a�^�cީi�hP�Q��֒瞾ν�T��dzzb���Ӓ۬'�&������7�t}��YI���s����:N�H��y�Y��!�5˝�Z�y�T��Xׂh�b8�s�[Lr���w����h~I�ٜ�}��>�F9_ꧧ۱2�a�q��aDf�y���K����Jñ�-1s^#d >�!��))�����nS�՝)Ek�B28Ly��f�ҁ�2����D��g��!�|s]�㍚y��'�%��6�1��To���$�i�ض��l���u,�mƯ���>{��n������h����5[�t�)R��������Q�s܍�Z�[����Π�A������ȼ�d1��Щc�8~��<�DcX\[�H8��Փ���ˀ:�lP���P���2��tg|q_r#~��N#����3D��>������Nt$�(tH�2ɰW��P��(w�g���=U<
���	�f̩I�������|��~����3IYw�����[NO�;m<3�����n��J|ƌ8�R�w���3���I8j�\�H�!#1B�[��<�Y��Њ	�f")�a����ǖ����y����_qd_��ƴ�Y-c��)������݉yS�a����ɜ�}r���ޓ{��wָC�t��ߞ�ɝMfb��<�r����L7�Ȱa�M�6�N��:�v�pm���Y7��z�l3��B7N�`�\�X�n$N1��a�\_����f��`�ѓ|"3��$�'��3~�|�s��9v�M�?�}�������}��L���Q�5�0�FN\��-n9�Ȳ�[X�K��-X��Ȋ��{�긪�?��tI��r�n`���ii�s�Y��q4Rb�L��)~$��֛������}n�x����O}ct�F?�1g��VM��?%eQ�}=��q�r�*���I���R�����8%��S%��REf�Z��<=%��w�~�5e�!5�B�����������}���z
e������{wf���k���C�;y��q��]��m3����LݛD�	G�)b�o�h�'�|V��Ǒ팃k�����K���nzG���|CMK�~�>R.��ݔR��9w��{Qc/���A�\�<�/����i�W(x��������;y���{���!�Ȕ��i��33�:�N	�\w�Kߘۦq�m��k��o��ۭ#�@U�S�d�;۹���z�s��gV#lB�?O���;'��)o��V��R����(d��?8��0K��<)-}��WN��r+���̝S�]}�Q�n�f
�tG_��3�������#��[M{����)ō��%���[w~��?���?��Ui      �   �  x�����0���*�@�#�õL�u쓯�,hy����C(?E�]�����6}i�VV/N�!��$�##�QwL	&�@�"�H7 ���� R�^gĥ�Jv��q~�s3!�'Z�J?�V�1[e#`�#�ɉBv�U�h�{bX�yR��1��$��A���D�5�1CwRK7�� '�Ҵ�e�{6����ވ�jg�QM�P�N��%�'@��Y�iڼzR铘40�)�*�M@�FT���qK���G�p7�����",d���;av���JĘ�ʆ�6:	+$�1Y�ѨDn���\G���ĸ
�~	);)c6C�'�`!�����	]'	�w�$��nc�|.վ����sH��9��o�K�.���$n	����M	G)��zO�/�"���2:/����B���˲��U:      �      x������ � �      �   g   x�+,M-.���+�,��b�8��Lt,t�ͭ����,���M��Ȧ!�0�J�+.O-*��Hf)Y[Y���#��]��=... S�,�      �   �  x�uVY��6��N�h�n6�9K�A�l�(����ߒӧ�y�G�\MV�"7���f�q}�趞O�e�z��(����kSVq�I'rnD�U�J�cbǲ��x��³���+�L�zZ�U?�'��"1���r������0|ȣ�BO)�æS�y�n狾�rmov�)4�ȣ��G3u�k���o%%��8����|�"���u{�Ο촴��v<M�*U��L�r�:-�tP�:̺IM����X����ٽ��pj�F?�(N"K�>4��,i(�AȻ��r�9<p��߶�۩=��T�eR�pG�16�"*�F�.�,jY�q�PJs�ڛ���	�I�����նǸi^u�#���e
ջ�7͎��ϐ��˜��v^�}��:���k (��a�{�W�ڔ��>pi���[=��w��#U}��(PJuԫ+=-8�W�~�KP^��~]�������ɫ��e�
8j0�ܗ���Y���#�����z��f��If�ݍ�����!9Rf�vg��2C�wj����j�;7z���������/��?�j�$�Q���Ь�[� ��'�M�wgJg�����#�������f�k-㠯S��F��a�r�*-x�Z3x���}��9%D\�?�|�zi7��q9���o�
V�|&�E�!�0"��T���=C��g��v��~۰�q�,G���"Ԅ��8Jv\�h�8����K"];�Y|B�A�3}X��	6��e[��/0�k�F�X��v�Cl�=([`�{��ۗX�1�L�1�]�w����a-�f�m�$�� ����Vb�����~�3��_�����	z-����O�m�j�"�$�g�u�2q��'���q+'�<�_���ʗn�k��Ǜ鞕h�
z��l<��Z�<���a1�J��4S����݆���Y7������1R�Y�^K����I(-���p�����n:���'�u{�ćLq��#����j�:1Zֹ�C�G�����T
���4]�r��w��n���:�� �u2i��8��ţCګ����1�̻�K]_![�$!qȝ=z�޻x�Rs,�j���5�q�!%�}����A��;KO���k@�	���
�b�R��<�]|B^f�Y�oM����N�K�B=B�at�g�o�n�$�q@�����s�M��:!��}c(0A'�h(�4�����WD*u��AH^��A���ᣤĀ:��i�� ��O      �      x��}M�,�q�Z���3�&�2�������h5���� [�Xṁ��>'�y[��,d��m-�c�bV#�`|T�b�TLo���B3Rs4}�� ̜�7�����_������Oj'o���?����o�R06~��'��M�gI���/���������~����1��^z���uI*Iw�}��98|����w������ߠsb��?������_��~��.������q��_�����t���1X�/>Z���T����K������ˣ���Q��Z�?߿_3�������������?�������o�������?~SRH�P5�r3�Z49�afM�2�<��7����[�,��C��	%tS9U�[/.x�<�o�׿��������S6��៬�����iu'��h�.�x����k\���Ça��q��O7
������\86�P�&�L"F�[ŷ:����p�S�	�D���N���S�?
ǯe�b&��}u'�)H_�%�^5'��jt~̖�A6�fw�hx-����%3���lb��i��\���F���!��\N���GmcS񫍫ٖA�2�m�3QϽs9x:7Y�Wwr��p�z������R��m�^.�Gb{�A�K�|�~.�YyҨ���ڠ��O1��S�ٗ�!�`��1��� H&��1u�q¹��Dg�Zi�-��x��Ww�q�U	��٬����3�pL��{T��{�jM\kͶ��p�#s�wр�	�L��2�s�<C"�p���5C2�͌Nk�$��lL��D8n-����R8��Ww�a�3�$��H0ol;l ���l����|'����p>w?N�!G?���=�Z�9�i��\,-mP ��lI&E��r�)R��{�	_{l��q�ıM6��M�d�T��S��&���F��C���I�Yc�w.���'�oA��/��;Ww���֔K�)ɕ��ï��z u�oP����ǃ�Q���@��vk���8�ZƱ4S�ғaۼ��!瘭8�)�aLG�F�m�����Δ��J�� [ �s5���]ù�!��C��E?���J�mԃ�r.�{uP���c���� � ��aE3%�ќK����H�Tp�%�ou⪢Q������tݞ��	⓷ ��/�����4Q����߸ג��A���Q���M^�f��\4k �X��U���ɒiU�V�%��!�B�0���G�3UJ6�'���E{b}X�&�QI�}}uO��,�#4����!�O�g��[:���ܝ���k����5[{�hH��lFJ��_����U �oD�#c�H.�&l�-�ƙh��hrr���˿���|@C0�J�]�W��'D������_K4��碑���9Bu�� 0 ��2� �p�1X�%�b�$�7�3)٭f��O�5��&.E���t��_X�kMΝ �U�-�W�atO�h�⽲Y�~>w_ >x�i���7^bJәἤbq����^�l;��L�b���1\����,���¡������__���قY��چ�8˘�q�6셓3��Y��m�p���=�*C�� ��#���܀ ߳�ŐU 0�0��)��
{w"�U�����g�f\_݉�Ի�&�l�&3��-��q��&��5��6_
�\=M�Kٲ_�L�=�,3�`�>B����*w��tΉH(NY��):�C�ū_X��Z� |��&�<:
7 -��O@�����:&����d<�l���C<�e��D�"X��-(�@t<���@���5�r��Hf����d��������C��-�Y�B�s0�M8��A�n֙'�����%�x�>�0�&�F�҈�I�wJ�9qL�C2��a�[̻NH��U|����bx��:(�כ�������Gh���\�,OEh���S���D�m��4y暪I#E�o;LeKf4�"�^�'�Mh�7@2+�(�,Y̦C�Xj���ӄuH�����M�/
#������e���=�'�<?��}l���2'ny�䁃�#c�`�H�&�
.��\ � �B�������u#�dO��ִ�죓x�~au'��=��ʦfWC��A6;h���?^����v�8Ͷ��d�O������u�}�n�TfJu  m����3$�RW�D�蓮>v֥�P�B2�@o,psg�՝d(���Ơ�����up��YM�w�<�8o�/b.�lb�a�aXd��Z�mar5����M���J�3	x�D2+O��o؝O}�K�;��������8f���bk�4j�N#�F��f�϶� `����
�0����@��k�]#n��s�p�����ꗆ ���>ص(�D4O��A#����D0�3$3����XC���������e��m�/b��1'�hEW��hA�8�7%@Q���0�:k��0R���`�[]
�?5%�B3���	�����+�gm�@�c�#����M��f٬a����h�s):.&�����kjgl�/�L=Ǿ��z����'X?�~I��S�#�3�Y]
|{hNP��}u��@��BU�c}� �A��YX����M�-�l�/���xՂ��������P�<�8n�g��a@b B���	N-�<͊r�?��;-����KN:�;hO���� �p:`mR�9��7�O��>6_%N�%�L-�?G2�k6T��n#[�-� ͠��?r�7��a��@yl[o�D.+����ɧ$gd��՝hb���Ln2�]���i� ��3��f�{�m�E���D��J��1;D�lrvvz�� M��h����$���$��F�z�K���n�Ol�؞E�^Xܣ�8�sЕ�xf��՚�h�C;g�n�'��c�E$����t��:��Ug�����4C�u��w�x"�6�C<��`x�HV%�i��:�������q��V��J/�&dGaDMo����8�q�^�<���v_��<�:����X3n*���6��e�^vl ��S��v������.�_pv���f��zȜR/����G!i ��Z���t�x�P�͊��Ͷ��h`�sp1$#��[ c�9�̱x0k�;�0$�$p��,�9��d7?��$L�V���c^X��{^hؘ�]��'O�:����@?fX{o4��рm�E��ʱ`�o��6WM���m֒�vWC�+]�V��*~���zr$��'�4kR��f��xv����>��7`i����#�1@���#㤀p�d�ݢ}�|�7g�ZZ1�3����̲Tj���Zy�IG�w(T$H2��MЌ��M��	�u�����B-����sn���S���^4��G�쎣v��t�h�q�m�xΎsm��8d�#���_>���g���o�r�h4�H/kRd2���t��RC�8�>tҧ;��W����u�\85� �E8�J�@X���o>Ͷ�"��G�P���x߬�#7pJش��3�����d�\F�55�.�jn=��I6��Ũ&�1��{�4h���%�0ĪQp 	Uˊ�F�0�h�Ϛ�l�/�s#�I�L)Eo���>@��J[J�n�M
�@�f��Ʉ^�@�@@�̖7	'��I*MV�x��_Xܻ������6� �e�N��H|s	=I���\,�g�p����s�?���
xJ��42��a`����b�fP�����d������e��M��������}� �D���Yj��S���zȆ�$)����.������/��ԆU�� �:kY]T���@?/g�X�� �S+`�_�y���4�p�~�̶N���L޳��V��k�S�9�6gg�R^,��ls�����ެvzY�v_ �iS haçTz͔\�:�0�1$0�oZ�*qҺ����>``Z�X�����Ida�1E�F ���j��=AJ>�lCo�c��|8��Oi������]�k��m~.��x���6����$�`ʰާb͛d�lMA���#4��r��G��H�j~�G��w���7��$9��/���F��Ǜ0�]k��#�R켋GId    ��rg!�:���"-R�Jo�� ����o4˰�X�'�l!�E.�IP����v���
��y��k��̉��^_�g`���$�9�XCZ�,'�!t��nN�'T�c�Ee	��L�}����qs�iF�|� UW�o�Oe����?ʬ�'_�\֩q��zu�����^�0%�{n�����t�|�)�Ov�Qd��_M2��˫��%zE��^�#���%�����g=���R8�-T$|^l�P��r�Bz�t��	o�ήV_Z݋�XqX�į�p��9��-R��f�<	Rl�/<W�O��
�
ޛ��{�A�j���[�����Y���Zc� 㘀i>�f]Èg΁b^�����[���\-�z-��!���^>�,�'�$���Q�,��H r�P���Q���z��i@�V�4�	n(�HpM���|�$�W� �u#�9G�+�}}u�k-L����1���Q�� �W׎�=�f���W��}q�:&T݉Ich"���;�C��G�["6xQ* ��k��@��� �_D�ΐ�3g#��}uOq��P8��Y���5����U%��ro ��)�������Dɐh�������mByl&��v1��XS����j`V��xg�NHJ���� �u�/�9���j�V�i�^��p�sM\�kAB��uߏ�y��֗�:������>`��1h���Kv h~I�&I�%? z�j@y�`-@k`3̔8|���YG]��@�B��V�5?ÏX8��3	F -�.�;�a@���N�?	m�/C�u�����o��x,�pٖT�x��������8��>=�e|K�x�����忰�OYh3���S��ׁS��>����z���QW9X����k��GS�6d���� �Pҹ�����:,^��Ec�ZPN�r�A4��9����V�A��W8М5�Z�N�+��q�,p����_�$�d�}Q���J����U J�� �Ϯ�ϔ����ON�RHQyZ��Ύ�K�?�|90�ӫV�﫫��A#[�����V� �0���8����??�5]�쾰=����� IIZ]Z��`�6 �=�G?0�I��tS����h���#_�^q>�Z�]�����;�,���H%�!2�x�cr�e+������m���lZ�4ދ�&t"�qŴT���J��?�D���)�br���K�9�)?�fMa��b�����=��i��Ϟ5�z:W�� -&(�������~��6_(U� -R�(��K�?M�;���rU@��T��8:���[<\E|rk���x�87/���yx\�9�v�T�5I�oNK���v}�|s'�'1�m�s9:�.�i�*C8�K�5�>�6�8��l=ph��+Nk��K�>�G���.�\�^!y�G���V���!�T+i:�MvMZ����t��'8݌�����W?�ڮɫZ`���50)u��V�[�X�'ڻ]�Z��ߚ<d�BQ� k�Ѭc�x����~}�� 0W��nUмv^p`��6�[��{|~���}Q�2�#7��l��e�a-l�,��&�Y:c��9|_״ʉ�>��3�9��A4OW|K1��������J,%�]n�Q%����?滆��U�'�m�E�k��L$���z���3���s�g�/'8��ue���� ً��@r��v�� �u��SN|]}au'۵{+�.N�^�H�8��9-Z` 1B��͓ ߶��DK���o C3�wm�h"R�`a��Z��i���/9SZ�kk6)<91h�ثײ"��B/���Z.=w�@��jt�qiL9��=��ӽ�W�$������pex�p.�. �	����Y٦�qסD0�����8�$q6S�o�&�p�G�ث���a�����H�@&����	1�t�I{m��������n�/����P��&�܏��j�oo���Ԩ|v���9�޴�JPk��4�!(��I���ۼ��f����|㫫{�=9���d;��)@�{�-�����&.�I�����Z#��F�ҤQ� H�]��s[t�'I���&]�&%�h��0s+1Wg9���d<td�Ý���{�T�u��p �N`�]����pg�n͓���MMv����Ѐ-�ŀ�C�b�(¦5%�޹��0���� (��-b���ua2Zy~a�����B4ԕ�Ɗ��hւ~	��=h)'���O����Э�V�3�:���a����-���2I��F�%��� �fr �1l��Rw'��Ko����Q��˿�z����F�
[i�e�8ē�����&nh�{e�l�/n�xTMZ�pZ�&�S�d%R|����w��^��M��&v�LC��s' �q(O���>g//���*SOQ�{d+v���W�Զ�Ǽ�����P�s�E3Y�B�����(��\�sE�m�ƃ8_���, z�ߌj�L�L,��3�����S;b��S$���ި���ɍ�{�~�Z|��p>����h꽢YG�>�^\'%X%�2l��&�
�F�F'�����Z7^������/`6ܒ魤DA��π����N{����ך�iT"('����=�٨��=�n��<�m����&�äj�=��M!�₍tB�lo�����W�Ngo�Q�izH�[��wȟ��9u��xH��Z��/%�\��vP�'9�3�ts7��V���W!4�C�W��#�R��Նu��F�]1�{lm��`�wv���pK�n`��W.����k��\�>˩QI!��ZD�Y��U�P`�T��;��~m�/�]O���*�g���A<I�b�F7._1�2��H����1'��Ǧ�!C����Kn�^X��%�I��TZ�<�\�'-��|�<w^���U�gi�/b	o��`�V��Ss�&&@#vɂ�lW'`8��mȅ1mê�=d�?�Zx搳?�h����>�!2���S��K,�9m�Ѣ�G�
roS�']��QlpT��MtЕ��@�1&�����]e�X��x��b<��!" WϙqBϚ}Z��k�Q�OFXٿ��ǡR5��k�# �x�$����X~�2��e��
f������R{7e�D��n��e���L��f(��j��ܼǉc��Y�=�>����R�_X�_%�Hz�k�A}Ձg ��q����b��Iz��E�e�}5I*t���H���6�G�����.`�Df���::L�yQ5��1w �����&I9��g���O��)pT�I�dg��C3.�؟#�[c{�����B�� �U��6ܵzv6�|P{��gy���F@z-�uz��g5��ڶ;�S�r��q��D��|n�����091q҆���{ڨ��dx�����>ng�L����"�K�+��F���ʚ�Ex�η��/��r�4{ZzkX���/���YP��-��9�P"�}W������S��vܣ��9-��?��pG��E���}!9����t��SW�e�Npؓࢶ�F��DO�� �C"#U<�5�d(�x��}2�R��2h�yV������v� �ҽ�-�L�n	��r�R����I���W�g�|ҵ��F;R�Z�NZJ�4����Vl�<�٘F�P�	41�8��v.�5}(oz2�0�7f��K�V����E�4���N��6���J��B�NnN�|ґ�s�E��OݚV���ܼ='�)5)�-x��Gg6q��wSq Ml9��Z�{�8!o����K�{�["��? �P���Nԏ������4�gY��W]��ނ����M �*�����Л~�o�q��c���j���s��MO�A��,��W��)�*�AAZs^3�2������������g�������$O�ӻ��\4�1@���l�-�l�ߤ��Y5����G_�NL�3��J��}\=M[ ��j��h3�ŻNizz(���o4�O�������C�;��&|��̙M*Arg"����� �kk��48�<U�*)����'��    �j���C�K�{ьQ���@ʛNi��&&Pk��ig��ڞD>w_ 4����s�ٸMP�0Yef	^�Mh��:,4gM�2���2�AS�J�>j�:�g��9}au�k"�f���ӑ��l�<�)S����7����|�1笡7ea�j�b,�s�z/m���L����{�(�;�E��؞�5�Ν����������'3���{�/%�VJ�!��Ѡ��]������}�+O�0������H,���:3�Z�[��
��j������-iUt�� �=��u(�7�иsN���>�$+瞪v�lmo����/�txM���K�'���}q�޴�/�G6K�k��E�ƻ��q�6�l=�f��*��6-�7�!�:j�낤��z�����\���*j괯t��NA$���!����vW����-;�e(X�| �����u�8� k�~W�Gm �|W�&/��+r~@�k �:�P���:v}u)� V�#�)����,�!2�1�n� �$�u�|�� �f�I�� W��D����l5�eQL_���E�z^���9@�zܕ���'�+��,x��A�VIa]3�z�R�L8)>���S{�����7�>It��}a+ � N���m�ա�4 �r����2�q�VT{��P�F�P��#/
C��!L߹���j�����}w4,Uo}���j-���]n��F��b�vv׻ސk��iZ����^�_��jj�p������@�g^��f}T�u�g�����/���	���K�4�"ņ���H�Xs�ps��'	͟����%8�[S�U�6Y.��Lvz�9�3[@�j%S��64|J��Byg�I���C�ٓ����W#�_X��
P" �	c�p��N� w$��PC�.݌��>6_�\k���/�k��`͌}�uP���Fm+�zO��Z���7�t:I~?��t@��4~����,�$���o5\�~��S��,yV�5sx�Џ=> �o��t�p�|��ˌNɲ �%[�t&���+�l�M��:g�f�b�H�ு��am��|ȡx��@~��"
x}u��is�6@�z mTP̅(�t@��2ӝ�$>�X�v_\�sw`,�4�E[N��Z�VBQR��V��R!˱�Cֳ]�!���m�zdf ͳ侗V�Y��[�y�G�6-Ly���0����d��#N�|��t�	�1��z��9!��}��\D��f� ���aKZ�^�N�Sb|��i���N����bq�����>��Z���٦R�)q�D�r'7�yw�q���m��!��.�516����6�61�I�<�����I�r#�����O��w����.79��u�������߹�����v7�N���FΖX{����� ���oZvb^G�>�^�d`�&F��L�w�՛���*~����@(U�4���h�R��(�>���Φ��89�-�[D�����|�A��6k���C�*\��xV�o�¿(珽9�:8!�`2��<񆣷p��������G1:�Zˌt�k�)��` 9<��_�L�L��i���뫇�b������*:�7Q�����7WL<��}l�`���$��?X푴�\�F�eXn�&t]���Qfҙ�0��C��Fb����_�4~+���z��7b���;Pe[;h�������������6_Ļe�fo���}6�ty�F��"�����coy�v��B��L���sr<�cK�_�ܗ*�	?,Ƌ\_=��ы���(�
�f�)F8f���X�+�~5��6_i�hR�05���3{z��X"i�����Ł�:3�v�u�_���'��O�p�0I�7��i�������d��rMl�Nt|5��-5��f�^G۷���C���t.Lt���X��:b��5�C��Mhl��hQG �,0~�B�;[ktr_
ǧ7"�����>�j�i�����f[�Ҋ����.���!������6��%����N,��mVC�R���H5Nf��ԡ�I;h�������%A�&gMZq�뫇�Qu\���f���0�e@1��t�g��:.�y�|���L�Z�ϠUR��E#�$���[ǚ�n�3���T���>
��vaX�Y��ĕ�Ő-4���>�GBFI�3J9��7�v@2��C��;9?�k���SS�i����k Xy�h��m�F:xY�S���Zʠ��,�X�e�jQ?*㉇����g�u.��{I�j�Jm�v�;�+S�l*~С�S�ab�/��g珽��Ҕ9�����g4��];!��������GNm�5�u I�ٔ��٥�u2� n�/E>�[�Lq�����#bYo��t�9,vf�-vP�����|C��E�m��a�ű�jZѹd���b��e�c��|q׻�7"��n��;!;�m�,�e'��g��UI�x��N�߹�/���%�m�spRB=��#�T�<f�f7�^Kz�|��օ�_c|ԛ
P`(��R�L\�_�~���^�tJұ��u͓��f�xʭ����8ۥ,���Y���I��D�H�BF�����D>H��t7�Zc�m��α�O��&�&HԖU��g�}4K��i����jB殐��%�ju��g��"���p�i��.�F㴖��c���r8ŐJ���6��v�E	7O�~��>6_�h���h��
튝��ʨ�����@gbIx�8DC�z�\F8MU���@U�D��@��߹�S�?��s���I�;V��Q�����4��Q��7�@n��S�7���?|{T����}%��&㵎�����tp2�F��D�;��Xi:�%�����\(6 ������b���
�G}p��|au�i�p�t�F�j�=�Wm��=�Я�Y�n�_�������۫
��1��uny��v@dZ{Y��$��%͒�,ӧ�N�0^?�.����)��&锿�vJ˽�y��/��#c���`����t.���3���L&�p�-姤�4��v_5n�N�B&�H .�#u���ET1��~:��_��ϴъ�囶K�������7Y��=��S^��)�K���>����\kıo�m�3�U�B-'{�v{5����I�ݶ�}C�r�y�e�t�L�Y����fOe��x71g�_5�b�3H�u��D�R{&�H�K��o�9(�4���,%�ٕZK���*&s��cSG���d���"��D��ء�#fp��{���K/�Y갤	N,�p�밠f��Mq��Q�3Yì|M���m%ͫ�{Y�<�t��C��ڶ�'h:�z-���^Q��ƶ����,���kY@�P��%�ij�-�^� �&4�۩���׶�Ì�-�$<��s��+ro 
�0��;V����IS���#@ĵ�2�������\��n�;9����U[Ӱ��w�h��Β��.�V���^�>7����H��k.��
���"�䛤S��L�Oi�OL粼�z�6R�/
x��@L���QjP�t��Ƨ��4���|�	j�"ȋ�Cks�8t�l7�Zgr�_��]���emf��,R�r�N�QÉ�f�� 9G�]0����Il�E�)Xn%h�	,]��vTҁg19��ₜ�����Vf0��~#䩳��g��&qE�g��ښ�� �6���e�n�6g�HsƓyЛ�s��L�OY�7�ӡ����=��)��i�L�pUB�+�Ds��Y��f��yo�/.��c��Kb�:�1k�R���1���Ot�=���Z4����p����b6A�������BN`�_rl��\��W��
^��/8����_�P�YB�<�Ǣ�������������Ĵ4 m���G������\ד�:�h&�F" W���K���I�ڼ]4I�&ir_2��-z)�߱����"9����5Z���#�k�x_ǹ*��L�H:<���i���i���!�G�#q����@��VRql��ɹ��-�eH�u�����
y��Sߵ����a��,��v����7�M��妋�+��m�E���g�0$A��u���9�6��X��l�^�w2��$4�S�����G��G?0�DbX`��Yk�/�   ?W��J|�N����P�!C0��n���/�/�4���$�>�I;����lK�ܙ�������up���1�;��Q����cr�vq/��"ޞ�#����׈���A&�Ylx#�-D�A��<�m����Փ&���&�uPǃ������H��i�N��:�b��c��C�����h()~q�ʳ��/ǻ	��,����b$҂�u���F�����p�� ȼQ�I���}�2͢�5��in���@��T7����?ָ�aC$�>�C���ji���ޚ_}=ڭA̅,����ƪ3֝�p�e���K�7���l��!����Z�6I	�:��*r.�k�`�	������V\�f�3��:]�����
m���?(֝�� ��W�5X�K��YJw�{>B�9���t���j��m�E�F�� ^4t�4�bt�����2�k�Z5���R����(��\�!�p:��F���ve����M�6Ν�j�fC��B��`�`����f�^G����޲�Ғ5-j�}��Ej���)��b���&�j�F�����`} ��5��O���1�%�u}��?��=���8�ϐ�c������7e�^��>����b��f��F���#k'�Coe��3�*D�g��{/�$�΁�Ks^�,#>���j�,��-=���c�Fj���!�44��*it���GF}W}΅P��B�C,U=)^��V@��A�]�<z��u�KJ�Y��․�a��AڴB,��~9@����i__��yԚ&�,��G,)����Υ��e����I��c�U?����d.���VS�dPѹ�,w�F:;��Lf���{ ��4��6"�m�g�S��������䂫��ˉ�[�}j9�)m��n�؎eX�n�����:��c�մAN-�-���e�����S�CדA{��#���xw��:��m���LȜ�d��)�"����f#���=3 ����q�����9��l���{�A�0��ދ��6��MD �Y�� c��ިE�3\wϹ�ɚYu~/��w־����{��_
��7�@������^�)�J	�
�F�$؂��A��yle��X����_���/���!�8������(�^<닳��6XE?�u(0���솋��=ev�S��I� sN�P����ہi��&�59
�<��L6��5�����vl�6����>D/�` (_��1 {��m�Ƀ�M�"�򙽚B�M��S��N.�_	���ȝ��V���L&p��<#<�t��!A����)��r~���|Q$��.�xӊ�*8u�l�����_^������vrE���,;3��9m'�� k�A���s��Uf�*���xdNI�H�І?���j(���mN�q fh�kx�v0�
M��k{K=}�ej]0�������"�m�N��:��u��+9^_�j�P�z�J�y�6
֏��X8�-�����z2�Pd��S��� /]���9]��%�=>
� ]a��DV7L�9�@`x�[\?����Ȑ���JkN�t���vDI�� �&>^����ZOU��rm�^LIݙ�S��A��z��D��K����T�� �B�i(�(̾ix*��k���o7��(�����ȳh5N>�0go�zE���Z[h0�Ӝ&�	�����[!�z�;[�i��U5h��Dٳ�;r��Et��I���;���������w��B����T�B	�po�@7Lֻ��>6_��E�����/�k��6�P���S�$\�U���������>�r      �      x������ � �      �      x������ � �      �      x������ � �     