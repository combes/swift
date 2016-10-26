//: Playground - noun: a place where people can play

// Write a name inside angle brakcets to make a generic function or type
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    
    return result
}

makeArray(repeating: "knock", numberOfTimes: 4)

// You can make generic forms of functions, methods, classes, enumerations, and structures.
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// Use 'where' right before the body to specify a list of requirements.
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable,
    T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        
        return false
}

if anyCommonElements([1,2,3], [3]) {
    print("Yes")
}

// Modify the function to make a function that returns an array of the elements that any two sequences have in common
func commonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [AnyObject]
    where T.Iterator.Element: Equatable,
    T.Iterator.Element == U.Iterator.Element {
        var commonElements = [AnyObject]()
        
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    commonElements.append(rhsItem as! AnyObject)
                }
            }
        }
        
        return commonElements
}

print(commonElements([1,2,3,4], [3,4,5,6]))




