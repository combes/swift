//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

import Foundation

var nameOfIntegers = [Int: String]()
nameOfIntegers[16] = "sixteen"
nameOfIntegers = [:] // Empty dictionary

var airports: [String: String] = ["ATX" : "Austin-Bergstrom Airport",
                                  "YYZ" : "Toronto Pearson",
                                  "DUB" : "Dublin"]
var airportsLiteral = ["ATX" : "Austin-Bergstrom Airport",
                       "YYZ" : "Toronto Pearson",
                       "DUB" : "Dublin"]
airports.isEmpty
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow" // Change value

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport is not in the airports dictionary")
}

airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain this value")
}

// Iterating Over a Dictionary
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys) // Initialize an array with Keys
let airportNames = [String](airports.values) // Initialize an array with Values

// Sorting
for airportCode in airports.keys.sorted() {
    print("Airport code: \(airportCode)")
}

// Testing access of dictionary values
var values = [String: Any?]()
values["name"] = 1
let name = values["name"] as? String // result is 'nil'
let value = values["name"] // result is "1" with implicit type

