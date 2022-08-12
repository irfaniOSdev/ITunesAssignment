//
//  SearchPageDataSource.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 10/08/2022.
//

import UIKit

class SearchPageDataSource: NSObject {

    let viewModel: SearchPageViewModelProtocol
    
    init(viewModel: SearchPageViewModelProtocol) {
        self.viewModel = viewModel
    }
}

extension SearchPageDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectedMediaTypeCell._reuseIdentifier, for: indexPath) as? SelectedMediaTypeCell else { return UICollectionViewCell() }
        cell.mediaType = viewModel.getMediaType(index: indexPath.row)
        return cell
    }
}
