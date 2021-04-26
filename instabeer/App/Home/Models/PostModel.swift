//
//  PostModel.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

enum PostType: String, Codable {
    case photo
    case video
}

struct PostModel: Codable, Identifiable {
    @DocumentID var id: String?
    var comment_ids: [String]
    @ServerTimestamp var creation_date: Timestamp?
    var description: String
    var like_count: Int
    var photo_ids: [String]
    var type: PostType
    var user_id: String
}
