/*
    Author: Crystal Long
    Date: 11/29/2025
    Assignment: Modules 5, 6, 7 & 8 - Project Parts 1–3
    Purpose: JavaBean used to access the movie database for READ, CREATE,
             and UPDATE operations. Updated for Module 8 to include update logic.
*/

package CSD430;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieBean {

    // ------------------------------------------------------------
    //  Database connection settings
    // ------------------------------------------------------------
    private final String url = "jdbc:mysql://localhost:3306/CSD430?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private final String username = "student1";
    private final String password = "pass";

    // ------------------------------------------------------------
    //  Retrieve ALL movies from crystal_movies_data
    // ------------------------------------------------------------
    public List<Movie> getAllMovies() {
        List<Movie> list = new ArrayList<>();

        String sql = "SELECT * FROM crystal_movies_data ORDER BY movie_id";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

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

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // ------------------------------------------------------------
    //  Retrieve ONE movie by ID
    // ------------------------------------------------------------
    public Movie getMovieById(int id) {
        Movie movie = null;

        String sql = "SELECT * FROM crystal_movies_data WHERE movie_id = ?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

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

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movie;
    }

    // ------------------------------------------------------------
    //  INSERT a new movie record (Module 7 - CREATE)
    // ------------------------------------------------------------
    public void addMovie(String title, String genre, int year, String rating, int runtime) {

        String sql = "INSERT INTO crystal_movies_data (title, genre, release_year, mpaa_rating, runtime_minutes) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, title);
            stmt.setString(2, genre);
            stmt.setInt(3, year);
            stmt.setString(4, rating);
            stmt.setInt(5, runtime);

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ------------------------------------------------------------
    //  UPDATE an existing movie (Module 8 - UPDATE)
    // ------------------------------------------------------------
    public void updateMovie(int id, String title, String genre, int year, String rating, int runtime) {

        String sql = "UPDATE crystal_movies_data " +
                     "SET title=?, genre=?, release_year=?, mpaa_rating=?, runtime_minutes=? " +
                     "WHERE movie_id=?";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, title);
            stmt.setString(2, genre);
            stmt.setInt(3, year);
            stmt.setString(4, rating);
            stmt.setInt(5, runtime);
            stmt.setInt(6, id);

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // ------------------------------------------------------------
    //  Get list of movie IDs for dropdown selection
    // ------------------------------------------------------------
    public List<Integer> getAllMovieIds() {
        List<Integer> list = new ArrayList<>();

        String sql = "SELECT movie_id FROM crystal_movies_data ORDER BY movie_id";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(rs.getInt("movie_id"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
