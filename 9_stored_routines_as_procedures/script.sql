-- Write your SQL code here
DELIMITER //

CREATE PROCEDURE place_order(
    IN p_customer_id INT, 
    IN p_product_id INT, 
    IN p_quantity INT, 
    IN p_delivery_date DATE
)
BEGIN
    DECLARE p_order_id INT;

    -- Insert into the orders table
    INSERT INTO `order` (client_id, order_date, delivery_date, status)
    VALUES (p_customer_id, CURDATE(), p_delivery_date, 'pending payment');

    -- Get the last inserted order ID
    SET p_order_id = LAST_INSERT_ID();
    
    -- Insert order items into order_items table (if there's an order_items table, assumes the order has items)
    INSERT INTO order_items (order_id, product_id, quantity)
    VALUES (p_order_id, p_product_id, p_quantity);
    
    -- Return the order ID
    SELECT p_order_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE update_order_status(
    IN p_order_id INT, 
    IN p_new_status VARCHAR(50)
)
BEGIN
    -- Update the status of the specified order
    UPDATE `order`
    SET status = p_new_status
    WHERE order_id = p_order_id;

    -- Check if the order was updated
    IF ROW_COUNT() > 0 THEN
        SELECT 'Order status updated successfully.' AS message;
    ELSE
        SELECT 'Order not found.' AS message;
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE update_order_status(
    IN p_order_id INT, 
    IN p_new_status VARCHAR(50)
)
BEGIN
    -- Update the status of the specified order
    UPDATE `order`
    SET status = p_new_status
    WHERE order_id = p_order_id;

    -- Check if the order was updated
    IF ROW_COUNT() > 0 THEN
        SELECT 'Order status updated successfully.' AS message;
    ELSE
        SELECT 'Order not found.' AS message;
    END IF;
END //

DELIMITER ;





