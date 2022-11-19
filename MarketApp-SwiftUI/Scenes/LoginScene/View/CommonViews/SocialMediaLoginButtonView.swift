//
//  SocialMediaLoginButtonView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct SocialMediaLoginButtonView: View {
    var socialMediaType: SocialMediaLoginType
    var action: () -> Void

    var color: Color {
        switch socialMediaType {
        case .facebook:
            return .facebookBlue
        case .twitter:
            return .twitterBlue
        }
    }

    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(socialMediaType == .facebook ? Image.facebookLogo : Image.twitterLogo)
                    .resizable().frame(width: 20, height: 20)
                    .padding(.horizontal)
                Text(socialMediaType.rawValue).font(.body).bold().foregroundColor(.white)
            }
            .padding()
            .frame(width: (UIScreen.screenWidth - 60) / 2, height: 50)
            .background(color)
            .shadow(radius: 5)
            .cornerRadius(6)
            .foregroundColor(.black)
        }
    }
}

// struct SocialMediaLoginButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        SocialMediaLoginButtonView(title: "", action: action())
//    }
// }

enum SocialMediaLoginType: String {
    case facebook = "FACEBOOK"
    case twitter = "TWITTER"
}
