//
//  DIContainer.swift
//  instabeer
//
//  Created by Julien Delferiere on 26/04/2021.
//

import Combine
import SwiftUI

struct DIContainer: EnvironmentKey {
    
    let repositories: Repositories
    let services: Services
    
    init(repositories: Repositories, services: Services) {
        self.repositories = repositories
        self.services = services
    }
    
    static var defaultValue: Self { Self.default }
    
    private static let `default` = Self(repositories: .mocked, services: .mocked)
    
}

extension EnvironmentValues {
    var injected: DIContainer {
        get {
            self[DIContainer.self]
        }
        set {
            self[DIContainer.self] = newValue
        }
    }
}

#if DEBUG
extension DIContainer {
    static var preview: Self {
        .init(repositories: .mocked, services: .mocked)
    }
}
#endif

// MARK: - Injection in the view hierarchy
extension View {
    
    func inject(_ repositories: DIContainer.Repositories, _ services: DIContainer.Services) -> some View {
        let container = DIContainer(repositories: repositories, services: services)
        return inject(container)
    }
    
    func inject(_ container: DIContainer) -> some View {
        return self
            .environment(\.injected, container)
    }
}
