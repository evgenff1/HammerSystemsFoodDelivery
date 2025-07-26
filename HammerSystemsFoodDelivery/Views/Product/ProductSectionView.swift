//
//  ProductSectionView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 25.07.2025.
//

import SwiftUI

// MARK: - ProductSectionView

struct ProductSectionView: View {
    let category: String
    let products: [Product]
    @Binding var selectedCategory: String
    @Binding var isCategoryTapScrolling: Bool
    let onSelectCategory: (String) -> Void

    var body: some View {
        VStack(spacing: 0) {
            CategorySectionObserver(category: category.lowercased()) { visibleCategory in
                if !isCategoryTapScrolling && visibleCategory != selectedCategory {
                    withAnimation {
                        selectedCategory = visibleCategory
                        onSelectCategory(visibleCategory)
                    }
                }
            }

            Color.clear.frame(height: 1).id(category.lowercased())

            ForEach(products, id: \.id) { product in
                ProductRowWithNavigation(product: product)
            }
        }
    }
}
