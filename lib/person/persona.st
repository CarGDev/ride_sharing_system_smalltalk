Object subclass: Persona [
    | name last_name id email phone |

    init [
        name := ''.
        last_name := ''.
        id := ''.
        email := ''.
        phone := ''.
        ^ self
    ]

    getFullName [
      ^ name, ' ', last_name
    ]

    getData [
      ^Dictionary new
         at: 'name' put: name;
         at: 'last_name' put: last_name;
         at: 'id' put: id;
         at: 'email' put: email;
         at: 'phone' put: phone;
         yourself
    ]

    setFullName: aName lastName: aLastName [
      name := aName.
      last_name := aLastName.
      ^ self
    ]

    setId: aId [
      id := aId.
      ^ self
    ]

    setEmail: anEmail [
      email := anEmail.
      ^ self
    ]

    setPhone: aPhone [
      phone := aPhone.
      ^ self
    ]
]
