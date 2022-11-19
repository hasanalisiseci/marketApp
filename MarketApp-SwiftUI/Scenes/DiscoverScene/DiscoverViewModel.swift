//
//  DiscoverViewModel.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

class DiscoverViewModel: NSObject, ObservableObject {
    @Published var firstTypeProductStatus: ProductStatus = .none
    @Published var secondTypeProductStatus: ProductStatus = .none
    @Published var thirthTypeProductStatus: ProductStatus = .none

    @Published var firstTypeProductList: [Product] = []
    @Published var secondTypeProductList: [Product] = []
    @Published var thirthTypeProductList: [Product] = []

    @Published var alertMessage: String = ""
    @Published var showingAlert: Bool = false

    @Published var isLoading = false

    override init() {
        super.init()
        isLoading = true
        fetchProducts(productType: .first)
        fetchProducts(productType: .second)
        fetchProducts(productType: .thirth)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
        }
    }

    func refreshPage() {
        isLoading = true
        fetchProducts(productType: .first)
        fetchProducts(productType: .second)
        fetchProducts(productType: .thirth)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
        }
    }

    func fetchProducts(productType: ProductType) {
        let type: RequestType
        switch productType {
        case .first:
            type = .firstDiscover
        case .second:
            type = .secondDiscover
        case .thirth:
            type = .thirthDiscover
        }
        NetworkManager.shared.fetchProducts(with: type) { [weak self] (result: Result<ProductModel, CustomError>) in
            switch result {
            case let .success(success):
                switch productType {
                case .first:
                    self?.firstTypeProductStatus = .success
                    self?.firstTypeProductList = success.list
                case .second:
                    self?.secondTypeProductStatus = .success
                    self?.secondTypeProductList = success.list
                case .thirth:
                    self?.thirthTypeProductStatus = .success
                    self?.thirthTypeProductList = success.list
                }
            case let .failure(failure):
                switch productType {
                case .first:
                    self?.firstTypeProductStatus = .fail
                case .second:
                    self?.secondTypeProductStatus = .fail
                case .thirth:
                    self?.thirthTypeProductStatus = .fail
                }
                print("\(type.endPoint)", failure.message)
                self?.alertMessage = failure.message
            }
        }
    }
}

enum ProductStatus {
    case none
    case loading
    case success
    case fail
}
