# Enterprise Employee & Project Resource Management System (SQL)

## Overview
This is a hands-on SQL learning project created to strengthen relational database
design and enterprise-style querying skills. The project focuses on modeling
employees, departments, client projects, and resource allocation using SQL,
similar to internal systems used in IT service and consulting organizations.

The goal of this project is learning and practice, not production deployment

## Purpose
- Practice core and advanced SQL concepts through a structured project
- Understand how enterprise data is organized across multiple related tables
- Gain hands-on experience writing business-oriented SQL queries
- Simulate real-world reporting and analysis scenarios

## Features
- Employee and department data modeling
- Client project tracking
- Resource allocation between employees and projects
- Salary and headcount reporting
- Department-wise and project-wise analysis
- Bench resource identification
- Role-based access modeling (data level)
- Time-based resource allocation tracking

## Tech Stack
- SQL (ANSI SQL)
- SQLite (for local execution and portability)

## Database Design
The system is built using a normalized relational schema:

- **Departments**  
  Stores department information and locations

- **Employees**  
  Stores employee details and department mapping

- **Projects**  
  Stores client project information

- **Employee_Project**  
  Manages employee-to-project allocation (many-to-many relationship)

- **Roles**  
  Defines system roles such as Admin, Manager, and Employee

- **Employee_Roles**  
  Maps employees to their assigned roles

- **Allocation_History**  
  Tracks time-based employee allocation across projects

## Design Decisions
- Normalized tables to avoid data duplication
- Separate mapping tables for roles and allocations to support flexibility
- Time-based allocation modeling to track historical and active assignments
- SQL-first approach to focus on data integrity and querying logic
- Learning-oriented design without assuming authentication or UI layers

## Key SQL Concepts Practiced
- INNER JOIN across multiple tables
- GROUP BY with aggregate functions (COUNT, AVG, SUM)
- Subqueries for comparison and filtering
- WHERE and HAVING clauses
- NULL and exclusion handling
- Temporal (date-based) data filtering

## Practice Scenarios Covered
- Listing employees by department
- Identifying employees working for a specific client (e.g., Deloitte)
- Calculating average and total salary by department
- Identifying bench employees (no project allocation)
- Detecting over-allocated employees
- Tracking allocation history for employees
- Identifying projects without assigned resources
- Role-based access data modeling and querying

## Edge Cases Handled
- Employees without department assignment
- Employees not allocated to any project
- Projects without assigned employees
- Salary comparison against department averages
- Employees working on multiple projects
- Over-allocation exceeding 100%
- Allocation validity based on date ranges

## Project Structure

├── schema.sql # Core table creation scripts
├── data.sql # Sample enterprise-style data
├── queries.sql # Business and reporting queries
├── advanced_extensions.sql # RBAC and time-based allocation modeling
└── README.md

## How to Use
1. Execute `schema.sql` to create base tables  
2. Execute `data.sql` to populate sample data  
3. Run queries from `queries.sql` to practice core SQL concepts  
4. Run scripts from `advanced_extensions.sql` to explore advanced modeling and reporting  

## Learning Outcomes
Through this project, I gained hands-on experience in:
- Designing relational database schemas
- Writing structured SQL queries for business reporting
- Modeling enterprise concepts such as roles and resource allocation
- Handling real-world data edge cases
- Extending an existing system with advanced features


## Applicability
This project reflects SQL concepts and data structures commonly found in
internal systems used by IT service and consulting companies such as
Deloitte, IBM, Accenture, Cognizant, TCS, and Capgemini.

## Future Enhancements
- Role-based permission rules at application level
- Time-series analysis for allocation trends
- Integration with backend services or APIs
- Visualization layer for dashboards
