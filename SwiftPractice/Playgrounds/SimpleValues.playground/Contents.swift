//: Playground - noun: a place where people can play

// Simple Values
var myVariable = 42 // Type is inferred as an integer
myVariable = 20
print(myVariable)
let myConstant = 42
// myConstant = 2 <-- Constants are immutable!
print(myConstant)
let explicitFloat: Float = 2 // Type is specified as Float

// Explicit conversion of type
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

// Simpler conversion of values into strings
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
print(appleSummary)
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
print(fruitSummary)
let name = "Luke"
let greeting = "Hello \(name)! I see you have \(explicitFloat) float values"
print(greeting)

// Arrays
var shoppingList = ["fish", "water", "almonds", "milk"]
shoppingList[1] = "coconut water"
let emptyArray = [String]()
print(emptyArray)
shoppingList = [] // Type information inferred from previous declaration

// Dictionaries
var occupations = [
    "Oliver Queen" : "Archer",
    "Dr. Who" : "Time Lord"
]
occupations["Lois Lane"] = "Reporter"
let emptyDictionary = [String : Float]()
print(emptyDictionary)
occupations = [:] // Type information inferred from previous declaration

// Tuples
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
let (justTheStatusCode, _) = http404Error
// Access values by index
print("The status code is \(http404Error.0)")
// You can name individual elements in a tuple
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
let canATupleHoldATuple = (1, (1,2))