//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

enum CompassPoint {
    case north // Values do not implicitly equal 0, 1, 2, 3 as in C
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// Enumerations should start with a Capital letter.
// Give enumeration types singular rather than plural names.
var directionToHead = CompassPoint.west
directionToHead = .east // Variable type is now defined

// Matching Enumeration Values with a Switch Statement
directionToHead = .south

switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51277, 4)
var noValuesPassed = Barcode.upc // Valid code
productBarcode = .qrCode("abcdefg")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product). \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product). \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

// Raw Values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Implicitly Assigned Raw Values
enum PlanetRaw: Int {
    case mercury, venus = 2, earth, mars, jupiter, saturn, uranus, neptune
}
PlanetRaw.mercury.rawValue // 0
PlanetRaw.earth.rawValue   // 3

enum CompassPointRaw: String { // Raw type is defined and is a string
    case north
    case south
    case east
    case west
}
CompassPointRaw.north.rawValue // "north"

// Initializing from a Raw Value
let possiblePlanet = PlanetRaw(rawValue: 5) // jupiter

// The raw value initializer is a failable initializer
let positionToFind = 11
if let somePlanet = PlanetRaw(rawValue: positionToFind) { // Optional binding
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

// Recursive Enumerations
// You indicate that an enumeration case is recursive by writing indirect before it.
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
// Enable indirection for all cases
indirect enum ArithmeticExpressionAgain {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))



























