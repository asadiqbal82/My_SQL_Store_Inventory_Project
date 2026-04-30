-- =========================================
-- SIMPLE INVENTORY MANAGEMENT SYSTEM
-- Beginner Level SQL Project
-- =========================================

DROP DATABASE IF EXISTS inventory_db;
CREATE DATABASE inventory_db;
USE inventory_db;

-- =========================================
-- 1. CATEGORIES TABLE
-- =========================================
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- =========================================
-- 2. SUPPLIERS TABLE
-- =========================================
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    city VARCHAR(100)
);

-- =========================================
-- 3. PRODUCTS TABLE
-- =========================================
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    supplier_id INT,
    price DECIMAL(10,2),
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- =========================================
-- 4. PURCHASES TABLE (STOCK IN)
-- =========================================
CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    purchase_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- =========================================
-- 5. SALES TABLE (STOCK OUT)
-- =========================================
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- =========================================
-- INSERT SAMPLE DATA
-- =========================================

INSERT INTO Categories (category_name)
VALUES ('Electronics'), ('Groceries'), ('Stationery');

INSERT INTO Suppliers (supplier_name, phone, city)
VALUES 
('Tech Supplier', '123456789', 'Riyadh'),
('Food Supplier', '987654321', 'Jeddah');

INSERT INTO Products (product_name, category_id, supplier_id, price, stock_quantity)
VALUES
('Laptop', 1, 1, 3500.00, 10),
('Rice Bag', 2, 2, 80.00, 50),
('Notebook', 3, 1, 5.00, 100);

-- =========================================
-- TRIGGER: AUTO REDUCE STOCK AFTER SALE
-- =========================================
DELIMITER $$

CREATE TRIGGER after_sale
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END $$

DELIMITER ;

-- =========================================
-- TRIGGER: AUTO INCREASE STOCK AFTER PURCHASE
-- =========================================
DELIMITER $$

CREATE TRIGGER after_purchase
AFTER INSERT ON Purchases
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity + NEW.quantity
    WHERE product_id = NEW.product_id;
END $$

DELIMITER ;

-- =========================================
-- TEST DATA (STOCK MOVEMENT)
-- =========================================

-- Purchase 5 Laptops
INSERT INTO Purchases (product_id, quantity, purchase_date)
VALUES (1, 5, CURDATE());

-- Sell 3 Laptops
INSERT INTO Sales (product_id, quantity, sale_date)
VALUES (1, 3, CURDATE());

-- =========================================
-- USEFUL QUERIES
-- =========================================

-- View All Products
SELECT * FROM Products;

-- View Products with Category & Supplier
SELECT 
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.price,
    p.stock_quantity
FROM Products p
JOIN Categories c ON p.category_id = c.category_id
JOIN Suppliers s ON p.supplier_id = s.supplier_id;

-- Low Stock Report (Less than 10)
SELECT product_name, stock_quantity
FROM Products
WHERE stock_quantity < 10;

-- Total Sales Quantity Per Product
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_sold
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- =========================================
-- END OF PROJECT
-- =========================================
