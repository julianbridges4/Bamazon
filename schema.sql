DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;
USE bamazon_db;
CREATE TABLE products(
	item_id INT(10) AUTO_INCREMENT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    department_name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT(10) NOT NULL,
    PRIMARY KEY(item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quanity) values ("NBA 2K18", "Video Games", 59.99, 200);
INSERT INTO products (product_name, department_name, price, stock_quanity) values ("Destiny 2", "Video Games", 59.99, 200);
INSERT INTO products (product_name, department_name, price, stock_quanity) values ("DualShock 4 Wireless Controller", "Video Games", 43.99, 300);
INSERT INTO products (product_name, department_name, price, stock_quanity) values ("Spalding NBA Basketball", "Sports Equipment", 44.99, 300);
INSERT INTO products (product_name, department_name, price, stock_quanity) values ("Monopoly", "Board Games", 19.99, 500);
INSERT INTO products (product_name, department_name, price, stock_quanity) values ("Risk", "Board Games", 49.95, 300);
INSERT INTO products (product_name, department_name, price, stock_quanity) values ("Rubik's Cube", "Toys & Games", 6.99, 1000);
INSERT INTO products (product_name, department_name, price, stock_quanity) values ("Baseball Glove", "Sports Equipment", 99.99, 200);
INSERT INTO products (product_name, department_name, price, stock_quanity) values ("Baseball Bat", "Sports Equipment", 59.99, 200);
INSERT INTO products (product_name, department_name, price, stock_quanity) values ("Soccer Ball", "Sports Equipment", 19.99, 400);

SELECT * FROM products;

