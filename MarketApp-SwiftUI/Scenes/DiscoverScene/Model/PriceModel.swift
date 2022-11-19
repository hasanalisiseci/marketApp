//
//  PriceModel.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import Foundation

// MARK: - Price
struct Price: Codable, Hashable {
    let value: Double
    let currency: String
}
