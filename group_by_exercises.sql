-- Create a new file named group_by_exercises.sql

-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
USE employees;
SELECT * FROM titles;
SELECT DISTINCT title as one_title, COUNT(title) FROM titles GROUP BY one_title;


-- Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY.
SELECT * FROM employees;
SELECT DISTINCT last_name AS UniqueLastName FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%e' GROUP BY last_name;

-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT DISTINCT last_name AS UniqueLastName, first_name FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%e' GROUP BY last_name, first_name;


-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';


-- Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.



-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees with those names for each gender.



-- Using your query that generates a username for all employees, generate a count of employees with each unique username.



-- From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? Bonus: How many duplicate usernames are there?