package com.hexaware.mainvehicleprogram;

import com.hexaware.abstractclasses.*;
import com.hexaware.concreteclasses.*;
import java.util.Scanner;


public class VehicleRentalSystem {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		  User user = new User("Ritesh");
		
		Vehicle car = new Car("Porshe" , 1000);
		Vehicle bike = new Bike("Honda" , 100);
		Vehicle truck = new Truck("Tata" , 500);
		
		boolean e = false;
		
		while(!e) {
			System.out.println("1. Rent Vehicles");
			System.out.println("2. Return Vehicles");
			System.out.println("3. View Vehicles");
			System.out.println("4. Exit");
			
			int choice = sc.nextInt();
			
			switch(choice) {
			case 1:
				System.out.println("Which Vechile you want to rent:");
				System.out.println("1. Car");
				System.out.println("2. Bike");
				System.out.println("3. Truck");
				int choice1 = sc.nextInt();
				if (choice1 == 1) {
                    user.rentVehicle(car);
                } else if (choice1 == 2) {
                    user.rentVehicle(bike);
                } else if (choice1 == 3) {
                    user.rentVehicle(truck);
                } else {
                    System.out.println("Invalid choice.");
                }
                break;
            case 2:
                System.out.println("Choose a vehicle to return:");
                System.out.println("1. Car");
                System.out.println("2. Bike");
                System.out.println("3. Truck");
                int returnChoice = sc.nextInt();
                if (returnChoice == 1) {
                    user.returnVehicle(car);
                } else if (returnChoice == 2) {
                    user.returnVehicle(bike);
                } else if (returnChoice == 3) {
                    user.returnVehicle(truck);
                } else {
                    System.out.println("Invalid choice.");
                }
                break;
            case 3:
                user.viewRentedVehicles();
                break;
            case 4:
                e = true;
                break;
            default:
                System.out.println("Invalid option.");
				
			}
		}
		

	}

}
