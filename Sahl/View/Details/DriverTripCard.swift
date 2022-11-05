//
//  DriverTripCard.swift
//  Sahl
//
//  Created by Khawlah on 05/11/2022.
//

import SwiftUI

struct DriverTripCard: View {
    
    let driver: Driver
    
    var body: some View {
        HStack(spacing:0) {
            
            Image(driver.image)
                .resizable()
                .frame(width: 44, height: 44)
                .padding()
            
            VStack(alignment: .leading) {
                Text(driver.name)
                    .font(.title2)
                    .foregroundColor(.black)
                Text(driver.name == "Saeed" ? "10 km Away" : "80 km Away")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .overlay(alignment: .topTrailing) {
            Text( driver.name == "Saeed" ? "now" : "2 day ago")
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
    }
}

struct DriverTripCard_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}

