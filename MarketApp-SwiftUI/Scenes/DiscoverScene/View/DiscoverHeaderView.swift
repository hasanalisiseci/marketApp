//
//  DiscoverHeaderView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct DiscoverHeaderView: View {
    var letters: String
    var body: some View {
        HStack(spacing: 20) {
            Text(letters)
                .bold()
                .font(.title3)
                .background(Circle()
                    .fill(LinearGradient(colors: [.purple, .red, .pink], startPoint: .leading, endPoint: .trailing))
                    .frame(width: 35, height: 35))
            Text(Constants.home)
                .bold()
                .font(.largeTitle)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical)
    }
}

struct DiscoverHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverHeaderView(letters: "TE")
    }
}
