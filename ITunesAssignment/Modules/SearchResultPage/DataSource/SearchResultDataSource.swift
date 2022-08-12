//
//  SearchResultDataSource.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 12/08/2022.
//

import UIKit

class SearchResultDataSource: NSObject {

    var viewModel: SearchResultViewModelProtocol?
    
    init(viewModel: SearchResultViewModelProtocol?) {
        self.viewModel = viewModel
    }
}

extension SearchResultDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: AppConstants.SCREEN_WIDTH, height: 50)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel?.getNumberOfSections() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel?.getNumberOfRows(of: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader {
            sectionHeader.titleLabel.text = viewModel?.getTitle(of: indexPath.section)
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if !(viewModel?.isListView ?? false) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridViewCell._reuseIdentifier, for: indexPath) as? GridViewCell else { return UICollectionViewCell() }
            cell.configureCell(model: viewModel?.getSearchData(of: indexPath))
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListViewCell._reuseIdentifier, for: indexPath) as? ListViewCell else { return UICollectionViewCell() }
            cell.configureCell(model: viewModel?.getSearchData(of: indexPath))
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = viewModel?.getSearchData(of: indexPath)
        viewModel?.didSearchResultSelected?(data)
    }
}
