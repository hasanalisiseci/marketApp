//
//  LinearGradient+Extension.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

extension LinearGradient {
    static let loginButtonGradient = LinearGradient(gradient: Gradient(colors: [.green.opacity(0.5),
                                                                                .green.opacity(0.7),
                                                                                .green.opacity(0.9),
                                                                                .green.opacity(1.0)]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing)
    
    static let loginTitleTextGradient = LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.2),
                                                                                   .blue.opacity(0.4),
                                                                                   .blue.opacity(0.6),
                                                                                   .blue.opacity(0.8),
                                                                                   .blue.opacity(1.0)]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing)
}
