//
//  NotificationBannerView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 24.07.2025.
//

import SwiftUI

// MARK: - NotificationBannerView

struct NotificationBannerView: View {
    let message: String
    let type: Constants.BannerType

    var body: some View {
        ZStack {
            Text(message)
                .font(.custom(Constants.Fonts.semibold, size: 13))
                .foregroundColor(type.textColor)
            
            HStack {
                Spacer()
                Image(type.iconName)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .padding(.trailing, 16 + 1)
            }
        }
        .frame(height: 50)
        .padding(.horizontal, 16)
        .background(type.backgroundColor.opacity(0.85))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.12), radius: 8, x: 0, y: 4)
    }
}


