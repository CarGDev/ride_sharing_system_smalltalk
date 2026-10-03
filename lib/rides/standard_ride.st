Rides subclass: StandardRide [
  | ratePerMile baseFare minimumFare bookingFee maxPassengers vehicleType |
  
  init [
    super init.
    ratePerMile := 1.5.
    baseFare := 0.
    minimumFare := 0.
    bookingFee := 0.
    maxPassengers := 4.
    vehicleType := "Standard".
    ^ self
  ]

  calculateFare [
    fare := (distance + durationMinutes) * ratePerMile.
    ^ fare
  ]

  rideDetails [
    ^ "Standard Ride " + rideID + " from " + pickupLocation + " to " + dropoffLocation + " - Miles: " + distance + " - Minutes: " + durationMinutes + " - Status: " + status
  ]

  getRatePerMile [
    ^ ratePerMile
  ]

  getBaseFare [
    ^ baseFare
  ]

  getMinimumFare [
    ^ minimumFare
  ]

  getBookingFee [
    ^ bookingFee
  ]

  getMaxPassengers [
    ^ maxPassengers
  ]

  getVehicleType [
    ^ vehicleType
  ]

]
