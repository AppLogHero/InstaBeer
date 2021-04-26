//
//  RouterView.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import SwiftUI
import Combine

struct RouterView: View {
    
    @EnvironmentObject var appEnvironment: AppEnvironment
    @Environment(\.injected) var container: DIContainer
    @State var account: AccountModel?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        container.services.sessionStore.listen()
        container.services.sessionStore.$session.sink { [self] (account) in
            self.account = account
        }
        .store(in: &cancellables)
    }
    
    var body: some View {
        if let account = account {
            MainTabView()
                .inject(appEnvironment.container)
        } else {
            SignInView(viewModel: SignInViewModel(container.services.sessionStore))
                .inject(appEnvironment.container)
        }
        
    }
}

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}
