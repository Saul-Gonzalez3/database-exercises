-- Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT * FROM employees;
SELECT first_name, last_name, emp_no  FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;
-- A) First was Irena Reutenauer and Last was Vidya Simmen.


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT first_name, last_name, emp_no  FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;
-- A) First: Irena Acton, Second: Vidya Zweizig


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT first_name, last_name, emp_no  FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name;
-- A) First: Irena Acton, Second: Maya Zyda

-- Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
SELECT DISTINCT last_name, first_name, emp_no FROM employees WHERE (last_name LIKE 'E%' AND last_name LIKE '%e') ORDER BY emp_no;
-- A) 899, First employee (10021 - Ramzi Erde), Last employee (51050 - Parto Egerstedt)


-- Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
SELECT * FROM employees;
SELECT last_name, first_name, hire_date FROM employees WHERE (last_name LIKE 'E%' AND last_name LIKE '%e') ORDER BY hire_date DESC;
-- A) There were 899 employees returned. Newest employee hired is Teiji Eldridge and oldest employee hired is Sergi Erde.

-- Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
SELECT first_name, last_name, hire_date, birth_date FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25' ORDER BY birth_date ASC, hire_date DESC;
-- A) There were 362 employees returned. Oldest employee who was hired last (Khun Bernini) and the name of the youngest employee who was hired first (Douadi Pettis ).


SHOW DATABASES;
USE employees;
SELECT DATABASE();
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
SELECT * FROM employees;
SELECT first_name, last_name, emp_no  FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- A) 10200, 10397, 10610 
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?
SELECT * FROM employees;
SELECT first_name, last_name, emp_no  FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
-- A) 10200, 10397, 10610. Everything still matched.
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results.
SELECT * FROM employees;
SELECT first_name, last_name, emp_no, gender  FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';
-- A) 10200, 10397, 10821.
-- Find all unique last names that start with 'E'.
SELECT * FROM employees;
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'E%';
-- Find all unique last names that start or end with 'E'.
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%e';
-- Find all unique last names that end with E, but does not start with E?
SELECT DISTINCT last_name FROM employees WHERE last_name NOT LIKE 'E%' AND last_name LIKE '%e';
-- Find all unique last names that start and end with 'E'.
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%e';
-- Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
SELECT * FROM employees;
SELECT first_name, last_name, hire_date, emp_no FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- A)10008, 10011, 10012
-- Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers.
SELECT first_name, last_name, hire_date, emp_no FROM employees WHERE birth_date LIKE '%12-25';
-- A)10078, 10115, 10261
-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with top three employee numbers.
SELECT first_name, last_name, hire_date, emp_no FROM employees WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31') AND birth_date LIKE '%12-25';
-- A) 10261, 10438, 10681
-- Find all unique last names that have a 'q' in their last name.
SELECT * FROM employees;
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE '%q%';
-- Find all unique last names that have a 'q' in their last name but not 'qu'.
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';