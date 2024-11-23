DELIMITER //

CREATE TRIGGER inventory_expiration_trigger
AFTER UPDATE ON inventory
FOR EACH ROW
BEGIN
    -- Check if the expiration date has passed or is today
    IF NEW.expiration_date <= CURDATE() THEN
        -- Mark the product as expired
        UPDATE inventory
        SET status = 'Expired'
        WHERE product_id = NEW.product_id;
        
        -- Optional: You can insert an entry into an expiration log table to track expired items
        INSERT INTO expiration_log (product_id, expiration_date, action_taken, log_date)
        VALUES (NEW.product_id, NEW.expiration_date, 'Marked as expired', CURDATE());
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER lease_expiration_trigger
AFTER UPDATE ON leases
FOR EACH ROW
BEGIN
    -- Check if the lease end date has passed or is today
    IF NEW.lease_end_date <= CURDATE() AND OLD.lease_end_date != NEW.lease_end_date THEN
        -- Update the lease status to 'Expired'
        UPDATE leases
        SET lease_status = 'Expired'
        WHERE lease_id = NEW.lease_id;

        -- Optional: Insert a notification record about the lease expiration
        INSERT INTO lease_notifications (lease_id, tenant_id, notification_date, message)
        VALUES (NEW.lease_id, NEW.tenant_id, CURDATE(), 'Lease has expired. Please contact for renewal or next steps.');
    END IF;
END //

DELIMITER ;