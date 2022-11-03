//
//  LocationSearchView.swift
//  Sahl
//
//  Created by Khawlah on 03/11/2022.
//

import SwiftUI

struct LocationSearchView: View {
    
    @FocusState private var keyboardFocused: Bool
    
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24 )
                    
                    Circle()
                        .fill(Color("Navy Blue"))
                        .frame(width: 6, height: 6)
                }
                VStack {
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .padding(.leading, 10)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $locationViewModel.queryFragment)
                        .focused($keyboardFocused)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    keyboardFocused = true
                                }
                            }
                        .frame(height: 32)
                        .padding(.leading, 10)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(locationViewModel.results, id: \.self) { result in
                        LocationSearchResultCell(title: result.title, subTitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    locationViewModel.selectLocation(result)
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
        }
        .background(Color.theme.backgoundColor)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
            LocationSearchView(mapState: .constant(.searchingForLocation))
                .environmentObject(LocationSearchViewModel())
    }
}
