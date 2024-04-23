CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255)
);
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5),
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date DATE
);
CREATE TABLE salaries (
    emp_no INT,
    salary INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(255)
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


