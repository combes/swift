//: Playground - noun: a place where people can play

// Initializers
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

// Default Property Values
struct FahrenheightStruct {
    var temperature = 32.0 // Keeps default value tied more closely to its declaration
}

// Initialization Parameters
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheight fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheight: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

// Parameter Names and Argument Labels
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// Initializer Parameters Without Argument Labels
struct CelsiusTwo {
    var temperatureInCelsius: Double
    init(fromFahrenheight fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = CelsiusTwo(37.0)

// Optional Property Types
class SurveyQuestion {
    // var text: String
    let text: String // Assigning Constant Properties During Initialization
    var response: String? // initialized with a default value of nil
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

// Memberwise Initializers for Structure Types
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

// Initializer Delegation for Value Types
// Initializers can call other initializers to perform part of an instance's initialization.
// This process is known as 'initializer delegation' and avoids code duplication.
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {} // This is what the default initializer is for a Struct
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let basicRect = Rect()
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

// A Designated Initializer fully initializes all properties introduced by that class
// and calls an appropriate superclass initializer to continue the initialization process
// up the superclass chain.
// At least one designated initializer is required (or inherited).

// A Convenience Initializer provides a supporting initializer for a class and are optional.

// Designated initializers must always delegate UP.
// Convenience initializers must always delegate ACROSS.


class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(S)"
    }
}
let vehicle = Vehicle()
print("Vehicle \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

// Designated and Convenience Initializers in Action
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        // super.init() does not need to be called since there is no inheritance
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        print("here")
        self.init(name: name, quantity: 1)
    }
}
let oneMysterItem = RecipeIngredient() // Confused as to why "init(name: String)" is called here.
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "✔" : "✘"
        return output
    }
}
var breakfastList = [
ShoppingListItem(),
ShoppingListItem(name: "Bacon"),
ShoppingListItem(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

// Failable Initializers
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

// Failable Initializers for Enumerations
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

// Failable Initializers for Enumerations with Raw Values
enum TemperatureUnitTwo: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}
let anotherUnit = TemperatureUnitTwo(rawValue: "F")
if anotherUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
let anotherUnknown = TemperatureUnit(symbol: "X")
if anotherUnknown == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

// Propogation of Initialization Failure
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

// Overriding a Failable Initializer
class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        // Force unwrapping to call the failable initializer
        super.init(name: "[Untitled]")!
        // super.init(name: "")!  // Error: Runtime error here with forced unwrapping
    }
}

// TODO: Not clear on how to use init!
//class ImplicitlyUnwrappedOptional: Document {
//    override init!() {
//        
//    }
//}

// Required Initializers
// Write the required modifier before the definition of a class initializer to indicate
// that every subclass of the class must implement that initializer:
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}

class SomeSubclass: SomeClass {
    required init() { // "override" not needed for "required" designated initializers
        
    }
}

// Setting a Default Property Value with a Closure or Function
class SomeClosureClass {
    let someProperty: SomeClass = {
        return SomeClass()
    }() // Execute the closure immediately, otherwise, the closure is assigned to the property.
}

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            
            isBlack = !isBlack
        }
        
        return temporaryBoard
    }()
    
    func squareisBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}
let board = Chessboard()
print(board.squareisBlackAt(row: 0, column: 1))
print(board.squareisBlackAt(row: 7, column: 7))






























