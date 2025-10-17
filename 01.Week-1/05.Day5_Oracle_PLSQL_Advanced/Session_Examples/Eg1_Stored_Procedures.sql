

----------------------------------------------------------------------------
--  **  Working with Stored Procedures  in Oracle **
----------------------------------------------------------------------------

--   Example 1: Simple Greeting Procedure
--   Purpose: Takes a name as input and returns a personalized greeting.

CREATE OR REPLACE PROCEDURE greet_user(p_name IN VARCHAR2, p_greeting OUT VARCHAR2)
IS
BEGIN
    p_greeting := 'Hello, ' || p_name || '! Welcome to Oracle!';
END greet_user;
/


-- Testing  / Invoke Stored Procedure
DECLARE
    v_message VARCHAR2(100);
BEGIN
    greet_user('Narasimha', v_message);
    DBMS_OUTPUT.PUT_LINE(v_message);
END;
/


----------------------------------------------------------------------------------------

--- Example 2: Employee Bonus Calculator
--- Purpose: Calculates bonus based on salary and returns the bonus amount.

CREATE OR REPLACE PROCEDURE calculate_bonus(p_salary IN NUMBER, p_bonus OUT NUMBER)
IS
BEGIN
    -- 10% bonus if salary > 5000, else 5%
    IF p_salary > 5000 THEN
        p_bonus := p_salary * 0.10;
    ELSE
        p_bonus := p_salary * 0.05;
    END IF;
END calculate_bonus;
/


DECLARE
    v_bonus NUMBER;
BEGIN
    calculate_bonus(6000, v_bonus);
    DBMS_OUTPUT.PUT_LINE('Bonus: $' || v_bonus);
    
    calculate_bonus(3000, v_bonus);
    DBMS_OUTPUT.PUT_LINE('Bonus: $' || v_bonus);
END;
/

----------------------------------

--  Example 3: Get Department Salary Summary
-- Purpose: Takes a department number and returns total salary and employee count for that department.

CREATE OR REPLACE PROCEDURE dept_salary_summary(
    p_deptno IN NUMBER,
    p_total_sal OUT NUMBER,
    p_emp_count OUT NUMBER
)
IS
BEGIN
    SELECT  SUM(sal), COUNT(*) INTO  p_total_sal, p_emp_count
    FROM emps
    WHERE deptno = p_deptno;
    
    -- If no employees found, set defaults
    IF p_emp_count = 0 THEN
        p_total_sal := 0;
        p_emp_count := 0;
    END IF;
END dept_salary_summary;
/


DECLARE
    v_total_sal NUMBER;
    v_emp_count NUMBER;
BEGIN
    -- Test with Department 10
    dept_salary_summary(10, v_total_sal, v_emp_count);
    DBMS_OUTPUT.PUT_LINE('Dept 10: ' || v_emp_count || ' employees, Total Salary: $' || v_total_sal);
    
    -- Test with Department 20
    dept_salary_summary(20, v_total_sal, v_emp_count);
    DBMS_OUTPUT.PUT_LINE('Dept 20: ' || v_emp_count || ' employees, Total Salary: $' || v_total_sal);
END;
/



 








