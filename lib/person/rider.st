Persona subclass: Rider [
    | ride_requested cancel_ride_requested current_ride_id on_ride current_driver |

    init [
        super init.
        ride_requested := OrderedCollection new.
        cancel_ride_requested := OrderedCollection new.
        current_ride_id := -1.
        on_ride := false.
        current_driver := Dictionary new.
        ^ self
    ]

    getFullName [
        ^ name, ' ', last_name
    ]

    requestRide: ride_id driver: driver_data [
        on_ride := true.
        current_ride_id := ride_id.
        current_driver := driver_data.
        ^ self
    ]

    endRide: ride_id [
        on_ride := false.
        current_ride_id := -1.
        ride_requested add: ride_id.
        current_driver := Dictionary new.
        ^ self
    ]

    cancelRide: ride_id [
        cancel_ride_requested add: ride_id.
        current_ride_id := -1.
        on_ride := false.
        current_driver := Dictionary new.
        ^ self
    ]

    getDriverData [
        ^ current_driver
    ]

    viewRides [
        ^ Dictionary new
            at: 'requested' put: ride_requested;
            at: 'cancelled' put: cancel_ride_requested;
            yourself
    ]

    getRiderInfo [
        ^ Dictionary new
            at: 'name' put: name;
            at: 'last_name' put: last_name;
            at: 'id' put: id;
            at: 'email' put: email;
            at: 'phone' put: phone;
            at: 'current_ride_id' put: current_ride_id;
            at: 'on_ride' put: on_ride;
            yourself
    ]
]
