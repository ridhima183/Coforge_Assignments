package assignments.day2;

import java.util.Scanner;
/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :9:45:56 pm
*email :ridhima.gadalay@gmail.com
*Triangle Type
Question: Write a Java program that asks the user to enter the lengths of three sides of a triangle. 
The program should then determine whether the triangle is equilateral, isosceles, or scalene. 
An equilateral triangle has all three sides equal, 
an isosceles triangle has two sides equal, and 
a scalene triangle has all sides different.
Expected Output: If the user inputs "5", "5", and "5", the program should output: 
"The triangle is equilateral." If the user inputs "5", "5", and "7", the program should output: "The triangle is isosceles." 
If the user inputs "3", "4", and "5", the program should output: "The triangle is scalene."

*/
public class TriangleType {
	
	    public static void main(String[] args) {

	        // Variable Declaration
	        int side1, side2, side3;

	        // Scanner Initialization
	        Scanner sc = new Scanner(System.in);

	        // Take Input
	        System.out.print("Enter First Side: ");
	        side1 = sc.nextInt();

	        System.out.print("Enter Second Side: ");
	        side2 = sc.nextInt();

	        System.out.print("Enter Third Side: ");
	        side3 = sc.nextInt();

	        // Check Valid Triangle
	        if (side1 + side2 <= side3 ||
	            side1 + side3 <= side2 ||
	            side2 + side3 <= side1) {

	            System.out.println("Invalid Triangle");
	        }

	        // Check Equilateral
	        else if (side1 == side2 && side2 == side3) {

	            System.out.println("Triangle is Equilateral");
	        }

	        // Check Isosceles
	        else if (side1 == side2 ||
	                 side1 == side3 ||
	                 side2 == side3) {

	            System.out.println("Triangle is Isosceles");
	        }

	        // Otherwise Scalene
	        else {

	            System.out.println("Triangle is Scalene");
	        }

	        sc.close();
	    }
	}

