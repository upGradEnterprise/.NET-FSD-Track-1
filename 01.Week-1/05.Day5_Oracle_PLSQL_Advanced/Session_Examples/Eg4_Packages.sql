CREATE OR REPLACE PACKAGE emp_actions_pkg IS
    PROCEDURE add_bonus(p_emp_id IN NUMBER, p_bonus IN NUMBER);
    FUNCTION get_total_compensation(p_emp_id IN NUMBER) RETURN NUMBER;
END emp_actions_pkg;
/
CREATE OR REPLACE PACKAGE BODY emp_actions_pkg IS
    PROCEDURE add_bonus(p_emp_id IN NUMBER, p_bonus IN NUMBER) IS
        BEGIN
        UPDATE emps
        SET sal = sal + p_bonus
        WHERE empno = p_emp_id;
        COMMIT;
    END add_bonus;
    
    FUNCTION get_total_compensation(p_emp_id IN NUMBER) RETURN NUMBER IS
        v_salary NUMBER;
        BEGIN
        SELECT sal INTO v_salary FROM emps WHERE empno = p_emp_id;
        RETURN v_salary * 12;
    END get_total_compensation;
END emp_actions_pkg;
/
-- Run:
EXEC emp_actions_pkg.add_bonus(7788, 500);
SELECT emp_actions_pkg.get_total_compensation(7788) FROM dual;

SELECT * FROM emps WHERE empno=7788;


