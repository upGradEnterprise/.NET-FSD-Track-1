
CREATE TABLE Dept
(
	Deptno NUMBER PRIMARY KEY,
	Dname VARCHAR2(50),
	Loc VARCHAR2(50) 
);


INSERT INTO Dept VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO Dept VALUES (20,'RESEARCH','DALLAS');
INSERT INTO Dept VALUES (30,'SALES','CHICAGO');
INSERT INTO Dept VALUES (40,'OPERATIONS','BOSTON');
INSERT INTO Dept VALUES (50,'TESTING','CHICAGO');
 
SELECT * FROM Dept;

DROP TABLE Dept;	-- Delete data and structure of the table 
---------------------------------------------------------------------



CREATE TABLE Emps
(
	Empno NUMBER PRIMARY KEY,
	Ename VARCHAR2(50),
	Job   VARCHAR2(50),
	Sal   FLOAT,
	Deptno NUMBER,	 
    CONSTRAINT fk_dept FOREIGN KEY (Deptno) REFERENCES Dept(Deptno)
) 

DROP TABLE Emps


SELECT * FROM Emps
 


	INSERT INTO Emps VALUES(7369,'SMITH','CLERK',800,  20);
	INSERT INTO Emps VALUES(7499,'ALLEN','SALESMAN',1600,30);
	INSERT INTO Emps VALUES(7521,'WARD','SALESMAN',1250,30);
	INSERT INTO Emps VALUES(7566,'JONES','MANAGER',2975,20);
	INSERT INTO Emps VALUES(7654,'MARTIN','SALESMAN',1250,30);
	INSERT INTO Emps VALUES(7698,'BLAKE','MANAGER',7839,30);
	INSERT INTO Emps VALUES(7782,'CLARK','MANAGER',7839,10);
	INSERT INTO Emps VALUES(7788,'SCOTT','ANALYST',7566,20);
	INSERT INTO Emps VALUES(7839,'KING','PRESIDENT',8900, 10);
	INSERT INTO Emps VALUES(7844,'TURNER','SALESMAN',1500,30);
	INSERT INTO Emps VALUES(7876,'ADAMS','CLERK',1100, 20);
	INSERT INTO Emps VALUES(7900,'JAMES','CLERK',950,30);
	INSERT INTO Emps VALUES(7902,'FORD','ANALYST',3000,20);
	INSERT INTO Emps VALUES(7934,'MILLER','CLERK',1300,10);

 
 
 ---------------------------------------------------------------
 
 -- Working with Set Operators
 
--  Example 1 — List all department locations and employee job titles (distinct):
 
SELECT loc AS info FROM dept
    UNION
SELECT job  FROM emps;


-- Example 2 — List all department numbers from both tables (distinct):
SELECT deptno FROM emps
UNION
SELECT deptno FROM dept;


-- Example 3 — List all department numbers from both tables (including duplicates):
SELECT deptno FROM emps
UNION ALL
SELECT deptno FROM dept;


-- Example 4 — List department numbers that exist in Dept but have no employees:
SELECT deptno FROM dept
MINUS
SELECT deptno FROM emps;


-- Example 5 — List job titles not present in department 10:
SELECT job FROM emps
MINUS
SELECT job FROM emps WHERE deptno = 10;



--  Example 6 — List department numbers common to both tables:

SELECT deptno FROM emps
INTERSECT
SELECT deptno FROM dept;


-- Example 7:   List job titles common between department 10 and department 20:
SELECT job FROM emps WHERE deptno = 10
INTERSECT
SELECT job FROM emps WHERE deptno = 20;


