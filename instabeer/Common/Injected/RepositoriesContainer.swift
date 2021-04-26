//
//  RepositoriesContainer.swift
//  instabeer
//
//  Created by Julien Delferiere on 26/04/2021.
//

extension DIContainer {
    struct Repositories {
        let postRepository: PostRepository
        
        init(postRepository: PostRepository) {
            self.postRepository = postRepository
        }
        
        static var mocked: Self {
            .init(postRepository: MockedPostRepository())
        }
        
    }
}
