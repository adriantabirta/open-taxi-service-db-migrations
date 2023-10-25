CREATE TABLE IF NOT EXISTS accounts (
    id BIGSERIAL PRIMARY KEY,
    access_token text NULL DEFAULT '',
    device_token text NULL DEFAULT '',
    email text NULL DEFAULT '',
    phone_number CHARACTER(12) NOT NULL UNIQUE,
    sms_code CHARACTER(6) NULL UNIQUE DEFAULT '',
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS drivers (
    id BIGINT PRIMARY KEY,
    first_name TEXT NULL DEFAULT '',   
    last_name TEXT NULL DEFAULT '',   
    idnp CHARACTER(13) NULL DEFAULT '',   
    age INTEGER NULL,
    day_orders_limit INTEGER DEFAULT 24,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),

    CONSTRAINT fk_accounts FOREIGN KEY(id) REFERENCES accounts(id)
);

CREATE TABLE IF NOT EXISTS clients (
    id BIGINT PRIMARY KEY,
    first_name text NULL DEFAULT '',   
    last_name text NULL DEFAULT '',   
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),

    CONSTRAINT fk_accounts FOREIGN KEY(id) REFERENCES accounts(id)
);

CREATE TABLE IF NOT EXISTS locations (
    id BIGSERIAL PRIMARY KEY,
    longitude DOUBLE PRECISION NOT NULL,  
    latitude DOUBLE PRECISION NOT NULL,  
    timestamp TIMESTAMP WITHOUT TIME ZONE NOT NULL
);