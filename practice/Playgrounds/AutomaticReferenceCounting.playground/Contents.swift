//: Playground - noun: a place where people can play

// ARC in Action
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "Johnny Appleseed")
//reference2 = reference1
//reference3 = reference1 // three references exist
//
//reference1 = nil // two references exist
//reference2 = nil // one references exist
//reference3 = nil // no references exist and object is deallocated

// Strong Reference Cycles Between Class Instances
class Resident {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit {
        print("(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Resident?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Resident?
var unit4A: Apartment?

john = Resident(name: "Johnny Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john // ERROR: Strong reference cycle exists between object properties
john = nil
unit4A = nil // Object properties still reference one another resulting in a memory leak

// Resolving String Reference Cycles Between Class Instances

// Weak References
// Both properties could be 'nil' and reference one another.
class SmartRenter {
    let name: String
    init(name: String) { self.name = name }
    var apartment: SmartApartment?
    deinit {
        print("(name) is being deinitialized")
    }
}

class SmartApartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: SmartRenter?
    deinit {
        print("SmartApartment \(unit) is being deinitialized")
    }
}

var seth: SmartRenter?
var unit4B: SmartApartment?
seth = SmartRenter(name: "Johnny Appleseed")
unit4B = SmartApartment(unit: "4B")
seth!.apartment = unit4B
unit4B!.tenant = seth

seth = nil // Resident is released from lease obligation
print(seth?.apartment ?? "nil") // Strong reference is nil since 'tenant' is weak reference
unit4B = nil

// Unowned References
// One property is allowed to be 'nil' and another property cannot be 'nil',
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var jacob: Customer?
jacob = Customer(name: "Jacob Jingleheimer")
jacob!.card  = CreditCard(number: 1234_5678_9012_3456, customer: jacob!)
jacob = nil // No more strong references

// Unowned References and Implciitly Unwrapped Optional Properties
// Both properties should always have a value.
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name // Country object is fully initialized at this point
        self.capitalCity = City(name: capitalName, country: self)
    }
    deinit {
        print("Country #\(name) is being deinitialized")
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("City #\(name) is being deinitialized")
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("(country.name)'s capital city is called \(country.capitalCity.name)")
// country = nil // Error: Nil cannot be assigned to type 'Country'

// TODO: A strong reference cycle is avoided in the above code but if the objects cannot
// be deallocated then what difference does it make?

// Strong Reference Cycles for Closures
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        
        // Multiple "strong" references to self but only one "strong" reference is captured.
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML  = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil // Strong reference cycle exists

// Resolving Strong Reference Cycles for Closures
// Define a Capture List to define rules when capturing referencees within closures

// Weak and Unowned References
class HTMLElementResolved {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("(name) is being deinitialized")
    }
}

var paragraphResolved: HTMLElementResolved? = HTMLElementResolved(name: "p", text: "hello, world")
print(paragraphResolved!.asHTML())
paragraphResolved = nil // Retain cycle resolved




























