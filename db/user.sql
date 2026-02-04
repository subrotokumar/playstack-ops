-- =========================================================
-- Backend service user
-- =========================================================
CREATE ROLE backend_service
    WITH
    LOGIN
    PASSWORD 'REPLACE_WITH_STRONG_PASSWORD'
    NOSUPERUSER
    INHERIT
    NOCREATEDB
    NOCREATEROLE
    NOREPLICATION;

COMMENT ON ROLE backend_service IS 'Backend application service account';

-- Allow DB connection
GRANT CONNECT ON DATABASE playstack TO backend_service;

-- Attach RW privileges
GRANT role_rw TO backend_service;

-- Force schema usage (prevents public schema leaks)
ALTER ROLE backend_service SET search_path = backend;
