

----------------------------------------------------------------------------
--  **  Working with Views   in Oracle PL/SQL**
----------------------------------------------------------------------------


--  Example 1: View Showing Employee-Department Details

CREATE OR REPLACE VIEW vw_emp_details AS
SELECT e.empno,
e.ename,
e.sal,
d.dname
FROM emps e
JOIN dept d ON e.deptno = d.deptno;


SELECT * FROM vw_emp_details;

------------------------------------------------------------------------------------------------------
-- Example 2: Inline View for Top 3 Salaries

SELECT *   FROM (    
SELECT empno, ename, sal
FROM emps
ORDER BY sal DESC
)
WHERE ROWNUM <= 3;



----------------------------------------

-- Example:3 :   Create MATERIALIZED view to store Department Summary


CREATE  MATERIALIZED VIEW mv_dept_summary
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND  
AS
SELECT  deptno, COUNT(*) AS emp_count, AVG(sal) AS avg_salary
FROM emps
GROUP BY deptno; 

DROP MATERIALIZED VIEW mv_dept_summary;

SELECT * from mv_dept_summary;

INSERT INTO Emps VALUES(2244,'STEVE','MANAGER',9975,40);

-- Refresh when needed
EXEC DBMS_MVIEW.REFRESH('mv_dept_summary');

select * from emps;











