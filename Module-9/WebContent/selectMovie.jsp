<%--
    Author: Crystal Long
    Date: 11/15/2025
    Assignment: Modules 5 & 6 Assignment - Project Part 1 (Updated for Module 8)
    Purpose: Displays a dropdown list of movie titles using the MovieBean.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="CSD430.MovieBean" %>
<%@ page import="CSD430.Movie" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select a Movie</title>
</head>
<body>

    <h1>Select a Movie</h1>

    <p>
        Choose a movie from the list below. This page reads from the CSD430
        database using the MovieBean and displays the full details on the
        next page.
    </p>

    <%
        MovieBean bean = new MovieBean();
        List<Movie> movies = bean.getAllMovies();
    %>

    <form action="displayMovie.jsp" method="get">
        <label for="movieId">Movie Title:</label>
        <select name="movieId" id="movieId" required>
            <option value="" disabled selected>-- Choose a Movie --</option>

            <%
                for (Movie m : movies) {
            %>
                <option value="<%= m.getMovieId() %>">
                    <%= m.getTitle() %>
                </option>
            <%
                }
            %>
        </select>

        <br><br>
        <button type="submit">Show Details</button>
    </form>

    <p><a href="index.jsp">Back to Index</a></p>

</body>
</html>
