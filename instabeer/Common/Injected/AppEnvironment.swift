//
//  AppEnvironment.swift
//  instabeer
//
//  Created by Julien Delferiere on 26/04/2021.
//

import Combine
import FirebaseFirestore

class AppEnvironment: ObservableObject {
    let container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
}

extension AppEnvironment {
    
    static func bootstrap() -> AppEnvironment {
        let repositories = configuredRepositories()
        let services = configuredServices()
        let diContainer = DIContainer(repositories: repositories, services: services)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configuredRepositories() -> DIContainer.Repositories {
        let firestore = Firestore.firestore()
        let postRepository = FireStorePostRepository(db: firestore)
        return .init(postRepository: postRepository)
    }
    
    private static func configuredServices() -> DIContainer.Services {
        let sessionStore = SessionStore()
        return .init(sessionStore: sessionStore)
    }
    
}
