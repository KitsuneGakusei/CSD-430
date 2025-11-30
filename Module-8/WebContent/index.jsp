<%--
    Author: Crystal Long
    Date: 11/29/2025
    Assignment: Modules 8 Assignment - Project Part 3
    Purpose: Index page that links to the Module 5 & 6 READ example using JSP and JavaBeans,
             as well as movie form functionality. Updated in later modules to include
             CREATE and UPDATE operations.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crystal Movies - Module 5, 6, 7 &amp; 8</title>
</head>
<body>
    <!-- Page header and brief description of the assignment -->
    <h1>Crystal Movies Data</h1>

    <p>
        This index page contains links to the Module 5 &amp; 6 CRUD-READ deliverables,
        Module 7 CREATE functionality, and Module 8 UPDATE functionality.
    </p>

    <!-- Navigation menu for CRUD operations -->
    <ul>
        <li><a href="selectMovie.jsp">View Movies (READ using JavaBean &amp; JSP)</a></li>
        <li><a href="addMovieForm.jsp">Add New Movie (Module 7 - CREATE)</a></li>
        <li><a href="selectMovieToUpdate.jsp">Update Existing Movie (Module 8 - UPDATE)</a></li>
    </ul>

</body>
</html>
