//
//  ChatView.swift
//  Sahl
//
//  Created by Shahad on 25/10/2022.
//

import SwiftUI

struct ChatView: View {
    
    let mesaage: String
    let selectedChat: Chatt
    
    var body: some View {
        Text(mesaage)
            .frame(width: (UIScreen.main.bounds.width / 2), alignment: .center)
            .padding(10)
            .background(selectedChat == .Sender ? Color("Light Blue") : Color(UIColor.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius:8))
            .frame(maxWidth: .infinity, alignment: selectedChat == .Sender ? .trailing : .leading)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(mesaage: "hello", selectedChat: .Sender)
    }
}
