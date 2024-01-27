select employee_id, first_name from hr.employees;
select hire_date as joining_date from hr.employees;
select FIRST_NAME|| ' ' || last_name as Full_Name from hr.employees;
select * from hr.employees where salary*12 > 20000 AND salary*12 < 30000;
select * from hr.employees where department_id between 60 and 100;
select * from hr.employees 
join hr.departments
on hr.employees.department_id = hr.departments.department_id 
join hr.locations 
on hr.departments.location_id = hr.locations.location_id
where city = 'Toronto' or city = 'Sydney' or city='Hiroshima';
select * from hr.employees where first_name like '%ll%';
select * from hr.employees where commission_pct is null;
select * from hr.employees order by salary desc;


select INITCAP(first_name) || ' ' || last_name as Employee_Name, lower(job_id) as job_id from hr.employees;
select first_name, length(first_name) as length_of_name, instr(first_name, 'A') as Pos_of_A
from hr.employees where job_id = 'SA_MAN' or job_id = 'SA_REP';
select employee_id, TO_DATE(hire_date) as Hire_Date, TO_CHAR (hire_date, 'Month') as Hire_Month
from hr.employees where TO_CHAR(hire_date,'YYYY') = 2003;
select employee_id, Extract (Month from hire_date) AS Hire_Month, Extract (Year from hire_date) AS Hire_Year from hr.employees;
select first_name, to_char(hire_date, 'DD MONTH, YYYY') as "Hire_date[DD MONTH, YEAR]" from hr.employees;
select TO_CHAR(Salary ,'$99999') as "Salary" from hr.employees where first_name like 'Neena';
select NEXT_DAY(SYSDATE, 'Monday') as "Next Monday" from Dual;
select * from hr.employees where last_name like '%A%';
select last_name, substr(last_name, length(last_name)-2, length(last_name)) as "Last 3 chars" from hr.employees;
select employee_id, hire_date,TRUNC( MONTHS_BETWEEN(SYSDATE, hire_date),0) as "Months Employeed" , NEXT_DAY(hire_date,'Friday') 
as "First Friday " ,LAST_DAY (Hire_date) as "Last Day" from hr.employees where MONTHS_BETWEEN(SYSDATE,hire_date) >100;

select employee_id,
first_name || ' ' || last_name as full_Name,
salary as Current_salary,
12*(salary+salary*0.15) as Incremented_Salary,
12*(salary*0.15) as Incremented_amount
from hr.employees;
select first_name, hire_date, TO_CHAR(hire_date,'Day') AS day from employees order by to_char(hire_date-1,'d');
select department_id, manager_id, round(COMMISSION_PCT,1) as commission from employees;
select * from hr.employees where COMMISSION_PCT > 0 and department_id NOT IN(90 , 100); 
select * from hr.employees where EXTRACT (Year from hire_date) = 2010;
--OR both results in empty table :(
select * from hr.employees where to_char(HIRE_DATE, 'YYYY') = 2010;
select * FROM hr.employees,hr.jobs where jobs.min_salary > 8000 and jobs.min_salary<15000 and employees.commission_pct is null;
--OR
select job_id, salary, commission_PCT from hr.employees where commission_pct is null AND (SALARY between 8000 AND 15000);
select employee_id,first_name, last_name,job_id,department_id from hr.employees 
where employee_id > 100 and employee_id < 150 and department_id > 90 and department_id < 100;
SELECT salary+(commission_pct*salary) as Total_Salary,commission_pct FROM hr.employees WHERE commission_pct is not NULL;
