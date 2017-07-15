//
//  HashInverterTests.swift
//  HashInverterTests
//
//  Created by Christopher Combes on 12/27/15.
//  Copyright © 2015 Christopher Combes. All rights reserved.
//

import XCTest
@testable import HashInverter

class HashInverterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHashValid() {
        do {
            let result = try HashConverter().hashValue("leepadg")
            XCTAssertTrue(result == 680131659347, "Hash result failed")
        } catch {
            XCTFail("Hash conversion must succeed")
        }
    }
    
    func testInvertValid() {
        do {
            let result = try HashConverter().invertHash("25377615533200")
            XCTAssertTrue(result == "nsanswer", "Hash inversion failed")
        } catch {
            XCTFail("Hash conversion must succeed")
        }
    }
    
    func testHashInvalidCharacter() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        do {
            _ = try String(HashConverter().hashValue("1"))
            XCTFail("Expected throw")
        } catch HashError.invalidCharacter(let text) {
            XCTAssertEqual(text, "1")
        } catch {
            XCTFail("Expected throw for invalid character")
        }
    }

    func testInvertOutOfRange() {
        do {
            _ = try HashConverter().invertHash("0")
            XCTFail("Expected throw")
        } catch HashError.outOfRange {
            XCTAssertTrue(true)
        } catch {
            XCTFail("Expected throw for out of range")
        }
    }
    
    func testInvertInvalidHash() {
        do {
            _ = try HashConverter().invertHash("275")
            XCTFail("Expected throw")
        } catch HashError.invalidHash {
            XCTAssertTrue(true)
        } catch {
            XCTFail("Expected throw for invalid hash")
        }
    }
    
    func testInvertDigitsRequired() {
        do {
            _ = try HashConverter().invertHash("w")
            XCTFail("Expected throw")
        } catch HashError.digitsRequired {
            XCTAssertTrue(true)
        } catch {
            XCTFail("Expected throw for digits required")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
