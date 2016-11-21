//: Playground - noun: a place where people can play

let possibleNumber = "123"
// convertedNumber is implicitly converted to an optional
let convertedNumber = Int(possibleNumber)

// Optional set to nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

// An optional variable without a default value is automatically set to nil
var surveyAnswer: String?

// Optionals of any type can be set to nil

// If an optional has a value, it is considered to be "not equal to" nil
if convertedNumber != nil {
    print("convertedNumber contains some integer value")
}

// Forced unwrapping an optional's value means "this optional definitely has a value; use it."
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

// You use optional binding to find out whether an optional contains a value
if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

// Boolean conditionals
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

// Implicitly unwrapped optionals are unwrapped using !
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

// Implicitly unwrapped optionals are given permission for the optional to be unwrapped
// automatically whenever it is used.

// The following code will crash since serverResponseCode is nil
// let value = serverResponseCode!