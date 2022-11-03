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
    
    @Environment (\.presentationMode) var PresentationMode
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
                            .foregroundColor(.white)
                            .padding(.vertical,4)
                            .padding(.horizontal,10)
                            .background(Color.init(UIColor.lightGray))
                            .cornerRadius(10)
                            .padding(.top,10.0)
                            .padding(.leading,30)
                            
                            
                            VStack {
                                TextField("5********", text: $phoneNumber)
                                    .keyboardType(.numberPad)
                                    .padding(.top,10.0)
                                    .padding(.leading,60)
                                    .font(.headline)
                                    .keyboardType(.numberPad)
                                Rectangle()
                                    .frame(height: 0.3)
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                            }
                            
                            
                        }
                        HStack{
                            Text("Are you a driver?")
                                .font(.system(size:18))
                                .padding(.leading, 30)
                            
                            Toggle("driver", isOn:$isDriver)
                                .padding(.trailing)
                                .frame(width: 70)
                        }
                        
                        Button {
                            if isDriver {
                                signupAsDriver = true
                            } else {
                                signupAsUser = true
                            }
                        } label: {
                            Text("Sing up")
                                .lightBlueStyle()
                        }
                        
                        HStack{
                            Text("Already have an account ? ")
                            NavigationLink(destination: SignInView()
                                .navigationBarBackButtonHidden()) {
                                    Text("Sign in")
                                }}
                        
                    }
                
                NavigationLink(isActive: $signupAsUser) {
                    VerifyView()
                        .navigationBarBackButtonHidden()
                } label: {
                    EmptyView()
                }
                
                NavigationLink(isActive: $signupAsDriver) {
                    SignUpDriverView()
                        .navigationBarBackButtonHidden()
                } label: {
                    EmptyView()
                }
            }
            .navigationBarItems(leading: backButton)
        
        
    }
    
    var backButton: some View {
        HStack(spacing:20){
            Image(systemName: "chevron.backward")
                .foregroundColor(Color("Navy Blue"))
                .font(.title)
                .padding()
                .onTapGesture {
                    PresentationMode.wrappedValue.dismiss()
                }
            Spacer()
        }
    }
}
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                SignUpView()
            }
        }
    }
