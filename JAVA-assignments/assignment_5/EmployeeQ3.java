package assignments.day5;
/**
*Author : Bhavna
*Date : 16-Jul-2026
*Time :9:54:06 pm
*email :ridhima.gadalay@gmail.com
*3) Java program to Create and work with a HashMap of userdefined Object 'Employee'as value consisting id,name & city fields as follows.

 *Map<Integer, Employee> employeesMap = new HashMap<>();*

 - Add 5 employees and display it.
 - Display Employee details based on Employee Id(key field).


*/
public class EmployeeQ3 {
	
    private int id;
    private String name;
    private String city;

    // Constructor
    public EmployeeQ3(int id, String name, String city) {
        this.id = id;
        this.name = name;
        this.city = city;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCity() {
        return city;
    }

    // Display object nicely
    @Override
    public String toString() {
        return "Employee [id=" + id + ", name=" + name + ", city=" + city + "]";
    }
}

