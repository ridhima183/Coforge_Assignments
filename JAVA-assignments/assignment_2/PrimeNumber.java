package assignments.day2;

import java.util.Scanner;

/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :9:57:23 pm
*email :ridhima.gadalay@gmail.com
*Prime Number Check
*/
public class PrimeNumber {
		
		public static void main(String[] args) {
			
			//variable declaration
			int number;
			boolean isPrime = false;
			
			//Scanner Initialization
			Scanner sc = new Scanner(System.in);
			
			//Take Input
			System.out.println("Enter Number : ");
			number = sc.nextInt();
			
			if (number<=1) {
				isPrime = true;
			}
			
			else {
				
				for (int i=2; i<=Math.sqrt(number); i++) {
					
					if (number % i == 0) {
						isPrime = false;
						break;
					}
				}
			}
				
			if (isPrime){
				System.out.println(number +" is  a Prime Number");
			}
			else {
				System.out.println(number +" is not 3a Prime Number");	
			}
			
			sc.close();
				
			}
	    }
