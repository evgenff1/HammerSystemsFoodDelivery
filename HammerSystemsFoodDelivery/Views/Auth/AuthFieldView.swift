//
//  AuthFieldView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI

// MARK: - AuthFieldView

struct AuthFieldView: View {
    let iconName: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var showToggle: Bool = false

    @State private var showPassword = false
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(spacing: 10) {
            Image(iconName)
                .resizable()
                .frame(width: 18, height: 18)

            ZStack(alignment: .trailing) {
                Group {
                    if isSecure {
                        TextField(placeholder, text: $text)
                            .opacity(showPassword ? 1 : 0)
                            .focused($isFocused)
                        SecureField(placeholder, text: $text)
                            .opacity(showPassword ? 0 : 1)
                            .focused($isFocused)
                    } else {
                        TextField(placeholder, text: $text)
                            .focused($isFocused)
                    }
                }
                .font(.custom(Constants.Fonts.regular, size: 13))
                .textContentType(.oneTimeCode)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)

                if showToggle {
                    Button(action: {
                        showPassword.toggle()
                        isFocused = true
                    }) {
                        Image(showPassword ? Constants.Images.Custom.eyeOpen : Constants.Images.Custom.eyeClosed)
                            .resizable()
                            .frame(width: 18, height: 18)
                    }
                }
            }
        }
        .frame(height: 50)
        .padding(.horizontal, 16)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Constants.Colors.border, lineWidth: 2)
        )
        .background(Color.white)
        .cornerRadius(20)
    }
}
