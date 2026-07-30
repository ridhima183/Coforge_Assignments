package assignments.day1;

import java.util.Scanner;

/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :8:21:34 pm
*email :ridhima.gadalay@gmail.com
* Create a program that simulates a simple calculator using command-line arguments to 
* perform and print the result of addition, subtraction, multiplication, and division..
*/
public class Calculator {
	
	public static void main(String[] args){
		
		//Variable Declaration
		int a;
		int b;
		int operator;
		
		//initialize Scanner 
		Scanner sc = new Scanner(System.in);
		
		//taking input 
		System.out.println("Enter the first number:");
		a = sc.nextInt();
		System.out.println("a:" +a);
		
		System.out.println("Enter the second number:");
		b = sc.nextInt();
		System.out.println("b:" +b);
		
		System.out.println("Enter the operator like (1,2,3,4) :");
		System.out.println(" 1. Addition \n 2. Substraction  \n 3. Multiplication \n 4. Division");
		operator = sc.nextInt();
		
		switch (operator) {
		
		case 1:
			
			System.out.println("Sum: " +(a+b));
			break; 
			
		case 2:
			
			System.out.println("Difference: " +(a-b));
			break;
			
		case 3:
			
			System.out.println("Product: " +(a*b));
			break;
			
		case 4:
			
			if (b==0) {
				System.out.println("Enter a valid b. b cannot be 0");
			}
			else {
				System.out.println("Difference: " +(a/b));
			}
			break;
			
		default : System.out.println("Enter the valid operator");
			
		sc.close();	
		
		}
					
	}

}
