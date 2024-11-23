-- Write your SQL code here

-- Primary key automatically creates a clustered index on customer_id
CREATE INDEX idx_email_address ON customer(email);
CREATE INDEX idx_phone_number ON customer(phone_number);

-- Primary key automatically creates a clustered index on station_id
CREATE INDEX idx_station_name ON retail_station(station_name);

-- Primary key automatically creates a clustered index on product_id
CREATE INDEX idx_product_name ON product(product_name);

-- Primary key automatically creates a clustered index on order_id
CREATE INDEX idx_client_id ON `order`(client_id);
CREATE INDEX idx_order_date ON `order`(order_date);
CREATE INDEX idx_delivery_date ON `order`(delivery_date);
