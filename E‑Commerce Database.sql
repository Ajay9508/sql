CREATE DATABASE ecommerces_db;
USE ecommerces_db;
-- users table
create table users(
user_id int primary key auto_increment,
name varchar(100) not null,
email varchar(100) unique not null,
password varchar(100)not null,
phone varchar(13),
address text,
created_at timestamp default current_timestamp
);
-- categories tables
create table categories (
category_id int primary key auto_increment,
name varchar(100) unique not null,
description text
);
-- products table
create table products(
product_id int primary key auto_increment,
name varchar(100)  not null,
stock int not null default 0,
price float not null,
category_id int,
 created_at timestamp default current_timestamp,
foreign key (category_id) references categories(category_id) on delete set null
);
-- add price in table product
alter table products add price float;
alter table products add description text;
create table orders (
order_id int primary key auto_increment,
total_price decimal (10,2) not null ,
user_id int,
status enum ('pending' ,'Processing','Shipped','Delivered','cancelled') default 'pending',
created_at  timestamp default current_timestamp,
foreign key(user_id) references users(user_id) on delete cascade
);  
-- oder Items table
create table oder_item(
order_item_id int primary key auto_increment,
product_id int,
order_id int,
quantity int not null,
price decimal (10 ,2) not null,
foreign key(order_id) references orders(order_id) on delete cascade,
foreign key (product_id) references products(product_id) on delete cascade
); 
-- Payment Tbale
create table payments(
payment_id int primary key auto_increment,
order_id int unique,
payment_mehtod enum('Creadit Card','PayPal','Bank Transfeer','Cash on Delivery') not null,
payment_status enum('Pending','Completed','Failed','Refound') default 'Pending',
transaction_id varchar(100) unique,
created_at timestamp default current_timestamp,
foreign key(order_id) references orders(order_id) on delete cascade
);
-- rename table
-- ALTER TABLE payments RENAME COLUMN payment_mehtod
-- TO payment_method; NOT WORKING DUEW TO VERSION CHANGE
ALTER TABLE payments
CHANGE payment_mehtod payment_method VARCHAR(50);
create table shipments(
shipment_id int primary key auto_increment,
order_id int unique,
tracking_number varchar(50) unique,
shipping_status ENUM('Pending', 'Dispatched', 'In Transit', 'Delivered') DEFAULT 'Pending',
estimated_delivery date,
created_at timestamp default current_timestamp,
foreign key (order_id) references orders(order_id) on delete cascade
); 
-- Insert Users
INSERT INTO users (name, email, password, phone, address) VALUES
('John Doe', 'john@example.com', 'password123', '1234567890', '123 Main St, NY'),
('Jane Smith', 'jane@example.com', 'password123', '0987654321', '456 Elm St, CA'),
('Alice Johnson', 'alice@example.com', 'password123', '9876543210', '789 Oak St, TX');
-- Insert Categories
INSERT INTO categories (name, description) VALUES
('Electronics', 'Devices and gadgets'),
('Clothing', 'Men and Women clothing'),
('Books', 'Various kinds of books');
-- Insert Products
INSERT INTO products (name, description, price, stock, category_id) VALUES
('Laptop', 'High performance laptop', 899.99, 10, 1),
('Smartphone', 'Latest model smartphone', 499.99, 20, 1),
('T-shirt', '100% Cotton T-shirt', 19.99, 50, 2),
('Novel', 'Bestselling fiction novel', 9.99, 100, 3);
-- Insert Orders
INSERT INTO orders (user_id, total_price, status) VALUES
(1, 519.98, 'Processing'),
(2, 899.99, 'Pending'),
(3, 19.99, 'Shipped');
-- Insert Order Items
INSERT INTO oder_item (order_id, product_id, quantity, price) VALUES
(1, 2, 1, 499.99),
(1, 3, 1, 19.99),
(2, 1, 1, 899.99),
(3, 3, 1, 19.99);
-- Insert Payments
INSERT INTO payments (order_id, payment_metHod, payment_status, transaction_id) VALUES
(1, 'Credit Card', 'Completed', 'TXN123456'),
(2, 'PayPal', 'Pending', 'TXN123457'),
(3, 'Cash on Delivery', 'Completed', NULL);
-- Insert Shipments
INSERT INTO shipments (order_id, tracking_number, shipping_status, estimated_delivery) VALUES
(1, 'TRACK123456', 'Dispatched', '2025-02-20'),
(2, 'TRACK123457', 'Pending', '2025-02-25'),
(3, 'TRACK123458', 'In Transit', '2025-02-18');

-- class practice
select * from  categories;

