//
//  TripsView.swift
//  Sahl
//
//  Created by ShahadQadi on 25/10/2022.
//

import SwiftUI

struct TripsView: View {
    @State var selectedTrip: TripType = .Upcoming
    let drivers: [Driver] = Driver.all

    var body: some View {
        VStack {
            Text("My Trips")
                .font(.largeTitle)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .bottomLeading)
                .background(Color(UIColor.systemGray6))
                .clipShape(Rectangle())
                .shadow(color: .black, radius: 1)
            
            HStack{
                Text("Upcoming")
                    .foregroundColor(selectedTrip == .Upcoming ? .white : .gray)
                    .frame(width: 150, height: 40, alignment: .center)
                    .background(selectedTrip == .Upcoming ? Color("Light Blue") : Color(.white))
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                                .stroke(Color(UIColor.lightGray), lineWidth: 1)
                        )
                    .onTapGesture {
                        withAnimation {
                            selectedTrip = .Upcoming
                        }
                    }
                    .padding()
                Text("Previous")
                    .foregroundColor(selectedTrip == .Previous ? .white : .gray)
                    .frame(width: 150, height: 40, alignment: .center)
                    .background(selectedTrip == .Previous ? Color("Light Blue") : Color(.white))
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                                .stroke(Color(UIColor.lightGray), lineWidth: 1)
                        )
                    .onTapGesture {
                        withAnimation {
                            selectedTrip = .Previous
                        }
                    }
            }
            
            
            if selectedTrip == .Upcoming {
                ScrollView {
                    VStack {
                        ForEach(drivers, id: \.self) { driver in
                            DriverTripCard(driver: driver)
                        }
                    }
                    .padding()
                }
                .offset(y: -15)
            }
            
            else {
                Spacer()
                Text("No Previous Trips")
                    .foregroundColor(.gray)
                Spacer()
            }
            
        }
        .ignoresSafeArea()
        
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
