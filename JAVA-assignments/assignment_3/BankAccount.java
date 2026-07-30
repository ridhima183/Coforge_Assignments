package assignments.day3;
/**
*Author : Bhavna
*Date : 11-Jul-2026
*Time :12:49:39 am
*email :ridhima.gadalay@gmail.com
*/
public class BankAccount {

	    // Data Members
	    private int accountNumber;
	    private String accountHolderName;
	    private double balance;

	    // Parameterized Constructor
	    public BankAccount(int accountNumber, String accountHolderName, double balance) {
	        this.accountNumber = accountNumber;
	        this.accountHolderName = accountHolderName;
	        this.balance = balance;
	    }

	    // Deposit Method
	    public void deposit(double amount) {
	        if (amount > 0) {
	            balance += amount;
	            System.out.println("₹" + amount + " deposited successfully.");
	        } else {
	            System.out.println("Invalid deposit amount.");
	        }
	    }

	    // Withdraw Method
	    public void withdraw(double amount) {
	        if (amount <= balance) {
	            balance -= amount;
	            System.out.println("₹" + amount + " withdrawn successfully.");
	        } else {
	            System.out.println("Insufficient Balance!");
	        }
	    }

	    // Display Account Details
	    public void display() {
	        System.out.println("\n------ Account Details ------");
	        System.out.println("Account Number : " + accountNumber);
	        System.out.println("Account Holder : " + accountHolderName);
	        System.out.println("Balance        : ₹" + balance);
	    }
	}

