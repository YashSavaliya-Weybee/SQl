--1--select LAST_NAME, JOB_ID, SALARY AS Sal from EMPLOYEES;
--True

--2--select EMPLOYEE_ID, LAST_NAME, sal*12 ANNUAL SALARY from EMPLOYEES;
--there is no sal column in employees table and also not written AS after sal*12 and you can not name any column like this ANNUAL SALARY. you should write like this ANNUAL_SALARY
	
--3
EXEC sp_help 'dbo.DEPARTMENTS';

--4
select DISTINCT JOB_ID 
from EMPLOYEES;

--5
select EMPLOYEE_ID, SALARY AS OLDsALARY, (SALARY+(SALARY*0.155)) AS NewSalary, (SALARY*0.155) AS Increment 
from EMPLOYEES;

--6 
select min(SALARY) as Min, max(SALARY) as Max, SUM(CAST(SALARY AS INT)) as Sum, AVG(CAST(SALARY AS INT)) as Average, JOB_TITLE from EMPLOYEES
inner join JOBS on JOBS.JOB_ID = EMPLOYEES.JOB_ID
group by JOB_TITLE

--7
select CONCAT(A.FIRST_NAME, ' ', A.LAST_NAME) AS Employee_Name, A.HIRE_DATE AS Hire_Date, CONCAT(B.FIRST_NAME, ' ', B.LAST_NAME) AS Manager_Name, B.HIRE_DATE AS Manager_HireDate
from EMPLOYEES A INNER JOIN EMPLOYEES B ON A.MANAGER_ID = B.EMPLOYEE_ID
where A.HIRE_DATE < B.HIRE_DATE;

--8
create view Hr_Department AS
select distinct CONCAT(A.FIRST_NAME, ' ', A.LAST_NAME) AS Employee_Name, A.DEPARTMENT_ID AS Department, CONCAT(B.FIRST_NAME, ' ', B.LAST_NAME) AS Emps_working
from EMPLOYEES A INNER JOIN EMPLOYEES B ON A.DEPARTMENT_ID = B.DEPARTMENT_ID
where B.LAST_NAME != A.LAST_NAME;

select * from Hr_Department;

--9
select ROUND(MAX(SALARY), 0) as Maximum, ROUND(MIN(SALARY), 0) as Minimum, ROUND(SUM(SALARY), 0) as Sum, ROUND(AVG(SALARY), 0) as Average from EMPLOYEES;

--10
create view Emp_Sal_Report as
select CONCAT(FIRST_NAME, ' ', LAST_NAME) as Employee_Name, SALARY from EMPLOYEES
where SALARY > (select min(SALARY) from EMPLOYEES);

select * from Emp_Sal_Report;

--11
create view Emp_To_Jhonty as
select A.LAST_NAME, A.SALARY 
from EMPLOYEES A INNER JOIN EMPLOYEES B on A.MANAGER_ID = B.EMPLOYEE_ID where B.FIRST_NAME = 'Jhonty';

select * from Emp_TO_Jhonty;

--12
insert into JOBS
(JOB_ID, JOB_TITLE) values (10,'ST_Clerk')

select DEPARTMENT_ID from EMPLOYEES
inner join JOBS on JOBS.JOB_ID = EMPLOYEES.JOB_ID
where JOBS.JOB_TITLE <> 'ST_Clerk'
group by DEPARTMENT_ID

--13
select EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID from EMPLOYEES
where DEPARTMENT_ID = 50
union
select EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID from EMPLOYEES
where DEPARTMENT_ID = 80
