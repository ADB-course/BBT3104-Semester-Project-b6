-- Write your SQL code here

START TRANSACTION;

-- Insert customer
INSERT INTO customer (customer_name, address, phone_number, email)
VALUES ('John Doe', '123 Main St', '555-1234', 'john.doe@example.com');

-- Get the last inserted customer ID
SET @customer_id = LAST_INSERT_ID();

-- Insert order for the customer
INSERT INTO orders (client_id, product_id, quantity, order_date, expected_delivery_date, status)
VALUES (@customer_id, 1, 3, CURDATE(), '2024-12-01', 'pending payment');

-- Commit the transaction to make changes permanent
COMMIT;

-- In case of any error, you can rollback the transaction to maintain data integrity
-- If you encounter an error, uncomment the following line to rollback:
-- ROLLBACK;
