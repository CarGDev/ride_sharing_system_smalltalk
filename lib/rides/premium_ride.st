Rider subclass: PremiumRider [
    | ratePerMile baseFare premiumFee serviceFee minimumFare maxPassengers
    vehicleType luxuryVehicle priorityPickup |

    init [
        super init.
        ratePerMile := 1.
        baseFare := 0.
        premiumFee := 0.
        serviceFee := 0.
        minimumFare := 0.
        maxPassengers := 4.
        vehicleType := "Premium".
        luxuryVehicle := true.
        priorityPickup := true.
        ^ self
    ]


    calculateFare [
      fare := (distance + durationMinutes) * ratePerMile.
      ^ fare
    ]

    rideDetails [
      ^ "Premium Ride " + rideID + " from " + pickupLocation + " to " + dropoffLocation + " - Miles: " + distance + " - Minutes: " + durationMinutes + " - Status: " + status
    ]

    getRatePerMile [
      ^ ratePerMile
    ]

    getPremiumFee [
      ^ baseFare
    ]

    getServiceFee [
      ^ serviceFee
    ]

    getMinimumFare [
      ^ minimumFare
    ]

    getMaxPassengers [
      ^ maxPassengers
    ]

    getVehicleType [
      ^ vehicleType
    ]

    hasLuxusyVehicle [
      ^ luxuryVehicle
    ]

    hasPriorityPickup [
      ^ priorityPickup
    ]
]
