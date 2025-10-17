
----------------------------------------------------------------------------
--  **  Working with Triggers   in Oracle PL/SQL**
----------------------------------------------------------------------------


--  Example 1: Validating Data (BEFORE INSERT Trigger)

CREATE OR REPLACE TRIGGER trg_check_salary
BEFORE INSERT OR UPDATE OF sal ON emps
FOR EACH ROW
BEGIN
    IF :NEW.sal < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative');
    END IF;
END;
/



    SELECT  * FROM Emps;
	INSERT INTO Emps VALUES(1122,'STEVE','MANAGER',-2975,20);
    UPDATE EMPS set sal = -6500 where empno =  7788;





----------------------------------------------------------------------------
-- Example2 :   Auditing Changes (AFTER UPDATE Trigger)


-- Create an audit table first
CREATE TABLE emp_audit (
    empno NUMBER,
    old_salary NUMBER,
    new_salary NUMBER,
    changed_on DATE
);

-- Create the trigger
CREATE OR REPLACE TRIGGER trg_emp_audit
AFTER UPDATE 
OF sal 
ON emps
FOR EACH ROW
BEGIN
    INSERT INTO emp_audit (empno, old_salary, new_salary, changed_on)
    VALUES (:OLD.empno, :OLD.sal, :NEW.sal, SYSDATE);
END;
/


UPDATE EMPS set sal = 6500 where empno =  7788;
SELECT * FROM emp_audit;

 