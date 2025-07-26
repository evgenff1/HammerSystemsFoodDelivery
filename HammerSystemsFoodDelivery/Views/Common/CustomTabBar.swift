//
//  CustomTabBar.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 25.07.2025.
//

import SwiftUI

// MARK: - CustomTabBar

struct CustomTabBar: View {
    @Binding var selectedTab: Constants.Tab

    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Constants.Colors.tabInactive)
                .frame(height: 1)

            HStack(spacing: 0) {
                tabItem(tab: .menu, imageName: Constants.Images.Custom.menu, label: Constants.Text.MainTabs.menu)
                Spacer()
                tabItem(tab: .contacts, imageName: Constants.Images.Custom.contacts, label: Constants.Text.MainTabs.contacts)
                Spacer()
                tabItem(tab: .profile, imageName: Constants.Images.Custom.profile, label: Constants.Text.MainTabs.profile)
                Spacer()
                tabItem(tab: .cart, imageName: Constants.Images.Custom.cart, label: Constants.Text.MainTabs.cart)
            }
            .padding(.bottom, 30)
            .frame(height: 82)
            .background(Constants.Colors.white)
        }
    }
    
    // MARK: - Private Helpers

    private func tabItem(tab: Constants.Tab, imageName: String, label: String) -> some View {
        let isSelected = selectedTab == tab

        return VStack(spacing: 4) {
            Image(imageName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 20)
                .foregroundColor(isSelected ? Constants.Colors.accent : Constants.Colors.tabInactive)

            Text(label)
                .font(.custom(Constants.Fonts.regular, size: 13))
                .foregroundColor(isSelected ? Constants.Colors.accent : Constants.Colors.tabInactive)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .onTapGesture { selectedTab = tab }
    }
}
