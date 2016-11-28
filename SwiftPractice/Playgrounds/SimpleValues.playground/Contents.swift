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

// a = (b x some multiplier) + remainder
// 1 = (2 x 0) + 1
// Remainder is the left over 1
1 % 2

// Comparison Operators
class Something {}
let x = Something()
let y = x
let z = Something()
if x === y {
    print("Same reference")
}
if x !== z {
    print("Different reference")
}

let anotherName = "world"
if anotherName == "world" {
    print("Same")
} else {
    print("Not same")
}

// Tuples are compared from left to right, one value at a time.
(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")
(1,2,3,4,5,6) == (1,2,3,4,5,6) // Max tuple comparison of 6 elements

// Ternary Conditional Operator
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

// Nil-Coalescing Operator
var a:String?
var b = "name"
a != nil ? a! : b // Shorthand for this
a ?? b // Provides short-circuit evaluation

// Closed Range Operator (a...b)
(1...2)
// (2...1) // The value of 'a' must not be greater than 'b'
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// Half-Open Range Operator (a..<b)
(1..<2)
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// Logical NOT Operator (!a)
let allowedEntry = false
if !allowedEntry {
    print("Access denied")
}

// Logical AND Operator (a && b)
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("Access denied")
}

// Logical OR Operator (a || b)
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("Access denied")
}

// Combining Logical Operators as left-associative.
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("Access denied")
}

// Explicit Parentheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("Access denied")
}




























