package assignments.day2;

import java.util.Scanner;
/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :9:59:25 pm
*email :ridhima.gadalay@gmail.com
*/
public class SumOfDigits {

	    public static void main(String[] args) {

	        // Variable Declaration
	        int number;
	        int sum = 0;
	        int remainder;

	        // Scanner Initialization
	        Scanner sc = new Scanner(System.in);

	        // Take Input
	        System.out.print("Enter Number: ");
	        number = sc.nextInt();

	        // Calculate Sum of Digits
	        while (number != 0) {

	            remainder = number % 10;

	            sum = sum + remainder;

	            number = number / 10;
	        }

	        // Print Result
	        System.out.println("Sum of Digits = " + sum);

	        sc.close();
	    }
	}
