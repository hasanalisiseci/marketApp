//
//  ForgotButtonView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct ForgotButtonView: View {
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(Constants.forgotPass)
                .font(.system(size: 12))
                .padding(.horizontal)
                .padding(.vertical, 5)
                .overlay(Capsule(style: .continuous).stroke(Color.forgotBlue, lineWidth: 3))
        }
    }
}

// struct ForgotButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForgotButtonView()
//    }
// }
