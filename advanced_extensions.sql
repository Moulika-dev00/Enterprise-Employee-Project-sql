/* =====================================================
   Role-Based Access Modeling (RBAC)
   Time-Based Resource Allocation Tracking
   ===================================================== */

/* ================================
   ROLE-BASED ACCESS MODELING
   ================================ */

-- Roles  table
CREATE TABLE Roles (
    role_id INTEGER PRIMARY KEY,
    role_name TEXT
);

-- Mapping employees to roles
CREATE TABLE Employee_Roles (
    emp_id INTEGER,
    role_id INTEGER
);

-- Sample role data
INSERT INTO Roles VALUES
(1, 'Admin'),
(2, 'Manager'),
(3, 'Employee');

-- Sample employee-role mapping
INSERT INTO Employee_Roles VALUES
(101, 2),  -- Ravi is Manager
(102, 3),  -- Anu is Employee
(103, 2),  -- Kiran is Manager
(104, 3);  -- Meena is Employee


/* ================================
   RBAC QUERIES (Role Based Accessing Modeling)
   ================================ */

-- List all employees with their roles
SELECT e.emp_name, r.role_name
FROM Employees e
JOIN Employee_Roles er ON e.emp_id = er.emp_id
JOIN Roles r ON er.role_id = r.role_id;

-- Find all Managers
SELECT e.emp_name
FROM Employees e
JOIN Employee_Roles er ON e.emp_id = er.emp_id
JOIN Roles r ON er.role_id = r.role_id
WHERE r.role_name = 'Manager';

-- Check Admin users
SELECT e.emp_name
FROM Employees e
JOIN Employee_Roles er ON e.emp_id = er.emp_id
WHERE er.role_id = 1;


/* ================================
   TIME-BASED ALLOCATION TRACKING
   ================================ */

-- Allocation history table with time periods
CREATE TABLE Allocation_History (
    allocation_id INTEGER PRIMARY KEY,
    emp_id INTEGER,
    project_id INTEGER,
    allocation_percentage INTEGER,
    start_date TEXT,
    end_date TEXT
);

-- Sample allocation history data
INSERT INTO Allocation_History VALUES
(1, 101, 203, 70, '2023-04-01', '2023-09-30'),
(2, 101, 202, 30, '2023-10-01', '2023-12-31'),
(3, 103, 203, 50, '2023-04-01', '2023-12-31'),
(4, 104, 202, 60, '2023-07-01', '2023-12-31');


/* ================================
   TIME-BASED BUSINESS QUERIES
   ================================ */

-- Current active allocations (based on current date)
SELECT e.emp_name, p.project_name, a.allocation_percentage
FROM Allocation_History a
JOIN Employees e ON a.emp_id = e.emp_id
JOIN Projects p ON a.project_id = p.project_id
WHERE date('now') BETWEEN a.start_date AND a.end_date;

-- Allocation history for a specific employee
SELECT e.emp_name, p.project_name, a.allocation_percentage,
       a.start_date, a.end_date
FROM Allocation_History a
JOIN Employees e ON a.emp_id = e.emp_id
JOIN Projects p ON a.project_id = p.project_id
WHERE e.emp_id = 101;

-- Detect over-allocated employees (>100%)
SELECT emp_id, SUM(allocation_percentage) AS total_allocation
FROM Allocation_History
WHERE date('now') BETWEEN start_date AND end_date
GROUP BY emp_id
HAVING SUM(allocation_percentage) > 100;

-- Projects active during a given time period
SELECT DISTINCT p.project_name
FROM Allocation_History a
JOIN Projects p ON a.project_id = p.project_id
WHERE '2023-08-01' BETWEEN a.start_date AND a.end_date;
