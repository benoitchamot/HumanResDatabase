-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/fFvWk6
-- Modified after import to correct any mistakes and change the order

-- STEP 1: create table before importing from departments.csv
CREATE TABLE "departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(18)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

-- STEP 2: create table before importing from titles.csv
CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(18),
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- STEP 3: create table before importing from employees.csv
CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" VARCHAR(10)   NOT NULL,
    "first_name" VARCHAR(14)   NOT NULL,
    "last_name" VARCHAR(16)   NOT NULL,
    "sex" CHAR(1),
    "hire_date" VARCHAR(10)    NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- STEP 3.1: Convert string to date in employee table (after data import)
ALTER TABLE employees
	ALTER hire_date TYPE date USING TO_DATE(hire_date,'MM/DD/YYYY'),
	ALTER birth_date TYPE date USING TO_DATE(birth_date,'MM/DD/YYYY');

-- STEP 4: create table before importing from dept_emp.csv
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL
);

-- STEP 5: create table before importing from dept_manager.csv
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL
);

-- STEP 6: create table before importing from salaries.csv
CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT
);

-- Add FOREIGN KEYS constraints
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");



