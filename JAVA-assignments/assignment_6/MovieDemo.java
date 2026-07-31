package assignments.day6;

import java.util.*;
import java.util.stream.Collectors;
/**
*Author : Bhavna
*Date : 16-Jul-2026
*Time :10:31:44 pm
*email :ridhima.gadalay@gmail.com
*/
public class MovieDemo {

	    public static void main(String[] args) {

	        List<Movie> movies = Arrays.asList(
	                new Movie("Inception", "Sci-Fi", 4.8),
	                new Movie("Avengers", "Action", 4.5),
	                new Movie("Titanic", "Romance", 3.9),
	                new Movie("Interstellar", "Sci-Fi", 4.9),
	                new Movie("KGF", "Action", 4.2),
	                new Movie("The Notebook", "Romance", 4.3)
	        );

	        // =====================================================
	        // 1. Display movies with ratings above 4.0
	        // Syntax:
	        // stream().filter(condition).forEach()
	        // =====================================================

	        System.out.println("Movies with Rating Above 4.0:");

	        movies.stream()
	                .filter(movie -> movie.getRating() > 4.0)
	                .forEach(System.out::println);


	        // =====================================================
	        // 2. Sort movies by rating
	        // Syntax:
	        // stream().sorted(Comparator.comparing())
	        // =====================================================

	        System.out.println("\nMovies Sorted by Rating:");

	        movies.stream()
	                .sorted(Comparator.comparing(Movie::getRating))
	                .forEach(System.out::println);


	        // =====================================================
	        // 3. Group movies by Genre
	        // Syntax:
	        // stream().collect(Collectors.groupingBy())
	        // =====================================================

	        System.out.println("\nMovies Grouped by Genre:");

	        Map<String, List<Movie>> groupedMovies =
	                movies.stream()
	                        .collect(Collectors.groupingBy(Movie::getGenre));

	        groupedMovies.forEach((genre, movieList) -> {
	            System.out.println(genre);
	            movieList.forEach(System.out::println);
	            System.out.println();
	        });


	        // =====================================================
	        // 4. Find Highest Rated Movie
	        // Syntax:
	        // stream().max(Comparator.comparing())
	        // =====================================================

	        Movie highestRated = movies.stream()
	                .max(Comparator.comparing(Movie::getRating))
	                .get();

	        System.out.println("Highest Rated Movie:");
	        System.out.println(highestRated);

	    }
	}

