//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

// Array Type Shorthand Syntax
var someArray = Array<String>()
var anotherArray = [String]()

// Creating an Empty Array
var someInts = [Int]()
print("There are \(someInts.count) items.")
someInts.append(3)
someInts = [] // Empty but still of type [Int]

// Creating an Array with a Default Value
var threeDoubles = Array(repeating: 0.0, count: 3)

// Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingListWithImplicitTyping = ["Eggs", "Milk"]

// Accessing and Modifying an Array
shoppingList.count
shoppingList.isEmpty
shoppingList.append("Flour")
shoppingList += ["Baking Power", "Butter"]
var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
shoppingList[2...4] = ["Bananas", "Apples"]
shoppingList
shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)
firstItem = shoppingList[0]
let apples = shoppingList.removeLast()

// Iterating Over an Array
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}









