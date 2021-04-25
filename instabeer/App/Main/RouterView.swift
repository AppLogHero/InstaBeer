//
//  RouterView.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import SwiftUI

struct RouterView: View {
    
    @ObservedObject var session: SessionStore = SessionStore()
    
    init() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if session.session != nil {
                MainTabView()
                    .environmentObject(session)
            } else {
                SignInView(viewModel: SignInViewModel(session))
            }
        }
    }
}

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}
