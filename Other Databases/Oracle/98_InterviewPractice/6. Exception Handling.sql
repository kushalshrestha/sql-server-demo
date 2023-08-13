/* Q. Show an example for exception handling*/
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50)
);
/
INSERT INTO Employees VALUES (1, 'John', 'Doe');
INSERT INTO Employees VALUES (2, 'Jane', 'Smith');
COMMIT;
/

DECLARE
    v_employee_id NUMBER := 1000;
    v_last_name VARCHAR2(50);
BEGIN
    select LastName into v_last_name
    from Employees
    where EmployeeID = v_employee_id;
    
    DBMS_OUTPUT.PUT_LINE('Employee Last Name: ' || v_last_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found');
END;
