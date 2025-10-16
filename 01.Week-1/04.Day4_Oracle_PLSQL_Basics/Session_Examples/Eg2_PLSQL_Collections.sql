
-- Example-1: Create an array to store salaries and keys are Integer 
    DECLARE
       -- Step 1: Define an associative array type
       TYPE salary_table IS TABLE OF NUMBER
          INDEX BY PLS_INTEGER;
    
       -- Step 2: Declare a variable of that type
       emp_salaries salary_table;
    
    BEGIN
       -- Step 3: Assign values
       emp_salaries(100) := 5000;
       emp_salaries(101) := 6000;
       emp_salaries(102) := 5500;
    
       -- Step 4: Access values
       DBMS_OUTPUT.PUT_LINE('Salary of Emp 102: ' || emp_salaries(102));
    END;



--  Example:2  --  String based keys
DECLARE
  TYPE t_employee IS TABLE OF NUMBER
    INDEX BY VARCHAR2(50);

  v_salary t_employee;
BEGIN
  v_salary('Alice') := 50000;
  v_salary('Bob')   := 60000;
  v_salary('Eve')   := 55000;

  DBMS_OUTPUT.PUT_LINE('Salary of Eve: ' || v_salary('Eve'));
END;
/


-- Example:3    One more example on  String based Keys
DECLARE
  TYPE t_country_capital IS TABLE OF VARCHAR2(50)
    INDEX BY VARCHAR2(50);

  v_capitals t_country_capital;
  v_key VARCHAR2(50);
BEGIN
  v_capitals('USA') := 'Washington';
  v_capitals('France') := 'Paris';
  v_capitals('Japan') := 'Tokyo';

  v_key := v_capitals.FIRST;

  WHILE v_key IS NOT NULL LOOP
    DBMS_OUTPUT.PUT_LINE(v_key || ' → ' || v_capitals(v_key));
    v_key := v_capitals.NEXT(v_key);
  END LOOP;
END;
/




-- Example-4: Create an array to store salaries and keys are Integer, Array Iteration

    DECLARE
       -- Step 1: Define an associative array type
       TYPE salary_table IS TABLE OF NUMBER
          INDEX BY PLS_INTEGER;
    
       -- Step 2: Declare a variable of that type
       emp_salaries salary_table;
       v_key PLS_INTEGER;
    
    BEGIN
       -- Step 3: Assign values
       emp_salaries(100) := 5000;
       emp_salaries(101) := 6000;
       emp_salaries(102) := 5500;
       
       
        v_key := emp_salaries.FIRST;
    
        WHILE v_key IS NOT NULL LOOP
            DBMS_OUTPUT.PUT_LINE(v_key || ' → ' || emp_salaries(v_key));
            v_key := emp_salaries.NEXT(v_key);
        END LOOP; 
      
      
    END;


-- Example-5:   Storing table column data into array,  key : empno and value : Salary 

DECLARE
    
   TYPE emp_sal_tab IS TABLE OF emps.sal%TYPE
       INDEX BY PLS_INTEGER; 
    
    emp_salaries emp_sal_tab;  --  array declaration of type emps.sal
    
BEGIN

   FOR rec IN (SELECT empno, sal FROM emps) LOOP
      emp_salaries(rec.empno) := rec.sal * 1.1; -- give 10% raise
   END LOOP;
   
      
   DBMS_OUTPUT.PUT_LINE('Saved salaries in memory.'); 
   
END;


