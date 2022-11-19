//
//  TabbarView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct TabbarView: View {
    var letters: String
    @State var selection = 0
    @ObservedObject var discoverViewModel = DiscoverViewModel()

    var body: some View {
        TabView(selection: $selection) {
            DiscoverView(discoverViewModel: discoverViewModel, letters: letters)
                .tabItem {
                    selection == 0 ? Image(systemName: "bag") : Image(systemName: "bag.fill")
                    Text("Home")
                }
                .tag(0)

            Text("Favorites")
                .navigationTitle("")
                .tabItem {
                    selection == 1 ? Image(systemName: "star") : Image(systemName: "star.fill")
                    Text("Favorites")
                }
                .tag(1)

            Text("Cart")
                .navigationTitle("")
                .tabItem {
                    selection == 2 ? Image(systemName: "cart") : Image(systemName: "cart.fill")
                    Text("Cart")
                }
                .tag(2)

            Text("Tags")
                .navigationTitle("")
                .tabItem {
                    selection == 3 ? Image(systemName: "tag") : Image(systemName: "tag.fill")
                    Text("Tags")
                }
                .tag(3)

            Text("Settings")
                .navigationTitle("")
                .tabItem {
                    selection == 4 ? Image(systemName: "person") : Image(systemName: "person.fill")
                    Text("Settings")
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
