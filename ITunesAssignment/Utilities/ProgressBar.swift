//
//  ProgressBar.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 10/08/2022.
//

import UIKit
import SwiftSpinner

struct ProgressBar {
    static func showLoader() {
        SwiftSpinner.shared.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        SwiftSpinner.show("")
    }
    
    static func hide() {
        SwiftSpinner.hide()
    }
}
