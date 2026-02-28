-- Optional but recommended
--CREATE SCHEMA sales;
--GO
-- Orders
CREATE TABLE sales.orders (
    order_id NVARCHAR(50) PRIMARY KEY,
    customer_id NVARCHAR(50),
    order_status NVARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

-- Order Items
CREATE TABLE sales.order_items (
    order_id NVARCHAR(50),
    order_item_id INT,
    product_id NVARCHAR(50),
    seller_id NVARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    PRIMARY KEY(order_id, order_item_id)
);
--Combined (order_id + order_item_id) → uniquely identifies each row => composite primary key
--PK = (1001, 1) and (1001, 2) → both unique.
--PK → ensure uniqueness
--FK → enforce relationships later in DWH layer, not in raw landing tables.

-- Payments
CREATE TABLE sales.payments (
    order_id NVARCHAR(50),
    payment_sequential INT,
    payment_type NVARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(10,2),
    PRIMARY KEY(order_id, payment_sequential)
);