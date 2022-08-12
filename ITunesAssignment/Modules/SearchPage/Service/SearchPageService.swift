//
//  SearchPageService.swift
//  ITunesAssignment
//
//  Created by Muhammad Irfan on 10/08/2022.
//

import UIKit

struct SearchPageService: NetworkRequestProtocol {
    
    let term: String
    let entity: String
    
    init(term: String, entity: String) {
        self.term = term
        self.entity = entity
    }
    
    var requestType: HTTPMethod {
        return .get
    }
    
    var endPoint: String {
        var components = URLComponents()
        components.path = "search/"
        components.queryItems = [URLQueryItem(name: "term", value: term), URLQueryItem(name: "entity", value: entity)]
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url.absoluteString
    }
}

extension SearchPageService: ExecuteRequest {
    typealias T = SearchResultResponse
    func executeRequest(_ completion: @escaping (Result<T, ErrorHandler>, URLResponse?) -> Void) {
        NetworkManager().executeRequest(self, completion: completion)
    }
}
