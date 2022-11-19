//
//  LoginButtonView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct LoginButtonView: View {
    var body: some View {
        Text(Constants.login).bold().padding()
            .frame(width: UIScreen.screenWidth - 32, height: 50)
            .background(LinearGradient.loginButtonGradient)
            .cornerRadius(6)
            .shadow(radius: 10)
            .foregroundColor(.black)
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView()
    }
}
