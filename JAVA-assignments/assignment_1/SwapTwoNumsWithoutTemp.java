package assignments.day1;

import java.util.Scanner; 

/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :8:11:38 pm
*email :ridhima.gadalay@gmail.com
*Q1)Write a program that declares two integer variables, swaps their values without using a third variable, and prints the result.
*/

public class SwapTwoNumsWithoutTemp {
	
	public static void main(String[] args) {
		
		//Variable declaration 
		int a;
		int b;
		
		//Scanner initialization
		Scanner sc = new Scanner(System.in) ;
		
		//input taking 
		System.out.println("Enter the numbers:");
		a = sc.nextInt();
		b = sc.nextInt();
		
		//print numbers before swapping 
		System.out.println("Numbers before swapping:");
		System.out.println("a:" +a);
		System.out.println("b:" +b);
		
		a = a+b;
		b = a-b;
		a = a-b;
		
		//print numbers after swapping 
		System.out.println("Numbers after swapping:");
		System.out.println("a:" +a);
		System.out.println("b:" +b);
		
		//close scanner to avoid leaks 
		sc.close();
	}
	
}
