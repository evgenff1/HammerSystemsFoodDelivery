//
//  CitySelectorView.swift
//  HammerSystemsFoodDelivery
//
//  Created by Evgeniy Fakhretdinov on 24.07.2025.
//

import SwiftUI

// MARK: - CitySelectorView

struct CitySelectorView: View {
    @State private var selectedCity = Constants.Text.City.defaultCity
    private let cities = Constants.Text.City.available

    var body: some View {
        HStack(spacing: 8) {
            Menu {
                ForEach(cities, id: \.self) { city in
                    Button(city) { selectedCity = city }
                }
            } label: {
                HStack(spacing: 4) {
                    Text(selectedCity)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.black)
                    Image(Constants.Images.Custom.arrowDown)
                        .resizable()
                        .frame(width: 8, height: 5)
                        .foregroundColor(.black)
                }
                .frame(height: 20)
            }

            Spacer()
        }
        .padding(.leading, 16)
        .padding(.top, 16)
    }
}
