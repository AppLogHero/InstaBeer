//
//  PostCell.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import SwiftUI

struct PostCellView: View {
    
    var post: PostModel
    
    var body: some View {
        VStack {
            HStack {
                defaultProfile
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFill()
                    .clipShape(Circle())
                Text(post.user_id)
                Spacer()
                ellipsis
                    .foregroundColor(secondary)
            }
            .padding([.trailing, .leading], 16)
            .padding([.top, .bottom], 8)
            VStack {
                GeometryReader { geo in
                    defaultProfile
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: screenHeight / 2)
                        .clipped()
                }
            }
            .frame(height: screenHeight / 2)
            HStack {
                Button(action: {
                    print("")
                }, label: {
                    suitHeart
                        .resizable()
                        .frame(width: 24, height: 24)
                        .scaledToFill()
                        .foregroundColor(secondary)
                })
                .padding(.trailing, 16)
                Button(action: {
                    print("")
                }, label: {
                    message
                        .resizable()
                        .frame(width: 24, height: 24)
                        .scaledToFill()
                        .foregroundColor(secondary)
                })
                .padding(.trailing, 16)
                Button(action: {
                    print("")
                }, label: {
                    paperplane
                        .resizable()
                        .frame(width: 24, height: 24)
                        .scaledToFill()
                        .foregroundColor(secondary)
                })
                Spacer()
                Button(action: {
                    print("")
                }, label: {
                    bookmark
                        .resizable()
                        .frame(width: 24, height: 24)
                        .scaledToFill()
                        .foregroundColor(secondary)
                })
            }
            .padding([.trailing, .leading], 16)
            .padding([.top, .bottom], 8)
            
        }
    }
}

struct PostCellView_Previews: PreviewProvider {

    static var previews: some View {
        let post: PostModel = PostModel(id: "", comment_ids: [], creation_date: .init(date: Date()), description: "", like_count: 0, photo_ids: [], type: .photo, user_id: "")
        
        PostCellView(post: post)
            .environment(\.colorScheme, .light)
    }
}
