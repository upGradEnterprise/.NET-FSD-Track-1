
-- ***************************************
-- Working with Cursors in PL/SQL
-- ***************************************

-- Example:1    An implicit cursor is automatically created by Oracle 
-- for any single-row SELECT INTO statement.

DECLARE
  v_ename  emps.ename%TYPE;
  v_sal    emps.sal%TYPE;
BEGIN
  SELECT ename, sal  INTO v_ename, v_sal   FROM emps
  WHERE empno = 7369;

  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_ename);
  DBMS_OUTPUT.PUT_LINE('Salary: ' || v_sal);
END;
---------------------------------------------------------------------------


-- Example-2 
-- An explicit cursor lets you manually control opening, fetching, and closing.
-- Appying for only one column

DECLARE
  CURSOR cur_emp IS  SELECT  ename FROM emps; 
  v_ename emps.ename%TYPE;
 
BEGIN
  OPEN cur_emp;
  LOOP
        FETCH cur_emp INTO  v_ename;
        EXIT WHEN cur_emp%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE( 'Name: ' || v_ename);    
  END LOOP;
  CLOSE cur_emp;
END; 


------------------------------------------------------------
-- Example-3
-- An explicit cursor lets you manually control opening, fetching, and closing.

 
DECLARE
  CURSOR cur_emp IS  SELECT empno, ename, sal, deptno FROM emps;

  v_empno emps.empno%TYPE;
  v_ename emps.ename%TYPE;
  v_sal   emps.sal%TYPE;
  v_dept  emps.deptno%TYPE;
BEGIN
  OPEN cur_emp;
  LOOP
    FETCH cur_emp INTO v_empno, v_ename, v_sal, v_dept;
        EXIT WHEN cur_emp%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(
      'Emp No: ' || v_empno || ', Name: ' || v_ename ||
      ', Salary: ' || v_sal || ', Dept: ' || v_dept
    );
  END LOOP;
  CLOSE cur_emp;
END;
 

 