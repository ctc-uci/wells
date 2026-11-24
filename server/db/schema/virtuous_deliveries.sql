CREATE TYPE virtuous_delivery_status AS ENUM ('Pending', 'Delivered', 'Failed');

CREATE TABLE virtuous_deliveries (
    id BIGSERIAL PRIMARY KEY,
    event_type VARCHAR(70) NOT NULL,
    virtuous_id VARCHAR(70) NOT NULL,
    payload JSONB NOT NULL,
    status virtuous_delivery_status NOT NULL DEFAULT 'Pending',
    attempts INT NOT NULL DEFAULT 0,
    last_error TEXT,
    delivered_at TIMESTAMP,
    date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
