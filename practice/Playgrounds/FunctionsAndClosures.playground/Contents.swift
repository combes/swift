//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

// Use 'func' to declare a function
func greet(person: String, day: String, lunchSpecial: String) -> String {
    return "Hello \(person), today is \(day). The lunch special is \(lunchSpecial)."
}

greet(person: "Bob", day: "Tuesday", lunchSpecial: "Turkey Sandwich")

// You can use custom argument labels or '_' to use no argument label
func greetAgain(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}

greetAgain("John", on: "Wednesday")

// “Use a tuple to make a compound value”
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 39])
print(statistics.sum)
print(statistics.2)  // Refers to the third argument, sum, using a zero-based index

// Functions can also take a variable number of arguments
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    
    for number in numbers {
        sum += number
    }
    
    return sum
}

sumOf()
sumOf(numbers: 42, 597, 12)

func averageOf(numbers: Int...) -> Int {
    // It appears Swift 3 does not yet support passing an array into a variadic argument list
    // See https://bugs.swift.org/browse/SR-128
//    var average = sumOf(numbers: numbers) / numbers.count
    
    var sum = 0
    
    for number in numbers {
        sum += number
    }
    
    return sum / numbers.count
}

averageOf(numbers: 1,2, 3, 4, 5)

// Functions can be nested.
func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    
    add()
    
    return y
}

returnFifteen()

// A function can return another function as its value.
func makeIncrementer() -> ((Int) -> Int) {
    
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrementer()
increment(7)

makeIncrementer()(8)

// A function can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 21]
hasAnyMatches(list: numbers, condition: lessThanTen)

// Functions are actually a special case of closures.
// Closures are blocks of code that can be called later.
// The code in a closure has access to things like variables and functions that were available in the scope where the closure was created.
// You can write a closure without a name by surrounding code with braces ({}).
// Use 'in' to separate the arguments and return type from the body.
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result % 2 == 0 ? result : 0
})

// When a closure’s type is already known, such as the callback for a delegate,
// you can omit the type of its parameters, its return type, or both.
// Single statement closures implicitly return the value of their only statement.
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// Testing using a closer for method "sorted"
let sortedNumbers = numbers.sorted(by: {
    (num1: Int, num2: Int) -> Bool in return num1 < num2 })
print(sortedNumbers)

// Testing using a function for method "sorted"
func sortFunc(num1: Int, num2: Int) -> Bool {
    return num1 < num2
}
print(numbers.sorted(by: sortFunc))





