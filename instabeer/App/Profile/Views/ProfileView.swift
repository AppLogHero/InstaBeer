//
//  ProfileView.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import SwiftUI

struct ProfileView: View {
    
    //tempo
    let data = (1...100).map { "Item \($0)" }
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    @State var displayName: String = "juliendelferiere"
    @State var username: String = "@Doctor"
    @State var nbrOfPost: Int = 0
    @State var nbrOfFollowers: Int = 0
    @State var nbrOfSubscribers: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(displayName)
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
            }
            .padding([.trailing, .leading], 16)
            HStack {
                defaultProfile
                    .resizable()
                    .frame(width: 80, height: 80)
                    .scaledToFill()
                    .clipShape(Circle())
                Spacer()
                VStack {
                    Text("\(nbrOfPost)")
                        .foregroundColor(secondary)
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                    Text("Publications")
                        .foregroundColor(secondary)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
                VStack {
                    Text("\(nbrOfPost)")
                        .foregroundColor(secondary)
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                    Text("Abonnés")
                        .foregroundColor(secondary)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
                VStack {
                    Text("\(nbrOfPost)")
                        .foregroundColor(secondary)
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                    Text("Abonnements")
                        .foregroundColor(secondary)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
                Spacer()
            }
            .padding([.trailing, .leading], 16)
            Text(username)
                .foregroundColor(secondary)
                .font(.system(size: 14))
                .fontWeight(.heavy)
                .padding(.leading, 16)
                .padding([.top, .bottom], 8)
            Button(action: {
                
            }, label: {
                Text("Modifier profil")
                    .foregroundColor(secondary)
                    .font(.system(size: 14))
                    .fontWeight(.heavy)
            })
            .padding()
            .frame(height: 32)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(secondary, lineWidth: 1)
            )
            .padding([.trailing, .leading], 16)
            .padding(.bottom, 8)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 120) {
                    ForEach(data, id: \.self) { item in
                        GeometryReader { geo in
                            defaultProfile
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: screenWidth / 3, height: screenWidth / 3)
                                .clipped()
                                .border(secondary)
                        }
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
