//
//  FoodTrackerUITests.swift
//  FoodTrackerUITests
//
//  Created by Christopher Combes on 2/6/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import XCTest

class FoodTrackerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.tables.cells.containing(.staticText, identifier:"Pizza").children(matching: .button).matching(identifier: "emptyStar").element(boundBy: 0).tap()
        app.otherElements.containing(.navigationBar, identifier:"Pizza").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).matching(identifier: "emptyStar").element(boundBy: 4).tap()
        app.navigationBars["Pizza"].buttons["Save"].tap()
        
        
    }
    
}
