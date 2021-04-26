//
//  HomeView.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.injected) var container: DIContainer
    @ObservedObject var viewModel: HomeViewModel
    @State var posts: [PostModel] = []
    
    //Tempo
    let userAsPosted: UserModel = UserModel(username: "JeanJean", firstname: "Jean", lastname: "Michel", email: "michmich@gmail.com")
    
    var body: some View {
        VStack {
            HStack {
                Text("Instabeer")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
                Button(action: {
                    print("")
                }, label: {
                    plusSquare
                        .resizable()
                        .frame(width: 24, height: 24)
                        .scaledToFill()
                        .foregroundColor(secondary)
                })
                .padding(.trailing, 16)
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
                    paperplane
                        .resizable()
                        .frame(width: 24, height: 24)
                        .scaledToFill()
                        .foregroundColor(secondary)
                })
            }
            .padding([.trailing, .leading], 16)
            ScrollView {
                ForEach(posts, id: \.id) { post in
                    PostCellView(userAsPosted: userAsPosted, post: PostModel(id: "", comment_ids: [], creation_date: .init(date: Date()), description: "", like_count: 0, photo_ids: [], type: .photo, user_id: ""))
                }
            }
        }
        .onAppear() {
            self.viewModel.loadPost()
        }
        .onReceive(viewModel.$posts, perform: { posts in
            self.posts = posts ?? []
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(postRepository: MockedPostRepository()))
    }
}
