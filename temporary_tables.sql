-- Using the example from the lesson, create a temporary table called employees_with_departments 
-- that contains first_name, last_name, and dept_name for employees currently with that department. 
-- Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", 
-- it means that the query was attempting to write a new table to a database that you can only read.


CREATE TEMPORARY TABLE employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees.employees
;
SELECT database(); 
SHOW databases; 
USE tobias_2306;

-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths 
-- of the first name and last name columns.

select * from employees_with_departments;
describe employees_with_departments;
alter table employees_with_departments
add full_name varchar(30);
alter table employees_with_departments
add dept_name varchar(50);



-- Update the table so that the full_name column contains the correct data.
SET sql_safe_updates=0;
update employees_with_departments 
	set full_name = concat(first_name, ' ', last_name);

-- Remove the first_name and last_name columns from the table.

alter table employees_with_departments
drop column first_name, drop column last_name;

-- What is another way you could have ended up with this same table?

-- A) You can just concat the first_name and last_name columns together in the select statement and used an alias set as full_name.

-- Create a temporary table based on the payment table from the sakila database.

SHOW databases;
use sakila;
show tables;
describe payment;
SELECT *
FROM sakila.payment;

DROP TABLE sakila.payment;

CREATE TEMPORARY TABLE tobias_2306.payment AS (
	SELECT * FROM sakila.payment);

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing 
-- the number of cents of the payment. For example, 1.99 should become 199.
select * from sakila.payment;

describe sakila.payment;

alter table sakila.payment
MODIFY amount int;

UPDATE sakila.payment
set amount = amount * 100;




-- Go back to the employees database. Find out how the current average pay in each department compares to 
-- the overall current pay for everyone at the company. For this comparison, you will calculate the z-score 
-- for each salary. In terms of salary, what is the best department right now to work for? The worst?
drop table dept_avgs;
select database();
use employees;

SELECT 
	-- just dept names and avg salaries
	dept_name,
    AVG(salary) AS dept_avg
FROM 
	-- departments from employees schema
	departments d
JOIN dept_emp de
	-- link dept_no to dept_emp
	USING(dept_no)
JOIN salaries s
	-- link emp_no to salaries
	USING(emp_no)
WHERE 
	-- current employees salaries in active departments
	de.to_date > NOW()
	AND 
    s.to_date > NOW()
-- aggregate based on department
GROUP BY dept_name;
drop table dept_avgs;
/*
ERROR HANDLING!
when creating our table recieved a DATA TRUNCATED error for our
dept_avg column. Problem was our column values were too large. Strange behavior!
Solution was to CAST() this column to a decimal with 10 digits places by default 
and the error was resolved
*/
create temporary table dept_avgs (
SELECT dept_name,
    cast(AVG(salary) as decimal) AS dept_avg 
FROM departments d
JOIN dept_emp de
	USING(dept_no)
JOIN salaries s
	USING(emp_no)
WHERE 
	de.to_date > NOW()
	AND 
    s.to_date > NOW()
GROUP BY dept_name
);

select * from dept_avgs;
alter table dept_avgs
add sample_mean float; 
alter table dept_avgs
add stand_dev float, 
add zscore float;
drop table metrics; 

create temporary table metrics (
select 
	cast(avg(salary) as decimal) as sample_means, 
    stddev(salary) as stdv						
from salaries
where to_date > now()
);

update dept_avgs
	set sample_mean = (select sample_means from metrics);
update dept_avgs
	set stand_dev = (select stdv from metrics);
update dept_avgs
	set zscore = ((dept_avg-sample_mean)/stand_dev);

select * from metrics;
select * from dept_avgs
	order by zscore desc;




