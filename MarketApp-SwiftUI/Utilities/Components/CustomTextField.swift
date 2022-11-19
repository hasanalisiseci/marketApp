//
//  CustomTextField.swift
//  MarketApp-SwiftUI
//
//  Created by Hasan Ali Şişeci on 19.11.2022.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var field: String
    let placeholder: String
    let iconName: String
    let keyboardType: UIKeyboardType
    let characterLimit: Int

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(field.isEmpty ? "" : placeholder)
                    .font(.caption)
                Spacer()
            }
            HStack {
                if placeholder == Constants.password {
                    SecureField(placeholder, text: $field)
                        .font(.body).bold()
                        .keyboardType(keyboardType)
                        .limitInputLength(value: $field, length: characterLimit)
                } else {
                    TextField(placeholder, text: $field)
                        .font(.body).bold()
                        .keyboardType(keyboardType)
                        .limitInputLength(value: $field, length: characterLimit)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                }

                Spacer()
                Image(systemName: iconName)
            }
            Rectangle().frame(width: UIScreen.screenWidth - 32, height: 2).foregroundColor(field.isEmpty ? .black : .blue)
        }.padding()
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(field: .constant(""), placeholder: "E-mail address", iconName: "bag", keyboardType: .emailAddress, characterLimit: 20)
    }
}
