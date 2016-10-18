//
//  ViewController.swift
//  SwiftPractice
//
//  Created by Christopher Combes on 10/16/16.
//  Copyright © 2016 Christopher Combes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Simple Values
        var myVariable = 42 // Type is inferred as an integer
        myVariable = 20
        print(myVariable)
        let myConstant = 42
        // myConstant = 2 <-- Constants are immutable!
        print(myConstant)
        let explicitFloat: Float = 2 // Type is specified as Float
        
        // Explicit conversion of type
        let label = "The width is "
        let width = 94
        let widthLabel = label + String(width)
        print(widthLabel)
        
        // Simpler conversion of values into strings
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apples"
        print(appleSummary)
        let fruitSummary = "I have \(apples + oranges) pieces of fruit"
        print(fruitSummary)
        let name = "Luke"
        let greeting = "Hello \(name)! I see you have \(explicitFloat) float values"
        print(greeting)
        
        // Arrays
        var shoppingList = ["fish", "water", "almonds", "milk"]
        shoppingList[1] = "coconut water"
        let emptyArray = [String]()
        print(emptyArray)
        shoppingList = [] // Type information inferred from previous declaration
        
        // Dictionaries
        var occupations = [
            "Oliver Queen" : "Archer",
            "Dr. Who" : "Time Lord"
        ]
        occupations["Lois Lane"] = "Reporter"
        let emptyDictionary = [String : Float]()
        print(emptyDictionary)
        occupations = [:] // Type information inferred from previous declaration
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

