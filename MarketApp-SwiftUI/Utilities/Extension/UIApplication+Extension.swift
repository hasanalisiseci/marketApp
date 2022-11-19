//
//  UIApplication+Extension.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 18.11.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
