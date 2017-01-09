//: Playground - noun: a place where people can play
import Darwin

enum VendhingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

// Propogating Errors Using Throwing Functions
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendhingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendhingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendhingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
"Alice": "Chips",
"Jason": "Licorice",
"Eve": "Pretzels"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

// Handling Errors Using Do-Catch
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendhingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendhingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendhingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

// Converting Errors to Optional Values
// Use try? to convert the value of the expression to nil.
enum DataError: Error {
    case dataFault
    case networkError
}
struct Data {}
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() {
        return data
    }
    if let data = try? fetchDataFromServer() {
        return data
    }
    return nil
}
func fetchDataFromDisk() throws -> Data {
    throw DataError.dataFault
}
func fetchDataFromServer() throws -> Data {
    throw DataError.networkError
}
let d = fetchData()

// Disabling Error Propogation
// Use try! to disable error propogration. If an error is thrown a runtime error occurs.
// let photo = try! loadImage(atPath: "./Resources/JohnAppleseed.jpg")

// Specifying Cleanup Actions
// Use a defer statement to ensure code execution prior to leaving the current block of code.
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Do work
            print(line)
        }
        // close(file) is called here at the end of the scope
    }
}

func exists(_ filename: String) -> Bool {
    return true
}
class File {
    func readline() throws -> String? {
        let x =  arc4random() % 2
        if (x != 1) {
            throw DataError.dataFault
        }
        return ""
    }
}
func open(_ file: String) -> File {
    print("Opening file")
    return File()
}
func close(_ file: File) {
    print("Closing file")
}

try processFile(filename: "Something")












