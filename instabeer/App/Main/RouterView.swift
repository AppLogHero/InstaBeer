//
//  RouterView.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import SwiftUI

struct RouterView: View {
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    @ObservedObject var session: SessionStore = SessionStore()
    
    init() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if session.session != nil {
                MainTabView()
                    .environmentObject(session)
                    .inject(appEnvironment.container)
            } else {
                SignInView(viewModel: SignInViewModel(session))
                    .inject(appEnvironment.container)
            }
        }
    }
}

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}
