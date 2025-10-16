-- Examples on PL/SQL Blocks & Variables 



--  Eg:1 -- Basic Output Statement in PL/SQL
BEGIN
   DBMS_OUTPUT.PUT_LINE('Welcome to PL/SQL!');
END;

------------------------------------------------------------------------------------------

--  Eg:2 --  PL/SQL with variables 

DECLARE
     v_uname VARCHAR2(20)  :=  'Scott';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hi ' || v_uname || ', Good morning...!');        
END;


------------------------------------------------------------------------------------------

--- Example 3 (Using Variables with SQL)
--  Combines SQL query with programming logic.

DECLARE
   v_count NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_count FROM emps;
   DBMS_OUTPUT.PUT_LINE('Total emps: ' || v_count);
END;


------------------------------------------------------------------------------------------

--- Example 4     Usage of   If...Else

DECLARE
   v_sal NUMBER;
BEGIN
   SELECT sal INTO v_sal FROM emps WHERE empno = 7900;
   IF v_sal > 3000 THEN
      DBMS_OUTPUT.PUT_LINE('High sal employee');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Normal sal employee');
   END IF;
END;


------------------------------------------------------------------------------------------

 --- Example 5:   Exception  Handling for Data Validation


-- WITHOUT Exception block 
DECLARE
   v_dept emps.deptno%TYPE;
BEGIN
   SELECT deptno INTO v_dept FROM emps WHERE empno  = 9999;
   DBMS_OUTPUT.PUT_LINE('Department Number : ' || v_dept);
END;



-- WITH Exception block  
DECLARE
   v_dept emps.deptno%TYPE;
BEGIN
   SELECT deptno INTO v_dept FROM emps WHERE empno  = 9999;
   DBMS_OUTPUT.PUT_LINE('Department Number : ' || v_dept);
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No such employee found!');
END;


------------------------------------------------------------------------------------------

 --- Example6:   Working with attributes in PL/SQL --  TYPE


DECLARE
   v_dept emps.deptno%TYPE;
BEGIN
   SELECT deptno INTO v_dept FROM emps WHERE empno  = 9999;
   DBMS_OUTPUT.PUT_LINE('Department Number : ' || v_dept);
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No such employee found!');
END;


------------------------------------------------------------------------------------------

 --- Example7:   Working with attributes in PL/SQL --  ROWTYPE
DECLARE
   emp_record emps%ROWTYPE;
BEGIN
   SELECT * INTO emp_record  FROM emps  WHERE empno = 7788;
   DBMS_OUTPUT.PUT_LINE('Name: ' || emp_record.ename || ', Job :  ' || emp_record.job);
END;





