package assignments.day2;

import java.util.Scanner;
/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :9:55:44 pm
*email :ridhima.gadalay@gmail.com
*Question: Write a Java program that asks the user to enter an integer. 
*The program should then reverse the digits of the number and print the reversed number.
Expected Output: If the user inputs "1234", the program should output: "The reversed number is 4321."
*/
public class ReverseNumber {

	    public static void main(String[] args) {

	        // Variable Declaration
	        int number;
	        int reverse = 0;
	        int remainder;

	        // Scanner Initialization
	        Scanner sc = new Scanner(System.in);

	        // Take Input
	        System.out.print("Enter Number: ");
	        number = sc.nextInt();

	        // Reverse the Number
	        while (number != 0) {

	            remainder = number % 10;

	            reverse = reverse * 10 + remainder;

	            number = number / 10;
	        }

	        // Print Result
	        System.out.println("Reversed Number = " + reverse);

	        sc.close();
	    }
	}

