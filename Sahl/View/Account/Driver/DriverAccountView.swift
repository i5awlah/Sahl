//
//  DriverAccountView.swift
//  Sahl
//
//  Created by Sarah on 25/10/2022.
//

import SwiftUI

struct DriverAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowEditProfile = false
    
    @State var image: Image? = Image("AbdullahSaeed")
    
    @State var description = "Deliver disabilty people in Narjis,Yasmin district and have suitable car. "
    @State var name = "Abdullah Saeed"
    @State var phone: String = "+966555555555"
    @State var carName = "Hyundai Sonata"
    @State var carModel: String = "2017"
    @State var carPlate = "9845 DWS"
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.white
                Image("SahlSystemBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(height: UIScreen.main.bounds.height / 3)
                    .ignoresSafeArea()
                
                    .overlay(alignment:.bottom) {
                        image?
                            .resizable()
                            .frame(width:120 ,height: 120)
                            .clipShape(Circle())
                            .background(
                                RoundedRectangle(cornerRadius: 100).stroke(Color.gray))
                            .background(
                                RoundedRectangle(cornerRadius: 100).fill(Color.white))
                            .offset(y: -40)
                    }
                
                VStack {
                    Text(name)
                        .font(.largeTitle)
                        .foregroundColor(Color("Navy Blue"))
                    
                    HStack{
                        VStack{
                            Text(description)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .bold()
                                .font(.callout)
                                .padding(.horizontal)
                                .frame(width: 350, height: 50)
                        }
                        .padding(.top, -15)
                    }
                    Divider()
                    
                    HStack{
                        
                        VStack{
                            Text(carName)
                                .foregroundColor(.black)
                            
                            Text(carPlate)
                                .foregroundColor(.gray)
                                .font(.callout)
                            
                        }
                        .padding()
                        
                        VStack{
                            Text("4.9")
                            HStack(spacing: 1){
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.caption2)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.caption2)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.caption2)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.caption2)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.gray)
                                    .font(.caption2)
                            }
                            Text("33")
                        }
                        .padding()
                    }
                    .frame(height: 60)
                    .overlay(RoundedRectangle(cornerRadius:15).stroke(Color.gray,lineWidth: 1.50))
                    .padding(.horizontal)
                    .padding()
                    
                    Divider()
                    HStack{
                        VStack{
                            Text("240")
                                .foregroundColor(.black)
                                .bold()
                                .font(.title)
                            Text("Trips")
                                .foregroundColor(.gray)
                                .font(.caption2)
                        }
                        .padding(.trailing, 150)
                        VStack{
                            Text("1.5")
                                .foregroundColor(.black)
                                .bold()
                                .font(.title)
                            Text("Years")
                                .foregroundColor(.gray)
                                .font(.caption2)
                        }
                    }
                    .font(.caption2)
                    .padding(.top, -6)
                    Divider()
                    
                    HStack{
                        VStack{
                            Text("Compliments")
                                .font(.title)
                        }
                        .padding(.top, -5)
                        .padding(.trailing, 190)
                    }
                    HStack{
                        Image("Image 3")
                            .resizable()
                            .frame(width: 80, height: 80)
                        Image("Image 4")
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                    .padding(.top, -10)
                    .padding(.trailing, 170)
                    Spacer()
                    
                    
                }
                .offset( y: UIScreen.main.bounds.height / 3 - 40)
            }
            
            .navigationBarItems(
                
                leading:
                    Button() {
                        isShowEditProfile.toggle()
                    }
                label: {
                    Label("Edit", systemImage: "square.and.pencil")
                        .foregroundColor(Color("Navy Blue"))
                    
                }
                    .sheet(isPresented: $isShowEditProfile) {
                        EditDriverAccountView(
                            image: $image,
                            description: $description,
                            name: $name,
                            phone: $phone,
                            carName: $carName,
                            carModel: $carModel,
                            carPlate: $carPlate)
                }
                ,
                trailing:
                    NavigationLink(destination: {
                        SettingsView().navigationBarBackButtonHidden()
                    }, label: {
                        Label("Setting", systemImage: "gear")
                            .foregroundColor(Color("Navy Blue"))
                    })
            )

            

        }
    }
}

struct DriverAccountView_Previews: PreviewProvider {
    static var previews: some View {
        DriverAccountView()
    }
}
