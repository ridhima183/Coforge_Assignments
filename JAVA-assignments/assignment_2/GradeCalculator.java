package assignments.day2;

import java.util.Scanner;
/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :9:40:32 pm
*email :ridhima.gadalay@gmail.com
*Write a Java program that prompts the user to enter their score (an integer between 0 and 100). 
*The program should then print the corresponding grade based on the following criteria: 
*A: 90-100 
*B: 80-89 
*C: 70-79 
*D: 60-69 
*F: 0-59
* Expected Output: If the user inputs "85", the program should output: "Your grade is B."
*/
public class GradeCalculator {
	
	    public static void main(String[] args) {

	        // Variable Declaration
	        int score;

	        // Scanner Initialization
	        Scanner sc = new Scanner(System.in);

	        // Take Input
	        System.out.print("Enter Score: ");
	        score = sc.nextInt();

	        // Check Grade
	        if (score < 0 || score > 100) {
	            System.out.println("Invalid Score");
	        }
	        else if (score >= 90) {
	            System.out.println("Your Grade is A");
	        }
	        else if (score >= 80) {
	            System.out.println("Your Grade is B");
	        }
	        else if (score >= 70) {
	            System.out.println("Your Grade is C");
	        }
	        else if (score >= 60) {
	            System.out.println("Your Grade is D");
	        }
	        else {
	            System.out.println("Your Grade is F");
	        }

	        sc.close();
	    }
	}

