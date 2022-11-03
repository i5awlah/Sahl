//
//  LaunchView.swift
//  Sahl
//
//  Created by Khawlah on 03/11/2022.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var showMainView = false
    @State private var offset = UIScreen.main.bounds.width
    
    var body: some View {
        Group {
            if showMainView {
                SahlView()
            } else {
                ZStack {
                    Color("Navy Blue")
                        .ignoresSafeArea()
                    Image("disability man")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width + 20)
                        .offset(x: -offset)
                    
                }
            }
        }
        .onAppear {
            withAnimation(Animation.linear.delay(0.9)) {
                self.offset = 0
            }
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(Animation.linear(duration: 0.5)) {
                    self.showMainView = true
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
