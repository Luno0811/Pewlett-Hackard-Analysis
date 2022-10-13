--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees

--Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles

--Create a new table using the INTO clause.
--Join both tables on the primary key.
--Filter the data on the birth_date column 
--to retrieve the employees who were born 
--between 1952 and 1955. Then, order by the employee number.
SELECT emp.emp_no,
	emp.first_name,
	emp.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS emp
INNER JOIN titles AS ti
ON emp.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--Retrieve the emp_no, first_name, last_name, and birth_date 
--columns from the Employees table.
SELECT emp_no,
	first_name,
	last_name,
	birth_date
FROM employees

--Retrieve the from_date and to_date columns 
--from the Department Employee table.
SELECT from_date,
	to_date
FROM dept_emp

--Retrieve the title column from the Titles table.
SELECT title FROM titles

--Use a DISTINCT ON statement to retrieve the first occurrence of the employee number 
--for each set of rows defined by the ON () clause.
--Create a new table using the INTO clause.
--Join the Employees and the Department Employee tables on the primary key.
--Join the Employees and the Titles tables on the primary key.
--Filter the data on the to_date column to all the current employees, 
--then filter the data on the birth_date columns to get all the employees 
--whose birth dates are between January 1, 1965 and December 31, 1965.
--Order the table by the employee number.
SELECT DISTINCT ON (emp_no) emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.birth_date,
	depemp.from_date,
	depemp.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS emp
INNER JOIN dept_emp AS depemp 
ON emp.emp_no = depemp.emp_no 
INNER JOIN titles AS ti
ON emp.emp_no = ti.emp_no
WHERE (depemp.to_date = '9999-01-01') AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

--Query to support result data
SELECT COUNT (title), title
FROM unique_titles
GROUP BY title;