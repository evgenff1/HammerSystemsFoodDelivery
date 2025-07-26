//
//  ProductListView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI

// MARK: - ProductListView

struct ProductListView: View, ProductListViewProtocol, CategoryViewProtocol {
    @State private var presenter: ProductPresenter?
    @State private var categoryPresenter: CategoryPresenter?
    @State private var groupedProducts: [(key: String, value: [Product])] = []
    @State private var categories: [String] = []
    @State private var selectedCategory: String = ""
    @State private var isCategoryTapScrolling = false

    let bannerPresenter: NotificationBannerPresenter
    private let scrollSyncManager = ScrollSyncManager()

    var body: some View {
        VStack(spacing: 0) {
            CitySelectorView()
                .padding(.bottom, 24)

            ScrollViewReader { scrollProxy in
                ScrollView {
                    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                        BannerCarouselView()
                            .padding(.bottom, 24)
                            .background(Constants.Colors.background)

                        Section(header:
                            StickyCategoryMenu(
                                categories: categories,
                                selectedCategory: $selectedCategory,
                                onCategoryTap: { category in
                                    isCategoryTapScrolling = true
                                    scrollSyncManager.scrollToCategory(category, scrollProxy: scrollProxy) {
                                        isCategoryTapScrolling = false
                                    }
                                })
                        ) {
                            ForEach(groupedProducts, id: \.key) { category, products in
                                ProductSectionView(
                                    category: category,
                                    products: products,
                                    selectedCategory: $selectedCategory,
                                    isCategoryTapScrolling: $isCategoryTapScrolling,
                                    onSelectCategory: { categoryPresenter?.selectCategory($0) }
                                )
                            }
                        }
                    }
                    .background(Constants.Colors.white)
                    .onPreferenceChange(VisibleCategoryPreferenceKey.self) { values in
                        scrollSyncManager.handleVisibleCategories(
                            values,
                            currentSelected: selectedCategory,
                            isCategoryTapScrolling: isCategoryTapScrolling
                        ) { newCategory in
                            selectedCategory = newCategory
                            categoryPresenter?.selectCategory(newCategory)
                        }
                    }
                }
                .coordinateSpace(name: Constants.CoordinateSpaces.scroll)
                .background(Constants.Colors.background)
            }
        }
        .background(Constants.Colors.background)
        .navigationBarHidden(true)
        .onAppear {
            presenter = ProductPresenter(view: self)
            categoryPresenter = CategoryPresenter(view: self)

            presenter?.loadProducts()
            categoryPresenter?.loadCategories()
        }
    }

    // MARK: - ProductListViewProtocol

    func reloadData(products: [Product]) {
        groupedProducts = Dictionary(grouping: products, by: { $0.category })
            .sorted { $0.key < $1.key }
    }

    // MARK: - CategoryViewProtocol

    func showCategories(_ categories: [String]) {
        self.categories = categories
    }

    func updateSelectedCategory(_ category: String) {
        self.selectedCategory = category
    }
}
