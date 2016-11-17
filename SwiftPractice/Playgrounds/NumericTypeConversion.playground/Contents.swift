//: Playground - noun: a place where people can play

// Overflow
// let cannotBeNegative: UInt8 = -1 // Cannot store negative value in a type of UInt
// let tooBig: Int8 = Int8.max + 1 // Overflow
// let tooSmall: Int8 = Int8.min - 1 // Overflow

// SomeType(ofInitialValue) is the default way to call the initializer of a Swift type and pass in an initial value.
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// Integer and floating-point conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(pi)
let value = 3 + 0.14159 // Type is inferred during the compilation phase

// Type aliases
typealias AudioSample = UInt16
var maxAmplitude = AudioSample.min

// Booleans
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmmmm, tasty turnips!")
} else {
    print("Turnips are not too good")
}
