-- Task 1
select department_id, count(*) no_of_employees, TRUNC(avg(salary),1) avg_salary from hr.employees group by department_id;

-- task 2
select job_id, count(*) no_of_employees from hr.employees group by job_id;

-- Task 3 
SELECT FIRST_NAME, HIRE_DATE FROM HR.EMPLOYEES WHERE HIRE_DATE > 
(SELECT HIRE_DATE FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 110);

-- Task 4
SELECT DEPARTMENT_ID, MAX(SALARY) 
FROM HR.EMPLOYEES GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY) > 15000;

-- Task 5
select * from hr.employees;
select employee_id, first_name || ' ' || last_name as Full_Name, job_id from hr.employees
where salary < any (select salary from hr.employees where job_id = 'IT_PROG');

-- TASK 6
select * from hr.employees where DEPARTMENT_ID not in (select DEPARTMENT_ID from hr.job_history);

-- Task 7
select manager_id, min(salary) min_salary from hr.employees where salary in
(select min(salary) from hr.employees group by manager_id having (min(salary) != 2000 and manager_id is not null))
group by manager_id order by min(salary); 

-- Task 8
create table clone_employee as select * from hr.employees where 1=2;

insert into clone_employee 
select * from hr.employees where employee_id =
(select employee_id from hr.job_history where start_date = '13-JAN-01');

select * from clone_employee;

-- Task 9
update clone_employee
set salary = salary+(salary*0.2)
where job_id in
(select job_id from hr.jobs where min_salary = 6000);

-- Task 10
delete from clone_employee
where manager_id = 
(select manager_id from hr.departments where department_name = 'Finance');

-- TASK 11
select department_id, count(employee_id) No_of_employees
from hr.employees
where salary*12 > 20000
group by department_id having count(employee_id)>5;



