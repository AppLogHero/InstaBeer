//
//  BigButton.swift
//  Feed
//
//  Created by Julien Delferiere on 21/02/2021.
//

import SwiftUI

struct BigButton: View {
    
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(label)
                .foregroundColor(.white)
                .font(.system(size: 18))
                .fontWeight(.heavy)
        })
        .frame(width: screenWidth - 32, height: 52, alignment: .center)
        .background(Color.blue)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

