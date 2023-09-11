-- Create a new file named group_by_exercises.sql

-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
USE employees;
SELECT * FROM titles;
SELECT DISTINCT title as one_title, COUNT(title) AS total_count_of_titles FROM titles GROUP BY one_title;

-- A) There have been 7 unique titles and 443, 308 counts of those titles.



-- Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY.
SELECT * FROM employees;
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%e' GROUP BY last_name;

-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT DISTINCT last_name AS UniqueLastName, first_name FROM employees WHERE last_name LIKE 'E%' and last_name LIKE '%e' GROUP BY last_name, first_name;


-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name;
-- A) Chieq, Linqvist, Qiwen


-- Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.
SELECT count(*), last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name;


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.

SELECT * FROM employees;
SELECT first_name, gender, count(gender) as HowMany FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') GROUP BY first_name, gender ORDER BY first_name;

-- Using your query that generates a username for all employees, generate a count of employees with each unique username.

SELECT * FROM employees;
SELECT last_name, COUNT(last_name), CONCAT(SUBSTR(LOWER(first_name), 1, 1), SUBSTR(LOWER(last_name), 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) AS username FROM employees GROUP BY last_name, username ORDER BY COUNT(last_name) DESC;

-- From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? Bonus: How many duplicate usernames are there?

-- A) Yes there are duplicate usernames.

-- Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
SHOW DATABASES;
USE employees;
SHOW tables;
SELECT * FROM salaries;
SELECT AVG(salary) AS average_salary, emp_no FROM salaries GROUP BY emp_no;


-- Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.
SHOW tables;
SELECT * FROM dept_emp;
SELECT COUNT(emp_no) AS number_of_employees, dept_no FROM dept_emp WHERE to_date = '9999-01-01' GROUP BY dept_no;


-- Determine how many different salaries each employee has had. This includes both historic and current.
SELECT * FROM salaries;
SELECT emp_no, COUNT(emp_no) AS different_salaries FROM salaries GROUP BY emp_no; 


-- Find the maximum salary for each employee.

SELECT * FROM salaries;
SELECT emp_no, max(salary) AS max_salary FROM salaries GROUP BY emp_no;

-- Find the minimum salary for each employee.
SELECT * FROM salaries;
SELECT emp_no, min(salary) AS min_salary FROM salaries GROUP BY emp_no;


-- Find the standard deviation of salaries for each employee.

SELECT * FROM salaries;
SELECT emp_no, stddev(salary) AS stddev_salary FROM salaries GROUP BY emp_no;


-- Find the max salary for each employee where that max salary is greater than $150,000.
SELECT * FROM salaries;
SELECT emp_no, max(salary) AS max_salary FROM salaries WHERE salary > 150000 GROUP BY emp_no;

-- Find the average salary for each employee where that average salary is between $80k and $90k.

SELECT * FROM salaries;
SELECT emp_no, avg(salary) AS average_salary FROM salaries WHERE salary BETWEEN  80000 AND 90000 GROUP BY emp_no;