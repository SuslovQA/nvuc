-- Initial administrator setup AFTER Flyway migrations; no sample content.
-- Supply a BCrypt hash via interactive prompt; plaintext passwords are never accepted.
-- An already customized admin password and role are deliberately preserved.
\set ON_ERROR_STOP on
\if :{?admin_password_hash}
\else
  \prompt 'BCrypt hash for admin: ' admin_password_hash
\endif
BEGIN;
CREATE TEMP TABLE nvuc_admin_input (
    password_hash TEXT NOT NULL CHECK (
        password_hash ~ '^\$2[aby]\$(0[4-9]|[12][0-9]|3[01])\$[./A-Za-z0-9]{53}$'
        AND password_hash <> '$2a$10$YpTzW0otKpNWYg.vjpergeN84dX4BZ4Izs6QXVj.dQ/sEDQOMXvti'
    )
) ON COMMIT DROP;
INSERT INTO nvuc_admin_input VALUES (:'admin_password_hash');
INSERT INTO admin_users (username, password, role)
SELECT 'admin', password_hash, 'ADMIN' FROM nvuc_admin_input
ON CONFLICT (username) DO UPDATE SET password = EXCLUDED.password
WHERE admin_users.password = '$2a$10$YpTzW0otKpNWYg.vjpergeN84dX4BZ4Izs6QXVj.dQ/sEDQOMXvti';
COMMIT;
SELECT username, role,
       password <> '$2a$10$YpTzW0otKpNWYg.vjpergeN84dX4BZ4Izs6QXVj.dQ/sEDQOMXvti' AS password_customized
FROM admin_users WHERE username = 'admin';
