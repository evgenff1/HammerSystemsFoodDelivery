//
//  ProductService.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import Foundation

// MARK: - ProductServiceProtocol

protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
}

// MARK: - ProductService

final class ProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        guard let url = URLBuilder.build(path: Constants.API.Paths.products) else {
            throw NetworkError.badURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }

            let products = try JSONDecoder().decode([Product].self, from: data)

            CacheManager.shared.save(products, as: "products.json")

            return products
        } catch {
            print("Ошибка сети. Пробуем загрузить из кэша")

            if let cached = CacheManager.shared.load([Product].self, from: "products.json") {
                return cached
            }

            throw error
        }
    }
}

