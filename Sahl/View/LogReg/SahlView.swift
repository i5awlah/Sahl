//
//  SahlView.swift
//  Sahl
//
//  Created by Khawlah on 03/11/2022.
//

import SwiftUI

struct SahlView: View {
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        Group {
            if userViewModel.currentUserSignedIn {
                MainTabView()
            } else {
                NavigationStack {
                    VStack {
                        Image("disability man")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width + 20)

                        
                        Text("Sahl")
                            .foregroundColor(Color("Bright Blue"))
                            .font(.custom("SignPainter", size: 60))
                        
                        Text("Easy ,Safe and Comfortable transportation")
                            .foregroundColor(Color("Navy Blue"))
                        
                        Spacer()
                        
                        NavigationLink {
                            SignInView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Sign in".uppercased())
                                .lightBlueStyle()
                        }
                        
                        NavigationLink {
                            SignUpView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Sign up".uppercased())
                                .lightBlueStyle()
                        }
                    }
                }
            }
        }
        .environmentObject(userViewModel)
    }
}

struct SahlView_Previews: PreviewProvider {
    static var previews: some View {
        SahlView()
    }
}

/*

 */
