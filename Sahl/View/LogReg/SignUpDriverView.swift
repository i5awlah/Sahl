//
//  SignUpDriverView.swift
//  Sahl
//
//  Created by Arwa on 24/10/2022.
//

import SwiftUI

struct SignUpDriverView: View {
    @Environment (\.presentationMode) var PresentationMode
    var body: some View {

                VStack(spacing:20) {
                    
                    ZStack(alignment: .bottom) {
                        Circle()
                            .foregroundColor(.gray)
                            .frame(width: 160, height:160)
                        Image(systemName:"person.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                        
                        Image(systemName:"camera.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.leading,80)
                        
                        
                    }
                    
                    
                    HStack {
                        Text("National ID:")
                        Spacer()
                    }
                    
                    HStack{
                        ForEach(0..<10) {_ in
                            Rectangle()
                                .fill(Color.init(UIColor.lightGray))
                                .frame(width: 25, height: 35)
                                .cornerRadius(5)
                            
                        }
                        
                    }
                    HStack{
                        Text("Vehicl Registration:")
                        Spacer()
                    }
                    Rectangle()
                        .foregroundColor(Color.init(UIColor.lightGray))
                        .frame(width:250, height: 100)
                        .cornerRadius(10)
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
                        VerifyView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Sing up")
                        .lightBlueStyle()
                    }
                    
                    HStack{
                        Text("Already have an account ? ")
                        
                        NavigationLink {
                            SignInView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Sign in")
                        }
                        
                    }
                    
                }
                .padding(.horizontal)
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



struct SignUpDriverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignUpDriverView()
        }
    }
}
