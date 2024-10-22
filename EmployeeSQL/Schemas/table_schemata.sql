--Drop pre-existing tables

DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;

--------------------------------------------------------------
--Create tables

CREATE TABLE titles (
		title_id VARCHAR(50),
		title VARCHAR(50),
		CONSTRAINT pk_titles PRIMARY KEY (title_id)
);

select * from titles;


CREATE TABLE departments (
		dept_no VARCHAR(4),
		dept_name VARCHAR(50),
		CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

select * from departments;


CREATE TABLE employees (
		emp_no INTEGER NOT NULL,
		emp_title_id VARCHAR(5), --FK >- t.title_id,
		birth_date VARCHAR,
		first_name VARCHAR(50),
		last_name VARCHAR(50),
		sex VARCHAR(1),
		hire_date VARCHAR,
		CONSTRAINT pk_employees PRIMARY KEY (emp_no)
);

select * from employees;


CREATE TABLE salaries (
		emp_no INTEGER NOT NULL, --FK >- e.emp_no
		salary INTEGER NOT NULL,
		CONSTRAINT pk_salaries PRIMARY KEY (emp_no)
);

select * from salaries;



CREATE TABLE dept_emp (
		emp_no INTEGER NOT NULL, --FK >- e.emp_no
		dept_no VARCHAR(4) NOT NULL, --FK >- d.dept_no
		CONSTRAINT pk_dept_no PRIMARY KEY (emp_no, dept_no)
);

select * from dept_emp;


CREATE TABLE dept_manager (
		dept_no VARCHAR(4) NOT NULL, --FK >- d.dept_no
		emp_no INTEGER NOT NULL, --FK >- e.emp_no
		CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no, emp_no)
);

select * from dept_manager;


--------------------------------------------------------------
--Create constraint

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

