//
//  MediaSelectionViewModel.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 11/08/2022.
//

import UIKit

protocol MediaSelectionViewModelProtocol {
    var mediaTypes: [MediaTypeModelProtocol]? { get set }
    func getNumberOfRows() -> Int
    func getMediaType(index: Int) -> MediaTypeModelProtocol?
}

extension MediaSelectionViewModelProtocol {
    
    func getMediaType(index: Int) -> MediaTypeModelProtocol? {
        if index < mediaTypes?.count ?? 0 {
            return mediaTypes?[index]
        }
        return nil
    }
    
    func getNumberOfRows() -> Int {
        return mediaTypes?.count ?? 0
    }
}

class MediaSelectionViewModel: MediaSelectionViewModelProtocol {
    
    var mediaTypes: [MediaTypeModelProtocol]? = [MediaTypeModel(type: "album", name: "Album"), MediaTypeModel(type: "artist", name: "Artist"), MediaTypeModel(type: "book", name: "Book"), MediaTypeModel(type: "movie", name: "Movie"), MediaTypeModel(type: "musicVideo", name: "Music Video"), MediaTypeModel(type: "podcast", name: "Podcast"), MediaTypeModel(type: "song", name: "Song")]
}
