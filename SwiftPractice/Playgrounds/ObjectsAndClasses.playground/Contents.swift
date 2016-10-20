//: Playground - noun: a place where people can play

import Darwin

// Classes
class Shape {
    var numberOfSides = 0
    let shapeName = "Shape"
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func setNumberOfSides(sides: Int) {
        numberOfSides = sides
    }
}

// Create an instance of a class
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

// Create an initializer in a class
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    deinit {
        // Perform cleanup here
    }
}

// Subclassing and 'override'
class Square: NamedShape {
    var sideLength: Double = 0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// Create subclass Circle from NamedShape
class Circle : NamedShape {
    var radius: Double = 0
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return Double.pi * pow(radius, 2)
    }
    
    override func simpleDescription() -> String {
        return "A circle of radius \(radius)"
    }
}

let circle = Circle(radius: 2, name: "A test circle")
circle.area()
circle.simpleDescription()

// Property getter and setter
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
//      set(newValue)  // You can provide an explicit name in parenthesis
            sideLength = newValue / 3.0 // newValue is implicit (it's the value passed in to 'set'
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "A triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// Add 'willSet' and 'didSet' as listeners
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

// If the value before the ? is 'nil', everything after the ? is ignored
// and the value of the whole expression is 'nil'.
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
let nilSquare: Square? = nil
let nilSideLength = nilSquare?.sideLength









