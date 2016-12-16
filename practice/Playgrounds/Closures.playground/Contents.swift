//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

// Sorting closure
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var reversedNames = names.sorted(by: backward)

// Closure Expression Syntax
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// Inferring Type From Context
// Swift can infer the types of its parameters and return type
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

// Implicit Returns from Single-Expression Closures
// Single-expression closures can implicitly return the result
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

// Shorthand Argument Names
reversedNames = names.sorted(by: { $0 > $1 })

// Operator Methods
// String supports the > operator which matches the function type.
reversedNames = names.sorted(by: >)

// Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body
}

// Call function without using a trailing closure
someFunctionThatTakesAClosure(closure: {
  // closure body
})

// Call function with a trailing closure
someFunctionThatTakesAClosure {
    // trailing closure body
}

// Trailing closure for sorted
reversedNames = names.sorted() { $0 > $1 }

// If a closure expression is provided as the function or method's only argument
// and you provide that expression as a trailing closure, you do not need to write
// a pair of () after the function name when calling the function.
reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in  // type of 'number' is inferred by the type in the array
    var number = number
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    
    return output
}

// Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        // runningTotal and amount are captured from the surrounding context
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10) // amount captured is 10
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7) // amount captured is 7
incrementBySeven()

incrementByTen() // previous captured amount of 10 is unchanged

// Both closures refere to the same variables
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// Escaping Closures
// A closure is said to "escape" a function when the closure is passed
// as an argument to the function, but is called after the function returns.
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } // "self" required when @escaping
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
completionHandlers.first?()
print(instance.x)

// Autoclosures
// An autoclosure lets you delay evaluation.
var customersInLine = ["Chris", "Alex", "Eva", "Barry", "Daniella"]
customersInLine.count
let customerProvider = {
    customersInLine.remove(at: 0)
}
customersInLine.count
print("Now serving \(customerProvider())!")
customersInLine.count

// Passing closure as an argument to a function provides delay
func serve(customer customerProvider: () -> String) {
    print("Now service \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) })

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))  // argument is converted to a closure

// Using @autoclosure and @escaping together
var customerProviders: [() -> String] = []
func collectCustomerProviders(customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customerProvider: customersInLine.remove(at: 0))
collectCustomerProviders(customerProvider: customersInLine.remove(at: 0))

customerProviders.count

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}













