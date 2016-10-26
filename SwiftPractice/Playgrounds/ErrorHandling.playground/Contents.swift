//: Playground - noun: a place where people can play

// Errors can be representated using any type that adopts the 'Error' protocol
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// Use 'throw' to throw an error and 'throws' to mark a function that can throw an error
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    
    return "Job sent"
}

// Several ways to handle errors.
// Use do-catch. Inside the 'catch' block the error is automatically given the name 'error' unless you give
// it a different name.
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

// Change the printer name to test throwing an error
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

// Provide multiple 'catch' blocks to handle specific errors.
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    throw PrinterError.outOfPaper // Testing throwing an error here
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// Use try? to convert the result to an optional.
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// Use 'defer' to write a block of code that is executed before the function returns, regardless of throwing an error.
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        print("Deferred") // NOTE: Not seeing this print in playground
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    print("Result")
    return result
}

fridgeContains("banana")
print(fridgeIsOpen)


















