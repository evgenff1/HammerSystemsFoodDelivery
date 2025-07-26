//
//  RoundedCornerShape.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 24.07.2025.
//

import SwiftUI

// MARK: - RoundedCornerShape

struct RoundedCornerShape: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
