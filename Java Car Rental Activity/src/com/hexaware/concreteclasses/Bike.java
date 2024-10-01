package com.hexaware.concreteclasses;
import com.hexaware.abstractclasses.*;

public class Bike extends Vehicle{

	public Bike(String name, double rentPrice) {
		super(name, rentPrice);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void rentVehicle() {
		// TODO Auto-generated method stub
		if(!this.isRented()) {
			this.setRented(true);
			System.out.println("Bike " + this.getName() + " has been rented at " + this.getRentPrice() + " per day.");
        	} else {
            System.out.println("Bike " + this.getName() + " is already rented.");
        	}
		
	}

	@Override
	public void returnVehicle() {
		// TODO Auto-generated method stub
		if (this.isRented()) {
            this.setRented(false);
            System.out.println("Bike " + this.getName() + " has been returned.");
        } else {
            System.out.println("Bike " + this.getName() + " was not rented.");
        }
		
	}

}
