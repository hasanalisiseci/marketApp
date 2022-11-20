//
//  TitleView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct LoginTitleView: View {
    var body: some View {
        Text("MarketApp")
            .foregroundLinearGradient(
                colors: [.blue,
                         .blue.opacity(0.9),
                         .blue.opacity(0.8),
                         .blue.opacity(0.7),
                         .blue.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(width: UIScreen.screenWidth - 180)
            .font(.system(size: 32, weight: .black))
            .multilineTextAlignment(.center)
    }
}

struct LoginTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTitleView()
    }
}
