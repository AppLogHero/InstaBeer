//
//  PostModel.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import Foundation

struct PostModel {
    let uuid = UUID().uuidString
    var imageName: String
    var description: String
}
