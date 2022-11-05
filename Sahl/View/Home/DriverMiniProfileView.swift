//
//  DriverMiniProfileView.swift
//  Sahl
//
//  Created by Khawlah on 05/11/2022.
//

import SwiftUI

struct DriverMiniProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let driver: Driver
    
    var body: some View {
        VStack {
            
            Image("SahlSystemBackground")
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
                .ignoresSafeArea()
                .overlay(alignment:.bottom){
                    Image(driver.image)
                        .resizable()
                        .frame(width:120 ,height: 120)
                        .clipShape(Circle())
                    .background(
                     RoundedRectangle(cornerRadius: 100).stroke(Color.gray))
                    .background(
                     RoundedRectangle(cornerRadius: 100).fill(Color.white))
                }
                .overlay(alignment:.top){
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color("Navy Blue"))
                        .font(.title)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    
                    .padding(.leading,-180)
                }
            Text(driver.name)
                .font(.largeTitle)
                .foregroundColor(Color("Navy Blue"))
            
            HStack{
                VStack{
                    Text(driver.carName)
                        .foregroundColor(.black)
                    
                    Text(driver.carPlate)
                        .foregroundColor(.gray)
                        .font(.callout)
                    
                }
                .padding()
                Spacer()
                VStack{
                    
                    Text("\(driver.rate).0")
                    
                    HStack(spacing: 1) {
                        ForEach(0..<5) { i in
                            if i < driver.rate {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            } else {
                                Image(systemName: "star.fill")
                                .foregroundColor(.gray)
                            }
                        }
                    }
                    Text("\(driver.numberOfRate)")
                }
                
                .padding()
            }
            .frame(height: 60)
            .overlay(RoundedRectangle(cornerRadius:12).stroke(Color("Light Blue"),lineWidth: 1.90))
            .padding(.horizontal)
            
            NavigationLink {
                DriverChat(driver: driver)
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Message")
                    .lightBlueStyle()
                    .padding()
            }
            
            Spacer()

            
        }
    }
}

struct DriverMiniProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DriverMiniProfileView(driver: Driver(name: "Saeed", image: "Saeed", carName: "Hyundai H1", carPlate: "1145 WQA", rate: 3, numberOfRate: 25))
    }
}
