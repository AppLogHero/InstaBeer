//
//  RoundedTextField.swift
//  Feed
//
//  Created by Julien Delferiere on 21/02/2021.
//

import SwiftUI

struct RoundedTextField: View {
    
    @Binding var value: String
    var placeholder: String
    var image: String
    var contentType: UITextContentType
    var keyboardType: UIKeyboardType
    
    var body: some View {
        HStack {
            Image(image)
                .frame(width: 21, height: 24, alignment: .center)
                .foregroundColor(.gray)
                .padding(.leading, 8)
            Group {
                if contentType == .password {
                    SecureField(placeholder, text: $value)
                        .padding(.trailing, 8)
                        .textContentType(contentType)
                        .keyboardType(keyboardType)
                        .foregroundColor(primary)
                        .placeHolder(Text(placeholder).foregroundColor(primary), show: value.isEmpty)
                } else {
                    TextField(placeholder, text: $value)
                        .padding(.trailing, 8)
                        .textContentType(contentType)
                        .keyboardType(keyboardType)
                        .foregroundColor(primary)
                        .placeHolder(Text(placeholder).foregroundColor(primary), show: value.isEmpty)
                }
            }
        }
        .frame(width: screenWidth - 32, height: 52, alignment: .center)
        .background(lightGray)
        .cornerRadius(10)
        //.shadow(radius: 4)
    }
}
