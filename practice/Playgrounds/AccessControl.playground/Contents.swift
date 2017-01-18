//: Playground - noun: a place where people can play
// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

// Access Control Syntax

// Classes with 'public' access, or any more restrictive access level, can be subclassed only within the module where they’re defined.
public class SomePublicClass {}

// Class members with 'public' access, or any more restrictive access level, can be overridden by subclasses only
// within the module where they’re defined.
public var somePublicVariable = 0

// 'internal' access enables entities to be used within any source file from their defining module,
// but not in any source file outside of that module.
// You typically use internal access when defining an app’s or a framework’s internal structure.
// 'internal' is the default access level.
internal class SomeInternalClass {}
internal let someInternalConstant = 0

// 'file-private' access restricts the use of an entity to its own defining source file.
// Use file-private access to hide the implementation details of a specific piece of functionality when those details are used within an entire file.
fileprivate class SomeFilePrivateClass {}
fileprivate func someFilePrivateFunction() {}

// Private access restricts the use of an entity to the enclosing declaration.
// Use private access to hide the implementation details of a specific piece of functionality when
// those details are used only within a single declaration.
private class SomePrivateClass {}
private func somePrivateFunction() {}

// Open classes can be subclassed within the module where they’re defined, and within any module that imports the module where they’re defined.
open class SomeOpenClass {}

open class AnotherClass {
    // Open class members can be overridden by subclasses within the module where they’re defined,
    // and within any module that imports the module where they’re defined.
    open func someOpenFunction() {}
}

// Custom Types
public class AnotherPublicClass {                // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class AnotherInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class AnotherFilePrivateClass {        // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class AnotherPrivateClass {                // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}

// Getters and Setters
struct TrackedString {
    private(set) var numberOfEdits = 0  // access level of property setter is lowered to 'private'
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

public struct AnotherTrackedString {
    public private(set) var numberOfEdits = 0  // 'public' getter and 'private' setter
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEditTwo = AnotherTrackedString()
stringToEditTwo.value = "This is a string."
print("The number of edits is \(stringToEditTwo.numberOfEdits)")









