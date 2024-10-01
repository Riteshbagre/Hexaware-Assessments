package com.hexaware.mainvehicleprogram;

import com.hexaware.abstractclasses.Vehicle;
import java.util.ArrayList;

public class User {
    private String username;
    private ArrayList<Vehicle> rentedVehicles;

    public User(String username) {
        this.username = username;
        this.rentedVehicles = new ArrayList<>();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void rentVehicle(Vehicle vehicle) {
        vehicle.rentVehicle();
        if (vehicle.isRented()) {
            rentedVehicles.add(vehicle);
        }
    }

    public void returnVehicle(Vehicle vehicle) {
        vehicle.returnVehicle();
        if (!vehicle.isRented()) {
            rentedVehicles.remove(vehicle);
        }
    }

    public void viewRentedVehicles() {
        if (rentedVehicles.isEmpty()) {
            System.out.println("No vehicles rented.");
        } else {
            for (Vehicle v : rentedVehicles) {
                System.out.println(v.getName());
            }
        }
    }
}

