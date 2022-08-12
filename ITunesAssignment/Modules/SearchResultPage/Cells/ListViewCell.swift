//
//  ListViewCell.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 10/08/2022.
//

import UIKit
import Kingfisher
class ListViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(model: SearchResultData?) {
        imageView.kf.setImage(with: URL(string: model?.artworkUrl100 ?? ""))
        titleLabel.text = model?.artistName
        subtitleLabel.text = model?.trackName
    }

}
