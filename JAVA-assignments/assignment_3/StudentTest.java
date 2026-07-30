package assignments.day3;

import java.util.Scanner;

/**
 * Author : Bhavna
 * Date : 11-Jul-2026
 * Time :12:40:07 am
 * email :ridhima.gadalay@gmail.com
 */

public class StudentTest {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        // Student 1
        System.out.println("Enter Details of Student 1");
        System.out.print("Name: ");
        String name1 = scanner.nextLine();

        System.out.print("Year of Joining: ");
        int year1 = scanner.nextInt();
        scanner.nextLine();

        System.out.print("Address: ");
        String address1 = scanner.nextLine();

        Student s1 = new Student(name1, year1, address1);

        // Student 2
        System.out.println("\nEnter Details of Student 2");
        System.out.print("Name: ");
        String name2 = scanner.nextLine();

        System.out.print("Year of Joining: ");
        int year2 = scanner.nextInt();
        scanner.nextLine();

        System.out.print("Address: ");
        String address2 = scanner.nextLine();

        Student s2 = new Student(name2, year2, address2);

        // Student 3
        System.out.println("\nEnter Details of Student 3");
        System.out.print("Name: ");
        String name3 = scanner.nextLine();

        System.out.print("Year of Joining: ");
        int year3 = scanner.nextInt();
        scanner.nextLine();

        System.out.print("Address: ");
        String address3 = scanner.nextLine();

        Student s3 = new Student(name3, year3, address3);

        // Display Output
        System.out.println("\n-----------------------------------------------");
        System.out.printf("%-10s %-18s %-20s%n", "Name", "Year of Joining", "Address");
        System.out.println("-----------------------------------------------");

        s1.display();
        s2.display();
        s3.display();

        scanner.close();
    }
}