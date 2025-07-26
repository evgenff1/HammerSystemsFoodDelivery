//
//  HammerSystemsFoodDeliveryApp.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI

// MARK: - HammerSystemsFoodDeliveryApp

@main
struct HammerSystemsFoodDeliveryApp: App {
    private let notificationBannerPresenter = NotificationBannerPresenter()

    var body: some Scene {
        WindowGroup {
            SplashView(bannerPresenter: notificationBannerPresenter)
        }
    }
}
