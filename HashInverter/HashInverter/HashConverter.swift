//
//  HashConverter.swift
//  HashInverter
//
//  Created by Christopher Combes on 12/30/15.
//  Copyright © 2015 Christopher Combes. All rights reserved.
//

import Foundation

enum HashError: ErrorType {
    case InvalidCharacter(text: String)
    case InvalidHash
    case OverFlowOccurred
    case OutOfRange
    case DigitsRequired
}

/*
Inversion Algorithm

Example #1:
c
7 * 37 = 259
259 + 1 = 260
260 - 1  = 259 / 37 = 7 *** Only value evenly divisible

Example #2:
le
7 * 37 = 259
259 + 6 = 265
265 * 37 = 9805
9805 + 3 = 9808

9808 - 3 = 9805 / 37 = 265 *** Only value evenly divisible
265 - 6 = 259 / 37 = 7 *** Only value evenly divisible
*/

class  HashConverter {

    static let maxStringLength = 8
    static let alphabet = "acdegilmnoprstuw"
    
    let seed: Int64 = 7
    let offset: Int64 = 37
    let letters = HashConverter.alphabet
    
    
    func hashValue(s: String) throws -> Int64 {
        var total: Int64 = seed

        // Iterate through each character entered by user so that we can convert it
        for character in s.characters {
    
            // Hash letters are constrained to our alphabet
            guard letters.containsString(String(character)) else {
                throw HashError.InvalidCharacter(text: String(character))
            }
            
            // Find the index of the current character in the loop
            let range: Range<String.Index> = letters.rangeOfString(String(character))!
            let intIndex: Int = letters.startIndex.distanceTo(range.startIndex)
            
            // Calculate total while allowing for overflow
            total = (total &* offset &+ Int64(intIndex))

            // If overflow occurs we get a negative number
            guard total > 0 else {
                throw HashError.OverFlowOccurred
            }
        }
        
        return total
    }
    
    func invertHash(s: String) throws -> String {
        
        var hash = ""
        let checkValue = Int64(s)
        
        guard checkValue != nil else {
            throw HashError.DigitsRequired
        }
        
        var value: Int64 = checkValue!
        
        // Hash range is limited
        guard value <= maxValue() && value >= minValue() else {
            throw HashError.OutOfRange
        }
        
        while value > seed {
            
            // Value must be evenly divisible based on the index range
            var found: Bool = false
            
            // Find an evenly divisible value by checking the modulus
            for index in 0...letters.characters.count - 1 {
                
                let nextValue = value - index
                let modulus = nextValue % offset
#if DEBUG
                print("\(value) - \(index) = \(nextValue) % \(offset) = \(modulus)")
#endif
                if modulus == 0 {
                    // We found an evenly divisible value so we can insert this letter
                    found = true
                    let c: Character = letters[letters.startIndex.advancedBy(index)]
                    hash.insert(c, atIndex: hash.startIndex)
                    
                    // Update value for next iteration
                    value -= index
                    value /= offset
                    
                    // Exit inner loop to see if we are done
                    break
                }
            }
            
            if found == false {
                throw HashError.InvalidHash
            }
        }
        
        return hash
    }
    
    func minValue() -> Int64 {
        // Min value is based on the first character in the letter index
        var value: Int64 = 0
        let text = String(letters.characters.first!)
        
        do {
            try value  = hashValue(text)
        } catch {
            assertionFailure("This could not possibly happen!")
        }
        
        return value
    }
    
    func maxValue() -> Int64 {
        // Max value is based on the largest letter index, simply the count of letters, and maximum string length.
        var value: Int64 = 0
        var text = ""
        
        for _ in 0...HashConverter.maxStringLength {
            text.append(letters.characters.last!)
        }
        
        do {
            try value  = hashValue(text)
        } catch {
            assertionFailure("This could not possibly happen!")
        }
        
        return value
    }
}