//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

// Use 'protocol' to declare a protocol
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Classes, enumerations, and structs can all adopt protocols
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 64124
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// Write an enumeration that conforms to this protocol.
//enum SimpleEnum: ExampleProtocol {
//    internal var simpleDescription: String // Enums may not contain stored properties
//    mutating func adjust() {
//        //simpleDescription += " (adjusted)"
//    }
//    case first, second, third
//}

// Trying a protocol without stored properties
protocol MethodProtocol {
    func adjust()
    func someFunction()
}

enum SimpleEnum: MethodProtocol {
    func adjust() {
        print("Called adjust")
    }
    func someFunction() {
        print("Called someFunction")
    }
    case first, second, third
}

var e = SimpleEnum.first
e.adjust()
e.someFunction()

// Use 'extension' to add functionality to an existing type.
extension Int: ExampleProtocol {
    mutating internal func adjust() {
        self += 42
    }

    internal var simpleDescription: String {
        return "The number \(self)"
    }
}

print(7.simpleDescription)

extension Double {
    func absoluteValue()-> Double {
        return self < 0 ? -1 * self : self
    }
}

var d:Double = 4.2
d.absoluteValue()
var negative = -1.2
negative.absoluteValue()

// You can use a protocol name just like any other type.
let protocolValue: ExampleProtocol = a
a.simpleDescription

// You could create a collection of objects that have different types but all conform to a single protocol.
var array = [ExampleProtocol]()
array.append(a)
array.append(b)
for object in array {
    print(object.simpleDescription)
}




