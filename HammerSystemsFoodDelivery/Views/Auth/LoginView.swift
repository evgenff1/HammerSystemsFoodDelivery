//
//  LoginView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI

// MARK: - LoginView

struct LoginView: View, LoginViewProtocol {
    @State private var username = ""
    @State private var password = ""
    @State private var isAuthenticated = false
    @State private var showLocalBanner = false
    @State private var localBannerMessage = ""
    @State private var keyboardIsShown = false
    @State private var keyboardHeight: CGFloat = 0

    private let bannerPresenter: NotificationBannerPresenter
    private let presenter = LoginPresenter()

    init(bannerPresenter: NotificationBannerPresenter) {
        self.bannerPresenter = bannerPresenter
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    Text(Constants.Text.Auth.authTitle)
                        .font(.custom(Constants.Fonts.semibold, size: 16))
                        .padding(.top, 24)

                    Spacer().frame(height: keyboardIsShown ? 30 : 135)

                    Image(Constants.Images.Custom.logo)
                        .resizable()
                        .frame(height: 103)
                        .padding(.horizontal, 26)

                    Spacer().frame(height: 32)

                    AuthFieldView(
                        iconName: Constants.Images.Custom.loginIcon,
                        placeholder: Constants.Text.Auth.login,
                        text: Binding(
                            get: { self.username },
                            set: {
                                self.username = $0
                                presenter.updateUsername($0)
                            }
                        )
                    )
                    .padding(.bottom, 8)
                    .padding(.horizontal, 16)

                    AuthFieldView(
                        iconName: Constants.Images.Custom.passwordIcon,
                        placeholder: Constants.Text.Auth.password,
                        text: Binding(
                            get: { self.password },
                            set: {
                                self.password = $0
                                presenter.updatePassword($0)
                            }
                        ),
                        isSecure: true,
                        showToggle: true
                    )
                    .padding(.horizontal, 16)

                    Spacer()
                }

                BottomActionView(
                    isEnabled: presenter.canLogin(),
                    action: {
                        presenter.login()
                    },
                    keyboardIsShown: keyboardIsShown
                )
                .padding(.bottom, keyboardIsShown ? keyboardHeight : -geo.safeAreaInsets.bottom)

                NavigationLink(destination: MainTabView(bannerPresenter: bannerPresenter),
                               isActive: $isAuthenticated) {
                    EmptyView()
                }
            }
            .onAppear { presenter.view = self }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                guard let userInfo = notification.userInfo,
                      let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
                      let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                let height = frame.height - geo.safeAreaInsets.bottom
                withAnimation(.easeOut(duration: duration)) {
                    keyboardIsShown = true
                    keyboardHeight = height
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
                guard let userInfo = notification.userInfo,
                      let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
                withAnimation(.easeOut(duration: duration)) {
                    keyboardIsShown = false
                    keyboardHeight = 0
                }
            }
            .background(Constants.Colors.background.ignoresSafeArea())
            .overlay(alignment: .top) {
                if showLocalBanner {
                    NotificationBannerView(
                        message: localBannerMessage,
                        type: .error
                    )
                    .padding(.horizontal, 16)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.easeInOut(duration: 0.3), value: showLocalBanner)
                }
            }
        }
        .ignoresSafeArea(.keyboard)
    }
    
    // MARK: - LoginViewProtocol
    
    func showLoginError(message: String) {
        localBannerMessage = message
        showLocalBanner = true
        
        Task {
            try? await Task.sleep(nanoseconds: Constants.Timing.loginErrorBannerDuration)
            await MainActor.run {
                showLocalBanner = false
            }
        }
    }

    func navigateToMainScreen() {
        isAuthenticated = true
    }
}
