-- Write your SQL code here
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    stock INT NOT NULL,
    min_inventory_level INT NOT NULL CHECK (stock >= min_inventory_level), -- Minimum inventory constraint
    price DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE warehouse (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(255) NOT NULL,
    max_capacity INT NOT NULL,  -- Maximum capacity of the warehouse
    current_storage INT NOT NULL, -- Current storage used in the warehouse
    CHECK (current_storage <= max_capacity) -- Maximum storage capacity constraint
) ENGINE=InnoDB;

CREATE TABLE project (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    budget DECIMAL(15, 2) NOT NULL,  -- Budget allocated for the project
    expenditure DECIMAL(15, 2) NOT NULL, -- Current expenditure of the project
    CHECK (expenditure <= budget) -- Budget constraint
) ENGINE=InnoDB;

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    cost_price DECIMAL(10, 2) NOT NULL, -- Cost of the product
    selling_price DECIMAL(10, 2) NOT NULL, -- Selling price of the product
    CHECK (selling_price >= cost_price * 1.1 AND selling_price <= cost_price * 1.5) -- Profit margin between 10% and 50%
) ENGINE=InnoDB;
