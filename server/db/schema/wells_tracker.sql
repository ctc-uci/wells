CREATE TYPE enum_type AS ENUM('New', 'Restored', 'Unmaintained', 'Healthy Village');

CREATE TABLE wells_tracker (
    id BIGSERIAL PRIMARY KEY,
    well_number VARCHAR(70) NOT NULL,
    name VARCHAR(70) NOT NULL,
    year INT NOT NULL,
    year_seq INT NOT NULL,
    date_created TIMESTAMP NOT NULL,
    village VARCHAR(70) NOT NULL,
    parish VARCHAR(70) NOT NULL,
    subcounty VARCHAR(70) NOT NULL,
    district VARCHAR(70) NOT NULL,
    gps_coord_n NUMERIC(9, 6) NOT NULL CHECK (gps_coord_n BETWEEN -90 AND 90),
    gps_coord_e NUMERIC(9, 6) NOT NULL CHECK (gps_coord_e BETWEEN -180 AND 180),
    altitude DECIMAL NOT NULL,
    type enum_type NOT NULL,
    status VARCHAR(32) NOT NULL,
    construction DATE NOT NULL,
    drilled_by VARCHAR(70) NOT NULL,
    dwd_no VARCHAR(70) NOT NULL,
    depth INT
);
