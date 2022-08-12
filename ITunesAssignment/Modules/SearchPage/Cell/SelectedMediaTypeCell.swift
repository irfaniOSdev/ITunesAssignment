//
//  SelectedMediaTypeCell.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 09/08/2022.
//

import UIKit

class SelectedMediaTypeCell: UICollectionViewCell {

    @IBOutlet weak var mediaLabel: UILabel!
    
    var mediaType: MediaTypeModelProtocol? {
        didSet {
            configure()
        }
    }
    
    func configure() {
        mediaLabel.text = mediaType?.name
    }

}
