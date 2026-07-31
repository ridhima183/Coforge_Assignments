package assignments.day6;
/**
*Author : Bhavna
*Date : 16-Jul-2026
*Time :10:36:35 pm
*email :ridhima.gadalay@gmail.com
*/
public class StringOperationDemo {

	    public static void main(String[] args) {

	        String text = "Ridhima";

	        // =====================================================
	        // 1. Convert to Uppercase
	        // Syntax:
	        // Interface variable = (parameter) -> expression;
	        // =====================================================

	        StringOperation upperCase = str -> str.toUpperCase();

	        System.out.println("Uppercase : " + upperCase.operate(text));


	        // =====================================================
	        // 2. Convert to Lowercase
	        // =====================================================

	        StringOperation lowerCase = str -> str.toLowerCase();

	        System.out.println("Lowercase : " + lowerCase.operate(text));


	        // =====================================================
	        // 3. Reverse a String
	        // =====================================================

	        StringOperation reverse = str ->
	                new StringBuilder(str).reverse().toString();

	        System.out.println("Reversed : " + reverse.operate(text));


	        // =====================================================
	        // 4. Find String Length
	        // Since the interface returns String,
	        // convert the length to String.
	        // =====================================================

	        StringOperation length = str -> String.valueOf(str.length());

	        System.out.println("Length : " + length.operate(text));

	    }
	}

