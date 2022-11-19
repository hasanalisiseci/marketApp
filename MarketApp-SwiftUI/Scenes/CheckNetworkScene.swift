//
//  CheckNetworkScene.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct CheckNetworkScene: View {
    var body: some View {
        VStack {
            Text("Please check your\nnetwork connection!")
                .bold()
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Image(Image.wifiProblem).resizable().frame(width: 200, height: 200)
        }
    }
}

struct CheckNetworkScene_Previews: PreviewProvider {
    static var previews: some View {
        CheckNetworkScene()
    }
}
