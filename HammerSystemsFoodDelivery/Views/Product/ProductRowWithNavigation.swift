//
//  ProductRowWithNavigation.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI

// MARK: - ProductRowWithNavigation

struct ProductRowWithNavigation: View {
    let product: Product
    
    var body: some View {
        VStack(spacing: 0) {
            ProductRowView(product: product)
                .buttonStyle(PlainButtonStyle())
            Divider()
                .frame(height: 0.5)
                .background(Constants.Colors.divider)
        }
    }
}
