//
//  TabbarView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct TabbarView: View {
    @ObservedObject var discoverViewModel = DiscoverViewModel()
    @State var selection = 0
    var letters: String

    var body: some View {
        TabView(selection: $selection) {
            DiscoverView(discoverViewModel: discoverViewModel, letters: letters)
                .tabItem {
                    selection == 0 ? Image(systemName: "bag") : Image(systemName: "bag.fill")
                    Text(Constants.home)
                }
                .tag(0)

            Text(Constants.favorites)
                .navigationTitle("")
                .tabItem {
                    selection == 1 ? Image(systemName: "star") : Image(systemName: "star.fill")
                    Text(Constants.favorites)
                }
                .tag(1)

            Text(Constants.cart)
                .navigationTitle("")
                .tabItem {
                    selection == 2 ? Image(systemName: "cart") : Image(systemName: "cart.fill")
                    Text(Constants.cart)
                }
                .tag(2)

            Text(Constants.tags)
                .navigationTitle("")
                .tabItem {
                    selection == 3 ? Image(systemName: "tag") : Image(systemName: "tag.fill")
                    Text(Constants.tags)
                }
                .tag(3)

            Text(Constants.settings)
                .navigationTitle("")
                .tabItem {
                    selection == 4 ? Image(systemName: "person") : Image(systemName: "person.fill")
                    Text(Constants.settings)
                }
                .tag(4)
        }

        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                DiscoverHeaderView(letters: letters)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(letters: "TE")
    }
}
