//
//  NotificationBannerPresenter.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 24.07.2025.
//

import Foundation

// MARK: - NotificationBannerPresenter

final class NotificationBannerPresenter {
    var view: NotificationBannerViewProtocol?

    func show(message: String, type: Constants.BannerType, duration: Double = 2.5) {
        Task { @MainActor in
            view?.showBanner(message: message, type: type)
        }
        
        Task {
            try? await Task.sleep(nanoseconds: Constants.Timing.bannerDisplayDuration)
            await MainActor.run {
                view?.hideBanner()
            }
        }
    }
}



