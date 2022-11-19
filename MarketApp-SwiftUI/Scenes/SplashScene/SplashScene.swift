//
//  SplashScene.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 20.11.2022.
//

import SwiftUI

struct SplashScene: View {
    var title: String
    var body: some View {
        VStack {
            Text(title)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .bold()
        }
    }
}

struct SplashScene_Previews: PreviewProvider {
    static var previews: some View {
        SplashScene(title: "")
    }
}
