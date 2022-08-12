//
//  SearchResultResponse.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 10/08/2022.
//

import UIKit

struct SearchResultResponse: Codable {
    let resultsCount: Int?
    let results: [SearchResultData]?
}

struct SearchResultData: Codable {
    let artistName: String?
    let trackName: String?
    let previewUrl: String?
    let trackViewUrl: String?
    let artworkUrl100: String?
}
