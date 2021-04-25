//
//  HomeView.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import SwiftUI

struct HomeView: View {
    
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
                ForEach([0...10], id: \.self) { post in
                    PostCellView(userAsPosted: userAsPosted, post: PostModel(imageName: "defaultprofile", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in mattis velit. Nunc porttitor leo id neque vestibulum tincidunt. Phasellus vitae nisl at libero fringilla ullamcorper nec non leo. Fusce cursus, magna ut accumsan ultrices, dui lectus laoreet ligula, nec bibendum risus velit vitae lorem. Pellentesque varius, sapien nec viverra feugiat, augue odio vestibulum odio, et blandit ipsum massa non enim. Nam efficitur justo nibh, eu condimentum lectus molestie ut. Nam et ligula vitae ligula tincidunt dictum. Nulla ultricies accumsan sapien vitae lobortis."))
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
