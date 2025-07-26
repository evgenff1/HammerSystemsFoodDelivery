//
//  BottomActionView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI

// MARK: - BottomActionView

struct BottomActionView: View {
    let isEnabled: Bool
    let action: () -> Void
    let keyboardIsShown: Bool

    var body: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: 20)

            HStack {
                Spacer().frame(width: 16)

                Button(action: action) {
                    Text(Constants.Text.Auth.enter)
                        .foregroundColor(.white)
                        .font(.custom(Constants.Fonts.semibold, size: 16))
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                }
                .disabled(!isEnabled)
                .padding(.horizontal, 16)
                .background(Constants.Colors.accent.opacity(isEnabled ? 1 : 0.4))
                .cornerRadius(25)

                Spacer().frame(width: 16)
            }

            Spacer().frame(height: keyboardIsShown ? 20 : 50)
        }
        .frame(height: keyboardIsShown ? 88 : 118)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(
            RoundedCornerShape(
                radius: 20,
                corners: [.topLeft, .topRight]
            )
        )
    }
}

