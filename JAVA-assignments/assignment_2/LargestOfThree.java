package assignments.day2;

import java.util.Scanner;

/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :9:43:27 pm
*email :ridhima.gadalay@gmail.com
*Question: Write a Java program that asks the user to enter three integers. 
*The program should then determine and print the largest of the three numbers.
* Expected Output: If the user inputs "12", "7", and "20", the program should output: "The largest number is 20."
*/
public class LargestOfThree {


	    public static void main(String[] args) {

	        // Variable Declaration
	        int a, b, c;

	        // Scanner Initialization
	        Scanner sc = new Scanner(System.in);

	        // Take Input
	        System.out.print("Enter First Number: ");
	        a = sc.nextInt();

	        System.out.print("Enter Second Number: ");
	        b = sc.nextInt();

	        System.out.print("Enter Third Number: ");
	        c = sc.nextInt();

	        // Find Largest Number
	        if (a >= b && a >= c) {
	            System.out.println("Largest Number is " + a);
	        }
	        else if (b >= a && b >= c) {
	            System.out.println("Largest Number is " + b);
	        }
	        else {
	            System.out.println("Largest Number is " + c);
	        }

	        sc.close();
	    }
	}
