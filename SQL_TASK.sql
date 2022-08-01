--1
select LAST_NAME, JOB_ID, SALARY AS Sal 
from EMPLOYEES;

--2
select EMPLOYEE_ID, LAST_NAME, sal*12 ANNUAL SALARY from EMPLOYEES;

--3
EXEC sp_help 'dbo.DEPARTMENTS';

--4
select DISTINCT JOB_ID 
from EMPLOYEES;

--5
select EMPLOYEE_ID, SALARY AS OLDsALARY, (SALARY+(SALARY*0.155)) AS NewSalary, (SALARY*0.155) AS Increment 
from EMPLOYEES;

--6
select MAX(SALARY) AS Max_Salary, MIN(SALARY) AS Min_Salary, SUM(SALARY) AS Sum_Of_Salary, AVG(SALARY) AS Avg_Salary 
from EMPLOYEES;

--7
select CONCAT(A.FIRST_NAME, ' ', A.LAST_NAME) AS Name, A.HIRE_DATE AS Hire_Date, CONCAT(B.FIRST_NAME, ' ', B.LAST_NAME) AS Manager, B.HIRE_DATE AS Manager_Hire_Date
from EMPLOYEES A INNER JOIN EMPLOYEES B ON A.MANAGER_ID = B.EMPLOYEE_ID
where A.HIRE_DATE < B.HIRE_DATE;

--8
create view Employee_Report AS
select distinct CONCAT(A.FIRST_NAME, ' ', A.LAST_NAME) AS Emp_Name, A.DEPARTMENT_ID AS Same_Dept, CONCAT(B.FIRST_NAME, ' ', B.LAST_NAME) AS Other_Emp
from EMPLOYEES A INNER JOIN EMPLOYEES B ON A.DEPARTMENT_ID = B.DEPARTMENT_ID
where B.LAST_NAME != A.LAST_NAME;

select * from Employee_Report;

--9
select MAX(SALARY) AS Maximum, MIN(SALARY)AS Minimum, SUM(SALARY) AS Sum, ROUND(AVG(SALARY), 0) AS Average from EMPLOYEES;

--10
create VIEW Salary_List_Report AS
select * from EMPLOYEES 
where SALARY > (select SALARY from EMPLOYEES where DEPARTMENT_ID = 4);

select * from Salary_List_Report;

--11
create VIEW Employee_To_Jhonty AS
select A.LAST_NAME, A.SALARY 
from EMPLOYEES A INNER JOIN EMPLOYEES B ON A.MANAGER_ID = B.EMPLOYEE_ID where B.FIRST_NAME = 'Jhonty';

select * from Employee_TO_Jhonty;

--12
UPDATE JOBS 
SET JOB_TITLE = 'ST_Clerk' where Job_ID = 8;

select DEPARTMENT_ID from EMPLOYEES
where DEPARTMENT_ID != 8
UNION 
select DEPARTMENT_ID from EMPLOYEES
where DEPARTMENT_ID != 8;

--13
select EMPLOYEE_ID, Job_ID, DEPARTMENT_ID from EMPLOYEES
where DEPARTMENT_ID IN (50, 80) ORDER BY Department_ID;

--Getting day/month/year from date-
select DAY(Hire_Date) from EMPLOYEES;
select MONTH(Hire_Date) from EMPLOYEES;
select YEAR(Hire_Date) from EMPLOYEES;