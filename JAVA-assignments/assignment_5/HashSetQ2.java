package assignments.day5;

import java.util.HashSet;

/**
*Author : Bhavna
*Date : 16-Jul-2026
*Time :9:30:56 pm
*email :ridhima.gadalay@gmail.com
*2)Write a Java code to Perform Set Operations using 2 HashSet
  
-Union -- using addAll()
In this, we could simply add one Set with other. Since the Set will itself not allow any duplicate entries, we need not take care of the common values.
Expected Output:
Union : [0, 1, 2, 3, 4, 5, 7, 8, 9]
 
 -Intersection - using retainAll()
We just need to retain the common values from both Sets.
Expected Output:
Intersection : [0, 1, 3, 4]
 
 -Difference - using removeAll()
We just need to remove all the values of one Set from the other.

Expected Output:
Difference : [2, 8, 9]
*/
public class HashSetQ2 {
	
	  public static void main(String[] args) {

	        // Syntax:
	        // HashSet<DataType> setName = new HashSet<>();

	        HashSet<Integer> set1 = new HashSet<>();
	        HashSet<Integer> set2 = new HashSet<>();

	        // Syntax:
	        // setName.add(element);

	        set1.add(0);
	        set1.add(1);
	        set1.add(2);
	        set1.add(3);
	        set1.add(4);
	        set1.add(8);
	        set1.add(9);

	        set2.add(0);
	        set2.add(1);
	        set2.add(3);
	        set2.add(4);
	        set2.add(5);
	        set2.add(7);

	        System.out.println("Set 1 : " + set1);
	        System.out.println("Set 2 : " + set2);

	        // ================= UNION =================  logic- create a copy of the first set named union then using addall() add all elements of set 2 to union 

	        // Syntax:
	        // new HashSet<>(existingSet) -> Creates a copy of the existing set. generally new HashSet<>() --> creates an empty []
	        HashSet<Integer> union = new HashSet<>(set1);

	        // Syntax:
	        // setName.addAll(otherSet);
	        // Adds all elements of otherSet into setName
	        union.addAll(set2);

	        System.out.println("\nUnion : " + union);

	        // ============== INTERSECTION ============== logic - create a copy of the first set named intersection- then using retainAll() retain the elements in intersection that 
	        // are there in set 2, the rest must be removed 

	        HashSet<Integer> intersection = new HashSet<>(set1);

	        // Syntax:
	        // setName.retainAll(otherSet);
	        // Keeps only the common elements
	        intersection.retainAll(set2);

	        System.out.println("Intersection : " + intersection);

	        // ============== DIFFERENCE ==============

	        HashSet<Integer> difference = new HashSet<>(set1); //logic - create a copy of set1 . and remove all the elements of set2 

	        // Syntax:
	        // setName.removeAll(otherSet);
	        // Removes all elements present in otherSet
	        difference.removeAll(set2);

	        System.out.println("Difference : " + difference);
	    }
	}
