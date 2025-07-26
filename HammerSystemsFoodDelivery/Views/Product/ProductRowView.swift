//
//  ProductRowView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI

// MARK: - ProductRowView

struct ProductRowView: View {
    let product: Product
    
    var body: some View {
        HStack(spacing: 16) {
            RemoteImageView(
                urlString: product.image,
                width: 132,
                height: 132
            )
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.custom(Constants.Fonts.semibold, size: 17))
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Text(product.description)
                    .font(.custom(Constants.Fonts.regular, size: 13))
                    .foregroundColor(Constants.Colors.mutedText)
                    .lineLimit(3)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("от \(Int(product.price)) $")
                        .font(.custom(Constants.Fonts.regular, size: 13))
                        .foregroundColor(Constants.Colors.accent)
                        .frame(width: 87, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Constants.Colors.accent, lineWidth: 1)
                        )
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.trailing, 10)
        .padding(.vertical, 24)
        .background(Constants.Colors.white)
        .frame(maxWidth: .infinity)
    }
}
