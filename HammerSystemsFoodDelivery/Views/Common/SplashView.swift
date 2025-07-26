//
//  SplashView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 24.07.2025.
//

import SwiftUI

// MARK: - SplashView

struct SplashView: View {
    @State private var isActive = false
    let bannerPresenter: NotificationBannerPresenter

    var body: some View {
        if isActive {
            NavigationView {
                LoginView(bannerPresenter: bannerPresenter)
                    .navigationBarHidden(true)
            }
        } else {
            VStack {
                Spacer()
                Image(Constants.Images.Custom.logoWhite)
                    .resizable()
                    .frame(height: 103)
                    .padding(.horizontal, 26)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Constants.Colors.accent)
            .ignoresSafeArea()
            .onAppear {
                Task {
                    try? await Task.sleep(nanoseconds: Constants.Timing.splashDelayDuration)
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
