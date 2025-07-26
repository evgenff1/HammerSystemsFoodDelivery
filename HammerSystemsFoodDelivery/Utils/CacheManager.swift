//
//  CacheManager.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 25.07.2025.
//

import Foundation

// MARK: - CacheManager

final class CacheManager {
    static let shared = CacheManager()
    private init() {}

    private func fileURL(for fileName: String) -> URL? {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(fileName)
    }

    func save<T: Encodable>(_ object: T, as fileName: String) {
        guard let url = fileURL(for: fileName) else { return }

        do {
            let data = try JSONEncoder().encode(object)
            try data.write(to: url)
        } catch {
            print("Ошибка сохранения в кэш:", error)
        }
    }

    func load<T: Decodable>(_ type: T.Type, from fileName: String) -> T? {
        guard let url = fileURL(for: fileName),
              FileManager.default.fileExists(atPath: url.path) else { return nil }

        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Ошибка загрузки из кэша:", error)
            return nil
        }
    }
}
