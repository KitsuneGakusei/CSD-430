/*
 * Author: Crystal Long
 * Date: 11/15/2025
 * Assignment: Modules 5 & 6 Assignment - Project Part 1
 * Purpose: JavaBean that connects to the CSD430 MySQL database and returns movie data.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MovieBean {

    // Connection information for the CSD430 database
    // Change the port number if your MySQL server uses a different one.
    private String url = "jdbc:mysql://localhost:3306/CSD430";
    private String username = "student1";
    private String password = "pass";

    // Constructor loads the MySQL JDBC driver
    public MovieBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Helper method that opens a connection to the database
    private Connection getConnection() throws Exception {
        return DriverManager.getConnection(url, username, password);
    }

    /**
     * Returns a list of all movies in the Crystal_Movies_data table.
     * This is used to populate the dropdown list in selectMovie.jsp.
     */
    public List<Movie> getAllMovies() {
        List<Movie> list = new ArrayList<>();

        String sql = "SELECT movie_id, title, genre, release_year, mpaa_rating, runtime_minutes "
                   + "FROM Crystal_Movies_data";

        // Try-with-resources closes the Connection, PreparedStatement, and ResultSet automatically.
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            // Build a Movie object for each row and add it to the list.
            while (rs.next()) {
                Movie m = new Movie(
                        rs.getInt("movie_id"),
                        rs.getString("title"),
                        rs.getString("genre"),
                        rs.getInt("release_year"),
                        rs.getString("mpaa_rating"),
                        rs.getInt("runtime_minutes")
                );
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * Returns a single Movie object for the given movieId.
     * This is used when the user selects a specific movie in the dropdown.
     */
    public Movie getMovieById(int id) {
        Movie movie = null;

        String sql = "SELECT movie_id, title, genre, release_year, mpaa_rating, runtime_minutes "
                   + "FROM Crystal_Movies_data WHERE movie_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Bind the primary key value to the SQL query
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            // If a row is found, build a Movie object from it
            if (rs.next()) {
                movie = new Movie(
                        rs.getInt("movie_id"),
                        rs.getString("title"),
                        rs.getString("genre"),
                        rs.getInt("release_year"),
                        rs.getString("mpaa_rating"),
                        rs.getInt("runtime_minutes")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return movie;
    }
    /**
     * Inserts a new movie into the Crystal_Movies_data table.
     * Returns the number of rows inserted (should be 1 on success).
     */
    public int insertMovie(String title,
                           String genre,
                           int releaseYear,
                           String mpaaRating,
                           int runtimeMinutes) {

        String sql = "INSERT INTO Crystal_Movies_data " +
                     "(title, genre, release_year, mpaa_rating, runtime_minutes) " +
                     "VALUES (?, ?, ?, ?, ?)";

        int rowsInserted = 0;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setInt(3, releaseYear);
            ps.setString(4, mpaaRating);
            ps.setInt(5, runtimeMinutes);

            rowsInserted = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowsInserted;
    }
}

