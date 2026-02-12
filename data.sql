INSERT INTO Departments VALUES
(1, 'IT', 'Hyderabad');
(2, 'HR', 'Bangalore');
(3, 'Finance', 'Mumbai');
(4, 'Operations', 'Chennai');

INSERT INTO Employees VALUES
(101, 'Ravi Kumar', 'ravi@company.con', 'Software Engineer', 45000, '2023-06-10', 1),
(102, 'Anu Sharma', 'anu@company.com', 'HR Associate', 30000, '2024-01-15', 2),
(103, 'Kiran Rao', 'kiran@company.com', 'Business Analyst', 50000, '2022-11-20', 1),
(104, 'Meena Das', 'meena@company.com', 'Finance Executive', 40000, '2023-03-05', 3);

INSERT INTO Projects VALUES
(201, 'Internal HR System', 'Accenture', '2023-01-01', '2023-12-31'),
(202, 'Payroll Automation', 'IBM', '2022-07-01', '2023-06-30'),
(203, 'Employee Portal', 'Deloitte', '2023-04-01', '2024-03-31');

INERT INTO Employee_Project VALUES
(1, 101, 203, 70),
(2, 103, 203, 50),
(3, 104, 202, 60),
(4, 102, 201, 40);
