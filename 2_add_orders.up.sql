CREATE TABLE IF NOT EXISTS orders (
    id BIGSERIAL PRIMARY KEY,
    client_id BIGINT NOT NULL,   
    driver_id BIGINT NULL,   
    estimated_price INTEGER NOT NULL,   
    distance NUMERIC NOT NULL,   
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),

    CONSTRAINT fk_client_id FOREIGN KEY(client_id) REFERENCES clients(id),
    CONSTRAINT fk_driver_id FOREIGN KEY(driver_id) REFERENCES drivers(id)
);

CREATE TABLE IF NOT EXISTS orders_locations (
    id BIGSERIAL PRIMARY KEY,
    order_id BIGINT NOT NULL,   
    location_name TEXT NULL DEFAULT '',
    longitude NUMERIC NOT NULL,
    latitude NUMERIC NOT NULL, 
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),

    CONSTRAINT fk_order_id FOREIGN KEY(order_id) REFERENCES orders(id)
);

CREATE TABLE IF NOT EXISTS transactions (
    id BIGSERIAL PRIMARY KEY,
    order_id BIGINT NOT NULL,
    payment_method INTEGER NOT NULL,
    amount INTEGER NOT NULL,  
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    updated_at timestamp without time zone NOT NULL DEFAULT now(),

    CONSTRAINT fk_transactions_orders FOREIGN KEY(order_id) REFERENCES orders(id)
);