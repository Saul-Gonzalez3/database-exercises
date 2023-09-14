-- Find all the current employees with the same hire date as employee 101010 using a subquery.
SHOW DATABASES; 
USE employees;

SELECT first_name, last_name
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date >= NOW() AND hire_date = (SELECT hire_date FROM employees WHERE emp_no = '101010') ORDER BY last_name; -- This is the Subquery



-- Find all the titles ever held by all current employees with the first name Aamod.

-- SELECT title, (SELECT first_name FROM employees WHERE first_name = 'Aaomod') AS first_n, last_name -- This is the Subquery
-- FROM titles
-- JOIN employees
-- 	ON employees.emp_no = titles.emp_no
-- WHERE titles.to_date >= NOW() GROUP BY title, last_name;

SELECT * -- Inner query to find all of the Aamod employees
FROM employees
JOIN titles
	ON employees.emp_no = titles.emp_no
WHERE first_name = "Aamod" AND to_date > NOW();

-- Now to find all of the titles held by the Aamods
SELECT distinct title
FROM titles
WHERE emp_no IN -- SINCE WE'RE USING THE INNER QUERY AS A TABLE SOURCE, WE PUT IT IN THE WHERE CLAUSE
		(
		SELECT emp_no -- Inner query to find all of the Aamod employees
		FROM employees
		JOIN titles
			using (emp_no)
		WHERE first_name = "Aamod" AND to_date > NOW()
		)
;





-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

-- SELECT DISTINCT(SELECT COUNT(*) employees FROM employees) AS no_longer_in_company -- This is the Subquery
-- FROM employees
-- JOIN dept_emp
-- 	ON dept_emp.emp_no = employees.emp_no
-- WHERE dept_emp.to_date < NOW();

SELECT emp_no -- THIS FINDS ALL OF THE CURRENT EMPLOYEES - THE INNER QUERY
FROM employees
JOIN dept_emp
	using (emp_no)
WHERE to_date > NOW();

-- NOW TO CREATE THE OUTER QUERY to "count" all the employees NOT IN the inner QUERY
SELECT count(*)
FROM employees
WHERE emp_no NOT IN (
					SELECT emp_no -- THIS FINDS ALL OF THE CURRENT EMPLOYEES - THE INNER QUERY
					FROM employees
					JOIN dept_emp
						using (emp_no)
					WHERE to_date > NOW()

					)
;
-- A) The answer is 59,900













-- Find all the current department managers that are female. List their names in a comment in your code.

SELECT first_name, last_name, title, dept_name
FROM dept_manager
JOIN employees
	ON dept_manager.emp_no = employees.emp_no
JOIN titles
	ON employees.emp_no = titles.emp_no
JOIN departments
	ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date >= NOW() AND gender = "F" AND title = "Manager";

-- INNER QUERY PURPOSE: FIND THE CURRENT DEPARTMENT MANAGERS NAMES

SELECT emp_no
FROM dept_manager
WHERE to_date > NOW();

-- OUT QUERY PURPOSE: FIND OUT WHICH DEPARTMENT MANAGERS ARE FEMALE USING THE INNER QUERY

SELECT first_name, last_name
FROM employees
WHERE gender = "f" AND emp_no IN (
									SELECT emp_no
									FROM dept_manager
									WHERE to_date > NOW()
								)
;


-- Find all the employees who currently have a higher salary than the 
-- companies overall, historical average salary.

-- CREATE INNER QUERY TO FIND THE COMPANY OVERALL HISTORICAL AVERAGE SALARY
SELECT ROUND(avg(salary))
FROM salaries; -- 63811

-- NOW CREATE OUTER QUERY TO FIND THE EMPLOYEES WHO HAVE A HIGHER SALARY THAN IN INNER QUERY
SELECT first_name, last_name, salary, to_date
FROM employees
JOIN salaries
	ON employees.emp_no = salaries.emp_no
WHERE salaries.to_date > NOW() AND salary > (
											SELECT ROUND(avg(salary))
											FROM salaries -- 63811

											)
;

-- How many current salaries are within 1 standard deviation of the current highest salary? 

-- INNER QUERY: FIND THE STANDARD DEVIATION FROM THE HIGHEST SALARY FIRST
SELECT MAX(salary) - std(salary)
FROM salaries
WHERE to_date > NOW(); -- 140910.04
-- MAX SALARY IS:
SELECT MAX(salary) FROM salaries; -- 158220

-- OUTER QUERY: FIND OUT HOW MANY CURRENT SALARIES FIT WITHIN the range of max salary minus inner query results

SELECT COUNT(*) -- The answer is 83 salaries
-- first_name, last_name, salary, to_date
FROM employees
JOIN salaries
	ON employees.emp_no = salaries.emp_no
WHERE salaries.to_date > NOW() AND salary > (
											SELECT MAX(salary) - std(salary)
											FROM salaries
											WHERE to_date > NOW() -- 140910.04

											)
;

-- What percentage of all salaries is this?
SELECT (


SELECT COUNT(*) -- The answer is 83 salaries
-- first_name, last_name, salary, to_date
FROM employees
JOIN salaries
	ON employees.emp_no = salaries.emp_no
WHERE salaries.to_date > NOW() AND salary > (
											SELECT MAX(salary) - std(salary)
											FROM salaries
											WHERE to_date > NOW() -- 140910.04

											)
)
	/
    (
		SELECT COUNT(*)
		FROM salaries
		WHERE to_date > NOW() -- 240,124
)
*100
;



