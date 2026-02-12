CREATE TABLE Departments (
  dept_id INTEGER PRIMARY KEY,
  dept_name TEXT,
  location TEXT 
);

CREATE TABLE Employees (
  emp_id INTEGER PRIMARY KEY,
  emp_name TEXT,
  email TEXT,
  job_role TEXT,
  salary INTEGER,
  hire_date TEXT,
  dept_id INTEGER
);

CREATE TABLE Projects (
  project_id INTEGER PRIMARY KEY,
  project_name TEXT,
  client_name TEXT,
  start_date TEXT,
  end_date TEXT
);

CREATE TABLE Employee_Project (
  allocation_id INTEGER PRIMARY KEY,
  emp_id INTEGER,
  project_id INTEGER,
  allocation_percentage INTEGER
 ); 

  


  
  
