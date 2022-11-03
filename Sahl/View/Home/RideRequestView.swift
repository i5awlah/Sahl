//
//  RideRequestView.swift
//  Sahl
//
//  Created by Khawlah on 03/11/2022.
//


import SwiftUI

struct RideRequestView: View {
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    @State var isStart = false
    @Binding var mapState: MapViewState
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Capsule()
                    .foregroundColor(Color(.systemGray5))
                    .frame(width: 48, height: 6)
                    .padding(.top, 8)
                
                ZStack {
                    VStack {
                        HStack {
                            VStack {
                                Circle()
                                    .fill(Color(.systemGray3))
                                    .frame(width: 8, height: 8)
                                
                                Rectangle()
                                    .fill(Color(.systemGray3))
                                    .frame(width: 1, height: 32 )
                                
                                Circle()
                                //.fill(Color("Navy Blue"))
                                    .fill(Color.primary)
                                    .frame(width: 8, height: 8)
                            }
                            
                            VStack(alignment: .leading, spacing: 24) {
                                HStack {
                                    Text("Current Location")
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Text(locationViewModel.pickupTime ?? "")
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                .padding(.bottom, 10)
                                
                                HStack {
                                    if let location = locationViewModel.selectedSahlLocation {
                                        Text(location.title)
                                            .font(.system(size: 16, weight: .semibold))
                                        //.foregroundColor(Color("Navy Blue"))
                                            .foregroundColor(.primary)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(locationViewModel.dropOffTime ?? "")
                                        .font(.system(size: 14, weight: .semibold))
                                }
                            }
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        }
                        .padding()
                        
                        //Text(locationViewModel.computeRidePrice().toCurrency())
                        Divider()
                        
                        Button {
                            isStart.toggle()
                        } label: {
                            Text("Start now")
                                .fontWeight(.bold)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background(Color("Light Blue"))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                        }
                        
                    }
                    .opacity(isStart ? 0 : 1)
                    
                    if isStart {
                        VStack {
                            ProgressView()
                            Text("Wating drivers")
                        }
                        .onTapGesture {
                            mapState = .noInput
                        }
                    }
                    
                }
                
            }
            .padding(.bottom, 16)
            .background(Color("Light Blue2"))
        }
        
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView(mapState: .constant(.polylineAdded))
            .environmentObject(LocationSearchViewModel())
    }
}

/*
 if isStart {
     ProgressView()
 }
 */
