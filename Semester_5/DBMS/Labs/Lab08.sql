--Task 1
DECLARE 
    enum integer;
    esal integer;
BEGIN
    enum:=&enum;
    select salary into esal from employees where employee_id = enum;
    if(esal<1000) THEN
        esal := esal+(esal*0.1);
    ELSIF(esal>= 1000 and esal<=1500) THEN
        esal := esal+(esal*0.15);
    ELSIF(esal> 1500) THEN
        esal := esal+(esal*0.20);
    ELSE
        esal := 0;
    END IF;    
    dbms_output.put_line('Incremented salary is: '||esal);    
END;

--Task 2
DECLARE 
    enum integer;
    esal integer;
    ecom float;
BEGIN
    enum:=&enum;
    select salary into esal from employees where enum=employee_id;
    select commission_pct into ecom from employees where enum = employee_id;
    if (ecom is not null) THEN
        esal := esal+(esal*ecom);
        update employees set salary = esal where enum=employee_id;
    else
        dbms_output.put_line('Commission is 0 ');
    end if;
END;

--Task 3
DECLARE 
    dname varchar(40);
BEGIN
    select department_name into dname from departments d where d.DEPARTMENT_ID=30;
    dbms_output.put_line('The department name is: '||dname);
END;

--Task 4
set serveroutput on
create or replace procedure getJobNature (dnum in integer)
as
    nature varchar(30);
BEGIN
    for v IN (select job_id,employee_id from employees where department_id = dnum)
    LOOP
        dbms_output.put_line('Job id for employee '|| v.employee_id || ' is: ' ||v.job_id);
    END LOOP;
END;
select getJobNature(20) from EMPLOYEES;

--Task 5
set serveroutput on
create or replace procedure getSalary (dnum in integer)
as

BEGIN
    for v IN (select salary,employee_id from employees where department_id = dnum)
    LOOP
        dbms_output.put_line('Salary for employee '|| v.employee_id || ' is: ' ||v.salary);
    END LOOP;    
END;
    select getSalary(20) from employees;
    
--Task 6
set serveroutput on
create or replace procedure updateSalary (empno in integer)
as
    
BEGIN
    update employees set salary = salary+(salary*10) where employee_id=empno;
    dbms_output.put_line('Salary Updated!');  
END;
    exec updateSalary(100);

--Task 7
set serveroutput on
create or replace procedure getSalary (dnum in integer)
as
    
BEGIN
    update employees set salary = salary+1000 where salary>5000 and department_id=dnum;    
END;
exec getSalary(20);


--Task 9
DECLARE 
    num1 integer;
    num2 integer;
    sums integer;
BEGIN
    num1 := &num1;
    num2 := &num2;
    sums := num1+num2;
    dbms_output.put_line('The sum is: '|| sums);
END;

--Task 10
DECLARE 
    num1 integer;
    num2 integer;
    sums integer;
BEGIN
    sums := 0;
    num1 := &num1;
    num2 := &num2;
    for a in num1..num2 LOOP
    sums := sums+a;
    END LOOP;
    dbms_output.put_line('The sum is: '|| sums);
END;

--Task 11
DECLARE 
    empno integer;
    fname varchar(30);
    dname varchar(30);
    hdate date;
BEGIN
    empno := &empno;
    select first_name into fname from employees 
    where employee_id = empno;
    select department_name into dname from departments 
    where department_id = (select department_id from employees 
    where employee_id = empno); 
    select hire_date into hdate from employees where employee_id = empno;
    dbms_output.put_line('The employee name is '|| fname);
    dbms_output.put_line('The employee department name is '|| fname);
    dbms_output.put_line('The employee hire date is '|| hdate);
END;

--Task 12
DECLARE 
temp integer;
numb integer;
rev integer;
BEGIN 
    rev := 0;
    numb := &numb;
    temp := numb;
    while temp>0 
    LOOP
        rev := rev*10;
        rev := rev + MOD(temp,10);
        temp := temp/10;
        
    END LOOP;
    IF(rev = numb) THEN
        dbms_output.put_line('Number is Paldindrome');
    ELSE
        dbms_output.put_line('Number is not Paldindrome');
    END IF;    
END;

--Task 13
DECLARE 
EMPLOYEE_ID integer;
FIRST_NAME varchar(20);
LAST_NAME   varchar(20);
EMAIL   varchar(20);
PHONE_NUMBER    varchar(20);
HIRE_DATE   date;
JOB_ID  varchar(20);
SALARY  integer;
COMMISSION_PCT float;
MANAGER_ID  integer;
DEPARTMENT_ID   integer;
BEGIN 
    EMPLOYEE_ID := &EMPLOYEE_ID;
    FIRST_NAME := FIRST_NAME;
    LAST_NAME := LAST_NAME;
    EMAIL := EMAIL;
    PHONE_NUMBER := PHONE_NUMBER;
    HIRE_DATE := HIRE_DATE;
    JOB_ID := JOB_ID;
    SALARY := SALARY;
    COMMISSION_PCT := COMMISSION_PCT;
    MANAGER_ID := MANAGER_ID;
    DEPARTMENT_ID := DEPARTMENT_ID;
END;

--Task 14

set serveroutput on;
DECLARE
    emp_salary EMPLOYEES.SALARY%type:=0;
    emp_first_name EMPLOYEES.FIRST_NAME%type;
    emp_last_name EMPLOYEES.LAST_NAME%type;
    emp_employee_id EMPLOYEES.EMPLOYEE_ID%type := 7499;
    emp_manager_id EMPLOYEES.MANAGER_ID%type := 7499;
BEGIN
    SELECT MANAGER_ID INTO emp_manager_id FROM EMPLOYEES WHERE EMPLOYEE_ID = emp_employee_id;
    WHILE(emp_salary <= 2500)
    LOOP
        SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY INTO emp_employee_id, emp_first_name, emp_last_name, emp_salary
        FROM EMPLOYEES WHERE EMPLOYEE_ID = emp_employee_id;
    END LOOP;
    dbms_output.put_line('The Employe who is higher in chain of command: ' || emp_first_name || ' ' || emp_last_name || ' with salary: ' || emp_salary);
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
        dbms_output.put_line('Record with employee id: ' || emp_employee_id || ' does not exists.');
END;


--Task 15
DECLARE 
    sums integer;
BEGIN
    sums := 0;
    for a in 1..100 LOOP
    sums := sums+a;
    END LOOP;
    dbms_output.put_line('The sum is: '|| sums);
END;