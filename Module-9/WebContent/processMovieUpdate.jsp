<%--
    Author: Crystal Long
    Date: 11/29/2025
    Assignment: Module 8 - Project Part 3
    Purpose: Processes updated movie data, updates DB record,
             displays the updated details.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="CSD430.MovieBean" %>
<%@ page import="CSD430.Movie" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Updated</title>
</head>
<body>

<h1>Movie Record Successfully Updated</h1>

<%
    MovieBean bean = new MovieBean();
    Movie updatedMovie = null;

    try {
        // Retrieve form data
        int movie_id = Integer.parseInt(request.getParameter("movie_id"));
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        int release_year = Integer.parseInt(request.getParameter("release_year"));
        String mpaa_rating = request.getParameter("mpaa_rating");
        int runtime_minutes = Integer.parseInt(request.getParameter("runtime_minutes"));

        // Update the movie
        bean.updateMovie(movie_id, title, genre, release_year, mpaa_rating, runtime_minutes);

        // Reload updated record from database
        updatedMovie = bean.getMovieById(movie_id);
    }
    catch (Exception e) {
        out.println("<p style='color:red;'>Error updating movie: " + e.getMessage() + "</p>");
    }

    if (updatedMovie == null) {
%>

<p style="color:red;">The movie could not be updated or retrieved.</p>
<p><a href="index.jsp">Return to Index</a></p>

<%
    } else {
%>

    <p>The updated movie record is shown below:</p>

    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>Movie ID</th>
                <th>Title</th>
                <th>Genre</th>
                <th>Release Year</th>
                <th>MPAA Rating</th>
                <th>Runtime (minutes)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= updatedMovie.getMovieId() %></td>
                <td><%= updatedMovie.getTitle() %></td>
                <td><%= updatedMovie.getGenre() %></td>
                <td><%= updatedMovie.getReleaseYear() %></td>
                <td><%= updatedMovie.getMpaaRating() %></td>
                <td><%= updatedMovie.getRuntimeMinutes() %></td>
            </tr>
        </tbody>
    </table>

    <br>
    <a href="selectMovieToUpdate.jsp">Update Another Movie</a><br>
    <a href="index.jsp">Return to Index</a>

<%
    }
%>

</body>
</html>
