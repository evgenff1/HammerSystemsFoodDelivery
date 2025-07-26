//
//  CategoryViewProtocol.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 25.07.2025.
//

// MARK: - CategoryViewProtocol

protocol CategoryViewProtocol {
    func showCategories(_ categories: [String])
    func updateSelectedCategory(_ category: String)
}
