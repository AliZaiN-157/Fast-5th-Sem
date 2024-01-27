/* mutilple
line comment */
-- single line comment
-- Creating Database
Create database practicedb; -- creating database
-- Create database if not exists demodb; -- creating database if not exists 

-- deleting the database
-- drop database practicedb;
-- drop database if exists practicedb;

-- Use 
use practicedb;
-- Creating a table
create table demoTable(
tableNo INT
);
-- Describing Table properties
describe demoTable;

-- Altering(ADD/DELETE) 
alter table demoTable
add demo_Name varchar(255); -- 8 bits = 1 Byte

alter table demoTable
drop demo_Name;


