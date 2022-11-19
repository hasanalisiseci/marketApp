//
//  Text+Extension.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

extension Text {
    public func foregroundLinearGradient(
        colors: [Color],
        startPoint: UnitPoint,
        endPoint: UnitPoint) -> some View {
        overlay {
            LinearGradient(
                colors: colors,
                startPoint: startPoint,
                endPoint: endPoint
            )
            .mask(
                self
            )
        }
    }
}
