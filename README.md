## Employee Data Management  (CRUD Application)

# #📌 Project Goal

A straightforward CRUD (Create, Read, Update, Delete) application to manage a list of employees. This project demonstrates a clean Spring Boot backend with RESTful APIs and a JSP-based frontend for managing employee records.

##  Features
🔹 Backend (Spring Boot + JPA + SQLite/MySQL)

Full CRUD API endpoints for employees (/api/employees).

Employee entity includes:

Name

Email

Position

Database persistence using JPA/Hibernate with SQLite/MySQL.

Search employees by name (/search?name=xyz).

##  Frontend (JSP + Bootstrap)

Display all employees in a table format.

Add new employees using a form.

Edit and Delete employees with a single click.

Search functionality with dynamic results.

Modal-based form handling for a modern UI experience.

Form validation to ensure correct input format.

##  Tech Stack

Backend: Spring Boot, Spring MVC, Spring Data JPA

Frontend: JSP, HTML5, CSS3, Bootstrap

Database: SQLite / MySQL

Build Tool: Maven

Server: Embedded Tomcat

## 📂 Project Structure  

```
Employee-Management-System/
├── src/main/java/com/demo/
│   ├── controller/        # Controller classes
│   │   └── HomeController.java
│   ├── model/             # Entity classes
│   │   └── Employee.java
│   ├── repository/        # DAO layer
│   ├── service/           # Business logic layer
│   └── DemoApplication.java
│
├── src/main/webapp/
│   └── index.jsp          # Frontend JSP
│
├── src/main/resources/
│   └── application.properties # Database configurations
│
├── pom.xml                # Maven dependencies
└── README.md
```

---

## 📋 Database Sample Data  

| ID | Name         | Email                     | Position               |
|----|-------------|----------------------------|------------------------|
| 1  | Rahul Sharma | rahul.sharma@example.com  | Software Engineer      |
| 2  | Priya Verma  | priya.verma@example.com   | HR Manager             |
| 3  | Amit Singh   | amit.singh@example.com    | Team Lead              |
| 4  | Sneha Patil  | sneha.patil@example.com   | UI/UX Designer         |
| 5  | Vikas Rao    | vikas.rao@example.com     | Database Administrator |

---



## ⚙️ Setup & Installation
  
   ## Prerequisites

      Java 17+

      Maven 3.8+

      MySQL or SQLite

  ## Steps

 1) Clone the repository:

      git clone https://github.com/your-username/employee-management-system.git
      cd employee-management-system


2) Configure database in application.properties:

     spring.datasource.url=jdbc:mysql://localhost:3306/employeesdb
     spring.datasource.username=root
     spring.datasource.password=yourpassword
     spring.jpa.hibernate.ddl-auto=update


3) Build and run the project:

        mvn spring-boot:run


4) Open in browser:

       http://localhost:8080/

## 🔑 API Endpoints

          Method	           Endpoint	                Description
          
           GET	             /                     Display employee list
           POST              /req1          	     Add / Update / Delete
           GET            	/search?name=    	    Search employees by name

           
## ✅ Form Validation Rules

    Name: Cannot be empty.

    Email: Must follow standard email format (example@domain.com).

    Position: Cannot be empty.



