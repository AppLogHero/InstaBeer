//
//  SignUpView.swift
//  Feed
//
//  Created by Julien Delferiere on 21/02/2021.
//

import SwiftUI

struct SignUpView: View {
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var repeatPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(signUpTitle)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.top, 24)
                .padding(.bottom, 8)
            Text(signUpSubtitle)
                .foregroundColor(Color.gray)
                .fontWeight(.medium)
                .padding(.bottom, 32)
            RoundedTextField(value: $username, placeholder: signUpUsernamePlaceholder, image: accountStringValue, contentType: .name, keyboardType: .default)
                .padding(.bottom, 8)
            //MARK: - Strange bug on image name
            RoundedTextField(value: $email, placeholder: signUpEmailPlaceholder, image: "email-pic", contentType: .emailAddress, keyboardType: .emailAddress)
                .padding(.bottom, 8)
            RoundedTextField(value: $password, placeholder: signUpPasswordPlaceholder, image: lockStringValue, contentType: .password, keyboardType: .default)
                .padding(.bottom, 8)
            RoundedTextField(value: $repeatPassword, placeholder: signUpRepeatPasswordPlaceholder, image: lockStringValue, contentType: .password, keyboardType: .default)
                .padding(.bottom, 16)
            BigButton(label: signUpButton) {
                print("")
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    print("Go SignIn")
                }, label: {
                    Text(signUpGoSignInButton)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(darkGray)
                        .multilineTextAlignment(.center)
                })
                Spacer()
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
