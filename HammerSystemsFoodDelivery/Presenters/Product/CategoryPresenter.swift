//
//  CategoryPresenter.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import Foundation

// MARK: - CategoryPresenter

final class CategoryPresenter {
    var view: CategoryViewProtocol?

    let categoryService: CategoryServiceProtocol
    var categoriesInternal: [String] = []
    var selectedCategoryInternal: String = ""

    init(view: CategoryViewProtocol? = nil, categoryService: CategoryServiceProtocol = CategoryService()) {
        self.view = view
        self.categoryService = categoryService
    }
    
    // MARK: - Public Methods

    func loadCategories() {
        Task {
            do {
                let fetched = try await categoryService.fetchCategories()
                let sorted = fetched.sorted()
                categoriesInternal = sorted
                selectedCategoryInternal = sorted.first ?? ""

                view?.showCategories(sorted)
                view?.updateSelectedCategory(selectedCategoryInternal)
            } catch {
                print("Ошибка загрузки категорий:", error)
            }
        }
    }

    func selectCategory(_ category: String) {
        guard category != selectedCategoryInternal else { return }
        selectedCategoryInternal = category
        view?.updateSelectedCategory(category)
    }
}
