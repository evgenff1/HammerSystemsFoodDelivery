//
//  URLBuilder.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import Foundation

// MARK: - URLBuilder

enum URLBuilder {
    static func build(path: String, queryItems: [URLQueryItem] = []) -> URL? {
        var components = URLComponents()
        components.scheme = Constants.API.scheme
        components.host = Constants.API.host
        components.path = path
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        return components.url
    }
}
