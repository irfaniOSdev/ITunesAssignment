//
//  MediaSelectionPageTests.swift
//  ITunesAssignmentTests
//
//  Created by Muhammad Irfan on 12/08/2022.
//

import XCTest
@testable import ITunesAssignment

class MediaSelectionPageTests: XCTestCase {
    
    var dataSource: MediaSelectionPageDataSource!
    var viewModel: MediaSelectionViewModelProtocol!
    
    override func setUpWithError() throws {
        viewModel = MediaSelectionViewModel()
        dataSource = MediaSelectionPageDataSource(viewModel: viewModel)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        dataSource = nil
    }

    func testMediaTypeModelCanCreateInstance() {
        let model = MediaTypeModel(type: "album", name: "music")
        XCTAssertNotNil(model)
    }
    
    func testViewModelInitialization() {
        XCTAssertNotNil(viewModel, "The Media selection page view model should not be nil.")
    }
    
    func testDataSourceInitialization() {
        XCTAssertNotNil(dataSource, "The media selection page data source should not be nil.")
    }
    
    func testNonEmptyRowsInResultDataSource() {
        let tableView = UITableView(frame: UIDevice.current.accessibilityFrame)
        tableView.dataSource = dataSource
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected 1 section in tableview")
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), viewModel.getNumberOfRows(), "Expected cells in tableview")
    }
    
    func testSelectedMediaCell() {
        let tableView = UITableView(frame: UIDevice.current.accessibilityFrame)
        tableView.dataSource = dataSource
        tableView.registerNibForCell(MediaSelectionCell._reuseIdentifier)
        let indexPath = IndexPath(row: 0, section: 0)
        guard let cell = dataSource.tableView(tableView, cellForRowAt: indexPath) as? MediaSelectionCell else {
            XCTAssert(false, "Expected MediaSelectionCell class")
            return
        }
        cell.setSelected(true, animated: true)
        XCTAssertTrue(cell.isSelected)
    }
    
    func testGetSearchData() {
        let mediaType = viewModel.getMediaType(index: 0)
        XCTAssertEqual(mediaType?.type, dataSource.viewModel.mediaTypes?.first?.type)
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
