package assignments.day5;
/**
 *Author : Bhavna
 *Date : 16-Jul-2026
 *Time :9:55:55 pm
 *email :ridhima.gadalay@gmail.com
 */

import java.util.HashMap;
import java.util.Map;


	public class EmployeeMapDemo {

	    public static void main(String[] args) {

	        // Syntax:
	        // Map<KeyType, ValueType> mapName = new HashMap<>();

	        Map<Integer, EmployeeQ3> employeesMap = new HashMap<>();


	        // Syntax:
	        // map.put(key, value);

	        employeesMap.put(101, new EmployeeQ3(101, "Ridhima", "Hyderabad"));
	        employeesMap.put(102, new EmployeeQ3(102, "Rahul", "Bangalore"));
	        employeesMap.put(103, new EmployeeQ3(103, "Sneha", "Chennai"));
	        employeesMap.put(104, new EmployeeQ3(104, "Aman", "Mumbai"));
	        employeesMap.put(105, new EmployeeQ3(105, "Priya", "Delhi"));


	        // Display complete HashMap

	        System.out.println("All Employees:");

	        // Syntax:
	        // for(Map.Entry<KeyType, ValueType> variable : map.entrySet())

	        for (Map.Entry<Integer, EmployeeQ3> entry : employeesMap.entrySet()) {

	            System.out.println("Key : " + entry.getKey());
	            System.out.println("Value : " + entry.getValue());
	            System.out.println();
	        }


	        // Display employee based on Employee Id (Key)

	        int empId = 103;

	        // Syntax:
	        // map.get(key);

	        EmployeeQ3 emp = employeesMap.get(empId);

	        if (emp != null) {
	            System.out.println("Employee Details for ID " + empId);
	            System.out.println(emp);
	        } else {
	            System.out.println("Employee not found.");
	        }

	    }
	}