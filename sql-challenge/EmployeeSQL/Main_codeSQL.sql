-- Drop and create the 'titles' table
DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles (
    title_id VARCHAR(100) PRIMARY KEY,       -- Unique identifier for title (max size 100)
    title_name VARCHAR(250) NOT NULL         -- Title name (max size 250)
);
SELECT * FROM titles;
-----------------------------------------------------------------

-- Drop and create the 'employees' table
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,                 -- Employee number (unique identifier)
	emp_title_id VARCHAR(250) NOT NULL,     -- Title ID (max size 250), referencing 'titles'
	birth_date DATE NOT NULL,               -- Date of birth 
    first_name VARCHAR(250) NOT NULL,       -- Employee's first name (max size 250)
    last_name VARCHAR(250) NOT NULL,        -- Employee's last name (max size 250)
    sex VARCHAR(1) NOT NULL,                -- Gender (max size 10)
    hire_date DATE NOT NULL,                -- Hiring date
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)  -- Foreign key to 'titles'
);
SELECT * FROM employees;
------------------------------------------------------------------

-- Drop and create the 'departments' table
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
    dept_no VARCHAR(20) PRIMARY KEY,       -- Department number (max size 20)
    dept_name VARCHAR(250) NOT NULL        -- Department name (max size 250)
);
SELECT * FROM departments;
--------------------------------------------------------------------

-- Drop and create the 'dept_manager' table
DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager (
    dept_no VARCHAR(20) NOT NULL,          -- Department number (max size 20)
    emp_no INT NOT NULL,                   -- Employee number
    PRIMARY KEY (dept_no, emp_no),         -- Composite primary key
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),  -- Foreign key to 'departments'
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)       -- Foreign key to 'employees'
);
SELECT * FROM dept_manager;
----------------------------------------------------------------------

-- Drop and create the 'dept_emp' table
DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,                   -- Employee number
    dept_no VARCHAR(20) NOT NULL,          -- Department number (max size 20)
    PRIMARY KEY (emp_no, dept_no),         -- Composite primary key
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),      -- Foreign key to 'employees'
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)   -- Foreign key to 'departments'
);
SELECT * FROM dept_emp;

------------------------------------------------------------------------------------------------
-- Drop and create the 'salaries' table
DROP TABLE IF EXISTS salaries CASCADE ;
CREATE TABLE salaries(
	emp_no INT NOT NULL PRIMARY KEY,        -- Employee number (unique identifier)
	salary INT NOT NULL,                    -- Salary cannot be NULL
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);
SELECT * FROM salaries;	