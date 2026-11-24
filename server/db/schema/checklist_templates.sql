CREATE TYPE program_type_enum AS ENUM (
    'New',
    'Restored',
    'Unmaintained',
    'Healthy Village'
);

CREATE TABLE checklist_templates (
    id BIGSERIAL PRIMARY KEY,
    program_type program_type_enum NOT NULL,
    step_key VARCHAR(70) NOT NULL,
    step_order INT NOT NULL,
    label VARCHAR(200) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    UNIQUE (program_type, step_key),
    UNIQUE (program_type, step_order)
);