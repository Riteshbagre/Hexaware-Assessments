package com.hexaware.account;

import com.hexaware.exceptions.InvalidAmountException;
import com.hexaware.exceptions.InsufficientFundsException;

public class BankAccount {
    private String accountHolderName;
    private int accountNumber;
    private double balance;

    public BankAccount(String accountHolderName, int accountNumber) {
        this.accountHolderName = accountHolderName;
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    public void deposit(double amount) throws InvalidAmountException {
        if (amount <= 0) {
            throw new InvalidAmountException("Amount to deposit must be positive.");
        }
        balance += amount;
        System.out.println("Successfully deposited: " + amount);
    }

    public void withdraw(double amount) throws InvalidAmountException, InsufficientFundsException {
        if (amount <= 0) {
            throw new InvalidAmountException("Amount to withdraw must be positive.");
        }
        if (amount > balance) {
            throw new InsufficientFundsException("Insufficient funds. Available balance: " + balance);
        }
        balance -= amount;
        System.out.println("Successfully withdrew: " + amount);
    }

    public void checkBalance() {
        System.out.println("Current balance: " + balance);
    }
}
