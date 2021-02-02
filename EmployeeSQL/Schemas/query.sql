-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date LIKE '%1986'


-- 3. List the manager of each department with the following information
-- department number, department name, the manager's employee number, last name, first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
LEFT JOIN employees AS e ON dm.emp_no = e.emp_no
LEFT JOIN departments AS d ON d.dept_no = dm.dept_no


-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN departments AS d ON d.dept_no = de.dept_no


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."

SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'


-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

CREATE VIEW emp_deptname AS(
	SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	FROM employees AS e
	INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
	LEFT JOIN departments AS d ON d.dept_no = de.dept_no);
	
SELECT emp_no, last_name, first_name, dept_name 
FROM emp_deptname
WHERE dept_name = 'Sales'

SELECT COUNT(*) FROM emp_deptname
--331,603

-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

SELECT emp_no, last_name, first_name, dept_name 
FROM emp_deptname
WHERE dept_name = 'Sales' OR dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.

SELECT last_name, 
COUNT(last_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC
	


