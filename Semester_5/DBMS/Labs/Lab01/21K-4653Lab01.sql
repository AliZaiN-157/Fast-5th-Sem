--Task# 1
select * from hr.jobs;

--Task# 2
select min_salary, max_salary from hr.jobs where JOB_TITLE = 'President';

--Task# 3
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
from hr.employees
where SALARY> 20000;

--Task# 4
select job_title
from HR.JOBS 
join HR.EMPLOYEES
on HR.JOBS.JOB_ID = HR.EMPLOYEES.JOB_ID
Where HR.EMPLOYEES.SALARY >= 15000;
--OR
SELECT JOB_ID FROM HR.EMPLOYEES WHERE SALARY >=15000;


--Task# 5
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID
from HR.EMPLOYEES where LAST_NAME = 'King';

--Task# 6
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID
from HR.EMPLOYEES where DEPARTMENT_ID = 50;

--Task# 7
select phone_number from HR.EMPLOYEES where department_id = 80 and manager_id = 100;

--Task# 8
select * from HR.EMPLOYEES where (FIRST_NAME = 'John' or FIRST_NAME = 'Neena' or FIRST_NAME = 'Lency');

--Task# 9
select city from hr.locations where country_id = 'IT';

--Task# 10
select city from hr.locations where country_id != 'IN' and country_id != 'CN';

--Task# 11
select * from hr.jobs where min_salary > 8000 and min_salary < 15000;

--Task# 12
select phone_number from hr.employees where department_id = 90 and job_id != 'IT';

--Task# 13
select * from hr.employees where hire_date > '12-Dec-07';

--Task# 14
select * from hr.employees where hire_date > '12-Dec-07' and department_id = 100;

--Task# 15
select * from hr.employees where hire_date > '12-Dec-07' and department_id != 100;





