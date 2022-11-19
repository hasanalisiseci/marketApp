//
//  CustomError.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import Foundation

enum CustomError: Error {
    case decodingError
    case dataError
    case urlError
    case responseError
    case noDataError
    case invalidTypeJsonError

    var message: String {
        switch self {
        case .decodingError:
            return "Decode Error"
        case .dataError:
            return "Check your internet connection."
        case .urlError:
            return "Url error"
        case .responseError:
            return "Response Error"
        case .noDataError:
            return "We can't find more movie. Please research with new keyword."
        case .invalidTypeJsonError:
            return "Invalid type json"
        }
    }
}
