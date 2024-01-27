create table Student (
Std_id number(4), 
Student_Name varchar(25),
Courses varchar(25),
Semester number(1),
university varchar(100),
CGPA decimal(3, 2)
);
alter table Student modify Student_Name varchar(25) NOT NULL;
alter table Student add CONSTRAINT uk1 unique(Std_id);
-- drop constraint
-- alter table Student drop constraint uk1;

-- add primary key
alter table Student Modify Std_id varchar(4);
alter table Student add constraint PK1 Primary Key(Std_id);
select * from Student;
describe Student;

CREATE Table Jobs (
JOB_ID varchar(10) NOT NULL PRIMARY KEY, JOB_TITLE varchar(255), MIN_SALARY int, MAX_SALARY int
);

select * from Jobs;

CREATE Table Job_History (
EMPLOYEE_ID int, START_DATE DATE, END_DATE DATE, JOB_ID varchar(10), DEPARTMENT_ID int
);

select * from JOB_HISTORY;

ALTER TABLE Jobs Modify JOB_ID int;

ALTER TABLE JOB_HISTORY Modify JOB_ID int;

ALTER TABLE JOB_HISTORY ADD FOREIGN KEY (JOB_ID) REFERENCES Jobs (JOB_ID);

INSERT INTO Jobs (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) Values(101, 'Abc', 10000, 20000);

ALTER TABLE Jobs ADD (JOB_NATURE varchar(255));

CREATE TABLE EMPLOYEES (
EMPLOYEE_ID int NOT NULL PRIMARY KEY, FIRST_NAME varchar2(20), LAST_NAME varchar2(25), EMAIL varchar2(25), 
PHONE_NUMBER varchar2(20), HIRE_DATE DATE, JOB_ID int, SALARY int, COMMISSION_PCT int, MANAGER_ID int, 
DEPARTMENT_ID INT );

select * from EMPLOYEES;

ALTER TABLE JOB_HISTORY ADD (EMP_ID int);

ALTER TABLE JOB_HISTORY ADD FOREIGN KEY (EMP_ID ) REFERENCES EMPLOYEES (EMPLOYEE_ID) on delete cascade;

ALTER TABLE Jobs DROP COLUMN JOB_NATURE;

ALTER TABLE EMPLOYEES ADD CONSTRAINT CK_EMPLOYE_FIRST_NAME CHECK (upper(FIRST_NAME)= FIRST_NAME);

ALTER TABLE EMPLOYEES MODIFY SALARY UNIQUE;

ALTER TABLE EMPLOYEES MODIFY PHONE_NUMBER NOT NULL;

ALTER TABLE EMPLOYEES ADD (FIRST_NAME varchar2(20));

INSERT INTO employees 
(employee_id,first_name, last_name, email, phone_number, hire_date, job_id, salary, 
commission_pct, department_id)
values (11, 'ABCD', 'def', 'abcddef@gmail.com', '03010000001', TO_DATE('17/12/2015', 'DD/MM/YYYY'), 111, 21300, 0.1,01 );

-- inserting random data for task 14

INSERT INTO employees 
(employee_id,first_name, last_name, email, phone_number, hire_date, job_id, salary, 
commission_pct, department_id)
values (1, 'DEFI', 'chawla', 'defichaw@gmail.com', '03010000222', TO_DATE('17/12/2010', 'DD/MM/YYYY'), 101, 300, 0,01 );

INSERT INTO employees 
(employee_id,first_name, last_name, email, phone_number, hire_date, job_id, salary, 
commission_pct, department_id)
values (105, 'ADDY', 'Jones', 'JonesAdd@gmail.com', '03010000212', TO_DATE('17/11/2010', 'DD/MM/YYYY'), 101, 500, 0,01 );

select * from employees;

UPDATE Employees set SALARY = 2000 where salary < 1000 AND Employee_id = 105;

select * from employees;

ALTER TABLE Employees ADD PRIMARY KEY (employee_id, job_id);
-- table can have only one primary key which is employee_id.

CREATE INDEX indx_job_id ON JOB_HISTORY (job_id);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = "tabnam";

ALTER TABLE JOB_HISTORY DROP CONSTRAINT SYS_C007097;

TRUNCATE TABLE Employees;