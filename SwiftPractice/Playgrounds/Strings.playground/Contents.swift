//: Playground - noun: a place where people can play

let someString = "Some string literal value"

// Initializing an empty string
var emptyString = "" // empty string literal (It's literally an empty string 😉)
var anotherEmptyString = String() // initializer syntax of an empty string
if emptyString.isEmpty {
    print("It's an empty string")
}

// String mutability
var variableString = "Horse" // String variables can be modified
variableString += " and carriage"
let constantString = "Highlander"
// constantString += " and another Highlander" // Constants are immutable and is an error

// Strings are Value Types
// Passing a string makes a copy and therefore modifications are local and do not mutate the original object.

// Working with Characters
for character in "Doggie! 🐶".characters {
    print(character)
}

// Stand-alone Character constant
let exclamationMark: Character = "!"

// Build String from Character array
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

// String concatenation
let string1 = "Hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

// Appending Character to a String
welcome.append(exclamationMark)

// String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"































