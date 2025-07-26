//
//  Constants.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI

enum Constants {
    
    // MARK: - Tab Identifiers
    enum Tab: Hashable {
        case menu, contacts, profile, cart
    }
    
    // MARK: - API Configuration
    enum API {
        static let scheme = "https"
        static let host = "fakestoreapi.com"
        
        enum Paths {
            static let products = "/products"
            static let productCategories = "/products/categories"
        }
    }
    
    // MARK: - Network Error Messages
    enum NetworkError {
        static let badURL = "Invalid URL. Please try again later."
        static let invalidResponse = "The server returned an invalid response."
        static let decodingFailed = "Failed to decode data from the server."
        static let serverError = "Server error: "
    }
    
    // MARK: - UI Text Constants
    enum Text {
        enum MainTabs {
            static let menu = "Меню"
            static let contacts = "Контакты"
            static let profile = "Профиль"
            static let cart = "Корзина"
        }
        enum City {
            static let defaultCity = "Москва"
            static let available = ["Москва", "Санкт-Петербург", "Казань"]
        }
        enum Auth {
            static let login = "Логин"
            static let password = "Пароль"
            static let enter = "Войти"
            static let authTitle = "Авторизация"
        }
    }
    
    // MARK: - Image Asset Names
    enum Images {
        enum System {
            static let placeholderImage = "tshirt"
        }
        enum Custom {
            static let menu = "tab_menu"
            static let contacts = "tab_contacts"
            static let profile = "tab_profile"
            static let cart = "tab_cart"
            static let arrowDown = "arrowDown"
            static let banners = ["banner1", "banner2"]
            static let successIcon = "icon_success"
            static let errorIcon = "icon_error"
            static let logoWhite = "logo_white"
            static let logo = "logo"
            static let loginIcon = "icon_login"
            static let passwordIcon = "icon_password"
            static let eyeOpen = "eye_open"
            static let eyeClosed = "eye_closed"
        }
    }
    
    // MARK: - Fonts
    enum Fonts {
        static let regular = "SFUIDisplay-Regular"
        static let bold = "SFUIDisplay-Bold"
        static let semibold = "SFUIDisplay-Semibold"
    }
    
    // MARK: - Colors
    enum Colors {
        static let accent = Color(hex: "#FD3A69")
        static let background = Color(hex: "#F3F5F9")
        static let mutedText = Color(hex: "#AAAABD")
        static let divider = Color(hex: "#F3F5F9")
        static let tabInactive = Color(hex: "#C3C4C9")
        static let success = Color(hex: "#10C425")
        static let border = Color(hex: "#AAAAAD")
        static let white = Color.white
    }
    
    // MARK: - Coordinate Spaces
    enum CoordinateSpaces {
        static let scroll = "scroll"
    }
    
    // MARK: - Timing
    enum Timing {
        static let bannerDisplayDuration: UInt64 = 2_500_000_000
        static let loginErrorBannerDuration: UInt64 = 2_500_000_000
        static let splashDelayDuration: UInt64 = 1_000_000_000

        static let scrollCategoryAdjustDelay: UInt64 = 360_000_000
        static let scrollCategoryFinalDelay: UInt64 = 440_000_000 
    }
    
    // MARK: - Banner
    enum BannerType {
        case success, error
        
        var backgroundColor: Color { Constants.Colors.white }
        
        var textColor: Color {
            switch self {
            case .error: return Constants.Colors.accent
            case .success: return Constants.Colors.success
            }
        }
        
        var iconName: String {
            switch self {
            case .error: return Constants.Images.Custom.errorIcon
            case .success: return Constants.Images.Custom.successIcon
            }
        }
    }
}

