create table persons(
    person_id number NOT NULL,
    first_name varchar2(25),
    last_name varchar2(25) NOT NULL,
    address varchar2(50),
    city varchar2(25),
    age number,
    CONSTRAINT person_pk PRIMARY KEY (person_id)
);

select * from persons;

INSERT INTO persons VALUES(1, 'Ali', 'Shaz', '123 Main St', 'UK', 12);
INSERT INTO persons VALUES(2, 'Alyaan', 'Khuwaja', '456 Oak St', 'UK', 24);
INSERT INTO persons VALUES(3, 'Muhammad', 'Abdullah', '789 Pine St', 'UK', 36);
INSERT INTO persons VALUES(4, 'Bilal', 'Ahmed', '101 Maple St', 'US', 28);
INSERT INTO persons VALUES(5, 'Onais', 'Ali', '100 Elm St', 'US', 32);
SAVEPOINT after_5_workers;
INSERT INTO persons VALUES(6, 'Zohaib', 'Saqib', '111 Redwood St', 'UK', 16);
INSERT INTO persons VALUES(7, 'Erum', 'Fatima', '444 Cedar St', 'UK', 22);
INSERT INTO persons VALUES(8, 'Atif', 'Ali', '555 Spruce St', 'UK', 40);
INSERT INTO persons VALUES(9, 'Ali', 'Zain', '666 Fir St', 'US', 25);
INSERT INTO persons VALUES(10, 'Muhammad', 'Bhai', '888 Minecraft St', 'US', 35);

UPDATE persons SET first_name = 'Rida' WHERE person_id = 7 AND first_name= 'Erum';

select * from persons;

rollback to after_5_workers;

select * from persons;

-- The new session couldn't update the value of id=8 until the first session committed its changes, causing a wait for the
-- updated information. Only after the first session committed, the second session proceeded with the ipdate,
-- reflecting the changes in the table

-- Inserting Again for task 2
INSERT INTO persons VALUES(6, 'Zohaib', 'Saqib', '111 Redwood St', 'UK', 16);
INSERT INTO persons VALUES(7, 'Erum', 'Fatima', '444 Cedar St', 'UK', 22);
INSERT INTO persons VALUES(8, 'Atif', 'Ali', '555 Spruce St', 'UK', 40);
INSERT INTO persons VALUES(9, 'Ali', 'Zain', '666 Fir St', 'US', 25);
INSERT INTO persons VALUES(10, 'Muhammad', 'Bhai', '888 Minecraft St', 'US', 35);

update persons set age = 30 where person_id = 8;

select * from persons;

-- Because of no commit from the new session there were no changes visible in the old session.
commit;
