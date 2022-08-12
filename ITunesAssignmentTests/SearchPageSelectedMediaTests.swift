//
//  SearchPageSelectedMediaTests.swift
//  ITunesAssignmentTests
//
//  Created by Muhammad Irfan on 12/08/2022.
//

import XCTest
@testable import ITunesAssignment
class SearchPageSelectedMediaTests: XCTestCase {

    var dataSource: SearchPageDataSource!
    var viewModel: SearchPageViewModelProtocol!
    
    override func setUpWithError() throws {
        viewModel = SearchPageViewModel()
        dataSource = SearchPageDataSource(viewModel: viewModel)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        dataSource = nil
    }

    func testViewModelInitialization() {
        XCTAssertNotNil(viewModel, "The search page view model should not be nil.")
    }

    func testEmptyRowsInSelectedMediaDataSource() {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: UIDevice.current.accessibilityFrame, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        XCTAssertEqual(dataSource.numberOfSections(in: collectionView), 1, "Expected one section in collection view")
        XCTAssertEqual(dataSource.collectionView(collectionView, numberOfItemsInSection: 0), 0, "Expected no cells in collection view")
    }
    
    func testSectionAndRowsInSelectedMediaDataSource() {
        
        viewModel.mediaTypes = [MediaTypeModel(type: "movie", name: "Movie"), MediaTypeModel(type: "musicVideo", name: "Music Video")]
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: UIDevice.current.accessibilityFrame, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        XCTAssertEqual(dataSource?.numberOfSections(in: collectionView), 1, "Expected one section in collectionview")
        XCTAssertEqual(dataSource?.collectionView(collectionView, numberOfItemsInSection: 2), viewModel.getNumberOfRows(), "Expected cells equal to selected media count in collectionview")

    }

    func testSelectedMediaCell() {
        viewModel.mediaTypes = [MediaTypeModel(type: "movie", name: "Movie"), MediaTypeModel(type: "musicVideo", name: "Music Video")]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: UIDevice.current.accessibilityFrame, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.register(nib: SelectedMediaTypeCell._reuseIdentifier)
        let indexPath = IndexPath(row: 0, section: 0)
        if dataSource?.collectionView(collectionView, cellForItemAt: indexPath) as? SelectedMediaTypeCell == nil {
            XCTAssert(false, "Expected SelectedMediaTypeCell class")
        }
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
