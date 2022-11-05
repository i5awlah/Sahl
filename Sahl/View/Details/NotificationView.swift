//
//  NotificationView.swift
//  Sahl
//
//  Created by Sarah on 25/10/2022.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView {
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
            
            .navigationTitle("Notification")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
            NotificationView()
    }
}
