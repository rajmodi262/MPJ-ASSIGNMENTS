# 📚 MPJ Assignments — Multi-Paradigm Java Programming

> Academic assignment repository for the Multi-Paradigm Java (MPJ) course at MIT World Peace University, Pune.

![Java](https://img.shields.io/badge/Java-17+-ED8B00?logo=openjdk&logoColor=white)
![Servlets](https://img.shields.io/badge/Servlets-JSP-007396?logo=java&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Connector--J-4479A1?logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/status-completed-brightgreen)

---

## 📋 Assignment Overview

| # | File(s) | Topic | Concepts |
|---|---------|-------|----------|
| 1 | `Assi1.java`, `assignment1.java` | Java Basics & Control Flow | Variables, loops, conditionals, I/O |
| 2 | `assignment2.java` | Object-Oriented Fundamentals | Classes, objects, constructors |
| 3 | `shapes.java`, `class hills.java` | Inheritance & Polymorphism | Abstract classes, method overriding |
| 4 | `BankingSystem.java`, `bankingsystem.java` | Exception Handling & Collections | Try-catch, ArrayList, custom exceptions |
| 5 | `EmployeeInheritanceDemo.java` | Multilevel Inheritance | `extends`, `super`, type casting |
| 6 | `MPJ-Assignment-5-Mine/` | **Java Web Application (Servlets + JSP)** | Full CRUD with MVC pattern |

---

## 🌐 Assignment 5 — Staff Management Web App

A complete **Java Servlet + JSP** web application implementing CRUD operations for employee/staff management.

### Architecture
```
MPJ-Assignment-5-Mine/
├── WebContent/
│   ├── WEB-INF/
│   │   ├── web.xml                    # Servlet mappings
│   │   └── lib/mysql-connector-java-8.0.13.jar
│   ├── index.jsp                      # Home page
│   ├── register.jsp                   # Staff registration form
│   ├── employeeList.jsp               # Staff listing view
│   └── success.jsp                    # Confirmation page
├── src/com/staff/
│   ├── Staff.java                     # POJO model
│   ├── StaffDAO.java                  # Data Access Object (MySQL CRUD)
│   ├── StaffServlet.java              # Controller servlet
│   └── DBConnection.java             # JDBC connection manager
└── screenshots/
    ├── home.png
    ├── register.png
    └── list.png
```

### Tech Stack
- **Backend:** Java Servlets, JSP, JDBC
- **Database:** MySQL 8.0 with Connector/J
- **Server:** Apache Tomcat
- **Pattern:** MVC (Model-View-Controller)

---

## 🛠️ Technologies Used

- **Language:** Java 17+
- **Web:** Java Servlets, JSP, HTML
- **Database:** MySQL 8.0, JDBC
- **Server:** Apache Tomcat 9+
- **IDE:** Eclipse / IntelliJ IDEA

---

## 👤 Author

| Name | Institution | Course |
|------|-------------|--------|
| **Raj Modi** | MIT World Peace University, Pune | B.Tech CSE (AI & Data Science) |

---

## 📄 License

This repository is developed for academic purposes as part of the MPJ curriculum at MIT-WPU.