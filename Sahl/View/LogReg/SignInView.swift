//
//  SignInView.swift
//  Sahl
//
//  Created by Arwa on 24/10/2022.
//

import SwiftUI

struct SignInView: View {

    @State var phoneNumber: String = ""
    
    var body: some View {
        
                    ZStack(alignment: .topLeading) {
                        Color.white
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .padding(.top, 50)
                        
                        VStack {
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text("Enter your phone number to start")
                                    .font(.title2)
                                
                                
                                HStack {
                                    Button("🇸🇦+966") {
                                        
                                    }
                                    .foregroundColor(.gray)
                                    .padding(.vertical,6)
                                    .padding(.horizontal,10)
                                    .background(Color(UIColor.systemGray5))
                                    .cornerRadius(10)
                                    
                                    TextField("5 55 555 555", text: $phoneNumber)
                                        .padding(5)
                                        .keyboardType(.numberPad)
                                        .overlay(alignment: .bottom) {
                                            Rectangle()
                                                .fill(.gray.opacity(0.2))
                                                .frame(height: 1)
                                        }
                                    
                                }
                            }
                            .padding(.horizontal, 30)
                            
                            
                            VStack(spacing: 5) {
                                NavigationLink {
                                    VerifyView(phoneNumber: phoneNumber)
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    Text("Sing in".uppercased())
                                        .lightBlueStyle()
                                        .padding(.top, 10)
                                }
                                
                                HStack{
                                    Text("Don’t have an account?")
                                    
                                    NavigationLink(destination: SignUpView()
                                        .navigationBarBackButtonHidden()) {
                                            Text("Register")
                                                .bold()
                                                .foregroundColor(Color("Navy Blue"))
                                        }
                                    
                                }
                            }
                            Spacer()
                        }
                        
                    }
                    .navigationBarItems(leading: BackButton())
        }
    
    

    }
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                SignInView()
            }
        }
    }
    
    

