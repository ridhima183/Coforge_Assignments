package assignments.day3;

import java.util.Scanner;
/**
*Author : Bhavna
*Date : 11-Jul-2026
*Time :12:50:22 am
*email :ridhima.gadalay@gmail.com
*/
public class BankTest {

	    public static void main(String[] args) {

	        Scanner sc = new Scanner(System.in);

	        System.out.print("Enter Account Number: ");
	        int accountNumber = sc.nextInt();
	        sc.nextLine();

	        System.out.print("Enter Account Holder Name: ");
	        String name = sc.nextLine();

	        System.out.print("Enter Initial Balance: ");
	        double balance = sc.nextDouble();

	        BankAccount account = new BankAccount(accountNumber, name, balance);

	        System.out.print("\nEnter Deposit Amount: ");
	        double depositAmount = sc.nextDouble();
	        account.deposit(depositAmount);

	        System.out.print("\nEnter Withdraw Amount: ");
	        double withdrawAmount = sc.nextDouble();
	        account.withdraw(withdrawAmount);

	        account.display();

	        sc.close();
	    }
	}
