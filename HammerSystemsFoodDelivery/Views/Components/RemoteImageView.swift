//
//  RemoteImageView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI
import Kingfisher

// MARK: - RemoteImageView

struct RemoteImageView: View {
    let urlString: String
    let width: CGFloat?
    let height: CGFloat?
    
    var body: some View {
        if let url = URL(string: urlString) {
            KFImage(url)
                .placeholder {
                    ProgressView()
                        .frame(width: width, height: height)
                }
                .retry(maxCount: 3, interval: .seconds(2))
                .onFailure { error in
                    print("Image load error:", error)
                }
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .clipped()
        } else {
            Image(systemName: Constants.Images.System.placeholderImage)
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .foregroundColor(.gray)
        }
    }
}
