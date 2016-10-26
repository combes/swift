//: Playground - noun: a place where people can play

// Constant
let maximumNumberOfLoginAttempts = 10

// Variable
var currentLoginAttempt = 0

// Multiple variables on a single line
var x = 0.0, y = 1.0, z = 2.0

// Type Annotations
var welcomeMessage: String
welcomeMessage = "Hello"

// Multiple related variables
var red, green, blue: Double

// Naming constants and variables
let π = 3.14159265358979323846
let 😀 = "Happy!"
enum MonkeyState: Int {
    case 🐵, 🙈, 🙉, 🙊
    func description() -> String {
        switch self {
        case .🐵:
            return "None"
        case .🙈:
            return "See no evil"
        case .🙉:
            return "Hear no evil"
        case .🙊:
            return "Speak no evil"
        }
    }
}

var monkeyState = MonkeyState.🙊
monkeyState.description()

// It's possible to use Swift keywords as variable names but is best avoided for obvious reasons
var `var` = "Value"

// Changing value
var friendlyWelcome = "Hello~"
friendlyWelcome = "Bonjour!"

// Constants are immutable
let languageName = "Swift"
// languageName = "C#" // Error

// Printing constants and variables
print(friendlyWelcome)
print([friendlyWelcome, monkeyState], separator: " | ", terminator: "\n")
print([friendlyWelcome, monkeyState], separator: " | ", terminator: "")

// String interpolation
print("The current value of friendlyWelcoe is \(friendlyWelcome)")

// Comments
// Single-line comment.
/* This is a comment
 written over multiple lines. */

/* Here is the start of a multiline
    comment.
 
/* This is a second, nested multiline
    comment. */
 
 This is the end of the first multiline
    comment. */

// Semicolons
let cat = "🐱"; print(cat) // required to separate statements

// Integers
let minValue8 = UInt8.min
let maxValue8 = UInt8.max
let minValue16 = UInt16.min
let maxValue16 = UInt16.max
let minValue32 = UInt32.min
let maxValue32 = UInt32.max
let minValue64 = UInt64.min
let maxValue64 = UInt64.max
Int.min
Int.max
Int8.min
Int8.max
Int16.min
Int16.max
Int32.min
Int32.max
Int64.min
Int64.max

// Numeric literals
let decimalInteger = 17
let binaryInteger = 0b10001     // 17 in binary notation
let octalInteger = 0o21         // 17 in octal notation
let hexademinalInteger = 0x11   // 17 in hexadecimal notation

let exponentValue = 1.25e2
let smallExponent = 1.25e-2
let exponentHex = 0xFp2
let smallHex = 0xFp-2

let decimalDouble = 12.1875
let exponentDouble  = 1.21875e1
let hexadecimalDouble  = 0xC.3p0

// Both integers and floats can be padded with extra zero and can contain underscores to help with readability
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1








