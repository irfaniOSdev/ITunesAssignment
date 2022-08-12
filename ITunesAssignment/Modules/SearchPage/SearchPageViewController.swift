//
//  SearchPageViewController.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 09/08/2022.
//

import UIKit

class SearchPageViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Properties
    var viewModel: SearchPageViewModelProtocol = SearchPageViewModel()
    
    lazy var dataSource: SearchPageDataSource = {
        let dataSource = SearchPageDataSource(viewModel: viewModel)
        return dataSource
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(nib: SelectedMediaTypeCell._reuseIdentifier)
        setupSearchListner()
    }
    
    // MARK: - Methods
    func setupSearchListner() {
        viewModel.searchCompletion = { [weak self] in
            ProgressBar.hide()
            guard let self = self else { return }
            Router.showSearchResult(from: self, searchResults: self.viewModel.searchResults)
        }
    }
    
    // MARK: - IBActions
    @IBAction func mediaSelectionAction(_ sender: Any) {
        Router.showMediaSelection(from: self)
    }

    @IBAction func submitAction(_ sender: Any) {
        viewModel.term = searchTextField.text
        guard let term = viewModel.term, !term.isEmpty else {
            self.showAlert(title: "", message: "Please enter search term", viewController: self)
            return
        }
        
        ProgressBar.showLoader()
        viewModel.performSearchRequest()
    }
}
// MARK: - MediaSelectionDelegate
extension SearchPageViewController: MediaSelectionDelegate {
    func getSelectedMediaTypes(mediaTypes: [MediaTypeModelProtocol]) {
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
        viewModel.mediaTypes = mediaTypes
        collectionView.reloadData()
    }
}
