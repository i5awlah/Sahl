//
//  SignInView.swift
//  Sahl
//
//  Created by Arwa on 24/10/2022.
//

import SwiftUI

struct SignInView: View {
    @Environment (\.presentationMode) var PresentationMode

    @State var phoneNumber:String=""
    var body: some View {
        
                    ZStack(alignment: .topLeading) {
                        Color.white
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .padding(.top, 50)
                        
                        VStack{
                            Text("Enter your phone number to start ")
                                .padding(.top, 400.0)
                                .padding(.leading,10)
                                .font(.title2)
                            
                            
                            HStack{
                                Button("🇸🇦+966") {
                                    
                                }
                                .foregroundColor(.white)
                                .padding(.vertical,6)
                                .padding(.horizontal,10)
                                .background(Color("Light Blue"))
                                .cornerRadius(10)
                                .padding(.top,10.0)
                                .padding(.leading,60)
                                
                                
                                
                                
                                
                                TextField("5********", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                    .underline()
                                    .underline()
                                    .padding(.top,10.0)
                                    .padding(.leading,50)
                                    .keyboardType(.numberPad)
                                
                                
                                
                            }
                            
                            NavigationLink {
                                VerifyView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("Sing in")
                                    .lightBlueStyle()
                                    .padding(10)
                            }
                            
                            HStack{
                                Text("Don’t have an account ?")
                                
                                NavigationLink(destination: SignUpView()
                                    .navigationBarBackButtonHidden()) {
                                        Text("Register")
                                        
                                    }
                                
                                
                                
                            }
                            
                            
                            
                            
                            
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
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            SignInView()
        }
    }
    
    

