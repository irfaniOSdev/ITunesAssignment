//
//  Router.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 10/08/2022.
//

import UIKit

class Router: NSObject {

    static func showMediaSelection(from controller: UIViewController) {
        guard let vc = AppConstants.storyboard.instantiateViewController(withIdentifier: MediaSelectionViewController.identifier) as? MediaSelectionViewController else { return }
        vc.delegate = controller as? MediaSelectionDelegate
        controller.navigationController?.show(vc, sender: nil)
    }
    
    static func showSearchResult(from controller: UIViewController, searchResults: [SearchResultProtocol]?) {
        guard let vc = AppConstants.storyboard.instantiateViewController(withIdentifier: SearchResultViewController.identifier) as? SearchResultViewController else { return }
        let viewModel = SearchResultViewModel()
        viewModel.searchResults = searchResults
        vc.viewModel = viewModel
        controller.navigationController?.show(vc, sender: nil)
    }
    
    static func showSearchResultDetail(from controller: UIViewController, searchResults: SearchResultData?) {
        guard let vc = AppConstants.storyboard.instantiateViewController(withIdentifier: SearchResultDetailViewController.identifier) as? SearchResultDetailViewController else { return }
        let viewModel = SearchResultDetailViewModel(searchData: searchResults)
        vc.viewModel = viewModel
        controller.navigationController?.show(vc, sender: nil)
    }
}
