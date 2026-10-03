Object subclass: Rides [
    | rideId pickupLocation dropoffLocation distance fare durationMinutes status |

    init [
        rideId := "".
        pickupLocation := "".
        dropoffLocation := "".
        distance := 0.
        fare := 0.
        durationMinutes := 0.
        status := "free".
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

    setStatus: newStatus [
      status := newStatus.
    ]
]
