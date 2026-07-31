package assignments.day5;

import java.util.ArrayList;
import java.util.Collections;

/**
*Author : Bhavna
*Date : 16-Jul-2026
*Time :9:19:04 pm
*email :ridhima.gadalay@gmail.com
*1) Write a Java program to create a new array list, add some colors (string) and print out the collection.
  -  iterate through all elements in a array list.
	- insert an element into the array list at the first position.
	- retrieve an element (at a specified index) from a given array list.
	- update specific array element by given element.
	-  remove the third element from a array list. 
	- search an element in a array list.
 	-  sort a given array list.
  - copy one array list into another.
	- shuffle elements in a array list. 
	- reverse elements in a array list.
 	- extract a portion of a array list.
	- replace the second element of a ArrayList with the specified element
*/
public class ArrayOperationsQ1 {
	
	public static void main(String[] args) {
		
		// 1. Create a new ArrayList and add colors
        ArrayList<String> colors = new ArrayList<>();  //syntax to create = inference<type> reference name = new ImplementationClass<>();
        
       
        //InterfaceName	List<String>	The type of the reference variable. It tells Java what operations are allowed.
        /*referenceName	colors	The variable that stores the address (reference) of the object.
        		ImplementationClass<>	ArrayList<>()	The actual class whose object is created.*/

        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Yellow");
        colors.add("Black");

        System.out.println("Original ArrayList: " + colors);
        
        // 2. Iterate through all elements
        System.out.println("\nIterating through the ArrayList:");    //for (DataType variable : collection) {code }
        for (String color : colors) {
            System.out.println(color);
        }

        // 3. Insert an element at the first position //referencename.add(index, element)
        colors.add(0, "White");
        System.out.println("\nAfter inserting White at first position:");
        System.out.println(colors);

        // 4. Retrieve an element at a specified index  //referencename.get(index)
        System.out.println("\nElement at index 2:");
        System.out.println(colors.get(2));

        // 5. Update a specific element  //referencename.set(index, new updated element)
        colors.set(3, "Pink");
        System.out.println("\nAfter updating index 3:");
        System.out.println(colors);

        // 6. Remove the third element
        colors.remove(2); // Index 2 = third element
        System.out.println("\nAfter removing third element:");
        System.out.println(colors);

        // 7. Search for an element
        if (colors.contains("Black")) {
            System.out.println("\nBlack is present.");
        } else {
            System.out.println("\nBlack is not present.");
        }

        // 8. Sort the ArrayList
        Collections.sort(colors);
        System.out.println("\nSorted ArrayList:");
        System.out.println(colors);

        // 9. Copy one ArrayList into another
        ArrayList<String> copyList = new ArrayList<>(colors);

        // Alternative:
        // ArrayList<String> copyList = new ArrayList<>();
        // copyList.addAll(colors);

        System.out.println("\nCopied ArrayList:");
        System.out.println(copyList);

        // 10. Shuffle the ArrayList
        Collections.shuffle(colors);
        System.out.println("\nShuffled ArrayList:");
        System.out.println(colors);

        // 11. Reverse the ArrayList
        Collections.reverse(colors);
        System.out.println("\nReversed ArrayList:");
        System.out.println(colors);

        // 12. Extract a portion of the ArrayList
        System.out.println("\nSubList (index 1 to 3):");
        System.out.println(colors.subList(1, 4));

        // 13. Replace the second element
        colors.set(1, "Orange");
        System.out.println("\nAfter replacing second element:");
        System.out.println(colors);
    }
}
