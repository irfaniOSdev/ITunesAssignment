//
//  SearchResultPageTests.swift
//  ITunesAssignmentTests
//
//  Created by Muhammad Irfan on 12/08/2022.
//

import XCTest
@testable import ITunesAssignment
class SearchResultPageTests: XCTestCase {

    var dataSource: SearchResultDataSource!
    var viewModel: SearchResultViewModelProtocol!
    
    override func setUpWithError() throws {
        viewModel = SearchResultViewModel()
        dataSource = SearchResultDataSource(viewModel: viewModel)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        dataSource = nil
    }

    func testViewModelInitialization() {
        XCTAssertNotNil(viewModel, "The search page view model should not be nil.")
    }
    
    func testDataSourceInitialization() {
        XCTAssertNotNil(dataSource, "The search page data source should not be nil.")
    }
    
    func testEmptyRowsInResultDataSource() {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: UIDevice.current.accessibilityFrame, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        XCTAssertEqual(dataSource.numberOfSections(in: collectionView), 0, "Expected zero section in collection view")
        XCTAssertEqual(dataSource.collectionView(collectionView, numberOfItemsInSection: 0), 0, "Expected no cells in collection view")
    }
    
    func testRowsAndSectionInResultDataSource() {
        
        guard let results = loadJsonAndDecode(filename: "searchSample") else {     XCTAssert(false, "unable to get data from provided json")
            return
        }
        let mediaType = MediaTypeModel(type: "musicVideo", name: "Music Video")
        let searchResult = SearchResultModel(type: mediaType.type, name: mediaType.name, searchResult: results)

        dataSource?.viewModel?.searchResults = [searchResult]
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        XCTAssertEqual(dataSource.numberOfSections(in: collectionView), 1, "Expected one section in collectionview")
        XCTAssertEqual(dataSource.collectionView(collectionView, numberOfItemsInSection: 0), results.count, "Expected cells equal to results count in collection view")
    }
    
    func testGridViewCell() {
        guard let results = loadJsonAndDecode(filename: "searchSample") else {     XCTAssert(false, "unable to get data from provided json")
            return
        }
        let mediaType = MediaTypeModel(type: "musicVideo", name: "Music Video")
        let searchResult = SearchResultModel(type: mediaType.type, name: mediaType.name, searchResult: results)
        dataSource.viewModel?.searchResults = [searchResult]
        dataSource.viewModel?.isListView = false
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: UIDevice.current.accessibilityFrame, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.register(nib: GridViewCell._reuseIdentifier)
        let indexPath = IndexPath(row: 0, section: 0)
        if dataSource.collectionView(collectionView, cellForItemAt: indexPath) as? GridViewCell == nil {
            XCTAssert(false, "Expected GridViewCell class")
        }
    }
    
    func testListViewCell() {
        guard let results = loadJsonAndDecode(filename: "searchSample") else {     XCTAssert(false, "unable to get data from provided json")
            return
        }
        let mediaType = MediaTypeModel(type: "musicVideo", name: "Music Video")
        let searchResult = SearchResultModel(type: mediaType.type, name: mediaType.name, searchResult: results)
        dataSource.viewModel?.searchResults = [searchResult]
        dataSource.viewModel?.isListView = true
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: UIDevice.current.accessibilityFrame, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.register(nib: ListViewCell._reuseIdentifier)
        let indexPath = IndexPath(row: 0, section: 0)
        if dataSource.collectionView(collectionView, cellForItemAt: indexPath) as? ListViewCell == nil {
            XCTAssert(false, "Expected ListViewcell class")
        }
    }
    
    func testGetTitleOfHeader() {
        guard let results = loadJsonAndDecode(filename: "searchSample") else {     XCTAssert(false, "unable to get data from provided json")
            return
        }
        let mediaType = MediaTypeModel(type: "musicVideo", name: "Music Video")
        let searchResult = SearchResultModel(type: mediaType.type, name: mediaType.name, searchResult: results)
        dataSource.viewModel?.searchResults = [searchResult]
        XCTAssertNotNil(viewModel.getTitle(of: 0))
    }
    
//    func testSectionHeader() {
//        guard let results = loadJsonAndDecode(filename: "searchSample") else {     XCTAssert(false, "unable to get data from provided json")
//            return
//        }
//        let mediaType = MediaTypeModel(type: "musicVideo", name: "Music Video")
//        let searchResult = SearchResultModel(type: mediaType.type, name: mediaType.name, searchResult: results)
//        dataSource.viewModel?.searchResults = [searchResult]
//        dataSource.viewModel?.isListView = true
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: UIDevice.current.accessibilityFrame, collectionViewLayout: layout)
//        collectionView.dataSource = dataSource
//        collectionView.registerNibForHeader(SectionHeader._reuseIdentifier)
//        let indexPath = IndexPath(row: 0, section: 0)
//        if dataSource.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath) as? SectionHeader == nil {
//            XCTAssert(false, "Expected ListViewcell class")
//        }
//    }
    
    func loadJsonAndDecode(filename fileName: String) -> [SearchResultData]? {
        let bundle = Bundle(for: SearchResultPageTests.self)
        if let path =  bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let result = try decoder.decode(SearchResultResponse.self, from: data)
                return result.results
            } catch {
                print("error:\(error)")
            }
        }
        return nil
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
