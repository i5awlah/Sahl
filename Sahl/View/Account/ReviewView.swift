//
//  ReviewView.swift
//  Sahl
//
//  Created by Khawlah on 05/11/2022.
//

import SwiftUI

struct ReviewView: View {
    
    let name: String
    let date: String
    let rateNumber: Int
    
    var body: some View {
        HStack {
            Text("You rated \(name)")
                .font(.body)
            Spacer()
            VStack (alignment: .trailing){
                Text(date)
                    .foregroundColor(.gray)
                    .font(.caption)
                Spacer()
                HStack (spacing: -2) {
                    ForEach (0..<5) { i in
                        if i < rateNumber {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .foregroundColor(.gray)
                .font(.caption2)
            }
        }
        .frame(height: 10)
        .padding(.vertical)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}
