//
//  SignUpDriverView.swift
//  Sahl
//
//  Created by Arwa on 24/10/2022.
//

import SwiftUI

struct SignUpDriverView: View {
    
    let phoneNumber: String
    
    var body: some View {
        
        VStack(spacing:20) {
            
            ZStack {
                Circle()
                    .foregroundColor(Color(UIColor.systemGray4))
                    .frame(width: 200, height:200)
                Image(systemName:"person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
            }
            .overlay(alignment: .bottomTrailing) {
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 40, height: 40)
                    
                    Image(systemName:"camera.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("Light Blue"))
                        .padding(10)
                }
            }
            
            
            HStack {
                Text("National ID:")
                Spacer()
            }
            
            HStack{
                ForEach(0..<10) {_ in
                    Rectangle()
                        .fill(Color.init(UIColor.lightGray).opacity(0.55))
                        .frame(width: 25, height: 35)
                        .cornerRadius(5)
                }
                
            }
            HStack{
                Text("Vehicl Registration:")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.init(UIColor.lightGray).opacity(0.55))
                .frame(width:250, height: 100)
                .frame(maxWidth: .infinity, alignment: .center)
            
                .overlay {
                    VStack {
                        Image(systemName:"icloud.and.arrow.up.fill")
                            .foregroundColor(.white)
                        Text("Upload a Photo")
                            .foregroundColor(.white)
                    }
                }
            
            NavigationLink {
                VerifyView(phoneNumber: phoneNumber)
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Sing up".uppercased())
                    .lightBlueStyle()
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
        .padding(.horizontal)
        .navigationBarItems(leading: BackButton())
        
        
    }
}



struct SignUpDriverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignUpDriverView(phoneNumber: "+96655555555")
        }
    }
}
