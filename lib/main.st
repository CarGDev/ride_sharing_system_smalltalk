FileStream fileIn: 'lib/person/driver.st'.
FileStream fileIn: 'lib/person/rider.st'.
FileStream fileIn: 'lib/vehicle.st'.
FileStream fileIn: 'lib/rides/ride.st'.
FileStream fileIn: 'lib/rides/standard_ride.st'.
FileStream fileIn: 'lib/rides/premium_ride.st'.
FileStream fileIn: 'lib/sharing_system.st'.

| system
  driver1 driver2 driver3
  standardRider1 standardRider2 standardRider3
  premiumRider1 premiumRider2
  standardVehicle premiumVehicle1 premiumVehicle2
  ride1 ride2 ride3 ride4 ride5 ride6 ride7 ride8 ride9 ride10
  rides requestRiders requestRiderLabels riderTypes rideTypes
  activeDrivers activeVehicles activeRides activeRideTypes |

system := RideSharingSystem new init.

driver1 := Driver new init.
driver2 := Driver new init.
driver3 := Driver new init.

standardRider1 := Rider new init.
standardRider2 := Rider new init.
standardRider3 := Rider new init.
premiumRider1 := Rider new init.
premiumRider2 := Rider new init.

driver1 setFullName: 'Hall' lastName: 'Coode'.
driver1 setEmail: 'hcoode0@nationalgeographic.com'.
driver1 setId: 'D001'.
driver1 setRating: 4.8.

driver2 setFullName: 'Izabel' lastName: 'Balding'.
driver2 setEmail: 'ibalding1@mysql.com'.
driver2 setId: 'D002'.
driver2 setRating: 4.9.

driver3 setFullName: 'Elden' lastName: 'McQuillen'.
driver3 setEmail: 'emcquillen2@psu.edu'.
driver3 setId: 'D003'.
driver3 setRating: 4.7.

standardRider1 setFullName: 'Bertha' lastName: 'Byrd'.
standardRider1 setEmail: 'bbyrd3@eventbrite.com'.
standardRider1 setId: 'R001'.

standardRider2 setFullName: 'Blakeley' lastName: 'Kalinsky'.
standardRider2 setEmail: 'bkalinsky4@foxnews.com'.
standardRider2 setId: 'R002'.

standardRider3 setFullName: 'Reynolds' lastName: 'Stubbin'.
standardRider3 setEmail: 'rstubbin5@addthis.com'.
standardRider3 setId: 'R003'.

premiumRider1 setFullName: 'Christel' lastName: 'Chipchase'.
premiumRider1 setEmail: 'cchipchase6@blogger.com'.
premiumRider1 setId: 'R004'.

premiumRider2 setFullName: 'Gillan' lastName: 'Auger'.
premiumRider2 setEmail: 'gauger7@japanpost.jp'.
premiumRider2 setId: 'R005'.

standardVehicle := Vehicle new init.
standardVehicle
  setVehicleId: 'V001';
  setMake: 'Chevrolet';
  setModel: 'Impala';
  setYear: 2020;
  setColor: 'White';
  setLicensePlate: 'STD-001';
  setCapacity: 4;
  setVehicleType: 'Standard'.

premiumVehicle1 := Vehicle new init.
premiumVehicle1
  setVehicleId: 'V002';
  setMake: 'Aston Martin';
  setModel: 'DBS';
  setYear: 2023;
  setColor: 'Black';
  setLicensePlate: 'PRE-001';
  setCapacity: 4;
  setVehicleType: 'Premium'.

premiumVehicle2 := Vehicle new init.
premiumVehicle2
  setVehicleId: 'V003';
  setMake: 'Infiniti';
  setModel: 'QX56';
  setYear: 2022;
  setColor: 'Blue';
  setLicensePlate: 'PRE-002';
  setCapacity: 4;
  setVehicleType: 'Premium'.

system addDriver: driver1.
system addDriver: driver2.
system addDriver: driver3.

system addRider: standardRider1.
system addRider: standardRider2.
system addRider: standardRider3.
system addRider: premiumRider1.
system addRider: premiumRider2.

system addVehicle: standardVehicle.
system addVehicle: premiumVehicle1.
system addVehicle: premiumVehicle2.

ride1 := StandardRide new initWithId: 'R001' pickup: 'Campus' dropoff: 'Downtown' distance: 5.0 duration: 12.
ride2 := PremiumRide new initWithId: 'R002' pickup: 'Airport' dropoff: 'Hotel' distance: 10.0 duration: 25.
ride3 := StandardRide new initWithId: 'R003' pickup: 'Library' dropoff: 'Mall' distance: 3.5 duration: 8.
ride4 := PremiumRide new initWithId: 'R004' pickup: 'Station' dropoff: 'Museum' distance: 8.0 duration: 18.
ride5 := PremiumRide new initWithId: 'R005' pickup: 'Hospital' dropoff: 'Campus' distance: 6.2 duration: 15.
ride6 := PremiumRide new initWithId: 'R006' pickup: 'Downtown' dropoff: 'Airport' distance: 12.0 duration: 28.
ride7 := StandardRide new initWithId: 'R007' pickup: 'Park' dropoff: 'Theater' distance: 4.7 duration: 10.
ride8 := PremiumRide new initWithId: 'R008' pickup: 'Hotel' dropoff: 'Restaurant' distance: 2.8 duration: 7.
ride9 := StandardRide new initWithId: 'R009' pickup: 'Gym' dropoff: 'Home' distance: 7.1 duration: 16.
ride10 := PremiumRide new initWithId: 'R010' pickup: 'Office' dropoff: 'Stadium' distance: 9.4 duration: 20.

rides := OrderedCollection with: ride1 with: ride2 with: ride3 with: ride4 with: ride5
  with: ride6 with: ride7 with: ride8 with: ride9 with: ride10.

requestRiders := OrderedCollection
  with: standardRider1
  with: premiumRider1
  with: standardRider2
  with: premiumRider2
  with: premiumRider1
  with: premiumRider2
  with: standardRider3
  with: premiumRider1
  with: standardRider1
  with: premiumRider2.

requestRiderLabels := OrderedCollection
  with: 'Bertha Byrd'
  with: 'Christel Chipchase'
  with: 'Blakeley Kalinsky'
  with: 'Gillan Auger'
  with: 'Christel Chipchase'
  with: 'Gillan Auger'
  with: 'Reynolds Stubbin'
  with: 'Christel Chipchase'
  with: 'Bertha Byrd'
  with: 'Gillan Auger'.

riderTypes := OrderedCollection
  with: 'Standard' with: 'Premium' with: 'Standard' with: 'Premium' with: 'Premium'
  with: 'Premium' with: 'Standard' with: 'Premium' with: 'Standard' with: 'Premium'.

rideTypes := OrderedCollection
  with: 'Standard' with: 'Premium' with: 'Standard' with: 'Premium' with: 'Premium'
  with: 'Premium' with: 'Standard' with: 'Premium' with: 'Standard' with: 'Premium'.

activeDrivers := OrderedCollection new.
activeVehicles := OrderedCollection new.
activeRides := OrderedCollection new.
activeRideTypes := OrderedCollection new.

Transcript show: 'Ride Sharing System Simulation'; cr.
Transcript show: 'Drivers: 3 | Riders: 5 (3 standard, 2 premium) | Vehicles: 3 (1 standard, 2 premium) | Ride requests: 10'; cr; cr.

rides withIndexDo: [ :ride :i |
  | rider rideType driver vehicle rideToComplete |

  rider := requestRiders at: i.
  rideType := rideTypes at: i.

  i >= 5 ifTrue: [
    rideToComplete := nil.

    activeRides withIndexDo: [ :activeRide :j |
      ((activeRide notNil) and: [ (activeRideTypes at: j) = rideType ])
        ifTrue: [
          rideToComplete isNil ifTrue: [ rideToComplete := j ]
        ]
    ].

    i = 5 ifTrue: [
      activeRides withIndexDo: [ :activeRide :j |
        ((activeRide notNil) and: [ activeRide getRideID = 'R002' ])
          ifTrue: [ rideToComplete := j ]
      ]
    ].

    rideToComplete notNil ifTrue: [
      (activeRides at: rideToComplete) setStatus: 'completed'.
      (activeDrivers at: rideToComplete) setAvailable: true.
      (activeVehicles at: rideToComplete) setAvailable: true.

      Transcript
        show: 'Completed ', ((activeRides at: rideToComplete) getRideID);
        show: '; driver and ', (activeRideTypes at: rideToComplete);
        show: ' vehicle are available again.';
        cr.

      activeRides at: rideToComplete put: nil.
    ].
  ].

  driver := system findAvailableDriver.
  vehicle := system findAvailableVehicle: rideType.

  Transcript
    show: 'Request ', i printString;
    show: ' by ', (requestRiderLabels at: i);
    show: ' for a ', rideType;
    show: ' ride: ', ride getRideID;
    cr.

  ((driver notNil) and: [ vehicle notNil ])
    ifTrue: [
      driver addRide: i.
      driver setAvailable: false.
      vehicle setDriver: driver.
      vehicle setAvailable: false.
      ride setStatus: 'assigned'.
      ride calculateFare.
      rider requestRide: i driverInfo: driver getDriverInfo.
      system addRide: ride.

      activeDrivers add: driver.
      activeVehicles add: vehicle.
      activeRides add: ride.
      activeRideTypes add: rideType.

      Transcript show: 'Assigned'; cr.
      Transcript show: 'Driver: ', driver getFullName; cr.
      Transcript show: 'Vehicle: ', vehicle getVehicleInfo; cr.
      Transcript show: ride rideDetails; cr.
      Transcript show: 'Fare: $', ride getFare printString; cr.
    ]
    ifFalse: [
      ride setStatus: 'unassigned'.
      rider cancelRide: i.

      Transcript
        show: 'No available driver or ', rideType;
        show: ' vehicle for ', ride getRideID;
        cr.
    ].

  Transcript cr.
].
