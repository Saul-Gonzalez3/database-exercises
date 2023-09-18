-- Exercises
-- Exercise Goals
-- Use CASE statements or IF() function to explore information in the employees database
-- Create a file named case_exercises.sql and craft queries to return the results for the following criteria:






-- Write a query that returns all employees, their department number, their start date, their end date, 
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. 
-- DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.

describe dept_emp;


SELECT *
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no;
    
SELECT first_name, last_name, dept_no as Department_Number, from_date as Start_Date, to_date as End_Date
	,IF(to_date = "9999-01-01", True, False) as is_current_employee
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no;


-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' 
-- that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT last_name, first_name
	, CASE 
		WHEN last_name < 'i' THEN 'A-H'
        WHEN last_name < 'q' THEN 'I-Q'
        WHEN last_name <= 'z' THEN 'R-Z'
        WHEN last_name like 'z%' THEN 'R-Z'
        END as 'alpha_group'
FROM employees;




-- How many employees (current or previous) were born in each decade?
 
SELECT emp_no, birth_date 
FROM employees;

SELECT COUNT(*) as older_employees
	,CASE
		WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN '1950s'
		WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN '1960s'
		ELSE 'DOES NOT MATTER'
        end as 'age_of_legends'

FROM employees
GROUP BY age_of_legends;
    




-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, 
-- Prod & QM, Finance & HR, Customer Service?
SELECT dept_name FROM departments;


select
	CASE 
		WHEN dept_name IN ('Research','Development') THEN 'R&D'
        WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN ('Finance','Human Resources') THEN 'Finance & HR'
        ELSE dept_name 
	END as 'dept_group'
    , ROUND(AVG(salary),2) as avg_sal
from salaries
	join dept_emp
		using (emp_no)
	join departments
		using (dept_no)
where salaries.to_date > now()
	AND dept_emp.to_date > now()
GROUP BY dept_group
;


    
SELECT dept_name, avg(salary)
FROM salaries
JOIN dept_emp
	ON dept_emp.emp_no = salaries.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no
GROUP BY dept_name;













-- BONUS

-- Remove duplicate employees from exercise 1.

SELECT *
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no;
    
SELECT distinct first_name, last_name, dept_no as Department_Number, from_date as Start_Date, to_date as End_Date
	,IF(to_date = "9999-01-01", True, False) as is_current_employee
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no;







