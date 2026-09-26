"--- Base class: Ride (encapsulation: ivars private, accessors public) ---"
Object subclass: Ride [
    | rideID pickupLocation dropoffLocation distance |

    init [ rideID := 0. pickupLocation := ''. dropoffLocation := ''. distance := 0.0. ^ self ]

    "accessors (getters/setters)"
    id         [ ^ rideID ]
    id: anID   [ rideID := anID ]
    pickup     [ ^ pickupLocation ]
    pickup: a  [ pickupLocation := a ]
    dropoff    [ ^ dropoffLocation ]
    dropoff: a [ dropoffLocation := a ]
    distance   [ ^ distance ]
    distance: d[ distance := d ]

    "behavior"
    fare [ ^ distance * 1.5 ]

    rideDetails [
        ^ 'Ride #', rideID printString, ' ', pickupLocation, ' -> ', dropoffLocation,
           ' (', distance printString, ' mi) fare: $', self fare printString
    ]
]

"--- Subclasses: inheritance + fare() override ---"
Ride subclass: StandardRide [
    fare [ ^ 2.0 + super fare ]            "base charge + inherited per-mile calc"
    rideDetails [ ^ 'STANDARD ', super rideDetails ]
]

Ride subclass: PremiumRide [
    fare [ ^ 5.0 + (distance * 3.5) ]      "own pricing: higher per-mile + surge"
    rideDetails [ ^ 'PREMIUM ', super rideDetails ]
]

"--- Driver: assignedRides private, only reachable via methods ---"
Object subclass: Driver [
    | driverID name rating assignedRides |

    init [ driverID := 0. name := ''. rating := 5.0. assignedRides := OrderedCollection new. ^ self ]

    id: aID name: aName [ driverID := aID. name := aName. ^ self ]

    addRide: aRide [
        (aRide isKindOf: Ride) ifTrue: [ assignedRides add: aRide ]
                                ifFalse: [ Transcript showCr: 'addRide: expected a Ride' ].
        ^ self
    ]

    "expose a copy, never the live collection"
    assignedRides [ ^ assignedRides asArray ]

    totalEarnings [ ^ assignedRides inject: 0.0 into: [ :sum :r | sum + r fare ] ]

    getDriverInfo [
        Transcript showCr: 'Driver ', name, ' (ID #', driverID, ') rating: ',
            rating printString, ' | rides: ', assignedRides size printString,
            ' | earnings: $', self totalEarnings printString
    ]
]

"--- Rider ---"
Object subclass: Rider [
    | riderID name requestedRides |

    init [ riderID := 0. name := ''. requestedRides := OrderedCollection new. ^ self ]

    id: aID name: aName [ riderID := aID. name := aName. ^ self ]

    requestRide: aRide [ (aRide isKindOf: Ride) ifTrue: [ requestedRides add: aRide ]. ^ self ]

    viewRides [
        Transcript showCr: 'Requested rides for ', name, ':'.
        requestedRides do: [ :r | Transcript showCr: '  ', r rideDetails ]
    ]
]

"--- Main: polymorphism over a heterogeneous collection ---"
alice := Rider new init.  alice id: 'R-101' name: 'Alice'.
bob   := Driver new init. bob id: 'D-7' name: 'Bob'.

s := StandardRide new init. s id: 1001. s pickup: 'Airport'. s dropoff: 'Downtown'. s distance: 12.0.
p := PremiumRide new init.  p id: 1002. p pickup: 'Hotel'.   p dropoff: 'Jazz Club'.  p distance: 8.0.

alice requestRide: s. alice requestRide: p.
bob addRide: s.       bob addRide: p.

alice viewRides.
bob getDriverInfo.

Transcript showCr: '--- Polymorphic dispatch over mixed collection ---'.
{ s. p } do: [ :each | Transcript showCr: (each rideDetails), ' | fare: $', each fare printString ]
