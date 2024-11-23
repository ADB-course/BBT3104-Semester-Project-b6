-- Write your SQL code here

--Function to calculate the total price of an order
DELIMITER //

CREATE FUNCTION calculate_total_price(
    p_product_id INT, 
    p_quantity INT
)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE product_price DECIMAL(10, 2);
    DECLARE total_price DECIMAL(10, 2);

    -- Get the price of the product
    SELECT price INTO product_price 
    FROM product 
    WHERE product_id = p_product_id;

    -- Calculate the total price
    SET total_price = product_price * p_quantity;

    -- Return the total price
    RETURN total_price;
END //

DELIMITER ;

--Function to get customer order count
DELIMITER //

CREATE FUNCTION get_customer_order_count(
    p_customer_id INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE order_count INT;

    -- Get the count of orders placed by the customer
    SELECT COUNT(*) INTO order_count
    FROM `order`
    WHERE client_id = p_customer_id;

    -- Return the number of orders
    RETURN order_count;
END //

DELIMITER ;

--Function to get product stock level
DELIMITER //

CREATE FUNCTION get_product_stock_level(
    p_product_id INT
)
RETURNS INT
DETERMINISTIC