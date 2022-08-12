//
//  SearchPageServiceTests.swift
//  ITunesAssignmentTests
//
//  Created by Muhammad Irfan on 12/08/2022.
//

import XCTest
@testable import ITunesAssignment

class SearchPageServiceTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    // test if requested URL is matching with specific search text
    func testSearchRequestURL() {
        let sut = SearchPageService(term: "music", entity: "movie")
        let correctURLString = "https://itunes.apple.com/search/?term=music&entity=movie"
        XCTAssertEqual(sut.absoluteURL, correctURLString)
    }
    
    func testItunesSearchWithValidQuery() throws {
        
        try XCTSkipUnless( ConnectionManager.shared.isConnectedToNetwork(), "Network connectivity needed for this test.")
        
        let expct = expectation(description: "Should return non empty response")
        let sut = SearchPageService(term: "music", entity: "movie")
        sut.executeRequest { result, _ in
            switch result {
            case .success(let model):
                if model.results !=  nil {
                    XCTAssert(true, "Success")
                    expct.fulfill()
                } else {
                    XCTFail("No results")
                }
            case .failure(let error):
                XCTFail(error.codeError().description ?? "Something went wrong")
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testItunesSearchWithInvalidQuery() throws {
        try XCTSkipUnless( ConnectionManager.shared.isConnectedToNetwork(), "Network connectivity needed for this test.")
        let expct = expectation(description: "Should return non empty response")
        let sut = SearchPageService(term: "", entity: "")
        sut.executeRequest { result, _ in
            switch result {
            case .success(let model):
                if model.results !=  nil {
                    XCTAssert(true, "Success")
                    expct.fulfill()
                } else {
                    XCTFail("No results")
                }
            case .failure(let error):
                XCTFail(error.codeError().description ?? "Something went wrong")
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testPerformSearchRequest() {
        let sut = SearchPageViewModel()
        sut.mediaTypes = [MediaTypeModel(type: "movie", name: "Movie"), MediaTypeModel(type: "musicVideo", name: "Music Video")]
        sut.term = "music"
        let expectation = expectation(description: "Should return non empty response")
        sut.performSearchRequest()
        sut.searchCompletion = {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
