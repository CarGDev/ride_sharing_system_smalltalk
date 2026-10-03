Object subclass: Rides [
    | rideId pickupLocation dropoffLocation distance fare durationMinutes status |

    init [
        rideId := ''.
        pickupLocation := ''.
        dropoffLocation := ''.
        distance := 0.
        fare := 0.
        durationMinutes := 0.
        status := 'free'.
        ^ self
    ]

    initWithId: anId pickup: aPickup dropoff: aDropoff distance: aDistance duration: aDuration [
        self init.
        rideId := anId.
        pickupLocation := aPickup.
        dropoffLocation := aDropoff.
        distance := aDistance.
        durationMinutes := aDuration.
        ^ self
    ]

    getRideID [
      ^ rideId
    ]

    getDistance [
      ^ distance
    ]

    getDurationMinutes [
      ^ durationMinutes
    ]

    getFare [
      ^ fare
    ]

    getStatus [
      ^ status
    ]

    numberString: aNumber [
      ^ ((aNumber asScaledDecimal: 2) printString) copyUpTo: $s
    ]

    setStatus: newStatus [
      status := newStatus.
      ^ self
    ]
]
