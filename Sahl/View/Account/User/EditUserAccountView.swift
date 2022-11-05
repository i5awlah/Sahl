//
//  EditUserAccountView.swift
//  Sahl
//
//  Created by Norah on 25/10/2022.
//

import SwiftUI
import PhotosUI

struct EditUserAccountView: View {
    
    @State var textFieldFirstName: String = ""
    @State var textFieldPhone: String = ""
    @State var dataArray: [String] = []
    
    @State var isShowPicker: Bool = false
    @Binding var image: Image?
    
    @Binding var showSheet: Bool
    @Binding var name: String
    @State var phone = "592266757"
    
    var body: some View {
        
        NavigationView {
            
            VStack() {
                
                ZStack {
                    if image == nil {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(UIColor.systemGray4))
                                .frame(width: 130, height:130)
                            Image(systemName:"person.fill")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .foregroundColor(.white)
                        }
                    } else {
                        image?
                            .resizable()
                            .frame(width: 130,height: 130)
                            .clipShape(Circle())
                    }
                }
                    .overlay(alignment: .bottomTrailing) {
                        ZStack {
                            Circle()
                                .fill(.white)
                                .frame(width: 40, height: 40)
                            
                            Image(systemName:"pencil.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("Light Blue"))
                        }
                        .onTapGesture {
                            withAnimation {
                                self.isShowPicker.toggle()
                            }
                        }
                    }
                
                
                
                Text(name)
                    .font(.title)
                    .foregroundColor(Color("Navy Blue"))
                    .bold()
                    .padding()
                
                    .foregroundColor(Color.black)
                    .bold()
                TextField(name, text: $textFieldFirstName)
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                    .foregroundColor(.black)
                    .font(.title3)
                    .padding(.bottom, 10)
                
                //                TextField("Abdullah", text: $textFieldLasttName)
                //                    .padding()
                //                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                //                    .foregroundColor(.black)
                //                    .font(.title3)
                //                    .padding(.bottom, 10)
                
                HStack {
                    Button("🇸🇦 +966"){
                        
                    }
                    .foregroundColor(.black)
                    .padding()
                    .background(Color(hue: 1.0, saturation: 0.009, brightness: 0.837))
                    .cornerRadius(10)
                    
                    TextField(phone, text: $textFieldPhone)
                        .padding()
                        .background(Color.gray.opacity(0.2).cornerRadius(10))
                        .foregroundColor(.black)
                        .font(.title3)
                }
                
                .navigationBarItems(
                    leading:
                        
                        Text("Cancel")
                        .font(.headline)
                        .foregroundColor(Color("Navy Blue"))
                        .onTapGesture {
                            showSheet = false
                        }
                    ,
                    trailing:
                        Button(action: {
                            if !textFieldFirstName.isEmpty {
                                name = textFieldFirstName
                            }
                            if !textFieldPhone.isEmpty {
                                phone = textFieldPhone
                            }
                            showSheet = false
                        }, label: {
                            Text("Save")
                                .font(.headline)
                                .foregroundColor(Color("Navy Blue"))
                        }
                              )
                    
                )
                
                Spacer()
            }
            .padding()
            .sheet(isPresented: $isShowPicker) {
                ImagePicker(image: self.$image)
            }
            
        }
        
        
    }
}


struct EditUserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserAccountView(image: .constant(nil), showSheet: .constant(false), name: .constant("Salem Ahmed"))
    }
}
