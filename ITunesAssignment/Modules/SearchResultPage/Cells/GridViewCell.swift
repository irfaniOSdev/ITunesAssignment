//
//  GridViewCell.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 10/08/2022.
//

import UIKit
import Kingfisher
class GridViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configureCell(model: SearchResultData?) {
        imageView.kf.setImage(with: URL(string: model?.artworkUrl100 ?? ""))
        titleLabel.text = model?.artistName
    }

}
