/* Q. Suppose you want to update the salaries of employees based on a percentage increase using Bulk Collect and FORALL.*/
select * from credit_card_accounts;

SET SERVEROUTPUT ON;

DECLARE
    TYPE credit_card_accounts_table is table of credit_card_accounts%ROWTYPE;
    account_data credit_card_accounts_table;
BEGIN
    -- Fetch data into collection using Bulk Collect
    select * bulk collect 
    into account_data
    from credit_card_accounts;
    
    -- Update balance in the collection (only in the collection, not in the database)
    FOR i IN 1..account_data.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Account Number :' || account_data(i).account_number);
        DBMS_OUTPUT.PUT_LINE('Balance :' || account_data(i).balance);
        account_data(i).balance := account_data(i).balance * 1.10; -- 10% increase
        
    END LOOP;
    
    -- FORALL expects only DML statement (INSERT UPDATE DELETE)
    FORALL i IN 1..account_data.COUNT
        /* Updating */
            UPDATE credit_card_accounts
            SET balance = account_data(i).balance
            WHERE account_number = account_data(i).account_number;
    
    COMMIT;
    
END;
/
