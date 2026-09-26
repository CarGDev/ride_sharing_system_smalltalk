Persona subclass: Driver [
    | rating assigned_rides available current_ride_id |

    init [
        super init.
        rating := 0.0.
        assigned_rides := OrderedCollection new.
        available := true
        current_ride_id := -1
        ^ self
    ]

    getFullName [
      ^ name, ' ', last_name
    ]

    addRide: id_ride [
      current_ride_id := id_ride.
      available := false.
      ^self
    ]

    getDriverInfo [
      ^ Dictionary new
        at: 'name' put: name;
        at: 'last_name' put: last_name;
        at: 'id' put: id;
        at: 'email' put: email;
        at: 'phone' put: phone;
        at: 'rating' put: rating;
        at: 'available' put: available;
        yourself
    ]

    closeRide: id_ride [
        assigned_rides add: id_ride.
        available := true.
        current_ride_id := -1.
        ^ self
    ]

    getCurrentRideId [
        ^ current_ride_id
    ]

    setCurrentRideId: aCurrentRideId [
        current_ride_id := aCurrentRideId.
        ^ self
    ]

    getRating [
        ^ rating
    ]

    setRating: aRating [
        rating := aRating.
        ^ self
    ]

    isAvailable [
        ^ available
    ]

    setAvailable: anAvailable [
        available := anAvailable.
        ^ self
    ]
]

