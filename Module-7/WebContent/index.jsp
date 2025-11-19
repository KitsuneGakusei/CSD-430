<%--
    Author: Crystal Long
    Date: 11/15/2025
    Assignment: Modules 5 & 6 Assignment - Project Part 1
    Purpose: Index page that links to the Module 5 & 6 READ example using JSP and JavaBeans. As well as a movie form.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crystal Movies - Module 5 &amp; 6</title>
</head>
<body>
    <!-- Page header and brief description of the assignment -->
    <h1>Crystal Movies Data</h1>

    <p>
        This index page contains links to the Module 5 &amp; 6 CRUD-READ deliverables.
    </p>

    <!-- Link to the JSP that reads data from the database -->
    <ul>
        <li><a href="selectMovie.jsp">View Movies (READ using JavaBean &amp; JSP)</a></li>
        <!-- Future modules can add Create / Update / Delete links here -->
         <li><a href="addMovieForm.jsp">Add New Movie (Module 7)</a></li>
    </ul>
</body>
</html>
