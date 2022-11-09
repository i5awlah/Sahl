//
//  TripsView.swift
//  Sahl
//
//  Created by ShahadQadi on 25/10/2022.
//

import SwiftUI

struct TripsDriverView: View {
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
                        //
                        HStack(spacing:0) {
                            
                            Image("UserPhoto")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .padding()
                            
                            VStack(alignment: .leading) {
                                Text("Adam")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                Text("Waiting...")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                        }
                        .overlay(alignment: .topTrailing) {
                            Text("2 day ago")
                                .font(.caption2)
                                .foregroundColor(.gray)
                                .padding(8)
                        }
                        .frame(height: 70)
                        .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color("Baby Blue").opacity(0.24))
                            )
                        .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(UIColor.systemGray5), lineWidth: 1)
                            )
                        //
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

struct TripsDriverView_Previews: PreviewProvider {
    static var previews: some View {
        TripsDriverView()
    }
}
