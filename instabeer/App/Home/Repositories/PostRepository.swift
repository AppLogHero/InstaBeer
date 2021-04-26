//
//  PostRepository.swift
//  instabeer
//
//  Created by Julien Delferiere on 26/04/2021.
//

import Combine
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class BasePostRepository {
    @Published var posts = [PostModel]()
    @Published var error: Error?
}

protocol PostRepository: BasePostRepository {
    func loadPosts()
    func addPost(_ post: PostModel)
    func deletePost(_ post: PostModel)
    func updatePost(_ post: PostModel)
}

class MockedPostRepository: BasePostRepository, PostRepository, ObservableObject {
    
    func loadPosts() {
        
    }
    
    func addPost(_ post: PostModel) {
        
    }
    
    func deletePost(_ post: PostModel) {
        
    }
    
    func updatePost(_ post: PostModel) {
        
    }

}

class FireStorePostRepository: BasePostRepository, PostRepository, ObservableObject {
    
    let db: Firestore
    var postPath: String = "posts"
    private var cancellables = Set<AnyCancellable>()
    
    init(db: Firestore) {
        self.db = db
    }
    
    func loadPosts() {
        db.collection(postPath).order(by: "creation_date").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.posts = querySnapshot.documents.compactMap({ (document) -> PostModel? in
                    try? document.data(as: PostModel.self)
                })
            } else {
                self.error = error
            }
        }
    }
    
    func addPost(_ post: PostModel) {
        
    }
    
    func deletePost(_ post: PostModel) {
        
    }
    
    func updatePost(_ post: PostModel) {
        
    }
    
}
