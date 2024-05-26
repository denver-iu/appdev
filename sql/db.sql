CREATE DATABASE fproject;
USE fproject;

CREATE TABLE products (
	uid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    type varchar(255),
    price FLOAT
);

CREATE TABLE uadmin (
	username VARCHAR(20) PRIMARY KEY,
    password VARCHAR(20)
);

INSERT INTO uadmin (username, password) VALUES
('admin','adminpass');

CREATE TABLE customers (
	uid VARCHAR(20) PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

INSERT INTO customers (uid, username, password) VALUES
('dummyuid', 'user1', 'user1pass');

CREATE TABLE sales (
	uid INT AUTO_INCREMENT PRIMARY KEY,
    productId VARCHAR(50),
    customerId VARCHAR(20),
	addOns VARCHAR(255),
    sugarContent INT,
    contactNumber VARCHAR(11),
    transactionDate VARCHAR(255),
    amountPaid FLOAT,
    FOREIGN KEY (productId) REFERENCES products(uid),
    FOREIGN KEY (customerId) REFERENCES customers(uid)
);

INSERT INTO products (uid, name, type, price) VALUES
('CMT', 'Classic Milk Tea', 'milk tea', 145.00),
('TMT', 'Taro Milk Tea', 'milk tea', 165.00),
('WMT', 'Wintermelon Milk Tea', 'milk tea', 192.50),
('OOMT', 'Oolong Milk Tea', 'milk tea', 195.00),
('SMT', 'Strawberry Milk Tea', 'milk tea', 200.00),
('ThMT', 'Thai Milk Tea', 'milk tea', 200.00),
('MMT', 'Matcha Milk Tea', 'milk tea', 210.00),
('CoMT', 'Coconut Milk Tea', 'milk tea', 210.50),
('HMT', 'Hokkaido Milk Tea', 'milk tea', 220.50),
('TPB', 'Tapioca Pearls (Boba)', 'addons', 5),
('GJ', 'Grass Jelly', 'addons', 5),
('AV', 'Aloe Vera', 'addons', 5),
('P', 'Pudding', 'addons', 5),
('RB', 'Red Bean', 'addons', 5),
('LJ', 'Lychee Jelly', 'addons', 5),
('CJ', 'Coconut Jelly', 'addons', 5),
('CF', 'Cheese Foam', 'addons', 5),
('AS', 'Acai Seeds', 'addons', 5);

DROP TABLE sales;
DROP TABLE customers;
