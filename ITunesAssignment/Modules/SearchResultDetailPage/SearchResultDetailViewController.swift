//
//  SearchResultDetailViewController.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 12/08/2022.
//

import UIKit
import Kingfisher
import AVKit
import AVFoundation
class SearchResultDetailViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    // MARK: - Properties
    var viewModel: SearchResultDetailViewModelProtocol?
    let playerViewController = AVPlayerViewController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.kf.setImage(with: URL(string: viewModel?.searchData?.artworkUrl100 ?? ""))
        trackName.text = viewModel?.searchData?.trackName
        artistName.text = viewModel?.searchData?.artistName
    }
    
    // MARK: - IBActions
    @IBAction func videoPlayAction(_ sender: Any) {
        playVideo()
    }
    // MARK: - Methods
    func playVideo() {
        guard let previewUrl = viewModel?.searchData?.previewUrl else { return }
        guard let videoURL = URL(string: previewUrl) else { return }
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
}
