package assignments.day1;

import java.util.Scanner;
/**
*Author : Bhavna
*Date : 08-Jul-2026
*Time :4:24:30 pm
*email :ridhima.gadalay@gmail.com
*java code to swap two numbers using a third variable 
*/
public class SwapTwoNumbers {
	
	public static void main(String[] args) {
		
		//Variable Declaration 
		int a;
		int b;
		int temp;
		
		//initialize Scanner 
		Scanner sc = new Scanner(System.in);
		
		//Take input
		System.out.println("Enter the first number : ");
		a = sc.nextInt();
		System.out.println("a: " +a);
		
		System.out.println("b : ");
		b = sc.nextInt();
		System.out.println("The Second number entered: " +b);
		
		//Swap numbers using third variable
		temp = b;
		b = a;
		a= temp;
		
		//print Results 
		System.out.println("The numbers after swapping become:");
		System.out.println("a: " +a);
		System.out.println("b: " +b);
		
		//close scanner
		sc.close();
			
	}

}
