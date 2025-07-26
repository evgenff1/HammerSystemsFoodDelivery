//
//  BannerCarouselView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 24.07.2025.
//

import SwiftUI

// MARK: - BannerCarouselView

struct BannerCarouselView: View {
    private let banners = Constants.Images.Custom.banners

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(banners, id: \.self) { name in
                    Image(name)
                        .scaledToFill()
                        .frame(width: 300, height: 112)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}
