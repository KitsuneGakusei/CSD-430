<%--
    Author: Crystal Long
    Date: 12/03/2025
    Assignment: Module 9 - Project Part 4
    Purpose: Displays ALL movie records in a table and includes a dropdown
             for selecting a movie ID to delete. Used as an alternative view
             for DELETE operations.
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
    <title>All Movies</title>
</head>
<body>

<h1>All Movies</h1>

<%
    MovieBean bean = new MovieBean();
    List<Movie> movies = bean.getAllMovies();
%>

<p>
    This page shows ALL movie records currently stored in the database.
    You may select any movie ID from the dropdown to delete that record.
</p>

<!-- ------------------------------------------------------------
     TABLE OF ALL MOVIES
------------------------------------------------------------- -->
<table border="1" cellpadding="5" cellspacing="0">
    <thead>
        <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Release Year</th>
            <th>MPAA Rating</th>
            <th>Runtime (Minutes)</th>
        </tr>
    </thead>

    <tbody>
    <%
        if (movies.isEmpty()) {
    %>
        <tr>
            <td colspan="6" style="text-align:center;">No movies found in the database.</td>
        </tr>
    <%
        } else {

            for (Movie m : movies) {
    %>
        <tr>
            <td><%= m.getMovieId() %></td>
            <td><%= m.getTitle() %></td>
            <td><%= m.getGenre() %></td>
            <td><%= m.getReleaseYear() %></td>
            <td><%= m.getMpaaRating() %></td>
            <td><%= m.getRuntimeMinutes() %></td>
        </tr>
    <%
            }
        }
    %>
    </tbody>
</table>

<br><br>

<!-- ------------------------------------------------------------
     DELETE DROPDOWN + FORM
------------------------------------------------------------- -->
<form action="deleteMovieConfirm.jsp" method="post">

    <label for="movie_id">Select Movie ID to Delete:</label><br>

    <select name="movie_id" id="movie_id" required>
        <option value="" disabled selected>-- Choose ID --</option>

        <%
            for (Movie m : movies) {
        %>
            <option value="<%= m.getMovieId() %>"><%= m.getMovieId() %></option>
        <%
            }
        %>
    </select>

    <br><br>

    <input type="submit" value="Delete Movie">

</form>

<br>
<a href="index.jsp">Back to Index</a>

</body>
</html>
