-- Write your SQL code here

--View: Active Orders
DELIMITER //

CREATE VIEW active_orders AS
SELECT 
    o.order_id,
    o.client_id,
    o.order_date,
    o.expected_delivery_date,
    o.status,
    c.customer_name,
    c.email
FROM `order` o
JOIN customer c ON o.client_id = c.customer_id
WHERE o.status IN ('pending payment', 'pending delivery', 'shipped');

DELIMITER ;

-- View: Customer Purchase Summary
DELIMITER //

CREATE VIEW customer_purchase_summary AS
SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    COUNT(o.order_id) AS total_orders,
    SUM(p.price * oi.quantity) AS total_spent
FROM customer c
LEFT JOIN `order` o ON c.customer_id = o.client_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN product p ON oi.product_id = p.product_id
WHERE o.status = 'delivered'
GROUP BY c.customer_id;

DELIMITER ;
