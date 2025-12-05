<%--
    Author: Crystal Long
    Date: 12/??/2025
    Assignment: Module 9 - Project Part 4
    Purpose: Displays all movie records in a table and provides a dropdown
             to select a record for deletion.
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
    <title>Delete Movie Records</title>

    <style>
        body { font-family: Arial, sans-serif; }
        table { border-collapse: collapse; margin-top: 15px; }
        th, td { padding: 8px 12px; border: 1px solid #333; }
        th { background-color: #e0e0e0; }
        h1 { color: #333; }
        .section { margin-bottom: 20px; }
        select { padding: 5px; }
        button { padding: 6px 12px; }
    </style>
</head>
<body>

<h1>Delete Movie Records</h1>

<div class="section">
    <p>
        Below is a complete list of all movie records currently stored in your
        <strong>Crystal_Movies_data</strong> table.  
        Select a movie ID to remove that record from the database.  
        After deletion, this page will refresh showing the remaining records.
    </p>
</div>

<%
    // Load full movie list + IDs
    MovieBean bean = new MovieBean();
    List<Movie> movies = bean.getAllMovies();
    List<Integer> movieIds = bean.getAllMovieIds();
%>

<!-- ========================= -->
<!--   MOVIE DISPLAY TABLE     -->
<!-- ========================= -->
<table>
    <thead>
        <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Release Year</th>
            <th>MPAA Rating</th>
            <th>Runtime (min)</th>
        </tr>
    </thead>
    <tbody>
<%
    if (movies != null && !movies.isEmpty()) {
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
    } else {
%>
        <tr>
            <td colspan="6" style="text-align:center; color:red;">
                No movie records exist in the database.
            </td>
        </tr>
<%
    }
%>
    </tbody>
</table>

<br><br>

<!-- ========================= -->
<!--     DELETE DROPDOWN       -->
<!-- ========================= -->
<form action="deleteMovie.jsp" method="post">

    <label for="deleteId"><strong>Select Movie ID to Delete:</strong></label><br>
    <select name="deleteId" id="deleteId" required>
        <option value="" disabled selected>-- Choose an ID --</option>

<%
    if (movieIds != null) {
        for (Integer id : movieIds) {
%>
            <option value="<%= id %>"><%= id %></option>
<%
        }
    }
%>
    </select>

    <br><br>
    <button type="submit">Delete Selected Movie</button>

</form>

<br>
<p><a href="index.jsp">Return to Index</a></p>

</body>
</html>
