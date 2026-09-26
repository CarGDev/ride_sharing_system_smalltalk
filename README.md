# Ride Sharing System

The Ride Sharing System must include the following components at a minimum. You should add additional functionality and feel free to be creative.

1. Ride Class:
   Create a base class Ride that holds core details such as rideID, pickupLocation, dropoffLocation, distance, durationMinutes, and fare.
   Define methods for calculating the fare() based on distance and duration, and a rideDetails() method to display ride information.
2. Specific Ride Subclasses:
   Implement at least two derived classes of Ride, such as StandardRide and PremiumRide.
   Each subclass should override the fare() method to calculate the fare based on ride type. Standard rides cost 1.50 USD per mile/minute, and premium rides cost 1.00 USD per mile/minute.
   Demonstrate polymorphism by calling the overridden fare() method on a list of different ride types.
3. Driver Class:
   Create a Driver class with attributes like driverID, name, rating, and assignedRides, a list of rides completed by the driver.
   Include methods such as addRide(Ride ride) to add rides to the driver’s list and getDriverInfo() to display driver details.
   Use encapsulation to keep assignedRides private and accessible only through defined methods.
4. Rider Class:
   Create a Rider class with attributes like riderID, name, and requestedRides, a list of rides requested by the rider.
   Include methods such as requestRide(Ride ride) to add a ride to the rider’s requested list, and viewRides() to display ride history.
5. System Functionality
   Demonstrate polymorphism by storing rides of different types in a list (array or collection) and invoking fare() and rideDe- tails() polymorphically.

## Current Class Diagram

This diagram reflects the classes currently implemented in `src/`.

Fare formulas:

- Standard fare = `1.5 * (distance + durationMinutes)`
- Premium fare = `1.0 * (distance + durationMinutes)`

```mermaid
classDiagram

    class PersonaData {
        +String name
        +String last_name
        +String id
        +String email
        +String phone
    }

    class Persona {
        +String name
        +String last_name
        +String id
        +String email
        +String phone
        +getFullName() String
        +getData() PersonaData
        +setFullName(String name, String last_name) void
        +setId(String id) void
        +setEmail(String email) void
        +setPhone(String phone) void
    }

    class DriverData {
        +String name
        +String last_name
        +String id
        +String email
        +String phone
        +double rating
        +boolean available
    }

    class Driver {
        -double rating
        -List~int~ assigned_rides
        -boolean available
        -int current_ride_id
        +Driver()
        +getFullName() String
        +addRide(int id_ride) void
        +getDriverInfo() DriverData
        +closeRide(int id) void
        +getCurrentRideId() int
        +setCurrentRideId(int current_ride_id) void
        +getRating() double
        +setRating(double rating) void
        +isAvailable() boolean
        +setAvailable(boolean available) void
    }

    class RiderData {
        +String name
        +String last_name
        +String id
        +String email
        +String phone
        +int current_ride_id
        +boolean on_ride
    }

    class RideRequestsView {
        +List~int~ requested
        +List~int~ cancelled
    }

    class Rider {
        -List~int~ ride_requested
        -List~int~ cancel_ride_requested
        -int current_ride_id
        -boolean on_ride
        -DriverData current_driver
        +Rider()
        +getFullName() String
        +requestRide(int id, DriverData driver) void
        +endRide(int id) void
        +cancelRide(int id) void
        +getDriverData() DriverData
        +viewRides() RideRequestsView
        +getRiderInfo() RiderData
    }

    class Ride {
        <<abstract>>
        #String rideID
        #String pickupLocation
        #String dropoffLocation
        #double distance
        #double fare
        #int durationMinutes
        #String status
        +calculateFare() double
        +rideDetails() String
        +getRideID() String
        +getDistance() double
        +getDurationMinutes() int
        +getFare() double
        +getStatus() String
        +setStatus(String status) void
    }

    class StandardRide {
        -double ratePerMile
        -double baseFare
        -double minimumFare
        -double bookingFee
        -int maxPassengers
        -String vehicleType
        +StandardRide(String rideID, String pickup, String dropoff, double distance, int durationMinutes)
        +calculateFare() double
        +rideDetails() String
        +getRatePerMile() double
        +getBaseFare() double
        +getMinimumFare() double
        +getBookingFee() double
        +getMaxPassengers() int
        +getVehicleType() String
    }

    class PremiumRide {
        -double ratePerMile
        -double baseFare
        -double premiumFee
        -double serviceFee
        -double minimumFare
        -int maxPassengers
        -String vehicleType
        -boolean luxuryVehicle
        -boolean priorityPickup
        +PremiumRide(String rideID, String pickup, String dropoff, double distance, int durationMinutes)
        +calculateFare() double
        +rideDetails() String
        +getRatePerMile() double
        +getBaseFare() double
        +getPremiumFee() double
        +getServiceFee() double
        +getMinimumFare() double
        +getMaxPassengers() int
        +getVehicleType() String
        +hasLuxuryVehicle() boolean
        +hasPriorityPickup() boolean
    }

    class Vehicle {
        -String vehicleID
        -String make
        -String model
        -int year
        -String color
        -String licensePlate
        -int capacity
        -String vehicleType
        -boolean available
        -Driver driver
        +Vehicle()
        +getVehicleID() String
        +getVehicleInfo() String
        +getVehicleType() String
        +getCapacity() int
        +setDriver(Driver driver) void
        +getDriver() Driver
        +isAvailable() boolean
        +setAvailable(boolean available) void
    }

    class RideSharingSystem {
        -List~Driver~ drivers
        -List~Rider~ riders
        -List~Vehicle~ vehicles
        -List~Ride*~ rides
        +addDriver(Driver driver) void
        +addRider(Rider rider) void
        +addVehicle(Vehicle vehicle) void
        +addRide(Ride* ride) void
        +findAvailableDriver() Driver*
        +findAvailableVehicle() Vehicle*
        +getDrivers() List~Driver~
        +getRiders() List~Rider~
        +getVehicles() List~Vehicle~
        +getRides() List~Ride*~
        +processRides() void
    }

    Persona <|-- Driver
    Persona <|-- Rider
    Ride <|-- StandardRide
    Ride <|-- PremiumRide

    PersonaData <.. Persona : returns
    DriverData <.. Driver : returns
    RiderData <.. Rider : returns
    RideRequestsView <.. Rider : returns

    RideSharingSystem "1" o-- "0..*" Driver : stores
    RideSharingSystem "1" o-- "0..*" Rider : stores
    RideSharingSystem "1" o-- "0..*" Vehicle : stores
    RideSharingSystem "1" o-- "0..*" Ride : stores pointers

    Driver "1" --> "0..*" Ride : stores ride ids
    Rider "1" --> "0..*" Ride : stores ride ids
```

## Simulation Cases

The current `main.cpp` demo runs a scripted ride-sharing scenario for assignment output screenshots.

- The system starts with 3 drivers: Hall Coode, Izabel Balding, and Elden McQuillen.
- The system starts with 5 riders: 3 standard riders and 2 premium riders.
- The system starts with 3 vehicles: 1 standard vehicle and 2 premium vehicles.
- The simulation creates 10 ride requests using both `StandardRide` and `PremiumRide` objects.
- Request 3 is rejected because the only standard vehicle is already assigned.
- Starting at request 5, completed rides release their driver and vehicle so later requests can be assigned again.
- Standard ride fare is calculated as `1.5 * (distance + durationMinutes)`.
- Premium ride fare is calculated as `1.0 * (distance + durationMinutes)`.
- Polymorphism is demonstrated by storing both `StandardRide` and `PremiumRide` objects as `Ride*` and calling `calculateFare()` and `rideDetails()` through the base class pointer.

## Results

```bash



```

## Author

Carlos Gutierrez

Email: cgutierrez44833@ucumberlands.edu

## License

This project is licensed under the MIT License. See `LICENSE` for details.

Copyright (c) 2026 Carlos Gutierrez.
