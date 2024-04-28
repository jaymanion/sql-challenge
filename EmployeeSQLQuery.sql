CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

COPY departments(dept_no, dept_name)
FROM 'C:\Users\Jay_m\OneDrive\Desktop\ASU Data Bootcamp\module 9 work\Starter_Code\data\departments.csv'
DELIMITER ',' CSV HEADER;

COPY dept_emp(emp_no, dept_no)
FROM 'C:\Users\Jay_m\OneDrive\Desktop\ASU Data Bootcamp\module 9 work\Starter_Code\data\dept_emp.csv'
DELIMITER ',' CSV HEADER;

COPY dept_manager(dept_no, emp_no)
FROM 'C:\Users\Jay_m\OneDrive\Desktop\ASU Data Bootcamp\module 9 work\Starter_Code\data\dept_manager.csv'
DELIMITER ',' CSV HEADER;

COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM 'C:\Users\Jay_m\OneDrive\Desktop\ASU Data Bootcamp\module 9 work\Starter_Code\data\employees.csv'
DELIMITER ',' CSV HEADER;

COPY salaries(emp_no, salary)
FROM 'C:\Users\Jay_m\OneDrive\Desktop\ASU Data Bootcamp\module 9 work\Starter_Code\data\salaries.csv'
DELIMITER ',' CSV HEADER;

COPY titles(title_id, title)
FROM 'C:\Users\Jay_m\OneDrive\Desktop\ASU Data Bootcamp\module 9 work\Starter_Code\data\titles.csv'
DELIMITER ',' CSV HEADER;

SELECT emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries USING(emp_no);

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
JOIN departments AS d ON dm.dept_no = d.dept_no
JOIN employees AS e ON dm.emp_no = e.emp_no;

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name, de.dept_no
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;