//
//  PostCell.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import SwiftUI

struct PostCellView: View {
    
    var userAsPosted: UserModel
    var post: PostModel
    
    var body: some View {
        VStack {
            HStack {
                defaultProfile
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFill()
                    .clipShape(Circle())
                Text(userAsPosted.username)
                Spacer()
                ellipsis
                    .foregroundColor(secondary)
            }
            .padding([.trailing, .leading], 16)
            .padding([.top, .bottom], 8)
            VStack {
                GeometryReader { geo in
                    Image(post.imageName)
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
        let userAsPosted: UserModel = UserModel(username: "JeanJean", firstname: "Jean", lastname: "Michel", email: "michmich@gmail.com")
        
        let post: PostModel = PostModel(imageName: "defaultprofile", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in mattis velit. Nunc porttitor leo id neque vestibulum tincidunt. Phasellus vitae nisl at libero fringilla ullamcorper nec non leo. Fusce cursus, magna ut accumsan ultrices, dui lectus laoreet ligula, nec bibendum risus velit vitae lorem. Pellentesque varius, sapien nec viverra feugiat, augue odio vestibulum odio, et blandit ipsum massa non enim. Nam efficitur justo nibh, eu condimentum lectus molestie ut. Nam et ligula vitae ligula tincidunt dictum. Nulla ultricies accumsan sapien vitae lobortis.")
        
        PostCellView(userAsPosted: userAsPosted, post: post)
            .environment(\.colorScheme, .light)
    }
}
