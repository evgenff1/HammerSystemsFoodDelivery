//
//  StickyCategoryMenu.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 25.07.2025.
//

import SwiftUI

// MARK: - StickyCategoryMenu

struct StickyCategoryMenu: View {
    let categories: [String]
    @Binding var selectedCategory: String
    let onCategoryTap: (String) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(categories, id: \.self) { category in
                    let isSelected = (selectedCategory == category)
                    Text(category.capitalized.replacingOccurrences(of: " ", with: "\n"))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .font(.custom(isSelected ? Constants.Fonts.bold : Constants.Fonts.regular, size: 13))
                        .foregroundColor(Constants.Colors.accent.opacity(isSelected ? 1 : 0.4))
                        .frame(width: 88, height: 32)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(isSelected ? Constants.Colors.accent.opacity(0.4) : Color.clear)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Constants.Colors.accent.opacity(0.4), lineWidth: isSelected ? 0 : 1)
                        )
                        .onTapGesture {
                            withAnimation {
                                selectedCategory = category
                            }
                            onCategoryTap(category)
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.bottom, 24)
        .background(Constants.Colors.background)
    }
}
