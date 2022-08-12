//
//  MediaSelectionViewController.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 09/08/2022.
//

import UIKit

protocol MediaSelectionDelegate: AnyObject {
    func getSelectedMediaTypes(mediaTypes: [MediaTypeModelProtocol])
}
class MediaSelectionViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: MediaSelectionDelegate?
    
    let viewModel: MediaSelectionViewModelProtocol = MediaSelectionViewModel()
        
    lazy var dataSource: MediaSelectionPageDataSource = {
        let dataSource = MediaSelectionPageDataSource(viewModel: viewModel)
        return dataSource
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = buttonItem
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNibForCell(MediaSelectionCell._reuseIdentifier)
    }
    
    @objc func doneAction() {
        var values: [MediaTypeModelProtocol] = []
        guard let selectedcells = tableView.indexPathsForSelectedRows else { return  }
        for indexPath in selectedcells {
            guard let cell = tableView.cellForRow(at: indexPath) as? MediaSelectionCell, let media = cell.mediaType else { return }
            values.append(media)
        }
        delegate?.getSelectedMediaTypes(mediaTypes: values)
        navigationController?.popViewController(animated: true)
    }
}

extension MediaSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MediaSelectionCell._reuseIdentifier, for: indexPath) as? MediaSelectionCell else {return UITableViewCell()}
        cell.mediaType = viewModel.getMediaType(index: indexPath.row)
        return cell
    }
}
