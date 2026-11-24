
CREATE TYPE enum_category AS ENUM('Wells', 'Checklist', 'Donors', 'Gifts', 'Comms', 'Users');
CREATE TYPE enum_action AS ENUM('Create', 'Update', 'Delete');

CREATE TABLE IF NOT EXISTS audit_log
(
    id BIGSERIAL PRIMARY KEY,
    created_by BIGINT NOT NULL REFERENCES wells_user(id) ON DELETE CASCADE,
    category enum_category NOT NULL,
    action enum_action NOT NULL,
    record_type VARCHAR(70) NOT NULL,
    record_id TEXT NOT NULL,
    before JSONB,
    after JSONB,
    description TEXT NOT NULL,
    date_created TIMESTAMP NOT NULL

);