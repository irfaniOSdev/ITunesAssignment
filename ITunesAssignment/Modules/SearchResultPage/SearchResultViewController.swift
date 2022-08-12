//
//  SearchResultViewController.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 09/08/2022.
//

import UIKit

class SearchResultViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    // MARK: - Properties
    var viewModel: SearchResultViewModel?
    
    lazy var dataSource: SearchResultDataSource = {
        let dataSource = SearchResultDataSource(viewModel: viewModel)
        return dataSource
    }()
    
    private lazy var listCVLayout: UICollectionViewFlowLayout = {

        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        collectionFlowLayout.itemSize = CGSize(width: AppConstants.SCREEN_WIDTH, height: 80)
        collectionFlowLayout.minimumInteritemSpacing = 0
        collectionFlowLayout.minimumLineSpacing = 5
        collectionFlowLayout.scrollDirection = .vertical
        collectionFlowLayout.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: 50.0)
        return collectionFlowLayout
    }()

    private lazy var gridCVLayout: UICollectionViewFlowLayout = {
        
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.scrollDirection = .vertical
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        collectionFlowLayout.itemSize = CGSize(width: (AppConstants.SCREEN_WIDTH - 50) / 3, height: 150)
        collectionFlowLayout.minimumInteritemSpacing = 5;      collectionFlowLayout.minimumLineSpacing = 5
        collectionFlowLayout.headerReferenceSize = CGSize(width: self.collectionView.frame.size.width, height: 50.0)
        return collectionFlowLayout
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = dataSource
        collectionView.dataSource = dataSource
        collectionView.registerNibForCell(GridViewCell._reuseIdentifier)
        collectionView.registerNibForCell(ListViewCell._reuseIdentifier)
        collectionView.registerNibForHeader(SectionHeader._reuseIdentifier)
        collectionView.collectionViewLayout = gridCVLayout
        setupListner()
    }
    
    // MARK: - Methods
    func setupListner() {
        viewModel?.didSearchResultSelected = { [weak self] searchData in
            guard let self = self else { return }
            Router.showSearchResultDetail(from: self, searchResults: searchData)
        }
    }
    
    // MARK: - IBActions
    @IBAction func segmentControlValueChange(_ sender: Any) {
        viewModel?.isListView = segmentControl.selectedSegmentIndex == 1
        self.collectionView.startInteractiveTransition(to: (viewModel?.isListView ?? false) ? self.listCVLayout : self.gridCVLayout, completion: nil)
        self.collectionView.finishInteractiveTransition()
        self.collectionView.reloadData()
    }
}
