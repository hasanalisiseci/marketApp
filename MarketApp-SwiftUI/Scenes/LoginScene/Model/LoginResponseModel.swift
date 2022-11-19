//
//  LoginResponseModel.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import Foundation

// MARK: - LoginResponseModel

struct LoginResponseModel: Codable {
    let isSuccess: Bool
    let message, statusCode: String?
}
