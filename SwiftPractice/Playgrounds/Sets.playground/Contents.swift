//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

// Creating and Initializing an Empty Set
var letters = Set<Character>()
letters.count
letters.insert("a")
letters = [] // Type already know. Clear set contents.

// Creating a Set with an Array Literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "New Age"]
var favoriteGenresImplicitLiteral: Set = ["Rock", "Classical", "New Age"]

// Accessing and Modifying a Set
favoriteGenres.count
favoriteGenres.isEmpty
favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("Removed \(removedGenre)")
} else {
    print("Not removed")
}

if favoriteGenres.contains("Funk") {
    print("Contains")
} else {
    print("Does not contain")
}

for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

// Performing Set Operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// Create a new set with all of the values in both sets.
oddDigits.union(evenDigits).sorted()
// Create a new set with oly the values comong to both sets.
oddDigits.intersection(evenDigits).sorted()
// Create a new set with values not in the specified set.
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// Create a new set with values in either set, but not both.
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

let firstSet: Set = [1, 2, 3]
let secondSet: Set = [3, 4, 5]
firstSet.symmetricDifference(secondSet).sorted()

// Set Membership and Equality
// Set 'a' is a 'superset' of set 'b' if it contains all elements of set 'a'.
// Set 'b' is a 'subset' of set 'a' if all elements of set 'b' are also contained by set 'a'.
// Set 'b' and set 'c' are 'disjoint' if they share no common elements.
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

// Determine whether all of the values of a set are contained in a specified set.
houseAnimals.isSubset(of: farmAnimals)

// Determine whether a set contains all of the values in a specified set.
farmAnimals.isSuperset(of: houseAnimals)

// Determine whether two sets have any values in common.
farmAnimals.isDisjoint(with: cityAnimals)

// Determine whether two sets contain all of the same values.
let favoriteAnimals: Set = ["🐶", "🐱"]
favoriteAnimals == houseAnimals



















