//: Playground - noun: a place where people can play

// Instance Methods
class Counter {
    var count = 0
    
    func increment() {
        count += 1
        // self.count += 1 // 'self' is implicit
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x  // 'self' provides disambiguation
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

// Modifying Value Types from Within Instance Methods
// By default, the properties of a value type cannot be modified unless 'mutating' is specified
struct MutablePoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var mutablePoint = MutablePoint(x: 1.0, y: 1.0)
mutablePoint.moveBy(x: 2.0, y: 3.0)

let fixedPoint = MutablePoint(x: 3.0, y: 3.0)
// fixedPoint.moveBy(x: 2.0, y: 3.0) // Error. Mutable methods cannot be called on constants.

// Assigning to self Within a Mutating Method
struct AlternatePoint {
    var x = 0.0, y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = AlternatePoint(x: x + deltaX, y: y + deltaY)
    }
}

// Enumerations can also assign to self
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()

// Type Methods
class SomeClass {
    class func someTypeMethod() {
        // 'self' used here would refer to the Type itself instead of an instance
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    // NOTE: Not seeing a compiler warning here.
    @discardableResult // Remove compiler warning if result is not used
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Persius")
player.complete(level: 1)
print("The highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Zeus")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
























