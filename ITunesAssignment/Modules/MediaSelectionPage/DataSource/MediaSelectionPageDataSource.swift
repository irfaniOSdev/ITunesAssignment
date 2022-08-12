//
//  MediaSelectionPageDataSource.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 11/08/2022.
//

import UIKit

class MediaSelectionPageDataSource: NSObject {
        
    let viewModel: MediaSelectionViewModelProtocol
    
    init(viewModel: MediaSelectionViewModelProtocol) {
        self.viewModel = viewModel
    }
}

extension MediaSelectionPageDataSource: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MediaSelectionCell._reuseIdentifier, for: indexPath) as? MediaSelectionCell else {return UITableViewCell()}
        cell.mediaType = viewModel.getMediaType(index: indexPath.row)
        return cell
    }
}
