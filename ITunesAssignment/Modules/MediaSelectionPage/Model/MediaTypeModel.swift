//
//  MediaTypeModel.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 10/08/2022.
//

import UIKit

protocol MediaTypeModelProtocol {
    var type: String {get}
    var name: String {get}
}

struct MediaTypeModel: MediaTypeModelProtocol {
    var type: String
    var name: String
}
