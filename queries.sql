/* ==============================================
   BASIC JOINS
  =============================================== */

-- Employees + Departments 
SELECT e.emp_name , e.job_role, d.dept_name
FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id;


--Employees working in IT department
SELECT e.emp_name, e.job_role
FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';


/* ========================================
  PROJECT & CLIENT QUERIES
  ========================================= */

-- Employees working on Deloitte projects
SELECT e.emp_name, p.project_name, p.client_name
FROM Employees e
JOIN Employee_Project ep ON e.emp_id = ep.emp_id
JOIN Projects p ON ep.project_id = p.project_id
WHERE p.client_name = 'Deloitte';

--Employees with alloation greater than 50% 
SELECT e.emp_name, ep.allocation_percentage
FROM Employees e
JOIN Employee_Project ep
ON e.emp_id = ep.emp_id
WHERE ep.allocation_percentage > 50;

/* =========================================
  SALARY & DEPARTMENT REPORTS
 =========================================== */

-- Employee Salary with department 
SELECT e.emp_name, e.salary, d.dept_name
FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id;

-- Employee count per department
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM Employees e 
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

--- Average salary per department
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

--- Total salary cost per department
SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name


/* =========================================
   PROJECT UTILIZATION REPORTS
 =========================================== */

--Employee count per project
SELECT p.project_name, COUNT(ep.emp_id) AS total_employees
FROM Projects p
JOIN Employee_Project ep ON p.project_id = ep.project_id
GROUP BY p.project_name

-- High allocation employees (>=60%)
SELECT e.emp_name, ep.allocation_percentage, p.project_name
FROM Employees e
JOIN Employee_Project ep ON e.emp_id = ep.emp_id
JOIN Projects p ON ep.project_id = p.project_id
WHERE ep.allocation_percentage >= 60;

/* ====================================
  SUBQUERIES & ADVANCED LOGIC
======================================= */

--Employees earning above company average
SELECT emp_name, salary
FROM Employees
WHERE salary > (
  SELECT AVG(salary)
  FROM Employees
);

--- Employees working for Deloitte (subquery)
SELECT emp_name
FROM Employees
WHERE emp_id IN (
  SELECT ep.emp_id
  FROM Employee_Project ep
  JOIN Projects p ON ep.project_id = p.project_id
  WHERE p.client_name = 'Deloitte'
); 

-- Departments with more than one employee
SELECT dept_name
FROM Departments
WHERE dept_id IN (
  SELECT Employees
  GROUP BY dept_id
  HAVING COUNT(emp_id) > 1
);

-- Bench employee (not assigned to any project)
SELECT emp_name
FROM Employees
WHERE emp_id NOT IN (
  SELECT emp_id
  FROM Employee_Project
);

-- Highest paid employee
SELCT emp_name, salary
FROM Employees
WHERE salary = (
  SELECT MAX(salary)
  FROM Employees
);

/* =====================================
  EDGE CASES & BUSINESS SCENARIOS
======================================= */

-- Employees without department assignment
SELECT emp_name
FROM Employees
WHERE dept_id IS NULL;

--- Employees earning below department average
SELECT e.emp_name, salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.salary < (
  SELECT AVG(salary)
  FROM Employees
  WHERE dept_id = e.dept_id
);

-- Project without any employee allocation
SELECT project_name
FROM Projects
WHERE project_id NOT IN (
  SELECT project_id
  FROM Employee_Project
);

-- Employees working on multiple projects
SELECT e.emp_name, COUNT(ep.project_id) AS project_count
FROM Employees e
JOIN Employee_Project ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_name
HAVING COUNT(ep.project_id) > 1;

-- Departments-wise average utilization
SELECT d.dept_name, AVG(ep.allocation_percentage) AS avg_utilization
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
JOIN Employee_Project ep ON e.emp_id = ep.emp_id
GROUP BY d.dept_name;



























