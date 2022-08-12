//
//  SearchResultDetailViewModel.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 12/08/2022.
//

import UIKit

protocol SearchResultDetailViewModelProtocol {
    var searchData: SearchResultData? {get}
    func isValidPreviewURL(previewURL: String?) -> Bool
}

extension SearchResultDetailViewModelProtocol {
    
    func isValidPreviewURL(previewURL: String?) -> Bool {
        guard let previewURL = previewURL else {
            return false
        }
        return previewURL.isValidURL()
    }
}
struct SearchResultDetailViewModel: SearchResultDetailViewModelProtocol {

    var searchData: SearchResultData?
}
