-- dummy tables for FK dependencies
CREATE TABLE IF NOT EXISTS wells_tracker (
  id BIGINT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS checklist_templates (
  id BIGINT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS wells_user (
  id BIGINT PRIMARY KEY
);

-- wells_checklist schema
CREATE TYPE checklist_status AS ENUM ('Pending', 'Completed', 'Skipped');

CREATE TABLE wells_checklist (
  id BIGSERIAL PRIMARY KEY,
  well_id BIGINT NOT NULL,
  template_id BIGINT NOT NULL,
  UNIQUE (well_id, template_id),
  step_order INT NOT NULL,
  status checklist_status NOT NULL,
  completed_at TIMESTAMP,
  completed_by BIGINT,
  note TEXT,
  date_created TIMESTAMP NOT NULL,

  FOREIGN KEY (well_id)
    REFERENCES wells_tracker(id),

  FOREIGN KEY (template_id)
    REFERENCES checklist_templates(id),

  FOREIGN KEY (completed_by)
    REFERENCES wells_user(id)
);
