//
//  ProductModel.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import Foundation

struct ProductModel: Codable {
    let isSuccess: Bool
    let message, statusCode: String
    let list: [Product]
}

// MARK: - List
struct Product: Codable, Hashable {
    let imageURL: String
    let listDescription: String
    let price, oldPrice: Price?
    let discount: String
    let ratePercentage: Int?

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case listDescription = "description"
        case price
        case oldPrice = "old_price"
        case discount
        case ratePercentage = "rate_percentage"
    }
}

extension Product {
    static let mockProduct = Product(imageURL: "https://casestudy-definex.herokuapp.com/images/image3.jpeg",
                                     listDescription: "Perfect Shoes For Every Season",
                                     price: Price(value: 5.99, currency: "$"),
                                     oldPrice: Price(value: 9.99, currency: "$"),
                                     discount: "48% OFF",
                                     ratePercentage: 60)
}
