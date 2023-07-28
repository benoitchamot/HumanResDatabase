-- Check that data are correctly imported
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the employee number, last name, first name, sex, and salary of each employee 
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
-- NOTE: order by is added to sort the dates from earliest to latest
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('Year', hire_date) = 1986
ORDER BY hire_date ASC;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dm.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM employees AS e
INNER JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
INNER JOIN departments AS d ON dm.dept_no = d.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE (first_name = 'Hercules') AND (last_name LIKE 'B%');

-- List each employee in the Sales department, including their employee number, last name, and first name
-- NOTE: the department name is printed as well to check the results.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS "Frequency counts"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;


