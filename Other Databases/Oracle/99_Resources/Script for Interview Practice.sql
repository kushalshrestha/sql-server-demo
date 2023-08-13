-- Create the table
CREATE TABLE credit_card_accounts (
    account_number VARCHAR2(10) PRIMARY KEY,
    balance NUMBER
);


-- Insert records
INSERT INTO credit_card_accounts (account_number, balance)
VALUES ('1234567890', 1200);

INSERT INTO credit_card_accounts (account_number, balance)
VALUES ('9876543210', 800);

-- Commit the inserts
COMMIT;

---------------
CREATE TABLE cart_items (
  item_id NUMBER PRIMARY KEY,
  customer_id NUMBER,
  quantity NUMBER,
  price NUMBER
);

-- Insert items into cart_items table for customer 1
INSERT INTO cart_items (item_id, customer_id, quantity, price)
VALUES (1, 1, 2, 10);

INSERT INTO cart_items (item_id, customer_id, quantity, price)
VALUES (2, 1, 1, 25);

-- Insert items into cart_items table for customer 2
INSERT INTO cart_items (item_id, customer_id, quantity, price)
VALUES (3, 2, 3, 5);

INSERT INTO cart_items (item_id, customer_id, quantity, price)
VALUES (4, 2, 2, 8);
COMMIT;
----------------
-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50)
);

-- Create AuditTable
CREATE TABLE AuditTable (
    AuditID NUMBER PRIMARY KEY,
    Operation VARCHAR2(20),
    TableName VARCHAR2(50),
    Timestamp TIMESTAMP
);
--------
