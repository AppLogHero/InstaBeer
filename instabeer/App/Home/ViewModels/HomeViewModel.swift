//
//  HomeViewModel.swift
//  instabeer
//
//  Created by Julien Delferiere on 26/04/2021.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var posts: [PostModel]?
    
    let postRepository: PostRepository
    private var cancellables = Set<AnyCancellable>()
    
    init(postRepository: PostRepository) {
        self.postRepository = postRepository
        
        postRepository.$posts.sink { (posts) in
            Logging.debug("Post: \(posts)")
            self.posts = posts
        }
        .store(in: &cancellables)
    }
    
    func loadPost() {
        postRepository.loadPosts()
    }
    
}
