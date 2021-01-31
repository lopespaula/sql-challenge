--Drop pre-existing tables
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;

--Create tables
CREATE TABLE titles (
		title_id VARCHAR,
		title VARCHAR,
		CONSTRAINT pk_titles PRIMARY KEY (
				title_id
		)
);

CREATE TABLE departments (
		dept_no VARCHAR,
		dept_name VARCHAR,
		CONSTRAINT pk_departments PRIMARY KEY (
				dept_no
		)
);

CREATE TABLE employees (
		emp_no INTEGER,
		emp_title_id VARCHAR, --FK >- t.title_id,
		birth_date VARCHAR,
		first_name VARCHAR,
		last_name VARCHAR,
		sex VARCHAR,
		hire_date VARCHAR,
		CONSTRAINT pk_employees PRIMARY KEY (
				emp_no
		)
);

CREATE TABLE salaries (
		emp_no INTEGER, --FK >- e.emp_no
		salary INTEGER,
		CONSTRAINT pk_salaries PRIMARY KEY (
				emp_no
		)
);

CREATE TABLE dep_emp (
		emp_no INTEGER, --FK >- e.emp_no
		dept_no VARCHAR, --FK >- d.dept_no
		CONSTRAINT pk_dept_no PRIMARY KEY (
				emp_no, dept_no
		)
);

CREATE TABLE dep_manager (
		dept_no VARCHAR, --FK >- d.dept_no
		emp_no INTEGER, --FK >- e.emp_no
		CONSTRAINT pk_dept_manager PRIMARY KEY (
				dept_no, emp_no
		)
);


