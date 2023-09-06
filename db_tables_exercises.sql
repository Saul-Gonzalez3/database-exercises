-- Open MySQL Workbench and login to the database server
-- Save your work in a file named db_tables_exercises.sql
-- List all the databases
SHOW DATABASES;
-- Write the SQL code necessary to use the albums_db database
USE albums_db;
-- Show the currently selected database
SELECT DATABASE();
-- List all tables in the database
SHOW TABLES;
-- Write the SQL code to switch to the employees database
SELECT DATABASE();
SHOW DATABASES;
USE employees;
-- Show the currently selected database
SELECT DATABASE();
-- List all tables in the database
SHOW TABLES;
-- Explore the employees table. What different data types are present in this table?
DESCRIBE SOURCE employees;
-- A) int, date, varchart(14), varchart(16), enum, date
-- Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
-- A) dept_emp, dept_manager, employees, salaries, titles
-- Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
-- A) ALL TABLES except for salaries
-- Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
-- A) titles, salaries, employees, dept_manager
-- What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
DESCRIBE employees;
DESCRIBE departments;
DESCRIBE dept_emp;
-- A) They are in the same database. The belong to the joiner table dept_emp(which has emp_no and dept_no, each present in employees and departments respectively).
-- Show the SQL code that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
-- A) CREATE TABLE `dept_manager` (
 --  `emp_no` int NOT NULL,
--   `dept_no` char(4) NOT NULL,
--   `from_date` date NOT NULL,
--   `to_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`,`dept_no`),
--   KEY `dept_no` (`dept_no`),
--   CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--   CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1 
SHOW CREATE TABLE dept_manager;



