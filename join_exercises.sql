-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SHOW DATABASES; 
USE join_example_db;
SELECT * FROM users;
describe users;
SELECT * FROM roles;
describe roles;

-- This version of JOIN works. Now you need to make it work like the instructor's version witht the alias.
SELECT * -- You can put other things here to make it more readable (first name, last name, ID, amounts, etc)
FROM users -- This comes from the table on the left
JOIN roles -- This comes from the table on the right
	ON users.id = roles.id;
    
-- Left JOIN
SELECT *
FROM users
LEFT JOIN roles
	ON users.id = roles.id;
    
-- Right JOIN
SELECT *
FROM users
RIGHT JOIN roles
	ON users.id = roles.id;
	
    
-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
-- Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query.
SELECT * FROM users;
SELECT * FROM roles;
SELECT COUNT(*) AS number_of_users, roles.name AS roles FROM users JOIN roles ON users.id = roles.id GROUP BY roles.name;









-- Employees Database
-- Use the employees database.

-- Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along with the name of the current manager for that department.
USE employees;
SHOW TABLES;
SELECT * FROM departments;
describe departments;
SELECT * FROM dept_emp;
describe dept_emp;
SELECT * FROM dept_manager;
describe dept_manager;
SELECT * FROM employees;
describe employees;
SELECT * FROM salaries;
describe salaries;
SELECT * FROM titles;
describe titles;

SELECT first_name, last_name, dept_name, title
FROM employees
JOIN titles
	ON titles.emp_no = employees.emp_no
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no
JOIN dept_manager
	ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date >= NOW() and title = "Manager";


--   Department Name    | Department Manager
--  --------------------+--------------------
--   Customer Service   | Yuchang Weedman
--   Development        | Leon DasSarma
--   Finance            | Isamu Legleitner
--   Human Resources    | Karsten Sigstam
--   Marketing          | Vishwani Minakawa
--   Production         | Oscar Ghazalie
--   Quality Management | Dung Pesch
--   Research           | Hilary Kambil
--   Sales              | Hauke Zhang




-- Find the name of all departments currently managed by women.

SELECT first_name, last_name, dept_name, title
FROM employees
JOIN titles
	ON titles.emp_no = employees.emp_no
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no
JOIN dept_manager
	ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date >= NOW() and title = "Manager" AND gender = "F";

-- Department Name | Manager Name
-- ----------------+-----------------
-- Development     | Leon DasSarma
-- Finance         | Isamu Legleitner
-- Human Resources | Karsetn Sigstam
-- Research        | Hilary Kambil



-- Find the current titles of employees currently working in the Customer Service department.
SELECT * FROM dept_emp;
SELECT title as Title, COUNT(title) AS Count
FROM titles 
JOIN employees
  ON titles.emp_no = employees.emp_no
JOIN dept_emp
  ON employees.emp_no = dept_emp.emp_no
JOIN departments
 ON departments.dept_no = dept_emp.dept_no
WHERE titles.to_date >= NOW() AND dept_name = "Customer Service" GROUP BY title;
  
-- Title              | Count
-- -------------------+------
-- Assistant Engineer |    68
-- Engineer           |   627
-- Manager            |     1
-- Senior Engineer    |  1790
-- Senior Staff       | 11268
-- Staff              |  3574
-- Technique Leader   |   241





-- Find the current salary of all current managers.

SELECT distinct distinct last_name, dept_name, max(salary), title
FROM salaries
JOIN dept_manager
	ON salaries.emp_no = dept_manager.emp_no
JOIN employees
	ON dept_manager.emp_no = employees.emp_no
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN titles
	ON employees.emp_no = employees.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no
WHERE dept_manager.to_date >= NOW() AND title = "Manager" GROUP BY  last_name, dept_name, title ;
-- Department Name    | Name              | Salary
-- -------------------+-------------------+-------
-- Customer Service   | Yuchang Weedman   |  58745
-- Development        | Leon DasSarma     |  74510
-- Finance            | Isamu Legleitner  |  83457
-- Human Resources    | Karsten Sigstam   |  65400
-- Marketing          | Vishwani Minakawa | 106491
-- Production         | Oscar Ghazalie    |  56654
-- Quality Management | Dung Pesch        |  72876
-- Research           | Hilary Kambil     |  79393
-- Sales              | Hauke Zhang       | 101987







-- Find the number of current employees in each department.

SELECT dept_name, COUNT(*) AS total_employees_in_each_department
FROM employees
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no 
WHERE dept_emp.to_date >= NOW() GROUP BY dept_name;

-- +---------+--------------------+---------------+
-- | dept_no | dept_name          | num_employees |
-- +---------+--------------------+---------------+
-- | d001    | Marketing          | 14842         |
-- | d002    | Finance            | 12437         |
-- | d003    | Human Resources    | 12898         |
-- | d004    | Production         | 53304         |
-- | d005    | Development        | 61386         |
-- | d006    | Quality Management | 14546         |
-- | d007    | Sales              | 37701         |
-- | d008    | Research           | 15441         |
-- | d009    | Customer Service   | 17569         |
-- +---------+--------------------+---------------+





-- Which department has the highest average salary? Hint: Use current not historic information.

SELECT dept_name, AVG(salary)
FROM employees
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no
JOIN salaries
	ON dept_emp.emp_no = salaries.emp_no
WHERE salaries.to_date >= NOW() GROUP BY dept_name;

-- +-----------+----------------+
-- | dept_name | average_salary |
-- +-----------+----------------+
-- | Sales     | 88852.9695     |
-- +-----------+----------------+







-- Who is the highest paid employee in the Marketing department?

SELECT first_name, last_name, MAX(salary), dept_name
FROM employees
JOIN salaries
	ON salaries.emp_no = employees.emp_no
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no
JOIN titles
	ON employees.emp_no = titles.emp_no
WHERE dept_emp.to_date >= NOW() AND dept_emp.to_date >= NOW() AND dept_name = "Marketing" AND (title != "Manager") GROUP BY first_name, last_name, dept_name;






-- SELECT first_name, last_name, max(salary), dept_name
-- FROM employees
-- JOIN dept_emp
-- 	ON dept_emp.emp_no = employees.emp_no
-- JOIN departments
-- 	ON dept_emp.dept_no = departments.dept_no
-- JOIN salaries
-- 	ON dept_emp.emp_no = salaries.emp_no
-- WHERE dept_emp.to_date >= NOW() AND dept_name = "Marketing" GROUP BY first_name, last_name, dept_name;

-- +------------+-----------+
-- | first_name | last_name |
-- +------------+-----------+
-- | Akemi      | Warwick   |
-- +------------+-----------+









-- Which current department manager has the highest salary?


SELECT first_name, last_name, max(salary), dept_name
FROM employees
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no
JOIN salaries
	ON dept_emp.emp_no = salaries.emp_no
JOIN dept_manager
	ON dept_emp.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date >= NOW() GROUP BY first_name, last_name, dept_name;

-- +------------+-----------+--------+-----------+
-- | first_name | last_name | salary | dept_name |
-- +------------+-----------+--------+-----------+
-- | Vishwani   | Minakawa  | 106491 | Marketing |
-- +------------+-----------+--------+-----------+







-- Determine the average salary for each department. Use all salary information and round your results.

SELECT ROUND(AVG(salary)) AS average_salary, dept_name
FROM employees
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no
JOIN salaries
	ON dept_emp.emp_no = salaries.emp_no
JOIN dept_manager
	ON dept_emp.emp_no = dept_manager.emp_no
GROUP BY dept_name;


-- +--------------------+----------------+
-- | dept_name          | average_salary | 
-- +--------------------+----------------+
-- | Sales              | 80668          | 
-- +--------------------+----------------+
-- | Marketing          | 71913          |
-- +--------------------+----------------+
-- | Finance            | 70489          |
-- +--------------------+----------------+
-- | Research           | 59665          |
-- +--------------------+----------------+
-- | Production         | 59605          |
-- +--------------------+----------------+
-- | Development        | 59479          |
-- +--------------------+----------------+
-- | Customer Service   | 58770          |
-- +--------------------+----------------+
-- | Quality Management | 57251          |
-- +--------------------+----------------+
-- | Human Resources    | 55575          |
-- +--------------------+----------------+
-- Bonus Find the names of all current employees, their department name, and their current manager's name.


-- 240,124 Rows

-- Employee Name | Department Name  |  Manager Name
-- --------------|------------------|-----------------
--  Huan Lortz   | Customer Service | Yuchang Weedman

--  .....