-- Run with psql as a PostgreSQL administrator, connected to postgres.
-- Do not use --single-transaction: CREATE DATABASE cannot run in a transaction.
-- Optional variables: -v db_name=nvuc -v db_user=nvuc
\set ON_ERROR_STOP on
\if :{?db_name}
\else
  \set db_name nvuc
\endif
\if :{?db_user}
\else
  \set db_user nvuc
\endif
SELECT format('CREATE ROLE %I LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE', :'db_user')
WHERE NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = :'db_user')
\gexec
SELECT format('CREATE DATABASE %I OWNER %I ENCODING %L TEMPLATE template0',
              :'db_name', :'db_user', 'UTF8')
WHERE NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = :'db_name')
\gexec
-- Existing role attributes, passwords and database ownership are not changed.
SELECT datname, pg_get_userbyid(datdba) AS owner
FROM pg_database WHERE datname = :'db_name';
\echo Set the role password separately as described in the deployment guide.

