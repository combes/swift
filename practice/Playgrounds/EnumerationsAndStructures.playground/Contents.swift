//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

import UIKit

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    static var allCases: [Rank] {
        return [.ace,.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

// Write a function that compares two Rank values by comparing their raw values
func compare(first: Rank, second: Rank) -> ComparisonResult {
    if (first.rawValue < second.rawValue) {
        return ComparisonResult.orderedAscending
    } else if (first.rawValue > second.rawValue) {
        return ComparisonResult.orderedDescending
    }
    
    return ComparisonResult.orderedSame
}

// Use the init?(rawValue:) initializaer to make an instance of an enumeration from a raw value.
if let convertedRank = Rank(rawValue: 3) {
    _ = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .spades, .clubs:
            return UIColor.black
        default:
            return UIColor.red
        }
    }
    
    static var allCases: [Suit] {
        return [.spades, .hearts, .diamonds, .clubs]
    }
}

let hearts = Suit.hearts
let description = hearts.simpleDescription()
let color = Suit.hearts.color()

// Use 'struct' to create a structure.
// Structures are always copied when they are passed around in your code.
// Classes are passed by reference.
struct Card {
    var rank: Rank
    var suit: Suit
    
    func SimpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    // Add a method to 'Card' that creates a full deck of cards
    static func fullDeck() -> Array<Card> {
        var array = [Card]()
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                array.append(Card(rank: rank, suit: suit))
            }
        }
        
        return array
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades) // It appears a default 'init' is provided with Structs
let threeOfSpadesDescription = threeOfSpades.SimpleDescription()
let deckOfCards = Card.fullDeck()


// Associated values
enum ServerResponse {
    case result(String, String)
    case failure(String)
    
    // Add a third case to 'ServerResponse' and to the switch.
    case meta(String, String, String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of order")
let meta = ServerResponse.meta("Call failed", "Method", "Reason")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
case let .meta(message, method, reason):
    print(message, method, reason)
}

// Guessing you can do this also
switch success {
case ServerResponse.result:
    print("result")
case ServerResponse.failure:
    print("failure")
case ServerResponse.meta:
    print("meta")
}




















