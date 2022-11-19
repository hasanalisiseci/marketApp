//
//  TextFieldModifier.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 18.11.2022.
//

import Combine
import Foundation
import SwiftUI

struct TextFieldLimitModifer: ViewModifier {
    @Binding var value: String
    var length: Int

    func body(content: Content) -> some View {
        if #available(iOS 14, *) {
            content
                .onChange(of: $value.wrappedValue) {
                    value = String($0.prefix(length))
                }
        } else {
            content
                .onReceive(Just(value)) {
                    value = String($0.prefix(length))
                }
        }
    }
}

extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        modifier(TextFieldLimitModifer(value: value, length: length))
    }
}
