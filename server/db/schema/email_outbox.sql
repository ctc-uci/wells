DROP TABLE IF EXISTS email_outbox CASCADE;

CREATE TYPE email_status AS ENUM ("Sending", "Sent", "Failed");


CREATE TABLE email_outbox (
  id BIGSERIAL PRIMARY KEY,
  CONSTRAINT well_id
    FOREIGN KEY (id) REFERENCES wells_tracker(id),
  to_email TEXT NOT NULL,
  subject TEXT NOT NULL,
  body TEXT NOT NULL,
  status email_status,
  error TEXT,
  CONSTRAINT sent_by
    FOREIGN KEY (id) REFERENCES wells_user(id),
  date_created TIMESTAMP NOT NULL
);

