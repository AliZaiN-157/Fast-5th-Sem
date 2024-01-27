--Question1:
a. A database is a collection of data that is usually so large that it has to be stored on secondary storage devices such as disks or tapes.
There data can be maintained as a collection of OS files, or stored in A Database System. The advantages of DBMS are:
- Data independence and efficient access
- Reduced application development time
- Data integrity and security
- Data administration
- Concurrent acces and creass recovery.

b. 
1. Security and authorization
2. Data availability and recovery from failures.
3. Database tuning: The DBA is responsible for evolving the database, in particular the conceptual and physical schemas, to ensure adequate
performance as user requirements change.
4. Designing the logical and physical schemas, as well as external schema.

c.
DDL: The data definition language is important in representing information because it
is used to describe external and logical schemas

DML: The data manipulation language is used to access and update data; it is not
important for representing the data. (Of course, the data manipulation language
must be aware of how data is represented, and reflects this in the constructs that
it supports.)

The Buffer Manager: The buffer manager is not very important for representation because it brings
arbitrary disk pages into main memory, independent of any data representation

The Data Model:The data model is fundamental to representing information. The data model
determines what data representation mechanisms are supported by the DBMS.
The data definition language is just the specific set of language constructs available
to describe an actual application’s data in terms of the data model

--Question2:

--Query 1: 
select sname
from student s, enroll e, faculty f,class c
where s.snum = e.snum and e.cname=c.cname and c.fid = f.fid and f.name = "I.tech" and s.level = "JR";

--Query 2:
select max(*) 
from student s
where major = 'History' or snum
in (select e.num 
    from enrolled e , class c, faculty, f
    where e.cname = c.cname and c.fid = f.fid and f.fname= "I.teach")

--Query 3: Find the names of all classes that either meet in room R128 or have five or more students enrolled.
select c.name 
from class c, student s
where c.room = "R128" or c.name in (select e.cname from enrolled e group by e.cname having count(*)>5)

--Query 4:
select sname
from student s
where snum in (select E1.snum
                from enrolled E1, enrolled E2, class C1, class C2
                where E1.snum = E2.snum 
                and E1.cname != E2.cname
                and E1.cname = C1.name 
                and E2.cname = C2.name 
                and C1.meets_at = C2.meets_at
                )

--Query 5:
select f.fname
from faculty f
where not exists ((select c1.room from class c1) except (select c2.room from class c2, faculty f where c2.fid =f.fid))

--Query 6:
SELECT DISTINCT F.fname
FROM Faculty F
WHERE 5 > (SELECT COUNT (E.snum)
FROM Class C, Enrolled E
WHERE C.name = E.cname
AND C.fid = F.fid)

--Query 7:
select level, avg(age)
from student
group by level;

--Query 8:
select level, avg(age)
from student
where level != "JR"
group by level; 

--Query 9:
select f.name and count(*) course_count
from faculty f, class c
where f.fid = c.cid
group by f.fid, c.cid having every(c.room = "R128");

--Query 10:
select s.name
from student s
where s.snum in (select E.snum from enrolled e group by e.snum);

--Query 11:
select sname from student where snum not in (select e.snum from enrolled e);

--Query 12:
SELECT S.age, S.level
FROM Student S
GROUP BY S.age, S.level,
HAVING S.level IN (SELECT S1.level
                    FROM Student S1
                    WHERE S1.age = S.age
                    GROUP BY S1.level, S1.age
                    HAVING COUNT (*) >= ALL (SELECT COUNT (*)
                    FROM Student S2
                    WHERE s1.age = S2.age
                    GROUP BY S2.level, S2.age))

--Q3:
--Query 1:
select A.aname from Aircraft A
where A.aid
in (Select C.eid from Certified C, Employee E where C.eid = E.eid and E.salary > 80000);

--Query 2:
select C.eid, max(A.cruisingrange) from Certified C, AirCraft A  where C.aid = A.aid groupby C.eid having count(*) > 3;

--Query 3:
select E.ename where Employees E where E.salary < (select min(F.price) from Flights F where F.from "Los Angeles" AND F.to = "Honolulu")

--Query 4:
select C.eid from Aircraft A , Certified C where A.aid = C.aid  And A.aname = "Boeing";

--Query 5:
select E.ename from AirCraft A, Certified C, Employee E where A.aid = C.aid AND A.aname = "Boeing" AND E.eid = C.eid;

--Query 6:
select E.ename from AirCraft A, Certified C, Employees E, FLights F 
where A.aid = C.aid AND E.eid = C.eid AND distance < cruisingrange AND salary > 10000

--Query 7: Assuming it will be a union operation direct filght from "Madison" to "New York" U from Madison to New York using one connecting 
--flight U from Madison to New York using two connecting flights

select F.departs
from Flights F
where F.flno in(
(select F1.flno from Flights F1 where F1.from = "Madison" AND F1.to = "New York" AND F1.arrives < "18:00")
Union
(select F1.flno from Flights F1, Flight F2 where F1.from = "Madison" AND F1.to != "New York" AND F1.to=F2.from AND F2.to ="New York"
AND F1.depart < F2.arrives and F2.arrives < '18:00')
Union
(select F1.flno From Flight F1, Flight F2, Flight F3 where F1.from = "Madison" AND F1.to != "New York" AND F1.to=F2.from AND
F2.to != "New York" AND F2.to = F3.from AND F3.to = "New York" AND F1.depart < F2.arrives and F2.depart < F3.arrives 
AND F3.arrives < '18:00'
))

--Query 8: 
select ((Select avg(E.salary) from Employees E where E.eid in (select C.eid from Certified C)) -
(Select avg(E.salary)  from Employees E)) as salary_difference

--Query 9:
select E.ename, E.salary from Employees E
where E.eid Not in (select C.eid from Certfied C) 
AND E.salary > (select avg(E.salary) from Employees E, Certified C where E.eid = C.eid); 

--Query 10:
select E.ename from EMployee E, Certified C, AirCraft A
where C.aid = A.aid AND E.eid = C.eid 
Group by E.eid, E.ename
having every (A.cruisingrange > 1000)

--Query 11:
select E.ename from EMployee E, Certified C, AirCraft A
where C.aid = A.aid AND E.eid = C.eid 
Group by E.eid, E.ename
having every (A.cruisingrange > 1000) and count(*) > 1;

--Query 12:
select E.ename from EMployee E, Certified C, AirCraft A
where C.aid = A.aid AND E.eid = C.eid 
Group by E.eid, E.ename
having every (A.cruisingrange > 1000) and A.aname = "Boeing";
                    
--Q4:
--Query 1:
CREATE TABLE Emp ( 
E_id INTEGER,
E_name CHAR(25),
E_age INTEGER ,
E_salary NUMBER,
PRIMARY KEY (eid),
CHECK ( salary >= 10000 ))

--Query 2:
CREATE TABLE Dept(
D_id INTEGER,
D_Budget NUMBER,
PRIMARY KEY (D_id),
Foreign ket (Mg_id) References Emp,
Check((select E.E_age from Emp E, Dept D where E.E_id = D.Mg_id) > 30)

--Query 3:
-- Assertion Not Taught

--Query 4:(Making some assumptions)
Delete 
From Emp E
Where E.E_id 
IN ( Select W.eid from Work W, Emp E1, Dept D Where W.D_id =D.D_id and D.Mg_id = E.E_id and E.E_salary >E2.E_salary)  


