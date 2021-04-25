//
//  SignInView.swift
//  Feed
//
//  Created by Julien Delferiere on 21/02/2021.
//

import SwiftUI

struct SignInView: View {

    @ObservedObject var viewModel: SignInViewModel
    @State var signUpIsShow: Bool = false
    @State var mainIsShow: Bool = false
    
    var body: some View {
        VStack {
            SignInForm(viewModel: viewModel)
            VStack {
                Spacer()
                Text(sigInOrLabel)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(darkGray)
                Spacer()
                BigButtonBordered(label: sigInWithGoogleButton, image: googleStringValue, action: {
                    print("")
                })
                .padding(.bottom, 16)
                BigButtonBordered(label: sigInWithFacebookButton, image: facebookStringValue, action: {
                    print("")
                })
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.signUpIsShow.toggle()
                }, label: {
                    Text(sigInGoTuSignUpButton)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(darkGray)
                        .multilineTextAlignment(.center)
                })
                .fullScreenCover(isPresented: $signUpIsShow, content: {
                    SignUpView()
                })
                Spacer()
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .fullScreenCover(isPresented: $mainIsShow, content: {
            MainTabView()
        })
        .onReceive(viewModel.$isLoading, perform: { isLoading in
            if isLoading {
                
            } else {
                
            }
        })
        .onReceive(viewModel.$state, perform: { state in
            switch state {
            case .error:
                Logging.error("SignIn Error")
            case .init_state:
                Logging.verbose("SignIn Init")
            case .is_signin:
                Logging.info("SignIn Success, go main")
                self.mainIsShow.toggle()
            case .empty_credantial:
                Logging.error("SignIn Error, empty credantial")
            case .wrong_pattern:
                Logging.error("SignIn Error, wrong email pattern")
            }
        })
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel(SessionStore()))
    }
}
