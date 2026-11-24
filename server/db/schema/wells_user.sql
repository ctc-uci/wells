
CREATE TYPE role_enum as ENUM('Viewer', 'Editor', 'Admin', 'Super Admin');
CREATE TYPE status_enum as ENUM('Active', 'Deactivated');

CREATE TABLE IF NOT EXISTS wells_user 
(
    id BIGSERIAL PRIMARY KEY,
    firebase_uid TEXT NOT NULL,
    email TEXT NOT NULL,
    role role_enum NOT NULL,
    first_name varchar(70) NOT NULL,
    last_name varchar(70) NOT NULL,
    status status_enum NOT NULL,
    created_by BIGINT REFERENCES wells_user(id)
);