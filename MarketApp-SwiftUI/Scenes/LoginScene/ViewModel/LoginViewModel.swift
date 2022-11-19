//
//  LoginViewModel.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

class LoginViewModel: NSObject, ObservableObject {
    @Published var loginStatus: LoginStatus = .none
    @Published var response: LoginResponseModel = LoginResponseModel(isSuccess: false, message: "", statusCode: "")
    @Published var alertMessage: String = ""
    @Published var showingAlert: Bool = false

    func requestLogin(email: String, password: String, completion: @escaping (Bool) -> Void) {
        loginStatus = .loading

        if email.isEmpty || password.isEmpty {
            alertMessage = Constants.loginInfoEmpty
            completion(false)
            loginStatus = .fail
            return
        }
        if !mailIsValid(email: email) {
            alertMessage = Constants.invalidMailAlertMessage
            completion(false)
            loginStatus = .fail
            return
        }
        DispatchQueue.main.async {
            NetworkManager.shared.loginRequest(with: .login(email: email, password: password), email: email, password: password) { [weak self] result in
                switch result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let json = try JSONSerialization.data(withJSONObject: data)
                        self?.response = try decoder.decode(LoginResponseModel.self, from: json)
                        self?.loginStatus = .success
                        completion(true)

                    } catch {
                        self?.loginStatus = .fail
                        self?.alertMessage = error.localizedDescription
                        completion(false)
                    }
                case let .failure(failure):
                    self?.loginStatus = .fail
                    self?.alertMessage = failure.message
                    completion(false)
                }
            }
        }
    }

    func forgotPass() {
        alertMessage = "Forgot Password is Coming Soon"
        showingAlert.toggle()
    }

    func facebookLogin() {
        alertMessage = "Facebook Login is Coming Soon"
        showingAlert.toggle()
    }

    func twitterLogin() {
        alertMessage = "Twitter Login is Coming Soon"
        showingAlert.toggle()
    }
}

enum LoginStatus {
    case none
    case loading
    case success
    case fail
}

extension LoginViewModel {
    private func mailIsValid(email: String) -> Bool {
        do {
            let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$"#
            let emailRegex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let range = NSRange(location: 0, length: email.count)
            if emailRegex.firstMatch(in: email, options: [], range: range) != nil {
                return true
            } else {
                alertMessage = Constants.invalidMailAlertMessage
                return false
            }
        } catch let error {
            print(error.localizedDescription)
            alertMessage = Constants.invalidMailAlertMessage
            return false
        }
    }
}
