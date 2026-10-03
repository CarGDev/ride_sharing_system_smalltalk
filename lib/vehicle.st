Object subclass: Vehicle [
  | vehicleId make model year color licensePlate capacity vehicleType available
  driver |

  init [
    vehicleId := "".
    make := "".
    model := "".
    year := 1900.
    color := "".
    licensePlate := "".
    capacity := 0.
    vehicleType := "".
    available := true.
    ^ self
  ]

  getVehicleId [
    ^ vehicleId
  ]

  getVehicleInfo [
    ^ vehicleId " - " + make + " " + model + " (" + year + ") " + color + " - " + licensePlate;
  ]

  getCapacity [
    ^ capacity
  ]

  setDriver: newDriver [
    driver := newDriver.
  ]

  getDriver [
    ^ driver
  ]

  isAvailable [
    ^ available
  ]

  setAvailable: isTaken [
    available := isTaken.
  ]
]
