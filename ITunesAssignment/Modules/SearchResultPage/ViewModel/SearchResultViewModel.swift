//
//  SearchResultViewModel.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 12/08/2022.
//

import UIKit

protocol SearchResultViewModelProtocol {
    var isListView: Bool {get set}
    var searchResults: [SearchResultProtocol]? {get set}
    func getNumberOfSections() -> Int
    func getNumberOfRows(of section: Int) -> Int
    func getTitle(of section: Int) -> String?
    func getSearchData(of indexPath: IndexPath) -> SearchResultData?
    var didSearchResultSelected: ((SearchResultData?) -> Void)? { get set }
}

class SearchResultViewModel: SearchResultViewModelProtocol {
    var isListView: Bool = false
    var searchResults: [SearchResultProtocol]?
    var didSearchResultSelected: ((SearchResultData?) -> Void)?

    func getNumberOfSections() -> Int {
        return searchResults?.count ?? 0
    }
    
    func getNumberOfRows(of section: Int) -> Int {
        return searchResults?[section].searchResult.count ?? 0
    }
    
    func getTitle(of section: Int) -> String? {
        searchResults?[section].name
    }
    
    func getSearchData(of indexPath: IndexPath) -> SearchResultData? {
        if indexPath.section < getNumberOfSections() {
            if indexPath.row < getNumberOfRows(of: indexPath.section) {
               return searchResults?[indexPath.section].searchResult[indexPath.row]
            }
        }
        return nil
    }
    
}
