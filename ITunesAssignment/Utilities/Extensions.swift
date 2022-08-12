//
//  Extensions.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 09/08/2022.
//

import UIKit

// MARK: - URLResponse
extension URLResponse {
    func statusCode() -> Int? {
        guard let response = self.getHttpURLResponse() else { return nil }
        return response.statusCode
    }
    func getHttpURLResponse() -> HTTPURLResponse? {
        guard let response = self as? HTTPURLResponse else { return nil }
        return response
    }
}

extension String {
    func isValidURL() -> Bool {
        if contains("http"), let url = NSURL(string: self) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
}

extension UITableView {
    /// used to register a NIB for  with same nibName and reuseIdentifier
    func registerNibForCell(_ reuseIdentifier: String) {
        register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}

// MARK: - UICollectionView
extension UICollectionView {
    func register(nib nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
}

extension UITableViewCell {
    static var _reuseIdentifier: String {
        return String(describing: Self.self) // defaults to the name of the class implementing this protocol.
    }
}

extension UICollectionView {
    /// used to register a NIB for  with same nibName and reuseIdentifier
    func registerNibForCell(_ reuseIdentifier: String) {
        register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    func registerNibForHeader(_ reuseIdentifier: String) {
        register(UINib(nibName: reuseIdentifier, bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: reuseIdentifier)
    }
}

extension UICollectionViewCell {
    static var _reuseIdentifier: String {
        return String(describing: Self.self) // defaults to the name of the class implementing this protocol.
    }
}

// MARK: - UIViewController
extension UIViewController {
    
    static var identifier: String {
        return String(describing: Self.self) // defaults to the name of the class implementing this protocol.
    }

    func showAlert(title: String = "Alert", message: String, viewController: UIViewController? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.default) {(_) in
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
