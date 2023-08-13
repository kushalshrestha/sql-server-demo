/* Q. Suppose you want to create a trigger that automatically updates an "audit" table whenever a new employee is 
inserted into the "Employees" table. The audit table will store information about the operation and the timestamp.
*/
-- Create Trigger
CREATE OR REPLACE TRIGGER employee_audit
AFTER INSERT OR UPDATE OR DELETE ON Employees
FOR EACH ROW
DECLARE
    v_operation VARCHAR2(20);
BEGIN
    IF INSERTING THEN
        v_operation := 'INSERT';
    ELSIF UPDATING THEN
        v_operation := 'UPDATE';
    ELSIF DELETING THEN
        v_operation := 'DELETE';
    END IF;

    INSERT INTO AuditTable (Operation, TableName, Timestamp)
    VALUES (v_operation, 'Employees', SYSTIMESTAMP);

END;
/


-- Insert an employee
INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES (1, 'John', 'Doe');


-- Update an employee
UPDATE Employees SET FirstName = 'Jane' WHERE EmployeeID = 1;

-- Delete an employee
DELETE FROM Employees WHERE EmployeeID = 1;

COMMIT;

-- Query AuditTable to see audit records
SELECT * FROM AuditTable;
