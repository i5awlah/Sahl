//
//  HomeView.swift
//  Sahl
//
//  Created by Khawlah on 03/11/2022.
//


import SwiftUI
import MapKit

struct HomeView: View {
    
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
     
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                MapViewRepresentable(mapState: $mapState)
                    .edgesIgnoringSafeArea(.top)
                
                if mapState == .noInput {
                    wheretoSearch
                        .onTapGesture {
                            withAnimation(.spring() ) {
                                mapState = .searchingForLocation
                            }
                        }
                        .padding()
                        .padding(.top)
                } else {
                    if mapState == .searchingForLocation {
                        LocationSearchView(mapState: $mapState)
                    }
                    backButton
                }
            }

        }
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                locationViewModel.userLocation = location
            }
        }
    }
    
    var wheretoSearch: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color("Light Blue2"))
            .shadow(radius: 4, y: 2 )
            .frame(height: 55)
            .overlay(alignment: .leading) {
                HStack(spacing: 15) {
                    Image(systemName: "circle.fill")
                        .foregroundColor(Color("Navy Blue"))
                    Text("Where to?")
                        .foregroundColor(.gray)
                    
                }
                .padding(.leading)
            }
    }
    
    var backButton: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 44, height: 44)
            .shadow(color: .black, radius: 4)
            .overlay {
                Image(systemName: "arrow.backward")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            .onTapGesture {
                withAnimation(.spring() ) {
                    actionForState(mapState )
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
    }
    
    func actionForState(_ state: MapViewState) {
        switch(state) {
        case .noInput: print("no input")
        case .searchingForLocation: mapState = .noInput
        case .locationSelected, .polylineAdded:
            mapState = .noInput
            locationViewModel.selectedSahlLocation = nil
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        //HomeView()
        MainTabView()
            .environmentObject(LocationSearchViewModel())
    }
}
