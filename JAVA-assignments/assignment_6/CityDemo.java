package assignments.day6;

import java.util.*;

/**
*Author : Bhavna
*Date : 16-Jul-2026
*Time :10:32:54 pm
*email :ridhima.gadalay@gmail.com
*/
public class CityDemo {
	


	    public static void main(String[] args) {

	        // Create List of Cities
	        List<String> cities = Arrays.asList(
	                "Hyderabad",
	                "Bangalore",
	                "Chennai",
	                "Mumbai",
	                "Delhi",
	                "Pune"
	        );

	        // ======================================================
	        // 1. Display cities using Lambda Expression
	        // Syntax:
	        // collection.forEach(variable -> System.out.println(variable));
	        // ======================================================

	        System.out.println("Cities using Lambda Expression:");

	        cities.forEach(city -> System.out.println(city));


	        // ======================================================
	        // 2. Display cities using Method Reference
	        // Syntax:
	        // collection.forEach(System.out::println);
	        // ======================================================

	        System.out.println("\nCities using Method Reference:");

	        cities.forEach(System.out::println);


	        // ======================================================
	        // 3. Sort cities alphabetically
	        // Syntax:
	        // stream().sorted().forEach();
	        // ======================================================

	        System.out.println("\nCities Sorted Alphabetically:");

	        cities.stream()
	              .sorted()
	              .forEach(System.out::println);


	        // ======================================================
	        // 4. Display cities in Uppercase
	        // Syntax:
	        // stream().map(String::toUpperCase).forEach();
	        // ======================================================

	        System.out.println("\nCities in Uppercase:");

	        cities.stream()
	              .map(String::toUpperCase)
	              .forEach(System.out::println);

	    }
	}

