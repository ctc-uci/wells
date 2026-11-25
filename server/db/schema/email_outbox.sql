DROP TABLE IF EXISTS email_outbox CASCADE;

CREATE TYPE email_status AS ENUM ('Sending', 'Sent', 'Failed');


CREATE TABLE email_outbox (
  id BIGSERIAL PRIMARY KEY,
  well_id BIGINT REFERENCES wells_tracker(id),
  to_email TEXT NOT NULL,
  subject TEXT NOT NULL,
  body TEXT NOT NULL,
  status email_status NOT NULL,
  error TEXT,
  sent_by BIGINT REFERENCES wells_user(id),
  date_created TIMESTAMP NOT NULL
);

