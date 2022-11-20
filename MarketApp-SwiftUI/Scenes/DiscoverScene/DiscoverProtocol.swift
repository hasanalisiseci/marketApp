//
//  DiscoverProtocol.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 20.11.2022.
//

import Foundation

protocol DiscoverViewModelProtocol: ObservableObject {
    var firstTypeProductList: [Product] { get set }
    var secondTypeProductList: [Product] { get set }
    var thirthTypeProductList: [Product] { get set }

    var alertMessage: String { get set }
    var showingAlert: Bool { get set }
    var isLoading: Bool { get set }

    func fetchProducts(productType: ProductType)
    func refreshPage()
}
