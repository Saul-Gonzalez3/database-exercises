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
-- Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
-- Salaries
-- Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
-- ALL TABLES except for salaries
-- Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
-- titles, salaries, employees, dept_manager
-- What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
SHOW CREATE TABLE employees;
SHOW CREATE TABLE departments;
-- I could not find a relationship between the two different tables.
-- Show the SQL code that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
SHOW CREATE TABLE dept_manager;



