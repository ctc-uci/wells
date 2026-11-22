-- Table: gifts
DROP TABLE IF EXISTS gifts CASCADE;

CREATE TABLE gifts(
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1), 
    virtuous_id VARCHAR(70) UNIQUE NOT NULL, 
    donor_id BIGINT NOT NULL REFERENCES donors(id), -- made it donors_id instead of donors (from the diagram) for clarity
    well_id BIGINT NOT NULL REFERENCES wells_tracker(id), 
    designation VARCHAR(200) NOT NULL, 
    amount NUMERIC(10, 2) NOT NULL, 
    date_received TIMESTAMP NOT NULL, 
    date_created TIMESTAMP NOT NULL
);

TABLESPACE pg_default;

ALTER TABLE IF EXISTS gifts
    OWNER to postgres;