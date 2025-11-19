<%--
    Author: Crystal Long
    Date: 11/18/2025
    Assignment: Module 7 - Project Part 2
    Purpose: Adds a new movie using MovieBean, then displays all records.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.sql.*" %>

<!-- Use the JavaBean ONLY for inserting a new movie -->
<jsp:useBean id="movieBean" class="MovieBean" scope="page" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Movie</title>
</head>
<body>

<h1>Add a New Movie</h1>
<p>Fill out the form below to add a new movie record to the database.</p>

<%
    // Check if form was submitted
    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    String releaseYearStr = request.getParameter("release_year");
    String mpaaRating = request.getParameter("mpaa_rating");
    String runtimeStr = request.getParameter("runtime_minutes");

    int rowsInserted = 0;

    if (title != null && genre != null && releaseYearStr != null &&
        mpaaRating != null && runtimeStr != null &&
        !title.isEmpty()) {

        try {
            // Convert numeric values
            int releaseYear = Integer.parseInt(releaseYearStr);
            int runtimeMinutes = Integer.parseInt(runtimeStr);

            // *** SAFE CHANGE ***
            // Use MovieBean to insert the new movie (instead of JDBC block)
            rowsInserted = movieBean.insertMovie(
                    title,
                    genre,
                    releaseYear,
                    mpaaRating,
                    runtimeMinutes
            );

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error inserting movie: " + e.getMessage() + "</p>");
        }
    }

    if (rowsInserted == 1) {
        out.println("<p style='color:green;'>Movie added successfully!</p>");
    }
%>

<form action="addMovie.jsp" method="post">
    <label>Title:</label>
    <input type="text" name="title" required><br><br>

    <label>Gen
