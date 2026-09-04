CREATE TABLE IF NOT EXISTS admin_users (
                                           id BIGSERIAL PRIMARY KEY,
                                           username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL DEFAULT 'ADMIN'
    );

INSERT INTO admin_users (
    username,
    password,
    role
)
VALUES (
           'admin',
           '$2a$10$YpTzW0otKpNWYg.vjpergeN84dX4BZ4Izs6QXVj.dQ/sEDQOMXvti',
           'ADMIN'
       )
    ON CONFLICT (username) DO NOTHING;