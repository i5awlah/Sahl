//
//  ChooseDriverView.swift
//  Sahl
//
//  Created by ShahadQadi on 10/04/1444 AH.
//

import SwiftUI


struct ChooseDriver: View {
    
    let drivers: [Driver] = Driver.all
    
    @Binding var mapState: MapViewState
    @Binding var isDriverAccept: Bool
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView {
                    
                    ForEach(drivers, id: \.self) { driver in
                        NavigationLink(destination: {
                            DriverMiniProfileView(driver: driver)
                                .navigationBarBackButtonHidden()
                        }, label: {
                            HStack{
                                Image(driver.image ?? "UserPhoto")
                                    .resizable()
                                    .frame(width:60 ,height: 60)
                                    .clipShape(Circle())
                                    .background(
                                        RoundedRectangle(cornerRadius: 100).stroke(Color.gray))
                                    .background(
                                        RoundedRectangle(cornerRadius: 100).fill(Color.white))
                                
                                    .padding()
                                VStack(alignment: .leading){
                                    Text(driver.name)
                                        .font(.title)
                                        .foregroundColor(.black)
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
                                }
                                Spacer()
                                Text(driver.name == "Saeed" ? "10 km Away" : "40 km Away")
                                    .font(.caption2)
                                    .foregroundColor(.black)
                                    .padding()
                            }
                            
                        })
                        
                        .frame(height: 80)
                        .overlay(RoundedRectangle(cornerRadius:8)
                            .stroke(Color("Light Blue"),lineWidth: 1))
                        .padding(.horizontal)
                    }
                }
                
                Text("Cancle Order".uppercased())
                    .lightBlueStyle()
                    .onTapGesture {
                        isDriverAccept = false
                        mapState = .noInput
                    }
                
                    .navigationTitle("Choose a Driver")
                    .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }
}

struct ChooseDriver_Previews: PreviewProvider {
    static var previews: some View {
        ChooseDriver(mapState: .constant(.polylineAdded), isDriverAccept: .constant(false))
    }
}
