//
//  HelpCenterView.swift
//  Sahl
//
//  Created by Norah on 25/10/2022.
//

import SwiftUI

struct HelpCenterView: View {
    
   
    @State private var message = ""
    @State var dataArray: [String] = []
    @State var textField: String = ""
    let date = Date()
    
    struct Message {
        var content: String
        var user: User
    }
    struct User {
        var name: String
        var avatar: String
        var isCurrentUser: Bool = false
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Help center ")
                    .font(.largeTitle)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 150, alignment: .bottom)
                    .background(Color(UIColor.systemGray6))
                    .clipShape(Rectangle())
                    .shadow(color: .black, radius: 1)
                     
            
                ZStack (alignment: .top){
                   
                    Color.white.opacity(0.5)
                             
                    ScrollView {
                        VStack {
                      
                            ChatView(mesaage: "Hello, I'm Mohammed from help center", selectedChat: .Reciver)
                            
                           ForEach(dataArray, id: \.self) { data in
                               ChatView(mesaage: data, selectedChat: .Sender)
                           }
                        }
                        .padding()
                    }
                   
                }
                HStack {
                    TextField("Enter your message here", text: $textField)
            
                        .foregroundColor(.black)
                        .font(.title3)
                       
                    
                    Button {
                        sendText()
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(hue: 1.0, saturation: 0.04, brightness: 0.437))
                            .cornerRadius(50)
                        
                    }
                }
               .padding(.horizontal)
                .padding(.vertical,10)
              .background(Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            
            }
            .ignoresSafeArea()
            
            BackButton()
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    func sendText() {
        if !textField.isEmpty {
            dataArray.append(textField)
            textField = ""
        }

    }
}

struct HelpCenterView_Previews: PreviewProvider {
    static var previews: some View {
        HelpCenterView()
    }
}
