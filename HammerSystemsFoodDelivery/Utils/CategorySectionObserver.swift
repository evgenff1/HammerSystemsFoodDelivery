//
//  CategorySectionObserver.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 25.07.2025.
//

import SwiftUI

// MARK: - CategorySectionObserver

struct CategorySectionObserver: View {
    let category: String
    let onVisible: (String) -> Void

    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(key: VisibleCategoryPreferenceKey.self, value: [VisibleCategory(id: category, minY: geo.frame(in: .named(Constants.CoordinateSpaces.scroll)).minY)])
        }
        .frame(height: 0)
    }
}

// MARK: - VisibleCategory

struct VisibleCategory: Equatable {
    let id: String
    let minY: CGFloat
}

// MARK: - VisibleCategoryPreferenceKey

struct VisibleCategoryPreferenceKey: PreferenceKey {
    static var defaultValue: [VisibleCategory] = []

    static func reduce(value: inout [VisibleCategory], nextValue: () -> [VisibleCategory]) {
        value.append(contentsOf: nextValue())
    }
}

