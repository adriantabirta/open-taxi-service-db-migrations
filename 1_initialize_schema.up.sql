CREATE TABLE IF NOT EXISTS accounts (
    id integer GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    access_token text NULL,
    email text NULL,
    phone_number CHARACTER(12) NOT NULL UNIQUE,
    sms_code CHARACTER(6) NOT NULL UNIQUE,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS drivers (
    id integer PRIMARY KEY,
    first_name text NULL,   
    last_name text NULL,   
    idnp CHARACTER(13) NULL UNIQUE,   
    age integer NULL,
    dayOrdersLimit integer DEFAULT 24,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),

    CONSTRAINT fk_accounts FOREIGN KEY(id) REFERENCES accounts(id)
);

CREATE TABLE IF NOT EXISTS clients (
    id integer PRIMARY KEY,
    first_name text NULL,   
    last_name text NULL,   
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),

    CONSTRAINT fk_accounts FOREIGN KEY(id) REFERENCES accounts(id)
);