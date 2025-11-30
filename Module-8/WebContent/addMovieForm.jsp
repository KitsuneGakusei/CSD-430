<%--
    Author: Crystal Long
    Date: 11/17/2025
    Assignment: Module 7 Assignment - Project Part 2
    Purpose: Gathers user input for creating a new movie record.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Movie</title>
</head>
<body>

    <h1>Add a New Movie</h1>
    <p>Enter movie details below. The movie ID will be assigned automatically.</p>

    <form action="addMovie.jsp" method="post">
        <p>
            <label for="title">Title:</label>
            <input type="text" name="title" id="title" required>
        </p>

        <p>
            <label for="genre">Genre:</label>
            <input type="text" name="genre" id="genre" required>
        </p>

        <p>
            <label for="releaseYear">Release Year (YYYY):</label>
            <input type="number" name="releaseYear" id="releaseYear"
                   min="1900" max="2100" required>
        </p>

        <p>
            <label for="mpaaRating">MPAA Rating:</label>
            <input type="text" name="mpaaRating" id="mpaaRating"
                   maxlength="10" required>
        </p>

        <p>
            <label for="runtimeMinutes">Runtime (minutes):</label>
            <input type="number" name="runtimeMinutes" id="runtimeMinutes"
                   min="1" required>
        </p>

        <button type="submit">Add Movie</button>
    </form>

    <p><a href="index.jsp">Back to Index</a></p>

</body>
</html>
