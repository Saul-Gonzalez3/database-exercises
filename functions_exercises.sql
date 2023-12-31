-- Write a query to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
USE employees;
SELECT * FROM employees;
SELECT CONCAT(first_name, " ", last_name) AS full_name FROM employees WHERE (last_name LIKE 'E%' AND last_name LIKE '%e'); -- 'e%e'


-- Convert the names produced in your last query to all uppercase.
SELECT CONCAT(UPPER(first_name), " ", UPPER(last_name)) AS full_name FROM employees WHERE (last_name LIKE 'E%' AND last_name LIKE '%e');


-- Use a function to determine how many results were returned from your previous query.
SELECT COUNT(CONCAT(UPPER(first_name), " ", UPPER(last_name))) FROM employees WHERE (last_name LIKE 'E%' AND last_name LIKE '%e');
-- A)899


-- Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT first_name, last_name, hire_date, datediff(NOW(),hire_date) AS days_at_company FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25';


-- Find the smallest and largest current salary from the salaries table.
SHOW DATABASES;
USE employees;
SHOW tables;
USE salaries;
SELECT * FROM salaries;
SELECT MAX(salary) FROM salaries; -- A) 158220 
SELECT MIN(salary) FROM salaries; -- A) 38623 


-- Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
-- first character of the employees first name
-- the first 4 characters of the employees last name
-- an underscore,
-- the month the employee was born
-- the last two digits of the year that they were born

SELECT * FROM employees;
SELECT CONCAT(SUBSTR(LOWER(first_name), 1, 1), SUBSTR(LOWER(last_name), 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) AS username FROM employees;











