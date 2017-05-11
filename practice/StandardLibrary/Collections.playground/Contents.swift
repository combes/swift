//: Playground - noun: a place where people can play

// Simplified
typealias MyComplexType = Int
typealias MyComplexCollection = [MyComplexType]

func selection() -> AnyBidirectionalCollection<MyComplexType> {
    let objects:MyComplexCollection = [1, 2, 3, 4, 5, 6]
    let result = objects.lazy.filter({$0 < 4}).map({$0 * 10})
    
    return AnyBidirectionalCollection(result)
}

let value = selection()
for index in value.indices {
    print(value[index])
}