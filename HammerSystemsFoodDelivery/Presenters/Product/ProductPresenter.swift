//
//  ProductPresenter.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import Foundation

// MARK: - ProductPresenter

final class ProductPresenter {
    var view: ProductListViewProtocol?

    let productService: ProductServiceProtocol
    var products: [Product] = []
    var isLoading = false

    init(view: ProductListViewProtocol? = nil, productService: ProductServiceProtocol = ProductService()) {
        self.view = view
        self.productService = productService
    }
    
    // MARK: - Public Methods
    
    func loadProducts() {
        isLoading = true
        Task {
            defer { isLoading = false }
            do {
                self.products = try await productService.fetchProducts()
                view?.reloadData(products: self.products)
            } catch {
                print("Ошибка загрузки продуктов: \(error)")
            }
        }
    }

    func product(by id: Int) -> Product? {
        products.first { $0.id == id }
    }

    func groupedProductsByCategory() -> [(key: String, value: [Product])] {
        Dictionary(grouping: products, by: { $0.category })
            .sorted { $0.key < $1.key }
    }
}
