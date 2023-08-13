/* Question: How would you write a PL/SQL block to update the "balance" column of a "credit_card_accounts" table for a specific account number? */

select *
from credit_card_accounts
fetch first 10 rows only;
/

SET SERVEROUTPUT ON;

DECLARE
    v_account_number credit_card_accounts.account_number%TYPE :='1234567890';
    v_new_balance credit_card_accounts.account_number%TYPE := 1500;
BEGIN
    UPDATE credit_card_accounts
    SET balance = v_new_balance
    WHERE account_number = v_account_number;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Balance Updated Successfully');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error Updating balance: ' || SQLERRM);
END;
/

select *
from credit_card_accounts
fetch first 10 rows only;
