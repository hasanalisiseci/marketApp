//
//  LoginView.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var alertMessage: String = ""
    @State private var navigateIsActive: Bool = false
    @State private var showingAlert: Bool = false
    var body: some View {
        ZStack {
            NavigationLink(destination: TabbarView(letters: String(email.prefix(2).uppercased())), isActive: $navigateIsActive) { }
            VStack {
                Spacer()
                LoginTitleView()
                CustomTextField(field: $email,
                                placeholder: Constants.emailAddress,
                                iconName: "mail",
                                keyboardType: .emailAddress,
                                characterLimit: 35)
                CustomTextField(field: $password,
                                placeholder: Constants.password,
                                iconName: "lock.fill",
                                keyboardType: .asciiCapable,
                                characterLimit: 20)
                Spacer()

                Button {
                    loginViewModel.requestLogin(email: email, password: password) { result in
                        if result {
                            self.navigateIsActive = true
                        } else {
                            loginViewModel.showingAlert.toggle()
                        }
                    }
                } label: {
                    LoginButtonView()
                }

                HStack(spacing: 0) {
                    DashedLine()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .frame(width: 50, height: 3)
                    ForgotButtonView(action: loginViewModel.forgotPass)
                    DashedLine()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .padding(.leading, 3)
                        .frame(width: 50, height: 3)
                }.padding(.top, 30)

                HStack {
                    SocialMediaLoginButtonView(socialMediaType: .facebook, action: loginViewModel.facebookLogin)
                    Spacer()
                    SocialMediaLoginButtonView(socialMediaType: .twitter, action: loginViewModel.twitterLogin)
                }.padding()
            }.blur(radius: loginViewModel.loginStatus == .loading ? 20 : 0)
            if loginViewModel.loginStatus == .loading {
                TurningIconLoadingView()
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .alert(loginViewModel.alertMessage, isPresented: $loginViewModel.showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
