package assignments.day2;

import java.util.Scanner;

/**
*Author : Bhavna
*Date : 10-Jul-2026
*Time :9:50:41 pm
*email :ridhima.gadalay@gmail.com
*Password Strength

Question: Write a Java program that prompts the user to enter a password. 
The program should then determine the strength of the password based on the following criteria:
Strong: At least 8 characters, contains both uppercase and lowercase letters, and includes at least one digit and one special character.
Medium: At least 6 characters, contains both uppercase and lowercase letters, and includes at least one digit.
Weak: Does not meet the above criteria.
Expected Output: If the user inputs "P@ssw0rd", the program should output: "Password strength: Strong." If the user inputs "Pass123", the program should output: "Password strength: 
Medium." If the user inputs "pass", the program should output: "Password strength: Weak."
*/
public class PasswordStrength {

	    public static void main(String[] args) {

	        // Variable Declaration
	        String password;

	        boolean hasUpper = false;
	        boolean hasLower = false;
	        boolean hasDigit = false;
	        boolean hasSpecial = false;

	        // Scanner Initialization
	        Scanner sc = new Scanner(System.in);

	        // Take Input
	        System.out.print("Enter Password: ");
	        password = sc.nextLine();

	        // Check each character
	        for (int i = 0; i < password.length(); i++) {

	            char ch = password.charAt(i);

	            if (Character.isUpperCase(ch)) {
	                hasUpper = true;
	            }
	            else if (Character.isLowerCase(ch)) {
	                hasLower = true;
	            }
	            else if (Character.isDigit(ch)) {
	                hasDigit = true;
	            }
	            else {
	                hasSpecial = true;
	            }
	        }

	        // Check Strength
	        if (password.length() >= 8 &&
	            hasUpper &&
	            hasLower &&
	            hasDigit &&
	            hasSpecial) {

	            System.out.println("Password Strength: Strong");
	        }
	        else if (password.length() >= 6 &&
	                 hasUpper &&
	                 hasLower &&
	                 hasDigit) {

	            System.out.println("Password Strength: Medium");
	        }
	        else {

	            System.out.println("Password Strength: Weak");
	        }

	        sc.close();
	    }
	}

