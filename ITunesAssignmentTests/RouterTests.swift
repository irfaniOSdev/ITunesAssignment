//
//  RouterTests.swift
//  ITunesAssignmentTests
//
//  Created by Muhammad Irfan on 12/08/2022.
//

import XCTest
@testable import ITunesAssignment

class RouterTests: XCTestCase {

    var sut: Router!
    override func setUpWithError() throws {
        sut = Router()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testViewModelInitialization() {
        XCTAssertNotNil(sut, "Router should not be nil.")
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
