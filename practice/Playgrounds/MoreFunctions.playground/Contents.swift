//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Holly"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greetAgain(person: "Anna"))

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Mandy", alreadyGreeted: true))

// Default return type is 'Vode' which is an empty tuple ()
func greetNoReturnTypeDefined(person: String) {
    print("Hello, \(person)")
}
greetNoReturnTypeDefined(person: "Shadowfax")

// Functions with Multiple Return Values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
// Tuples can be accessed using dot syntax with the named parameters
print("min is \(bounds.min) and max is \(bounds.max)")

// Optional Tuple Return Types
// (Int, Int)? means the entire tuple is optional
// (Int?, Int?) means individual values are optional
func minMaxSafe(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

if let bounds = minMaxSafe(array: [8, -6, 2, 109, 3, 71]) {
    print("mins \(bounds.min) and max is \(bounds.max)")
}

// Function argument labels and parameter names
func someFunction(firstParameterName: Int, secondParameterName: Int) {
}
someFunction(firstParameterName: 1, secondParameterName: 2)

func someFunctionAgain(argumentLabel parameterName: Int, argumentLabel anotherParameter: Int) {
    // It's possible to have duplicate argument labels but is not very readable
}
someFunctionAgain(argumentLabel: 1, argumentLabel: 2)

// Omitting argument labels
func someFunctionWithParams(_ firstParameterName: Int, secondParameterName: Int) {
    
}
someFunctionWithParams(1, secondParameterName: 2)

// Default parameter values
func someFunctionFour(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    
}
someFunctionFour(parameterWithoutDefault: 1)

// Variadic parameters
// Only one variadic parameter allowed.
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

// In-Out parameters
// Cannot have default values.
// Variadic parameters cannot be marked as inout.
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// Function Types
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
// The type of this function is (Int, Int) -> Int

func printHelloWorld() {
    print("hello, world")
}
// The type of this function is () -> Void
var mathFunction: (Int, Int) -> Int = multiplyTwoInts
mathFunction(2, 4)

// Swift can infer the function type
let anotherMathFunction = multiplyTwoInts

// Function Types as Parameter Types
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(multiplyTwoInts, 3, 5)

// Function Types as Return Types
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}

// Nested Functions
func chooseAnotherStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

currentValue = -4
let moveNearerToZeroAgain = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZeroAgain(currentValue)
}






