//
//  MainTabView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI

// MARK: - MainTabView

struct MainTabView: View, NotificationBannerViewProtocol {
    @State private var isBannerVisible = false
    @State private var bannerMessage = ""
    @State private var bannerType: Constants.BannerType = .success
    @State private var selectedTab: Constants.Tab = .menu

    private let bannerPresenter: NotificationBannerPresenter

    init(bannerPresenter: NotificationBannerPresenter) {
        self.bannerPresenter = bannerPresenter
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                VStack(spacing: 0) {
                    Spacer(minLength: 0)

                    Group {
                        switch selectedTab {
                        case .menu:
                            ProductListView(bannerPresenter: bannerPresenter)
                        case .contacts:
                            ContactsView()
                        case .profile:
                            ProfileView()
                        case .cart:
                            CartView()
                        }
                    }

                    Spacer(minLength: 0)
                }
            }

            CustomTabBar(selectedTab: $selectedTab)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .overlay(alignment: .top) {
            if isBannerVisible {
                NotificationBannerView(
                    message: bannerMessage,
                    type: bannerType
                )
                .padding(.horizontal, 16)
                .transition(.move(edge: .top).combined(with: .opacity))
                .animation(.easeInOut, value: isBannerVisible)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            bannerPresenter.view = self
            bannerPresenter.show(
                message: "Вход выполнен успешно",
                type: .success
            )
        }
    }
    
    // MARK: - NotificationBannerViewProtocol

    func showBanner(message: String, type: Constants.BannerType) {
        bannerMessage = message
        bannerType = type
        isBannerVisible = true
    }

    func hideBanner() {
        isBannerVisible = false
    }
}

