----------------------------------------------------------------------------
--  **  Working with Functions   in Oracle PL/SQL**
----------------------------------------------------------------------------


-- Example-1:   Function to return Hello World Message
CREATE OR REPLACE FUNCTION hello_world
RETURN VARCHAR2
IS
BEGIN
  RETURN 'Hello World';
END;


-- Invoke function 
SELECT hello_world() as Result FROM dual;

------------------------------------------------------------------

-- Example-2:   Function to return Greeting message based on the name

CREATE OR REPLACE FUNCTION get_greeting(name IN VARCHAR2)
RETURN VARCHAR2
IS
BEGIN
  RETURN 'Hello, ' || name || '!';
END;
/

SELECT get_greeting('Alice') FROM dual;

--------------------------------------------------------------------------------------------
--   Example 3:  Function to Calculate Tax

CREATE OR REPLACE FUNCTION calc_tax (  
				p_amount  NUMBER
)
RETURN NUMBER
IS
BEGIN
		RETURN p_amount * 0.1; 			--10% tax
END;

-- Use it:
SELECT calc_tax(1000) AS tax FROM dual;

-------------------------------------------------------------------------------

--   Example 4:  Function with Database Query – Get Employee Salary

  
CREATE OR REPLACE FUNCTION get_employee_salary(emp_id IN NUMBER)
RETURN NUMBER
IS
  v_salary NUMBER;
BEGIN
  SELECT sal INTO v_salary
  FROM emps
  WHERE empno = emp_id;

  RETURN v_salary;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
/



SELECT get_employee_salary(7788) FROM dual;


 