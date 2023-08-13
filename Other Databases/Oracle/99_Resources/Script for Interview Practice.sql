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