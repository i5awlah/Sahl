//
//  ChatView.swift
//  Sahl
//
//  Created by ShahadQadi on 25/10/2022.
//

import SwiftUI

struct ChatView: View {
    
    let mesaage: String
    let selectedChat: Chatt
    
    var body: some View {
        Text(mesaage)
            .padding(10)
            .background(selectedChat == .Sender ? Color("Light Blue") : Color(UIColor.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius:8))
            .frame(maxWidth: UIScreen.main.bounds.width / 2, alignment: selectedChat == .Sender ? .trailing : .leading)
            .frame(maxWidth: .infinity, alignment: selectedChat == .Sender ? .trailing : .leading)
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ChatView(mesaage: "hello", selectedChat: .Sender)
            ChatView(mesaage: "hi", selectedChat: .Reciver)
            ChatView(mesaage: "hello, How are you? Are you Fine? hello, How are you? Are you Fine?", selectedChat: .Sender)
            ChatView(mesaage: "hello", selectedChat: .Sender)
        }
    }
}

/*
 UIScreen.main.bounds.width / 2
 */
