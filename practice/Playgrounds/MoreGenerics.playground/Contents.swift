//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

// The Problem That Generics Solve
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Additional functions would be required for type Double or String.

// Generic Functions
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoValues(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print("someString is now \(someString), and anotherString is now \(anotherString)")

// Generic Types
// Example stack implementation with Int values
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// Example stack implementation with generic values
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("Un")
stackOfStrings.push("Deux")
stackOfStrings.push("Trois")
stackOfStrings.push("Quatre")
let topValue = stackOfStrings.pop()

// Extending a Generic Type
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}

// Type Constraints
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}
let strings = ["cat", "dog", "llama", "parakeet", "giraffe"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind { // Equatable constraint handles == and !=
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Charlie", "Andrea"])

// Associated Types
protocol Container {
    associatedtype ItemType  // The generic type of items for the Container
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStackTwo: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    
    // Swift compiler can infer the type to use based on the ItemType placement
    // typealias ItemType = Int  // Defining 'Int' as the associated type
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

// Generic Where Clauses
// A generic where clause enables you to require that an associated type must conform
// to a certain protocol, or that certain type parameters and associated types must
// be the same.

func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool
where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    
    // Check that both containers contain the same number of items.
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    // Check each pair of items to see if they are equivalent.
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    // All items match, so return true.
    return true
}

var arrayOfStrings = ["uno", "dos", "tres"]

// TODO: The following code from the text is causing an error.
// "error: cannot invoke 'allItemsMatch' with an argument list of type '(Stack<String>, [String])'"
//if allItemsMatch(stackOfStrings, arrayOfStrings) {
//    print("All items match.")
//} else {
//    print("Not all items match.")
//}

// The following code also does not work even though the same variable is passed for each argument.
//if allItemsMatch(arrayOfStrings, arrayOfStrings) {
//    print("All items match.")
//} else {
//    print("Not all items match.")
//}






