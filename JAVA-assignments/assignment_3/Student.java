package assignments.day3;
/**
*Author : Bhavna
*Date : 11-Jul-2026
*Time :12:30:05 am
*email :ridhima.gadalay@gmail.com
*/
public class Student {
	
	//parameters definition 
	
	String name;
	int year;
	String address;
	
	
	public Student(String name, int year,  String address) {
		super();
		this.name = name;
		this.year = year;
		this.address = address;
	}


	public String getName() {
		return name;
	}


	public int getYear() {
		return year;
	}

	public String getAddress() {
		return address;
	}
	
	 void display() {
	        System.out.printf("%-10s %-18d %-20s%n", name, year, address);
	    }
}

