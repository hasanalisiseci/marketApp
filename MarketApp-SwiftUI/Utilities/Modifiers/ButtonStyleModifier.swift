//
//  ButtonStyleModifier.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI



struct LoginButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: UIScreen.screenWidth - 32, height: 50)
            .background(LinearGradient.loginButtonGradient)
            .cornerRadius(6)
            .shadow(radius: 10)
            .foregroundColor(.black)
    }
}

struct SocialMediaLoginButtonStyle: ButtonStyle {
    var color: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: (UIScreen.screenWidth - 60) / 2, height: 50)
            .background(color)
            .shadow(radius: 5)
            .cornerRadius(6)
            .foregroundColor(.black)
    }
}

struct ForgotButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal)
            .padding(.vertical, 5)
            .overlay(Capsule(style: .continuous).stroke(Color.forgotBlue, lineWidth: 3))
    }
}
