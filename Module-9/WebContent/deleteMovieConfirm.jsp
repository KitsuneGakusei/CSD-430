<%--
    Author: Crystal Long
    Date: 12/03/2025
    Assignment: Module 9 - Project Part 4
    Purpose: Processes the selected movie ID for deletion, updates the
             database, and reloads the delete page with updated results.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="CSD430.MovieBean" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Movie Result</title>
</head>
<body>

<h1>Delete Movie Result</h1>

<%
    String idString = request.getParameter("movie_id");

    if (idString == null || idString.trim().isEmpty()) {
%>
        <p style="color:red;">No movie ID was selected.</p>
        <p><a href="deleteMovie.jsp">Return to Delete Page</a></p>
    </body>
</html>
<%
        return;
    }

    MovieBean bean = new MovieBean();

    try {
        int movie_id = Integer.parseInt(idString);

        bean.deleteMovie(movie_id);

        out.println("<p style='color:green;'>Movie ID " + movie_id + " was successfully deleted.</p>");
    }
    catch (Exception e) {
        out.println("<p style='color:red;'>Error deleting movie: " + e.getMessage() + "</p>");
    }
%>

<br>
<p><a href="deleteMovie.jsp">Return to Delete Page</a></p>
<p><a href="index.jsp">Return to Index</a></p>

</body>
</html>
