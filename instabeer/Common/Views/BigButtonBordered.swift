//
//  BigButtonBordered.swift
//  Feed
//
//  Created by Julien Delferiere on 21/02/2021.
//

import SwiftUI

struct BigButtonBordered: View {
    
    var label: String
    var image: String?
    var action: () -> Void
    
    var body: some View {
        Group {
            if let image = image {
                HStack {
                    Image(image)
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        .padding(.leading, 16)
                    Spacer()
                    Button(action: {
                        action()
                    }, label: {
                        Text(label)
                            .foregroundColor(darkGray)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                    })
                    Spacer()
                }
                .frame(width: screenWidth - 32, height: 52, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(darkGray, lineWidth: 1))
            } else {
                Button(action: {
                    action()
                }, label: {
                    Text(label)
                        .foregroundColor(darkGray)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                })
                .frame(width: screenWidth - 32, height: 52, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(darkGray, lineWidth: 1))
            }
        }
    }
}
