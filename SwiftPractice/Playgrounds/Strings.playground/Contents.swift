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

// Unicode
// String type is built from Unicode scalar values.
// A Unicode scalar is a unique 21-bit number for a character.

let wiseWords = "\"Wherever you go, there you are\""
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

// An extended grapheme cluster is a sequence of one or more Unicode scalars that
// (when combined)  produce a single human-readable character.
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
let enclosedEAcute: Character = "\u{E9}\u{20DD}"

// Unicode scalars for regional indicator symbols can be combined in pairs
// to make a single Character value.
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

// Counting characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
var symbolMenagerie = "🐨🐌🐧🐪"
symbolMenagerie.characters.count

// Appending a diacritic will not change the word count.
var word = "cafe"
word.characters.count
word += "\u{301}"
word.characters.count

// Performance note: Counting # of characters requires iteration in order to determine the grapheme clusters.

// String indices
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// greeting[greeting.endIndex] // error
// greeting.index(after: greeting.endIndex) // error

// Use the indices property to access individual characters.
for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}
// startIndex, endIndex, and other properties are available on Array, Dictionary, and Set.

// Inserting and Removing Characters
var hello = "hello"
hello.insert("!", at: hello.endIndex)
hello.insert(contentsOf: " there".characters, at: hello.index(before: hello.endIndex))
hello.remove(at: hello.index(before: hello.endIndex))
let range = hello.index(hello.endIndex, offsetBy: -6)..<hello.endIndex
hello.removeSubrange(range)

















