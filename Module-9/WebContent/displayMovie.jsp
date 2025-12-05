<%--
    Author: Crystal Long
    Date: 11/17/2025
    Assignment: Modules 5 & 6 Assignment - Project Part 1 (Updated for Module 8)
    Purpose: Displays the full record for the selected movie using MovieBean.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="CSD430.MovieBean" %>
<%@ page import="CSD430.Movie" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Details</title>
</head>
<body>

<h1>Movie Details</h1>
<p>This page displays the full record for the movie you selected.</p>

<%
    String idParam = request.getParameter("movieId");
    Movie selectedMovie = null;

    if (idParam != null && !idParam.isEmpty()) {
        try {
            int movieId = Integer.parseInt(idParam);
            MovieBean bean = new MovieBean();
            selectedMovie = bean.getMovieById(movieId);
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error retrieving movie: " + e.getMessage() + "</p>");
        }
    }
%>

<%
    if (selectedMovie == null) {
%>
        <p style="color:red;">No movie was found for the selected ID.</p>
<%
    } else {
%>

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
                    <td><%= selectedMovie.getMovieId() %></td>
                    <td><%= selectedMovie.getTitle() %></td>
                    <td><%= selectedMovie.getGenre() %></td>
                    <td><%= selectedMovie.getReleaseYear() %></td>
                    <td><%= selectedMovie.getMpaaRating() %></td>
                    <td><%= selectedMovie.getRuntimeMinutes() %></td>
                </tr>
            </tbody>
        </table>

<%
    }
%>

<p><a href="selectMovie.jsp">Back to Select Movie</a></p>
<p><a href="index.jsp">Back to Index</a></p>

</body>
</html>

