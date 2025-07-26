//
//  LoginPresenter.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import Foundation

// MARK: - LoginPresenter

final class LoginPresenter {
    var view: LoginViewProtocol?

    var username: String = ""
    var password: String = ""

    func updateUsername(_ text: String) {
        username = text
    }

    func updatePassword(_ text: String) {
        password = text
    }

    func canLogin() -> Bool {
        return !username.isEmpty && !password.isEmpty
    }

    func login() {
        if username == "Qwerty1234" && password == "Qwerty1234" {
            view?.navigateToMainScreen()
        } else {
            view?.showLoginError(message: "Неверный логин или пароль")
        }
    }
}

