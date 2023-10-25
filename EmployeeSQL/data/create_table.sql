drop table departments
create table departments(
	dept_no VARCHAR,
	dept_name VARCHAR);						
select * from departments

DROP table dept_emp
create table dept_emp(
	emp_no INT, 
	dept_no VARCHAR);	
SELECT *FROM dept_emp


CREATE TABLE dept_manager(dept_no VARCHAR,
						 emp_no INT)
select * from dept_manager


create table employees(
					   emp_no INT, 
					   emp_title_id VARCHAR(30), 
					   birth_date DATE, 
					   first_name VARCHAR(50), 
					   last_name VARCHAR(50), 
					   sex CHAR(1), 
					   hire_date DATE);
select * from employees


create table salaries(emp_no INT,
					 salary INT)
select * from salaries

drop table titles
create table titles(title_id VARCHAR,
				    title VARCHAR)
select* from titles

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

SELECT de.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;


SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


SELECT last_name, COUNT(*) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;



