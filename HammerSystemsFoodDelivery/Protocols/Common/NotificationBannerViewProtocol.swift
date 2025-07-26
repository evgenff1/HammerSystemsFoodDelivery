//
//  NotificationBannerViewProtocol.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 25.07.2025.
//

// MARK: - NotificationBannerViewProtocol

protocol NotificationBannerViewProtocol {
    func showBanner(message: String, type: Constants.BannerType)
    func hideBanner()
}

