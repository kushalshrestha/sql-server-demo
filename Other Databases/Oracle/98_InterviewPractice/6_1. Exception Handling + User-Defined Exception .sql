SET SERVEROUTPUT ON;

DECLARE
    v_account_number NUMBER := 1234567890;
    v_balance credit_card_accounts.balance%TYPE;
    BalanceTooLow Exception;
BEGIN
    select balance
    into v_balance
    from credit_card_accounts
    where account_number = v_account_number;
    
    IF v_balance < 5000 THEN
        RAISE BalanceTooLow;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Your Credit Balance : ' || v_balance);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Account Number not found.');
    WHEN BalanceTooLow THEN
        DBMS_OUTPUT.PUT_LINE('Balance is too low.');
END;
/
        