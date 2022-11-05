//
//  SignUpView.swift
//  Sahl
//
//  Created by Arwa on 24/10/2022.
//

import SwiftUI

struct SignUpView: View {
    @State var FirstName:String=""
    @State var LastName:String=""
    @State var phoneNumber:String=""
    @State private var isDriver = true
    
    @State private var signupAsDriver = false
    @State private var signupAsUser = false
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        
            ZStack(alignment: .topLeading) {
                    Color.white
                    VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width / 2)
                            .padding(.top, 50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("First name", text: $FirstName)
                            .padding(.horizontal)
                        
                            .padding(.leading,10)
                        Divider()
                        TextField("Last name", text: $LastName)
                            .padding(.horizontal)
                            .padding(.top,4.0)
                            .padding(.leading,10)
                        Divider()
                        HStack{
                            Button("🇸🇦+966") {
                            }
                            .foregroundColor(.gray)
                            .padding(.vertical,6)
                            .padding(.horizontal,10)
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10)
                            .padding(.top,10.0)
                            .padding(.leading,30)
                            
                            
                            VStack {
                                TextField("5 55 555 555", text: $phoneNumber)
                                    .keyboardType(.numberPad)
                                    .padding(.top,10.0)
                                    .padding(.leading,15)
                                    .keyboardType(.numberPad)
                                Rectangle()
                                    .frame(height: 0.3)
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                            }
                            
                            
                        }
                        
                            Toggle("Are you a driver?", isOn:$isDriver)
                            .frame(width: 200)
                            .padding()
                        
                        VStack(spacing: 5) {
                            Button {
                                if isDriver {
                                    userViewModel.currentUserType = .driver
                                    signupAsDriver = true
                                } else {
                                    userViewModel.currentUserType = .user
                                    signupAsUser = true
                                }
                            } label: {
                                Text("Sing up".uppercased())
                                    .lightBlueStyle()
                                    .padding(.top, 10)
                            }
                            
                            HStack {
                                Text("Already have an account?")
                                
                                NavigationLink(destination: SignInView()
                                    .navigationBarBackButtonHidden()) {
                                        Text("Sign in")
                                            .bold()
                                            .foregroundColor(Color("Navy Blue"))
                                    }
                                
                            }
                        }
                        
                    }
                
                NavigationLink(isActive: $signupAsUser) {
                    VerifyView(phoneNumber: phoneNumber)
                        .navigationBarBackButtonHidden()
                } label: {
                    EmptyView()
                }
                
                NavigationLink(isActive: $signupAsDriver) {
                    SignUpDriverView(phoneNumber: phoneNumber)
                        .navigationBarBackButtonHidden()
                } label: {
                    EmptyView()
                }
            }
            .navigationBarItems(leading: BackButton())
        
        
    }
}
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                SignUpView()
            }
        }
    }
