-- Table: well_sponsorships

CREATE TABLE IF NOT EXISTS well_sponsorships (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1),
    well_id BIGINT NULL REFERENCES wells_tracker(id), 
    donor_id BIGINT NOT NULL REFERENCES donors(donor_id), 
    display_name TEXT NOT NULL
);

TABLESPACE pg_default;

ALTER TABLE IF EXISTS well_sponsorships
    OWNER to postgres;