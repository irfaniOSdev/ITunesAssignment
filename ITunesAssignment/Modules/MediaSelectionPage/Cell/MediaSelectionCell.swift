//
//  MediaSelectionCell.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 10/08/2022.
//

import UIKit

class MediaSelectionCell: UITableViewCell {
    
    @IBOutlet weak var mediaTypeLabel: UILabel!
    var mediaType: MediaTypeModelProtocol? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.accessoryType = selected ? .checkmark : .none
    }
    
    func configure() {
        mediaTypeLabel.text = mediaType?.name
    }
}
