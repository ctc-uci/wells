CREATE TYPE enum_condition AS ENUM('Good', 'Poor');
CREATE TYPE enum_functionality AS ENUM('Functional (In Use)', 'Functional (Not In Use)', 'Non Functional');

CREATE TABLE wells_inspection (
    id BIGSERIAL PRIMARY KEY,
    well_id BIGINT NOT NULL REFERENCES wells_tracker(id), 
    step_key VARCHAR(70) NOT NULL,
    step_order INT NOT NULL,
    condition enum_condition NOT NULL,
    functionality enum_functionality NOT NULL,
    flow_of_water enum_condition NOT NULL,
    quality_of_water enum_condition NOT NULL,
    clear_drainage BOOLEAN NOT NULL,
    fencing BOOLEAN NOT NULL,
    repair_history BOOLEAN,
    inspected_at DATE NOT NULL,
    inspected_by VARCHAR(70) NOT NULL,
    rehab_needed BOOLEAN NOT NULL,
    estimated_users BIGINT NOT NULL,
    water_members TEXT NOT NULL,
    other_comments TEXT,
    user_comments TEXT,
    date_created TIMESTAMP NOT NULL,
    created_by TEXT NOT NULL REFERENCES wells_user(id) 
);