//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

// For-In Loops
for index in 1...5 { // 'var' is implicit
    print("\(index) time 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power { // '_' is a placeholder value that is ignored in the loop
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// Iterate over an array
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
print(names[0], names[1], separator: ", ")

// Iterate over a dictionary
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// While Loops

// Snakes and Ladders Game
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
// Zeros are used purely for code alignment
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02;
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08;

var square = 0
var endSquare = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    
    if diceRoll == 7 { diceRoll = 1 }
    
    // move by the rolled amount
    square += diceRoll
    
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
        endSquare = square
    }
}

print("Game over. You made it to square \(endSquare)")

// Repeat-While
var n = 0
repeat {
    print("n = \(n)")
    n += 1
} while n < 1

// If
var temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold")
} else {
    print("It's not freezing")
}

// Switch
var someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A": // compound case
    print("The letter A")
    fallthrough // explciitly "fall through" to the next case
default:
    print("Not the letter A")
}

// Interval Matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

// Switch on Tuples
let somePoint = (1, 1)
switch somePoint {
case (0, 0): // duplicate matching cases allowed (all four match 0,0)
    print("(0, 0) is at the origin")
case (_, 0): // '-' is also known as the wildcard pattern to match any possible values
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

// Value Bindings - values are bound to temporary constants or variables
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

// "where" can be used to check for additional conditions
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// Compound Cases
extension Character
{
    func unicodeScalarCodePoint() -> UInt32
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
}

someCharacter = "e"
switch someCharacter {
case "a", "e", "i", "o", "i":
    print("\(someCharacter) is a vowel")
case let (c) where c.hashValue > 96 && c.hashValue < 123:
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
someCharacter.unicodeScalarCodePoint()

// Compound cases with value bindings
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}

// Control Transfer Statements
// Swift has five control transfer statements:
// continue
// break
// fallthrough
// return
// throw

// Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// Prints "The integer value of 三 is 3."

// Guard

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather isnice in \(location).")
}

greet(person: ["name":"John"])
greet(person: ["name":"Jane", "location":"Austin"])








