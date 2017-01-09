//: Playground - noun: a place where people can play

// Optional Chaining as an alternative to Forced Unwrapping

class Person {
    var residence: Residence?
}
class Room {
    let name: String
    init(name: String) { self.name = name }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() { // Implicit return type of Void
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

let jill = Person()
// let roomCount = jill.residence!.numberOfRooms // Error:

if let roomCount = jill.residence?.numberOfRooms { // Optional chaining to the rescue
    print("Jill's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

jill.residence = Residence()
if let roomCount = jill.residence?.numberOfRooms { // Optional chaining to the rescue
    print("Jill's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

// Accessing Properties through Optional Chaining

let jack = Person()
if let roomCount = jack.residence?.numberOfRooms {
    print("Jack's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acadia Road"
jack.residence?.address = someAddress // residence is nil and so the assignment fails

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acadia Road"
    
    return someAddress
}
jack.residence?.address = createAddress() // Nothing is printed as function is not called

// Calling Methods through Optioal Chaining
if jack.residence?.printNumberOfRooms() != nil {
    print("It is possible to print the number of rooms.")
} else {
    print("It is not possible to print the number of rooms.")
}

if (jack.residence?.address = someAddress) != nil {
    print("It is possible to set the address.")
} else {
    print("It is not possible to set the address.")
}

// Accessing Subscripts through Optional Chaining
if let firstRoomName = jack.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

jack.residence?[0] = Room(name: "Bathroom")

let jacksHouse = Residence()
jacksHouse.rooms.append(Room(name: "Living Room"))
jacksHouse.rooms.append(Room(name: "Kitchen"))
jack.residence = jacksHouse

if let firstRoomName = jack.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

// Accessing Subscripts of Optional Type
var testScores = ["Dawn" : [86, 94, 90], "Beverly": [79, 92, 81]]
testScores["Dawn"]?[0] = 91
testScores["Beverly"]?[0] += 1
testScores["Brian"]?[0] = 72
print(testScores)

// Linking Multiple Levels of Chaining
// Non-optionals become optionals when chaining
if let jackStreet = jack.residence?.address?.street {
    print("Jack's street name is \(jackStreet)/")
} else {
    print("Unable to retrieve the address.")
}

let jacksAddress = Address()
jacksAddress.buildingName = "The Larches"
jacksAddress.street = "Laurel Street"
jack.residence?.address = jacksAddress

if let jacksStreet = jack.residence?.address?.street {
    print("Jack's street name is \(jacksStreet).")
} else {
    print("Unable to retrieve the address.")
}

// Chaining on Methods with Optional Return Values
if let buildingIdentifier = jack.residence?.address?.buildingIdentifier() {
    print("Jack's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe = jack.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("Jack's building identifier begins with \"The\".")
    } else {
        print("Jack's building identifier does not begin with \"The\".")
    }
}









