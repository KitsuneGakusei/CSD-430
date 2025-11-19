<%--
    Author: Crystal Long
    Date: 11/17/2025
    Assignment: Modules 5 & 6 Assignment - Project Part 1
    Purpose: Displays all fields for the selected movie in an HTML table using a JavaBean/JDBC.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.sql.*" %>
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
        // Read the movieId value submitted from selectMovie.jsp
        String idParam = request.getParameter("movieId");

        // Database connection details
        // ⚠ If selectMovie.jsp uses a different port, change 3306 to match it
        String url  = "jdbc:mysql://localhost:3306/CSD430";
        String user = "student1";
        String pass = "pass";

        // Variables to hold the selected movie data
        int movieId = 0;
        String title = null;
        String genre = null;
        int releaseYear = 0;
        String mpaaRating = null;
        int runtimeMinutes = 0;
        boolean found = false;

        // JDBC resources
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            if (idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);

                // Load the MySQL driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect and select the matching movie row
                conn = DriverManager.getConnection(url, user, pass);
                String sql = "SELECT movie_id, title, genre, release_year, mpaa_rating, runtime_minutes " +
                             "FROM Crystal_Movies_data WHERE movie_id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();

                if (rs.next()) {
                    movieId        = rs.getInt("movie_id");
                    title          = rs.getString("title");
                    genre          = rs.getString("genre");
                    releaseYear    = rs.getInt("release_year");
                    mpaaRating     = rs.getString("mpaa_rating");
                    runtimeMinutes = rs.getInt("runtime_minutes");
                    found = true;
                }
            }
        } catch (Exception e) {
            // Print to server log
            e.printStackTrace();
        } finally {
            try { if (rs   != null) rs.close(); } catch (Exception ignore) {}
            try { if (ps   != null) ps.close(); } catch (Exception ignore) {}
            try { if (conn != null) conn.close(); } catch (Exception ignore) {}
        }
    %>

    <%
        // If no movie was found, display a friendly message
        if (!found) {
    %>
        <p>No movie was found for the selected ID.</p>
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
                    <td><%= movieId %></td>
                    <td><%= title %></td>
                    <td><%= genre %></td>
                    <td><%= releaseYear %></td>
                    <td><%= mpaaRating %></td>
                    <td><%= runtimeMinutes %></td>
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
