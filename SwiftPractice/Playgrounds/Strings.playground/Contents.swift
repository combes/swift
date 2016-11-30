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
