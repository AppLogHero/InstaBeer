//
//  NewPostStepOneView.swift
//  instabeer
//
//  Created by Julien Delferiere on 27/04/2021.
//

import SwiftUI

struct NewPostStepOneView: View {

    @Environment(\.presentationMode) var presentationMode
    @State private var inputImage: UIImage?
    @State private var pickerIsShow: Bool = false
    @State private var keyboardIsShow: Bool = false
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack {
                    GeometryReader { geo in
                        Button(action: {
                            self.pickerIsShow.toggle()
                        }, label: {
                            ZStack {
                                Image(uiImage: inputImage ?? UIImage())
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geo.size.width, height: screenHeight / 2)
                                    .clipped()
                                Text("Clique ici pour selectionner une photo")
                                    .opacity(inputImage != nil ? 0.0 : 1.0)
                            }
                        })
                    }
                }
                .frame(height: screenHeight / 2)
                HStack {
                    Text("Description")
                        .font(.system(size: 18))
                        .fontWeight(.heavy)
                        .foregroundColor(secondary)
                    Spacer()
                    Button(action: {
                        UIApplication.shared.endEditing()
                    }, label: {
                        Text("Fin")
                    })
                    .opacity(keyboardIsShow == false ? 0.0 : 1.0)
                }
                .padding([.leading, .trailing], 16)
                .padding([.top, .bottom], 8)
                TextEditor(text: $description)
                    .frame(maxHeight: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(darkGray, lineWidth: 1.0)
                    )
                    .padding([.leading, .trailing], 16)
                    .padding(.bottom, 8)
                BigButton(label: "Post !") {
                    print("")
                }
                .padding([.leading, .trailing], 16)
                .padding(.bottom, 8)
                
            }
            .keyboardAware
            .navigationBarTitle(Text("Nouveau Post"), displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    close
                }))
            .fullScreenCover(isPresented: $pickerIsShow, content: {
                ImagePicker(image: $inputImage)
            })
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification), perform: { _ in
                self.keyboardIsShow = true
            })
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification), perform: { _ in
                self.keyboardIsShow = false
            })
        }
    }

}

struct NewPostStepOneView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostStepOneView()
    }
}
