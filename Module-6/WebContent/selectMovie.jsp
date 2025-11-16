<%--
    Author: Crystal Long
    Date: 11/15/2025
    Assignment: Modules 5 & 6 Assignment - Project Part 1
    Purpose: Displays a dropdown list of movies by reading directly from the database.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select a Movie</title>
</head>
<body>
    <!-- Page title and explanation for the user -->
    <h1>Select a Movie</h1>

    <p>
        Choose a movie from the list below. The form will read from the CSD430 database
        and display all fields for the movie you select on the next page.
    </p>

    <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/CSD430";
        String user = "student1";
        String pass = "pass";

        // A list to hold id/title pairs for the dropdown
        List<int[]> ids = new ArrayList<int[]>();
        List<String> titles = new ArrayList<String>();

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection and query all movies
            Connection conn = DriverManager.getConnection(url, user, pass);
            String sql = "SELECT movie_id, title FROM Crystal_Movies_data";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Collect all rows
            while (rs.next()) {
                int id = rs.getInt("movie_id");
                String title = rs.getString("title");
                ids.add(new int[] { id });
                titles.add(title);
            }

            rs.close();
            ps.close();
            conn.close();
      } catch (Exception e) {
    e.printStackTrace();
}

    %>

    <!-- Form posts the selected movieId to displayMovie.jsp -->
    <form action="displayMovie.jsp" method="get">
        <label for="movieId">Movie Title:</label>
        <select name="movieId" id="movieId">
            <%
                // Loop through the collected id/title values and build the dropdown options
                for (int i = 0; i < ids.size(); i++) {
                    int idVal = ids.get(i)[0];
                    String titleVal = titles.get(i);
            %>
                <option value="<%= idVal %>">
                    <%= titleVal %>
                </option>
            <%
                }
            %>
        </select>
        <button type="submit">Show Details</button>
    </form>

    <!-- Navigation link back to the index page -->
    <p><a href="index.jsp">Back to Index</a></p>
</body>
</html>
