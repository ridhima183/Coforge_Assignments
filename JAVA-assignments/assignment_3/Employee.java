package assignments.day3;

/**
 *Author : Bhavna
 *Date : 11-Jul-2026
 *Time :12:17:05 am
 *email :ridhima.gadalay@gmail.com
 * Write a program by creating an Employee class having the following methods and print
the final salary.
	1 - getInfo(); which takes the salary, number of hours of work per day of employee as
		parameter
	2 - addSal(); which adds $10 to salary of the employee if it is less than $500.
	3 - addWork(); which adds $5 to salary of employee if the number of hours of work per
		day is more than 6 hours.
 */
public class Employee {

	//initializing parameters 

	double salary;
	int hours;

	//methods to get informations 

	void getInfo(double salary, int hours) {
		this.salary = salary;
		this.hours = hours ;
	}

	//method addsal() 
	void addSal() {
		if (salary < 500) {
			salary+=10;
		}
	}

	//methodaddWork()
	void addWork() {
		if (hours > 6) {
			salary +=5;
		}
	}
	
	void display() {
        System.out.println("Final Salary = $" + salary);
    }
}