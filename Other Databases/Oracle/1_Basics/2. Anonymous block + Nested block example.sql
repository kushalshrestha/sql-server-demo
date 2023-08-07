SET SERVEROUTPUT ON
BEGIN
--packageName.procedureName
DBMS_OUTPUT.PUT_LINE('HELLO WORLD');

END;

------------------ NESTED BLOCK EG: ---------
SET SERVEROUTPUT ON;
BEGIN
dbms_output.put_line('Hello World');
    BEGIN
        dbms_output.put_line('Nested Block PL/SQL');
    END;

END;