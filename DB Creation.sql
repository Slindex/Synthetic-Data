CREATE DATABASE IF NOT EXISTS bi;
USE bi;

CREATE TABLE sales (
	sale_id INT PRIMARY KEY,
    user_id INT,
    created_at TIMESTAMP,
    country CHAR(2),
    value INT
    );

CREATE TABLE sales_products (
	item_id INT PRIMARY KEY,
    sale_id INT,
    user_id INT,
    name VARCHAR(255),
    type VARCHAR(31),
    brand VARCHAR(31),
    qty INT,
    value INT
    );

CREATE TABLE invoices (
	invoice_id INT PRIMARY KEY,
    sale_id INT,
    created_at TIMESTAMP,
    value INT
    );
    
CREATE TABLE users (
	user_id INT PRIMARY KEY,
    created_at TIMESTAMP,
    country CHAR(2),
    no_id VARCHAR(20)
    );
    
SET GLOBAL local_infile=1;

    
LOAD DATA LOCAL INFILE 'E:/david/Documents/Synthetic-Data/data/sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM sales;


LOAD DATA LOCAL INFILE 'E:/david/Documents/Synthetic-Data/data/sales_products.csv'
INTO TABLE sales_products
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM sales_products;


LOAD DATA LOCAL INFILE 'E:/david/Documents/Synthetic-Data/data/invoices.csv'
INTO TABLE invoices
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM invoices;


LOAD DATA LOCAL INFILE 'E:/david/Documents/Synthetic-Data/data/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM users;