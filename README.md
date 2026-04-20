# StaffHub – Employee Management System

A Java Web Application built using JSP, Servlets, and JDBC.

## Features
- Add new employees (name, email, phone, department, designation, salary, joining date)
- View all employees in a clean directory table
- Delete employee records
- MVC architecture with DAO pattern

## Tech Stack
- **Frontend:** JSP, HTML5, CSS3
- **Backend:** Java Servlets
- **Database:** MySQL (JDBC)
- **Server:** Apache Tomcat

## Database Setup

```sql
CREATE DATABASE staffdb;
USE staffdb;

CREATE TABLE staff_records (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100)   NOT NULL,
    email       VARCHAR(150)   NOT NULL UNIQUE,
    department  VARCHAR(100),
    designation VARCHAR(100),
    salary      DECIMAL(10,2),
    phone       VARCHAR(15),
    join_date   DATE
);
```

## Configuration
Update `DBConnection.java` with your MySQL credentials.

## How to Run
1. Create the database using the SQL above
2. Import project into Eclipse as a Dynamic Web Project
3. Deploy to Tomcat
4. Open `http://localhost:8080/<project-name>/`
