//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

// Bitwise Operators

// Bitwise NOT operator (bits are inverted)
let initialBits: UInt8 = 0b00001111 // '0b' indicates binary
let invertedBits = ~initialBits     // equals 11110000

// Bitwise AND operator (bits are set to 1 only if the bits were equal to in both numbers)
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 =  0b00111111
let middleFourBits = firstSixBits & lastSixBits // equals 00111100

// Bitwise OR operator (bits are set to 1 if boths bits are equal to 1 in either number)
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedBits = someBits | moreBits // equals 11111110

// Bitwise XOR operator (bits are set to 1 where the input bits ar edifferent and to 0 where the input bits are equal)
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits // equals 00010001

// Bitwise Left and Right Shift Operators
// Shifting an integer’s bits to the left by one position doubles its value.
// Shifting an integer's bits to the right by one position halves its value.

// Logical shift
let shiftBits: UInt8 = 4    // 00000100 in binary
shiftBits << 1              // 00001000
shiftBits << 2              // 00010000
shiftBits << 5              // 10000000
shiftBits << 6              // 00000000
shiftBits >> 2              // 000000001

let pink: UInt32 = 0xCC6699
// AND with a "bit mask" to isolate values
let redComponent = (pink & 0xFF0000) >> 16  // redComponent is 0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8 // greenComponent is 0x66, or 102
let blueComponent = pink & 0x0000FF         // blueComponent is 0x99, or 153

// Overflow Operators
var potentialOverflow = Int16.max  // equals 32767 which is the maximum value an Int16 can hold
// potentialOverflow += 1 // Overflow error

// Value Overflow
var unsignedOverflow = UInt8.max // equals 255 which is the maximum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &+ 1 // now equal to 0

unsignedOverflow = UInt8.min // equals 0 which is the minimum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &- 1 // equal to 255

var signedOverflow = Int8.min // equals -128 which is the minimum value an Int8 can hold
signedOverflow = signedOverflow &- 1 // equal to 127

// Precedence and Associativity
// PEMDAS still applies (Parenthesis, Exponent, Multiplcation, Division/Remainder, Addition, Subtration)

// Operator Overloading
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

// Prefix and Postfix Operators
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative

// Compound Assignment Operators
extension Vector2D {
    // Depends on addition extension defined above
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

// Equivalence Operators
extension Vector2D {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D, right: Vector2D) -> Bool {
        return !(left == right)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

// Custom Operators
prefix operator +++ // prefix, infix, or postfix can be used when defining custom operators

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoulbing = +++toBeDoubled

// Precedence for Custom Infix Operators
infix operator +-: AdditionPrecedence

// Precedence is discussed in Swift Standard Library Operators Reference.
// See https://developer.apple.com/reference/swift/1851035-swift_standard_library_operators
// See https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Declarations.html#//apple_ref/doc/uid/TP40014097-CH34-ID550

extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector is a Vector2D instance with values of (4.0, -2.0)

// Custom operators can begin with one of the ASCII characters /, =, -, +, !, *, %, <, >, &, |, ^, ?, or ~,
// P. 772 describes additional characters than can be used and appears to be quite extension.
// I think clarity is key. Using custom operators is nifty and can provide succinctness when writing code but could also cause confusion when reading code.











