/*
 * Author: Crystal Long
 * Date: 11/15/2025
 * Assignment: Modules 5 & 6 Assignment - Project Part 1
 * Purpose: JavaBean that represents a single movie record from the database.
 */

public class Movie {

    // Primary key for the movie record
    private int movieId;

    // Basic movie details
    private String title;
    private String genre;
    private int releaseYear;
    private String mpaaRating;
    private int runtimeMinutes;

    // Default constructor for JavaBean use
    public Movie() {
    }

    // Convenience constructor to build a complete movie object
    public Movie(int movieId, String title, String genre,
                 int releaseYear, String mpaaRating, int runtimeMinutes) {
        this.movieId = movieId;
        this.title = title;
        this.genre = genre;
        this.releaseYear = releaseYear;
        this.mpaaRating = mpaaRating;
        this.runtimeMinutes = runtimeMinutes;
    }

    // Getters and setters for each field (required for JavaBeans)

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public String getMpaaRating() {
        return mpaaRating;
    }

    public void setMpaaRating(String mpaaRating) {
        this.mpaaRating = mpaaRating;
    }

    public int getRuntimeMinutes() {
        return runtimeMinutes;
    }

    public void setRuntimeMinutes(int runtimeMinutes) {
        this.runtimeMinutes = runtimeMinutes;
    }
}
