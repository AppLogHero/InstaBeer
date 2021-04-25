//
//  MainTabView.swift
//  instabeer
//
//  Created by Julien Delferiere on 25/04/2021.
//

import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    houseFill
                        .foregroundColor(secondary)
                }
            SearchView()
                .tabItem {
                    search
                        .foregroundColor(secondary)
                }
            VideoView()
                .tabItem {
                    film
                        .foregroundColor(secondary)
                }
            MarketView()
                .tabItem {
                    bag
                        .foregroundColor(secondary)
                }
            ProfileView()
                .tabItem {
                    profile
                        .foregroundColor(secondary)
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
