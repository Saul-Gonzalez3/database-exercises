-- Find all the current employees with the same hire date as employee 101010 using a subquery.
SHOW DATABASES; 
USE employees;

SELECT first_name, last_name
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date >= NOW() AND hire_date = (SELECT hire_date FROM employees WHERE emp_no = '101010') ORDER BY last_name;


-- Find all the titles ever held by all current employees with the first name Aamod.

-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

-- Find all the current department managers that are female. List their names in a comment in your code.

-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.

-- How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.
-- BONUS

-- Find all the department names that currently have female managers.
-- Find the first and last name of the employee with the highest salary.
-- Find the department name that the employee with the highest salary works in.

-- Who is the highest paid employee within each department.