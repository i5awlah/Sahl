//
//  ReviewsView.swift
//  Sahl
//
//  Created by Norah on 03/11/2022.
//

import SwiftUI

struct ReviewsView: View {
    var body: some View {
        
        ScrollView {
            VStack {
                ReviewView(name: "Mar***", date: "Now", rateNumber: 2)
                Divider()
                ReviewView(name: "Ab***", date: "Now", rateNumber: 5)
                Divider()
                ReviewView(name: "Om***", date: "19/08/2022", rateNumber: 4)
            }
            .padding()
        }
        
        .navigationTitle("Your reviews")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReviewsView()
        }
    }
}
