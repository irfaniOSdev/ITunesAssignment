//
//  SearchResultModel.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 11/08/2022.
//

import UIKit

protocol SearchResultProtocol: MediaTypeModelProtocol {
    var searchResult: [SearchResultData] {get}
}

struct SearchResultModel: SearchResultProtocol {
    var type: String
    var name: String
    var searchResult: [SearchResultData]
}
