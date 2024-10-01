package com.hexaware.main;

import com.hexaware.account.BankAccount;
import com.hexaware.exceptions.InvalidAmountException;
import com.hexaware.exceptions.InsufficientFundsException;
import com.hexaware.exceptions.InvalidChoiceException;

import java.util.InputMismatchException;
import java.util.Scanner;

public class BankAccountManagementSystem {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        BankAccount account = null;

        while (true) {
            System.out.println("\n----- Bank Account Management System -----");
            System.out.println("1. Create Account");
            System.out.println("2. Deposit");
            System.out.println("3. Withdraw");
            System.out.println("4. Check Balance");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");
            
            try {
                int choice = scanner.nextInt();
                
                switch (choice) {
                    case 1:
                        System.out.print("Enter account holder name: ");
                        String name = scanner.next();
                        System.out.print("Enter account number: ");
                        int accountNumber = scanner.nextInt();
                        account = new BankAccount(name, accountNumber);
                        System.out.println("Account created successfully.");
                        break;
                    
                    case 2:
                        if (account == null) throw new NullPointerException("Create an account first.");
                        System.out.print("Enter amount to deposit: ");
                        double depositAmount = scanner.nextDouble();
                        account.deposit(depositAmount);
                        break;
                    
                    case 3:
                        if (account == null) throw new NullPointerException("Create an account first.");
                        System.out.print("Enter amount to withdraw: ");
                        double withdrawAmount = scanner.nextDouble();
                        account.withdraw(withdrawAmount);
                        break;

                    case 4:
                        if (account == null) throw new NullPointerException("Create an account first.");
                        account.checkBalance();
                        break;

                    case 5:
                        System.out.println("Thank you for using the system!");
                        System.exit(0);
                        break;
                    
                    default:
                        throw new InvalidChoiceException("Invalid choice! Please select a valid option.");
                }
            } catch (InvalidAmountException | InsufficientFundsException | InvalidChoiceException e) {
                System.out.println("Error: " + e.getMessage());
            } catch (NullPointerException e) {
                System.out.println("Error: " + e.getMessage());
            } catch (InputMismatchException e) {
                System.out.println("Error: Invalid input type. Please enter a valid number.");
                scanner.next();  // clear the invalid input
            }
        }
    }
}
