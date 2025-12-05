<%--
    Author: Crystal Long
    Date: 11/18/2025
    Assignment: Module 7 - Project Part 2 (Used again in Module 8)
    Purpose: Processes form data submitted from addMovieForm.jsp, inserts the
             new movie record using the MovieBean, and displays a confirmation.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="CSD430.MovieBean" %>

<!-- Use the JavaBean for inserting a new movie -->
<jsp:useBean id="movieBean" class="CSD430.MovieBean" scope="page" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Movie</title>
</head>
<body>

<h1>Add a New Movie</h1>

<%
    // Retrieve submitted form data
    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    String releaseYearStr = request.getParameter("releaseYear");
    String mpaaRating = request.getParameter("mpaaRating");
    String runtimeStr = request.getParameter("runtimeMinutes");

    boolean inserted = false;

    // Only process if form was submitted
    if (title != null && genre != null && releaseYearStr != null &&
        mpaaRating != null && runtimeStr != null) {

        try {
            int releaseYear = Integer.parseInt(releaseYearStr);
            int runtimeMinutes = Integer.parseInt(runtimeStr);

            // Insert the movie using MovieBean
            movieBean.addMovie(
                title,
                genre,
                releaseYear,
                mpaaRating,
                runtimeMinutes
            );

            inserted = true;

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error inserting movie: " + e.getMessage() + "</p>");
        }
    }

    // Display success message
    if (inserted) {
        out.println("<p style='color:green;'>Movie added successfully!</p>");
    }
%>

<p><a href="addMovieForm.jsp">Add Another Movie</a></p>
<p><a href="index.jsp">Return to Index</a></p>

</body>
</html>
