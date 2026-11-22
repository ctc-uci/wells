DROP TABLE IF EXISTS gifts CASCADE;

CREATE TABLE gifts(
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1), 
    virtuous_id varchar(70) UNIQUE NOT NULL, 
    donor_id bigint NOT NULL REFERENCES donors(id), 
    well_id bigint NOT NULL REFERENCES wells_tracker(id), 
    designation varchar(200) NOT NULL, 
    amount numeric(10, 2) NOT NULL, 
    date_received timestamp NOT NULL, 
    date_created timestamp NOT NULL
);

TABLESPACE pg_default;

ALTER TABLE IF EXISTS gifts
    OWNER to postgres;