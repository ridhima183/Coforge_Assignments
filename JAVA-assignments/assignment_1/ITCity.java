package assignments.day1;

import java.util.Scanner;
/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :9:32:14 pm
*email :ridhima.gadalay@gmail.com
*/
public class ITCity {

	public static void main(String[] args) {
		
		//variable Declaration 
		String city ;
		
		//Scanner Declaration
		Scanner sc = new Scanner(System.in);
		
		//Take input 
		System.out.println("Enter the city:");
		city = sc.next();
		
		switch (city.toLowerCase()) {
		case "delhi":
	    case "mumbai":
	    case "kolkatta":
	    case "bangalore":
	    case "chennai":
	    case "hyderabad":
	        System.out.println("IT City");
	        break;
	    default:
	        System.out.println("Not an IT City");
		}
		
		sc.close();
	} 

}
