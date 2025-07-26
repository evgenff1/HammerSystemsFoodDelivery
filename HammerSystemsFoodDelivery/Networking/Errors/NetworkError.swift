//
//  NetworkError.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import Foundation

// MARK: - NetworkError

enum NetworkError: Error, LocalizedError {
    case badURL
    case invalidResponse
    case decodingFailed
    case serverError(String)
    var errorDescription: String? {
        switch self {
        case .badURL:
            return Constants.NetworkError.badURL
        case .invalidResponse:
            return Constants.NetworkError.invalidResponse
        case .decodingFailed:
            return Constants.NetworkError.decodingFailed
        case .serverError(let message):
            return Constants.NetworkError.serverError + "\(message)"
        }
    }
}
