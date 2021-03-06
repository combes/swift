//
//  HashConverter.swift
//  HashInverter
//
//  Created by Christopher Combes on 12/30/15.
//  Copyright © 2015 Christopher Combes. All rights reserved.
//

import Foundation

enum HashError: Error {
    case invalidCharacter(text: String)
    case invalidHash
    case overFlowOccurred
    case outOfRange
    case digitsRequired
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
    
    
    func hashValue(_ s: String) throws -> Int64 {
        var total: Int64 = seed

        // Iterate through each character entered by user so that we can convert it
        for character in s.characters {
    
            // Hash letters are constrained to our alphabet
            guard letters.contains(String(character)) else {
                throw HashError.invalidCharacter(text: String(character))
            }
            
            // Find the index of the current character in the loop
            let range: Range<String.Index> = letters.range(of: String(character))!
            let intIndex: Int = letters.characters.distance(from: letters.startIndex, to: range.lowerBound)
            
            // Calculate total while allowing for overflow
            total = (total &* offset &+ Int64(intIndex))

            // If overflow occurs we get a negative number
            guard total > 0 else {
                throw HashError.overFlowOccurred
            }
        }
        
        return total
    }
    
    func invertHash(_ s: String) throws -> String {
        
        var hash = ""
        let checkValue = Int64(s)
        
        guard checkValue != nil else {
            throw HashError.digitsRequired
        }
        
        var value: Int64 = checkValue!
        
        // Hash range is limited
        guard value <= maxValue() && value >= minValue() else {
            throw HashError.outOfRange
        }
        
        while value > seed {
            
            // Value must be evenly divisible based on the index range
            var found: Bool = false
            
            // Find an evenly divisible value by checking the modulus
            for index in 0...letters.characters.count - 1 {
                
                let nextValue = value - Int64(index)
                let modulus = nextValue % offset
#if DEBUG
                print("\(value) - \(index) = \(nextValue) % \(offset) = \(modulus)")
#endif
                if modulus == 0 {
                    // We found an evenly divisible value so we can insert this letter
                    found = true
                    let c: Character = letters[letters.characters.index(letters.startIndex, offsetBy: index)]
                    hash.insert(c, at: hash.startIndex)
                    
                    // Update value for next iteration
                    value -= Int64(index)
                    value /= offset
                    
                    // Exit inner loop to see if we are done
                    break
                }
            }
            
            if found == false {
                throw HashError.invalidHash
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
