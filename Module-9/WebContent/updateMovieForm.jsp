<%--
    Author: Crystal Long
    Date: 11/29/2025
    Assignment: Module 8 - Project Part 3
    Purpose: Loads the selected movie record from the database and displays it
             in an editable form (except for the movie ID, which cannot be changed).
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="CSD430.MovieBean" %>
<%@ page import="CSD430.Movie" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Movie</title>
</head>
<body>

    <h1>Update Movie Information</h1>

    <%
        String idString = request.getParameter("movie_id");
        Movie movie = null;
        int movie_id = -1;

        try {
            movie_id = Integer.parseInt(idString);
            MovieBean bean = new MovieBean();
            movie = bean.getMovieById(movie_id);
        } catch (Exception e) {
            out.println("<p style='color:red;'>Invalid or missing movie ID.</p>");
        }

        if (movie == null) {
    %>

        <p style="color:red;">No movie found for the selected ID.</p>
        <p><a href="selectMovieToUpdate.jsp">Back to Select Movie</a></p>
        <p><a href="index.jsp">Back to Index</a></p>

    </body>
    </html>

    <%
            return;
        }
    %>

    <p>
        The form below displays the current movie data. You may update any of the
        fields except for the Movie ID, which is not editable.
    </p>

    <form action="processMovieUpdate.jsp" method="post">

        <label>Movie ID:</label><br>
        <input type="text" value="<%= movie.getMovieId() %>" readonly>
        <input type="hidden" name="movie_id" value="<%= movie.getMovieId() %>">
        <br><br>

        <label>Title:</label><br>
        <input type="text" name="title" value="<%= movie.getTitle() %>" required>
        <br><br>

        <label>Genre:</label><br>
        <input type="text" name="genre" value="<%= movie.getGenre() %>" required>
        <br><br>

        <label>Release Year:</label><br>
        <input type="number" name="release_year" value="<%= movie.getReleaseYear() %>" required>
        <br><br>

        <label>MPAA Rating:</label><br>
        <input type="text" name="mpaa_rating" value="<%= movie.getMpaaRating() %>" required>
        <br><br>

        <label>Runtime (minutes):</label><br>
        <input type="number" name="runtime_minutes" value="<%= movie.getRuntimeMinutes() %>" required>
        <br><br>

        <input type="submit" value="Update Movie">
    </form>

</body>
</html>
