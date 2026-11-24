DROP TABLE IF EXISTS comms_log CASCADE;
DROP TYPE IF EXISTS comms_log_step;
DROP TYPE IF EXISTS comms_log_status;

CREATE TYPE comms_log_step AS ENUM('Initial', 'Follow-Up', 'Plaque');
CREATE TYPE comms_log_status AS ENUM('Sent', 'Completed');



CREATE TABLE IF NOT EXISTS comms_log 
(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    donor BIGINT NOT NULL,
    well_id BIGINT,
    created_by BIGINT NOT NULL,
    step comms_log_step NOT NULL,
    status comms_log_status NOT NULL ,
    description TEXT,
    date_created TIMESTAMP NOT NULL,

    CONSTRAINT comms_log_donor_fk
        FOREIGN KEY (donor) REFERENCES donors (id),
    CONSTRAINT comms_log_well_id_fk
        FOREIGN KEY (well_id) REFERENCES wells_tracker (id),
    CONSTRAINT comms_log_created_by_fk
        FOREIGN KEY (created_by) REFERENCES wells_user (id)
);