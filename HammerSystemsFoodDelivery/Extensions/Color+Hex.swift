//
//  Color+Hex.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 23.07.2025.
//

import SwiftUI

// MARK: - Color+Hex

extension Color {
    init(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
                              .replacingOccurrences(of: "#", with: "")
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        let r = Double((rgbValue >> 16) & 0xFF) / 255
        let g = Double((rgbValue >> 8) & 0xFF) / 255
        let b = Double(rgbValue & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
