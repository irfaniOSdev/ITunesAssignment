//
//  SearchResultDetailPageTests.swift
//  ITunesAssignmentTests
//
//  Created by Muhammad Irfan on 12/08/2022.
//

import XCTest
@testable import ITunesAssignment

class SearchResultDetailPageTests: XCTestCase {

    var viewModel: SearchResultDetailViewModel!
    
    override func setUpWithError() throws {
        viewModel = SearchResultDetailViewModel()
        viewModel.searchData = SearchResultData(artistName: "Jack & Jack", trackName: "Beg", previewUrl: "https://music.apple.com/us/artist/jack-jack/944171951?uo=4", trackViewUrl: "https://music.apple.com/us/music-video/beg/1444862464?uo=4", artworkUrl100: "https://is2-ssl.mzstatic.com/image/thumb/Video128/v4/26/52/09/265209b7-dd76-149c-2d24-9b668a07b266/17UM1IM30033_1_1.jpg/100x100bb.jpg")
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testViewModelInitialization() {
        XCTAssertNotNil(viewModel, "The Search Result Detail View Model should not be nil.")
    }
    
    func testIsValidPreviewURL() {
        let url = viewModel.searchData?.previewUrl
        XCTAssertTrue(viewModel.isValidPreviewURL(previewURL: url))
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
