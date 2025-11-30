<%--
    Author: Crystal Long
    Date: 11/29/2025
    Assignment: Module 8 - Project Part 3
    Purpose: Displays a dropdown list of movie IDs to select a record to update.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="CSD430.MovieBean" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Movie to Update</title>
</head>
<body>

    <h1>Select Movie to Update</h1>

    <p>
        Choose the movie ID you want to update. The selected ID will be used
        to load the movie's details into an editable update form.
    </p>

    <%
        // Create the bean and retrieve all movie IDs
        MovieBean bean = new MovieBean();
        List<Integer> movieIds = bean.getAllMovieIds();
    %>

    <form action="updateMovieForm.jsp" method="post">
        <label for="movie_id">Select Movie ID:</label>
        <select name="movie_id" id="movie_id" required>
            <option value="" disabled selected>-- Choose ID --</option>

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
        <input type="submit" value="Load Movie">
    </form>

    <p><a href="index.jsp">Back to Index</a></p>

</body>
</html>
