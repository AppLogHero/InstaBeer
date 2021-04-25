//
//  SignInViewModel.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import Combine

enum SignInState {
    case error
    case init_state
    case is_signin
    case empty_credantial
    case wrong_pattern
}

class SignInViewModel: ObservableObject {
    
    var session: SessionStore
    
    @Published var isLoading: Bool = false
    @Published var state: SignInState = .init_state
    
    init(_ session: SessionStore) {
        self.session = session
    }
    
    func signIn(email: String, password: String) {
        isLoading = true
        if !email.isEmpty && !password.isEmpty {
            if email.isValidEmail {
                session.signIn(email: email, password: password) { (authDataResult, error) in
                    if let error = error {
                        Logging.error("SignIn Error: \(error)")
                        self.state = .error
                    } else {
                        Logging.error("SignIn Success")
                        self.state = .is_signin
                        self.isLoading = false
                    }
                }
            } else {
                Logging.error("Email wrong pattern")
                self.state = .wrong_pattern
                self.isLoading = false
            }
        } else {
            Logging.error("Empty credantial")
            self.state = .empty_credantial
            self.isLoading = false
        }
    }
    
}
