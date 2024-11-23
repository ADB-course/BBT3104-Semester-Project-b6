-- Write your SQL code here
DELIMITER //

CREATE TRIGGER before_insert_order
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    -- Check if the order_date is a future date
    IF NEW.order_date > CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Order date cannot be in the future';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER after_update_payment
AFTER UPDATE ON payments
FOR EACH ROW
BEGIN
    -- Check if the payment amount has changed
    IF OLD.amount != NEW.amount THEN
        -- Update the client's total balance after the payment
        UPDATE client
        SET balance = balance - NEW.amount
        WHERE client_id = NEW.client_id;
    END IF;
END //

DELIMITER ;
