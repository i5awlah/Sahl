//
//  EditDriverProfileView.swift
//  Sahl
//
//  Created by Sarah on 25/10/2022.
//

import SwiftUI

struct EditDriverAccountView: View {
    
    @State var textFieldDescription: String = ""
    @State var textFieldFirstName: String = ""
    @State var textFieldPhone: String = ""
    @State var textFieldCarName: String = ""
    @State var textFieldCarModel: String = ""
    @State var textFieldCarPlate: String = ""

        
    @State var isShowPicker: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var driver: Driver
    @Binding var image: Image?
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
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
                            .background(
                                RoundedRectangle(cornerRadius: 100).stroke(Color.gray))
                            .background(
                                RoundedRectangle(cornerRadius: 100).fill(Color.white))
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
                
                
                TextField("Write description", text: $textFieldDescription)
                    .padding(10)
                    .font(.title3)
                    .foregroundColor(.black)
                
                    .overlay(alignment: .top) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 80)
                    }
                    .frame(height: 80)
                    .padding(.bottom, 30)
                
                // name
                HStack {
                    Text("Name")
                        .padding(.trailing)
                    VStack {
                        TextField(driver.name, text: $textFieldFirstName)
                            .offset(x: 20)
                        Divider()
                    }
                }
                
                // phone number
                HStack {
                    Text("Phone Number")
                        .padding(.trailing)
                    VStack {
                        TextField(driver.phoneNumber, text: $textFieldPhone)
                            .offset(x: 20)
                        Divider()
                    }
                }
                
                // car name
                HStack {
                    Text("Car Name")
                        .padding(.trailing)
                    VStack {
                        TextField(driver.carName, text: $textFieldCarName)
                            .offset(x: 20)
                        Divider()
                    }
                }
                
                // car model
                HStack {
                    Text("Car Model")
                        .padding(.trailing)
                    VStack {
                        TextField(driver.carModel, text: $textFieldCarModel)
                            .offset(x: 20)
                        Divider()
                    }
                }
                
                // car plate
                HStack {
                    Text("Car Plate")
                        .padding(.trailing)
                    VStack {
                        TextField(driver.carPlate, text: $textFieldCarPlate)
                            .offset(x: 20)
                        Divider()
                    }
                }
                
                
                
                .navigationBarItems(
                    leading:
                        Text("Cancel")
                        .font(.headline)
                        .foregroundColor(Color("Navy Blue"))
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    ,
                    trailing:
                        Button(action: {
                            if !textFieldDescription.isEmpty {
                                driver.description = textFieldDescription
                            }
                            if !textFieldFirstName.isEmpty {
                                driver.name = textFieldFirstName
                            }
                            if !textFieldPhone.isEmpty {
                                driver.phoneNumber = textFieldPhone
                            }
                            if !textFieldCarName.isEmpty {
                                driver.carName = textFieldCarName
                            }
                            if !textFieldCarModel.isEmpty {
                                driver.carModel = textFieldCarModel
                            }
                            if !textFieldCarPlate.isEmpty {
                                driver.carPlate = textFieldCarPlate
                            }
                            presentationMode.wrappedValue.dismiss()
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
            .onAppear{
                image = Image(driver.image )
            }
            .sheet(isPresented: $isShowPicker) {
                ImagePicker(image: $image)
            }
            
        }
        
        
    }
}

struct EditDriverAccountView_Previews: PreviewProvider {
    static var previews: some View {
        EditDriverAccountView(driver: .constant(Driver.all[0]), image: .constant(nil))
    }
}
