Object subclass: RideSharingSystem [
  | drivers riders vehicles rides |

  init [
    drivers := OrderedCollection new.
    riders := OrderedCollection new.
    vehicles := OrderedCollection new.
    rides := OrderedCollection new.
    ^ self
  ]

  addDriver: newDriver [
    drivers add: newDriver.
    ^ self
  ]

  addRider: newRider [
    riders add: newRider.
    ^ self
  ]

  addVehicle: newVehicle [
    vehicles add: newVehicle.
    ^ self
  ]

  addRide: newRide [
    rides add: newRide.
    ^ self
  ]

  findAvailableDriver [
    ^ drivers
      detect: [ :driver | driver isAvailable ]
      ifNone: [ nil ]
  ]

  findAvailableVehicle [
    ^ vehicles
      detect: [ vehicle | vehicle isAvailable ]
      ifNone: [ nil ]
  ]

  findAvailableVehicle: vehicleType [
    ^ vehicles
      detect: [ :vehicle | vehicle isAvailable and: [ 
        vehicle getVehicleType = vehicleType
      ]]
      ifNone: [ nil ]
  ]

  getDrivers [
    ^ drivers
  ]

  getRiders [
    ^ riders
  ]

  getVehicles [
    ^ vehicles 
  ]

  getRides [
    ^ rides
  ]

  processRides [
    
  ]
]

