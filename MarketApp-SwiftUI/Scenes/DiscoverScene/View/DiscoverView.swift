//
//  DiscoverView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject var discoverViewModel: DiscoverViewModel
    @State var showingAlert = false

    var letters: String
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(discoverViewModel.firstTypeProductList, id: \.self) { item in
                            Button {
                                FirebaseManager.shared.logProductDetail(title: "\(item.listDescription.prefix(15))", discount: item.discount)
                                showingAlert.toggle()
                            } label: {
                                ProductCell(product: item, productType: .first)
                            }
                        }.redacted(reason: discoverViewModel.isLoading ? .placeholder : [])
                    }.padding(.horizontal)
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(discoverViewModel.secondTypeProductList, id: \.self) { item in
                            Button {
                                FirebaseManager.shared.logProductDetail(title: "\(item.listDescription.prefix(15))", discount: item.discount)
                                showingAlert.toggle()
                            } label: {
                                ProductCell(product: item, productType: .second)
                            }
                        }.redacted(reason: discoverViewModel.isLoading ? .placeholder : [])
                    }.padding(.horizontal)
                }
                LazyVGrid(columns: StaticColumns.adaptiveColumns, spacing: 20) {
                    ForEach(discoverViewModel.thirthTypeProductList, id: \.self) { item in

                        Button {
                            FirebaseManager.shared.logProductDetail(title: "\(item.listDescription.prefix(15))", discount: item.discount)
                            showingAlert.toggle()
                        } label: {
                            
                                ProductCell(product: item, productType: .thirth)
                                                   }
                    }.redacted(reason: discoverViewModel.isLoading ? .placeholder : [])
                }
                .padding(.horizontal)
            }
        }
        .alert(Constants.logWithFirebase, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
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
