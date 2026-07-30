package assignments.day2;
/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :10:01:15 pm
*email :ridhima.gadalay@gmail.com
*/
public class PatternDemo {

	    public static void main(String[] args) {

	        // Upper Half
	        for (int i = 1; i <= 5; i++) {

	            for (int j = 1; j <= (2 * i - 1); j++) {
	                System.out.print("* ");
	            }

	            System.out.println();
	        }

	        // Lower Half
	        for (int i = 4; i >= 1; i--) {

	            for (int j = 1; j <= (2 * i - 1); j++) {
	                System.out.print("* ");
	            }

	            System.out.println();
	        }
	    }
	}

