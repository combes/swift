//: Playground - noun: a place where people can play

// Class and structures have many things in common.
// Clases have additional capabilities that structures do not:
// - Inheritance enables one class to inherit the characteristics of another.
// - Type casting enables you to check and interpret the type of a class instance at runtime.
// - Deinitializers enable an instance of a class to free up any resources it has assigned.
// - Reference counting allows more than one reference to a class instance.

// Structures are always copied when they are passed around in your code
// and do not use reference counting.

// Definition Syntax
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()

// Accessing Properties
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280

// Memberwise Initializers for Structure Types
// All structures have an automatically-generated memberwise initializer.
let vga = Resolution(width: 640, height: 480)

// Structures and Enumerations Are Value Types
// A value type is a type whose value is copied when it is assigned
// to a variable or constant, or when it is passed to a function.
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
hd.width // Value unchanged from 1920

// Classes Are Reference Types
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
tenEighty.frameRate // Value changed from 25.0

// Identity Operators
if tenEighty === alsoTenEighty {
    print("Same intance")
}
let anotherMode = VideoMode()
if tenEighty !== anotherMode {
    print("Difference instances")
}

