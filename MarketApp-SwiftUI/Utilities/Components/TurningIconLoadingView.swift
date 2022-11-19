//
//  TurningIconLoadingView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct TurningIconLoadingView: View {
    @State var angle: Double = 0.0
    @State var isAnimating = false
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }

    var body: some View {
        Button(action: {}, label: {
            Image(Image.XSembol)
                .resizable()
                .frame(width: UIScreen.screenWidth / 4, height: UIScreen.screenWidth / 4, alignment: .center)
                .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                .animation(self.foreverAnimation, value: isAnimating)
                .onAppear {
                    self.isAnimating = true
                }
        })
    }
}

struct TurningIconLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        TurningIconLoadingView()
    }
}
