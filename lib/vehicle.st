Object subclass: Vehicle [
  | vehicleId make model year color licensePlate capacity vehicleType available
  driver |

  init [
    vehicleId := ''.
    make := ''.
    model := ''.
    year := 1900.
    color := ''.
    licensePlate := ''.
    capacity := 0.
    vehicleType := ''.
    available := true.
    ^ self
  ]

  getVehicleId [
    ^ vehicleId
  ]

  getVehicleInfo [
    ^ vehicleId, ' - ', make, ' ', model, ' (', year printString, ') ', color, ' - ', licensePlate
  ]

  getVehicleType [
    ^ vehicleType
  ]

  getCapacity [
    ^ capacity
  ]

  setDriver: newDriver [
    driver := newDriver.
    ^ self
  ]

  getDriver [
    ^ driver
  ]

  isAvailable [
    ^ available
  ]

  setAvailable: isTaken [
    available := isTaken.
    ^ self
  ]

  setVehicleId: aVehicleId [
    vehicleId := aVehicleId.
    ^ self
  ]

  setMake: aMake [
    make := aMake.
    ^ self
  ]

  setModel: aModel [
    model := aModel.
    ^ self
  ]

  setYear: aYear [
    year := aYear.
    ^ self
  ]

  setColor: aColor [
    color := aColor.
    ^ self
  ]

  setLicensePlate: aLicensePlate [
    licensePlate := aLicensePlate.
    ^ self
  ]

  setCapacity: aCapacity [
    capacity := aCapacity.
    ^ self
  ]

  setVehicleType: aVehicleType [
    vehicleType := aVehicleType.
    ^ self
  ]
]
