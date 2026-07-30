package assignments.day1;

import java.util.Scanner;
/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :8:53:32 pm
*email :ridhima.gadalay@gmail.com
*Write a Java program that asks the user to enter their weight in kilograms and height in meters, then calculates and prints their Body Mass Index (BMI). Use the formula BMI = weight / (height * height).
Expected Output: If the user inputs "70" for weight and "1.75" for height, the program should output: "Your BMI is 22.86."
*/
public class BMICalculator {
	
	public static void main(String[] args) {
		
		//variable declartion
		float weight;
		float height;
		float BMI;
		
		//scanner Initialization
		Scanner sc = new Scanner(System.in);
		
		//take inputs 
		System.out.println("Enter your weight(in kgs): ");
		weight = sc.nextFloat();
		System.out.println("Weight Entered: " +weight);
		
		System.out.println("Enter your height(in meters): ");
		height = sc.nextFloat();
		System.out.println("Height Entered: " +height);
		
		//BMI logic 
		BMI = (weight / (height * height));
		
		//output
		System.out.printf("Your BMI is %.2f\n" ,BMI);
		
		//Close scanner
		sc.close();
	}

}
