//
//  DiscoverViewModel.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI



class DiscoverViewModel: NSObject, DiscoverViewModelProtocol {
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
                    self?.firstTypeProductList = success.list
                case .second:
                    self?.secondTypeProductList = success.list
                case .thirth:
                    self?.thirthTypeProductList = success.list
                }
            case let .failure(failure):
                print("\(type.endPoint)", failure.message)
                self?.alertMessage = failure.message
            }
        }
    }
}

