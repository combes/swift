//: Playground - noun: a place where people can play

import Foundation

func isBalanced(string: String) -> Bool {
    var stack = [Character]()
    
    for c in string.characters {
        if c == ")" {
            if stack.last != "(" {
                return false
            }
            stack.removeLast()
        } else if c == "]" {
            if stack.last != "[" {
                return false
            }
            stack.removeLast()
        } else if c == "}" {
            if stack.last != "{" {
                return false
            }
            stack.removeLast()
        } else {
            stack.append(c)
        }
    }
    
    return stack.count == 0
}

var testStrings = [
    // false
    ")" : false,
    "())" : false,
    "]" : false,
    "[]{}()(}" : false,
    "(({}{[]})" : false,
    
    // true
    "()" : true,
    "((()))" : true,
    "[]" : true,
    "([])" : true,
    "([{}{}][])" : true,
    "(((([]))))" : true
]

for (s, expected) in testStrings {
    let result = isBalanced(string: s)
    print("Checking \(s)... \(result)")
    assert(expected == result, "Expected \(expected). Received \(result)")
}