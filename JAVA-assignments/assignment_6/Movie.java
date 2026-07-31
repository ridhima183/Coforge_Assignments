package assignments.day6;
/**
*Author : Bhavna
*Date : 16-Jul-2026
*Time :10:31:18 pm
*email :ridhima.gadalay@gmail.com
*/
public class Movie {


	    private String movieName;
	    private String genre;
	    private double rating;

	    // Constructor
	    public Movie(String movieName, String genre, double rating) {
	        this.movieName = movieName;
	        this.genre = genre;
	        this.rating = rating;
	    }

	    // Getters
	    public String getMovieName() {
	        return movieName;
	    }

	    public String getGenre() {
	        return genre;
	    }

	    public double getRating() {
	        return rating;
	    }

	    @Override
	    public String toString() {
	        return "Movie Name : " + movieName +
	               ", Genre : " + genre +
	               ", Rating : " + rating;
	    }
	}
