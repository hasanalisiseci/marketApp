//
//  DiscoverView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject var discoverViewModel: DiscoverViewModel

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var letters: String
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(discoverViewModel.firstTypeProductList, id: \.self) { item in
                            ProductCell(product: item, productType: .first)

                        }.redacted(reason: discoverViewModel.isLoading ? .placeholder : [])
                    }.padding(.horizontal)
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(discoverViewModel.secondTypeProductList, id: \.self) { item in
                            ProductCell(product: item, productType: .second)

                        }.redacted(reason: discoverViewModel.isLoading ? .placeholder : [])
                    }.padding(.horizontal)
                }
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(discoverViewModel.thirthTypeProductList, id: \.self) { item in
                        ProductCell(product: item, productType: .thirth)

                    }.redacted(reason: discoverViewModel.isLoading ? .placeholder : [])
                }
                .padding(.horizontal)
            }
        }.refreshable {
            discoverViewModel.refreshPage()
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(discoverViewModel: DiscoverViewModel(), letters: "TE")
    }
}
