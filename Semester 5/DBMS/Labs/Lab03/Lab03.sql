CREATE Table Jobs (
JOB_ID varchar(10) NOT NULL PRIMARY KEY, 
JOB_TITLE varchar(50), 
MIN_SALARY number(6), 
MAX_SALARY number(6)
);

CREATE Table Job_History (
EMPLOYEE_ID number, 
START_DATE DATE, 
END_DATE DATE, 
JOB_ID varchar(10),
DEPARTMENT_ID number(3)
);

select * from Job_History;

alter table Jobs Modify JOB_ID number;

alter table Job_History Modify JOB_ID number;
alter table Job_History Add Foreign Key(JOB_ID) references Jobs (JOB_ID);
--Desc Job_history;

insert into Jobs (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) Values(001, 'SQL Developer', 12000, 28000);

alter table Jobs add Job_Nature varchar(255);

create table EMPLOYEES (
EMPLOYEE_ID number NOT NULL PRIMARY KEY, FIRST_NAME varchar2(20), LAST_NAME varchar2(25), EMAIL varchar2(25), 
PHONE_NUMBER varchar2(20), HIRE_DATE DATE, JOB_ID number, SALARY number, COMMISSION_PCT number, MANAGER_ID number, 
DEPARTMENT_ID number );

alter table JOB_HISTORY ADD (EMP_ID number(4));
alter table JOB_HISTORY ADD FOREIGN KEY (EMP_ID ) REFERENCES EMPLOYEES (EMPLOYEE_ID) on delete cascade;

alter table Jobs drop column Job_Nature;

alter table EMPLOYEES add constraint Ename check (upper(first_name)= first_name);

alter table employees modify salary unique;

alter table employees modify phone_number not null;

--describe employees;
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id ,department_id)
VALUES(101, 'ALI', 'Zain', 'alizain@gmail.com', '000-444-555', TO_DATE('7/9/2023', 'DD/MM/YYYY'), 001, 25000, 0.2, 999, 123); 
INSERT INTO employees VALUES(105, 'ZAIN', 'Ali', 'zainali@gmail.com', '999-244-555', TO_DATE('27/5/2022', 'DD/MM/YYYY'), 011, 300, 0.1, 899, 133); 

update employees set salary = 8000 where employee_id = 105 and salary<1000;

select * from EMPLOYEES;

ALTER TABLE EMPLOYEES ADD CONSTRAINT PRIMARY_KEY PRIMARY KEY(EMPLOYEE_ID, JOB_ID);
-- There can be only one primary key and it already exist in employees table

create index indx_job_id on job_history (job_id);

drop table employees;

