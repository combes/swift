//: Playground - noun: a place where people can play

// Control Flow
let individualScores = [75, 43, 103, 87, 12];
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
optionalName = nil // No greeting is printed, as expected
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, stranger"
}

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)" // Default value 'fullName' is used since 'nickName' is 'nil'


let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default: // If 'default' case is removed an error occurs
    print("Everything tastes good in soup")
}


let interestingNumbers = [
    "Prime" : [2, 3, 5, 7, 11, 13],
    "Fibonacci" : [1, 1, 2, 3, 5, 8],
    "Square" : [1, 4, 9, 16, 25]
]

var largest = 0
var largestKind = ""
// var largestKind:String // same
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}

print("Largest number is \(largest) from the \(largestKind) sequence")



var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 { // ..< omits upper value, ... includes upper value
    total += i
}
print(total)


















