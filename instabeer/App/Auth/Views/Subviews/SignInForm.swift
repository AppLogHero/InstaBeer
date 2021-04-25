//
//  SignInForm.swift
//  Feed
//
//  Created by Julien Delferiere on 21/02/2021.
//

import SwiftUI

struct SignInForm: View {
    
    @ObservedObject var viewModel: SignInViewModel
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sigInTitle)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.top, 24)
                .padding(.bottom, 8)
            Text(sigInSubtitle)
                .foregroundColor(Color.gray)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .padding(.bottom, 32)
            //MARK: - Strange bug on image name
            RoundedTextField(value: $email, placeholder: sigInEmailPlaceholder, image: "email-pic", contentType: .emailAddress, keyboardType: .emailAddress)
                .padding(.bottom, 8)
            RoundedTextField(value: $password, placeholder: sigInPasswordPlaceholder, image: lockStringValue, contentType: .password, keyboardType: .default)
                .padding(.bottom, 16)
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text(sigInForgotPasswordButton)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(darkGray)
                })
            }
            .padding(.bottom, 16)
            BigButton(label: sigInButton) {
                self.viewModel.signIn(email: self.email, password: self.password)
            }
        }
    }
}
