package assignments.day6;
/**
*Author : Bhavna
*Date : 16-Jul-2026
*Time :10:26:47 pm
*email :ridhima.gadalay@gmail.com
*/
public class LambdaDemo {


	    // Method to check Odd
	    public static PerformOperation isOdd() {

	        // Lambda Syntax:
	        // (parameter) -> expression

	        return (n) -> n % 2 != 0;
	    }

	    // Method to check Prime
	    public static PerformOperation isPrime() {

	        return (n) -> {

	            if (n <= 1)
	                return false;

	            for (int i = 2; i <= Math.sqrt(n); i++) {

	                if (n % i == 0)
	                    return false;
	            }

	            return true;
	        };
	    }

	    // Method to check Palindrome
	    public static PerformOperation isPalindrome() {

	        return (n) -> {

	            int original = n;
	            int reverse = 0;

	            while (n > 0) {

	                int digit = n % 10;
	                reverse = reverse * 10 + digit;
	                n = n / 10;
	            }

	            return original == reverse;
	        };
	    }

	    public static void main(String[] args) {

	        PerformOperation odd = isOdd();
	        PerformOperation prime = isPrime();
	        PerformOperation palindrome = isPalindrome();

	        int number = 131;

	        System.out.println(number + " is Odd : " + odd.check(number));
	        System.out.println(number + " is Prime : " + prime.check(number));
	        System.out.println(number + " is Palindrome : " + palindrome.check(number));

	    }
	}

