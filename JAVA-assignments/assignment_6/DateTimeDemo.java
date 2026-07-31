package assignments.day6;

import java.time.LocalDate;
import java.time.DayOfWeek;
import java.time.Month;
import java.time.temporal.ChronoUnit;
/**
*Author : Bhavna
*Date : 16-Jul-2026
*Time :10:34:28 pm
*email :ridhima.gadalay@gmail.com
*/
public class DateTimeDemo {

	    public static void main(String[] args) {

	        // =====================================================
	        // 1. Display Today's Date
	        // Syntax:
	        // LocalDate variable = LocalDate.now();
	        // =====================================================

	        LocalDate today = LocalDate.now();

	        System.out.println("Today's Date : " + today);


	        // =====================================================
	        // 2. Display Current Month and Day of the Week
	        // Syntax:
	        // date.getMonth();
	        // date.getDayOfWeek();
	        // =====================================================

	        Month month = today.getMonth();
	        DayOfWeek day = today.getDayOfWeek();

	        System.out.println("Current Month : " + month);
	        System.out.println("Day of the Week : " + day);


	        // =====================================================
	        // 3. Calculate Number of Days Between Two Dates
	        // Syntax:
	        // ChronoUnit.DAYS.between(date1, date2);
	        // =====================================================

	        LocalDate date1 = LocalDate.of(2026, 7, 1);
	        LocalDate date2 = LocalDate.of(2026, 7, 16);

	        long days = ChronoUnit.DAYS.between(date1, date2);

	        System.out.println("Days Between Two Dates : " + days);


	        // =====================================================
	        // 4. Check Whether Current Year is Leap Year
	        // Syntax:
	        // date.isLeapYear();
	        // =====================================================

	        boolean leap = today.isLeapYear();

	        System.out.println("Is Current Year Leap Year? : " + leap);

	    }
	}

