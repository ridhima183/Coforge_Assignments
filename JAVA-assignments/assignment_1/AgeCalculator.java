package assignments.day1;

import java.util.Scanner;
/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :8:42:29 pm
*email :ridhima.gadalay@gmail.com
*Q3)Write a Java program that asks the user to enter their birth year, then calculates and prints their current age.
* Assume the current year is 2024.
*Expected Output: If the user inputs "1990", the program should output: "You are 34 years old."
*/
public class AgeCalculator {
	
	public static void main(String[] args) {
		
		//Variable Declaration
		int year;
		
		//Scanner initialization
		Scanner sc = new Scanner(System.in);
		
		//Take input
		System.out.println("Enter your year of birth:");
		year = sc.nextInt();
		System.out.println("Your year of birth entered:" +year);
		
		//Logic to calculate the age 
		int result = 2024 - year; 
		
		//print results 
		System.out.println("You are " +result +" years old.");
		
		//close scanner
		sc.close();
	}

}
