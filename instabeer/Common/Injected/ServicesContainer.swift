//
//  ServiceContainer.swift
//  instabeer
//
//  Created by Julien Delferiere on 26/04/2021.
//

extension DIContainer {
    struct Services {
        let sessionStore: SessionStore
        
        init(sessionStore: SessionStore) {
            self.sessionStore = sessionStore
        }
        
        static var mocked: Self {
            .init(sessionStore: SessionStore())
        }
    }
}
