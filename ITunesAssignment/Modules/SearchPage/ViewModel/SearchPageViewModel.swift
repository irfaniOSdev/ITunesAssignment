//
//  SearchPageViewModel.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 10/08/2022.
//

import UIKit

protocol SearchPageViewModelProtocol: MediaSelectionViewModelProtocol {
    var term: String? { get set }
    var searchResults: [SearchResultProtocol]? {get}
    var searchCompletion: (() -> Void)? { get set }
    func performSearchRequest()
}

class SearchPageViewModel: SearchPageViewModelProtocol {
    
    var mediaTypes: [MediaTypeModelProtocol]?
    var term: String?
    var searchResults: [SearchResultProtocol]?
    let myGroup = DispatchGroup()
    var searchCompletion: (() -> Void)?
    
    func performSearchRequest() {
        searchResults?.removeAll()
        guard let mediaTypes = mediaTypes, let term = term else {
            return
        }
        for type in mediaTypes {
            myGroup.enter()
            let service = SearchPageService(term: term, entity: type.type)
            service.executeRequest { result, _ in
                switch result {
                case .success(let model):
                    if let results = model.results {
                        self.setSearchResults(type: type, results: results)
                    }
                    self.myGroup.leave()
                case .failure(let error):
                    print(error.codeError().description ?? "")
                }
            }
        }
        myGroup.notify(queue: .main) {
            self.searchCompletion?()
        }
    }
    
    func setSearchResults(type: MediaTypeModelProtocol, results: [SearchResultData]) {
        let mediaType = SearchResultModel(type: type.type, name: type.name, searchResult: results)
        if self.searchResults == nil {
            self.searchResults = [mediaType]
        } else {
            self.searchResults?.append(mediaType)
        }
    }
}
