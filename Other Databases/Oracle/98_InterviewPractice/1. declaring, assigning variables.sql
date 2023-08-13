--- DECLARING & INITIALIZING & USING VARIABLES
SET SERVEROUTPUT ON;

DECLARE
    v_text VARCHAR2(50) NOT NULL DEFAULT 'HELLO';
BEGIN
    dbms_output.put_line(v_text);
END;
/
---------------------------------------------------------

--- ASSIGNING A VALUE -> must be inside DECLARE block
SET SERVEROUTPUT ON;

DECLARE
    v_text VARCHAR2(50) NOT NULL DEFAULT 'HELLO';
BEGIN
    v_text := 'HELLO MODIFIED' || ' FROM INSIDE BLOCK';
    dbms_output.put_line(v_text || ' , AGAIN CONCATENATED');
END;
/
---------------------------------------------------------

--- ASSIGNING A VALUE (Continued)
SET SERVEROUTPUT ON;

DECLARE
    v_text VARCHAR2(50) NOT NULL := 'WELCOME';
BEGIN
    dbms_output.put_line(v_text || ' , AGAIN CONCATENATED');
END;
/
---------------------------------------------------------

--- DECLARING & INITIALIZING & ASSIGNING A VALUE 
SET SERVEROUTPUT ON;

DECLARE
    v_text    VARCHAR2(50) NOT NULL DEFAULT 'HELLO';
    v_text1   VARCHAR2(50) NOT NULL := 'WELCOME';
    v_number  NUMBER NOT NULL := 50;
    v_number1 NUMBER NOT NULL := 50.42;
    v_number2 NUMBER(2) NOT NULL := 50.42;
    v_number3 NUMBER(4, 2) NOT NULL := 50.42; -- precision must be equal or higher to a number

BEGIN
    dbms_output.put_line(v_text); -- HELLO
    v_text := 'HELLO MODIFIED' || ' FROM INSIDE BLOCK';
    dbms_output.put_line(v_text); -- HELLO MODIFIED FROM INSIDE BLOCK
    dbms_output.put_line(v_text1 || ' , AGAIN CONCATENATED'); -- WELCOM , AGAIN CONCATENATED
    dbms_output.put_line(v_number || ' years ago'); -- 50 years ago
    dbms_output.put_line(v_number1 || ' years ago'); -- 50.42 years ago
    dbms_output.put_line(v_number2 || ' years ago'); -- 50 years ago
    dbms_output.put_line(v_number3 || ' years ago'); -- 50.42 years ago

END;
/