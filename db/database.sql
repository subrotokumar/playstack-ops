-- =========================================================
-- Database
-- =========================================================
CREATE DATABASE playstack
    WITH
    OWNER = pgadmin
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE playstack IS 'Playstack Application Database';

-- Avoid accidental access
REVOKE ALL ON DATABASE playstack FROM PUBLIC;
GRANT ALL ON DATABASE playstack TO pgadmin;

-- =========================================================
-- Schema
-- =========================================================
CREATE SCHEMA IF NOT EXISTS backend AUTHORIZATION pgadmin;

COMMENT ON SCHEMA backend IS 'Backend application schema';

REVOKE ALL ON SCHEMA backend FROM PUBLIC;
GRANT ALL ON SCHEMA backend TO pgadmin WITH GRANT OPTION;

-- =========================================================
-- Roles
-- =========================================================
CREATE ROLE role_rw
    NOLOGIN
    NOSUPERUSER
    INHERIT
    NOCREATEDB
    NOCREATEROLE
    NOREPLICATION;

COMMENT ON ROLE role_rw IS 'Read-Write application role';

CREATE ROLE role_ro
    NOLOGIN
    NOSUPERUSER
    INHERIT
    NOCREATEDB
    NOCREATEROLE
    NOREPLICATION;

COMMENT ON ROLE role_ro IS 'Read-Only application role';

-- =========================================================
-- RW Permissions
-- =========================================================
GRANT USAGE ON SCHEMA backend TO role_rw;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA backend TO role_rw;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA backend TO role_rw;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA backend TO role_rw;

ALTER DEFAULT PRIVILEGES IN SCHEMA backend
    GRANT ALL PRIVILEGES ON TABLES TO role_rw;

ALTER DEFAULT PRIVILEGES IN SCHEMA backend
    GRANT ALL PRIVILEGES ON SEQUENCES TO role_rw;

ALTER DEFAULT PRIVILEGES IN SCHEMA backend
    GRANT ALL PRIVILEGES ON FUNCTIONS TO role_rw;

-- =========================================================
-- RO Permissions
-- =========================================================
GRANT USAGE ON SCHEMA backend TO role_ro;

GRANT SELECT ON ALL TABLES IN SCHEMA backend TO role_ro;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA backend TO role_ro;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA backend TO role_ro;

ALTER DEFAULT PRIVILEGES IN SCHEMA backend
    GRANT SELECT ON TABLES TO role_ro;

ALTER DEFAULT PRIVILEGES IN SCHEMA backend
    GRANT SELECT ON SEQUENCES TO role_ro;

ALTER DEFAULT PRIVILEGES IN SCHEMA backend
    GRANT EXECUTE ON FUNCTIONS TO role_ro;
