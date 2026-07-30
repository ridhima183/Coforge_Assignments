package assignments.day3;

import java.util.Scanner;

/**
*Author : Bhavna
*Date : 11-Jul-2026
*Time :12:27:42 am
*email :ridhima.gadalay@gmail.com
*/
public class EmployeeDemo {
	
	// main class creation 
		public static void main(String[] args) {

			Scanner sc = new Scanner(System.in);

			Employee emp = new Employee();

			System.out.print("Enter Salary: ");
			double salary = sc.nextDouble();

			System.out.print("Enter Working Hours per Day: ");
			int hours = sc.nextInt();

			emp.getInfo(salary, hours);
			emp.addSal();
			emp.addWork();
			emp.display();

			sc.close();
		}
}



