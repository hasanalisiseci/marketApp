//
//  RequestType.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import Foundation

enum URLConstants: String {
    case baseURL = "https://casestudy-definex.herokuapp.com/"
    case loginKey = "login.json?"
    case emailKey = "email="
    case passwordKey = "&password="
    case firstEndpoint = "/discover_first_horizontal_list.json"
    case secondEndpoint = "/discover_second_horizontal_list.json"
    case thirthEndpoint = "/discover_thirth_two_column_list.json"
}

enum RequestType {
    case login(email: String, password: String)
    case firstDiscover
    case secondDiscover
    case thirthDiscover

    var endPoint: String {
        switch self {
        case let .login(email: email, password: password):
            return URLConstants.baseURL.rawValue + URLConstants.loginKey.rawValue + URLConstants.emailKey.rawValue + email + URLConstants.passwordKey.rawValue + password
        case .firstDiscover:
            return URLConstants.baseURL.rawValue + URLConstants.firstEndpoint.rawValue
        case .secondDiscover:
            return URLConstants.baseURL.rawValue + URLConstants.secondEndpoint.rawValue
        case .thirthDiscover:
            return URLConstants.baseURL.rawValue + URLConstants.thirthEndpoint.rawValue
        }
    }

    var httpMethod: HttpMethod {
        switch self {
        case .login(email: _, password: _):
            return .POST
        case .firstDiscover:
            return .GET
        case .secondDiscover:
            return .GET
        case .thirthDiscover:
            return .GET
        }
    }
}

enum HttpMethod: String {
    case GET
    case POST
}
