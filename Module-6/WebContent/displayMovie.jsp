<%--
    Author: Crystal Long
    Date: 11/15/2025
    Assignment: Modules 5 & 6 Assignment - Project Part 1
    Purpose: Displays all fields for the selected movie in an HTML table.
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
    <!-- Page heading for the detail view -->
    <h1>Movie Details</h1>

    <%
        // Read the movieId value that was submitted from selectMovie.jsp
        String idParam = request.getParameter("movieId");

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/CSD430";
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

        if (idParam != null && !idParam.isEmpty()) {
            try {
                // Parse the incoming id
                int id = Integer.parseInt(idParam);

                // Load the MySQL driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect and select the matching movie row
                Connection conn = DriverManager.getConnection(url, user, pass);
                String sql = "SELECT movie_id, title, genre, release_year, mpaa_rating, runtime_minutes "
                           + "FROM Crystal_Movies_data WHERE movie_id = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    movieId = rs.getInt("movie_id");
                    title = rs.getString("title");
                    genre = rs.getString("genre");
                    releaseYear = rs.getInt("release_year");
                    mpaaRating = rs.getString("mpaa_rating");
                    runtimeMinutes = rs.getInt("runtime_minutes");
                    found = true;
                }

                rs.close();
                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace(out);
            }
        }
    %>

    <%
        // If no movie was found, display a friendly message
        if (!found) {
    %>
        <p>No movie could be found for the selected id.</p>
    <%
        } else {
    %>
        <!-- Description of what the table shows -->
        <p>
            The table below shows all fields for the movie selected from the dropdown,
            including the primary key and descriptive information from the CSD430 database.
        </p>

        <!-- Table header uses thead to show field titles, and tbody for the record data -->
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

    <!-- Navigation links back to the dropdown and index pages -->
    <p><a href="selectMovie.jsp">Choose another movie</a></p>
    <p><a href="index.jsp">Back to Index</a></p>
</body>
</html>
