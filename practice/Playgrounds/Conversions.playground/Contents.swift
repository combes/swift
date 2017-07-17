//: Playground - noun: a place where people can play

import Foundation

// Convert ASCII integer value to it's String equivalent
func characterFromInt(index : Int) -> String {
    var characterString = ""
    characterString.append(Character(UnicodeScalar(index)!))
    return characterString
}

characterFromInt(index: 65) // "A"

// [Method 1] Convert String character to it's ASCII equivalent
extension String {
    func asciiInt() -> UInt32 {
        return UnicodeScalar(self)!.value
    }
}

"A".asciiInt() // "65"

// [Method 2] Convert String character to it's ASCII equivalent
var singleCharString = "A" as NSString
var singleCharValue = singleCharString.character(at: 0) // "65"