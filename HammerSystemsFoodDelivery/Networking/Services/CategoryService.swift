//
//  CategoryService.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import Foundation

// MARK: - CategoryServiceProtocol

protocol CategoryServiceProtocol {
    func fetchCategories() async throws -> [String]
}

// MARK: - CategoryService

final class CategoryService: CategoryServiceProtocol {
    func fetchCategories() async throws -> [String] {
        guard let url = URLBuilder.build(path: Constants.API.Paths.productCategories) else {
            throw NetworkError.badURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }

            let categories = try JSONDecoder().decode([String].self, from: data)

            CacheManager.shared.save(categories, as: "categories.json")

            return categories
        } catch {
            print("Ошибка сети. Пробуем загрузить категории из кэша")
            if let cached = CacheManager.shared.load([String].self, from: "categories.json") {
                return cached
            }

            throw error
        }
    }
}

