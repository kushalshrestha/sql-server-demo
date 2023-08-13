/* Question: Suppose you have a table named "credit_card_accounts" with columns "account_number,"balance"
You want to retrieve and display credit card account using cursor
*/

select * from credit_card_accounts;
/

DECLARE
    CURSOR cur_credit_card_accounts IS 
        SELECT ACCOUNT_NUMBER, BALANCE
        FROM credit_card_accounts;
    account_number credit_card_accounts.account_number%TYPE;
    balance credit_card_accounts.balance%TYPE;

BEGIN
    OPEN cur_credit_card_accounts;
    
    LOOP
        FETCH cur_credit_card_accounts INTO account_number, balance;
        EXIT WHEN cur_credit_card_accounts%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Account Number :' || account_number || ', balance :' || balance);
    END LOOP;
    
    CLOSE cur_credit_card_accounts;
END;
/

