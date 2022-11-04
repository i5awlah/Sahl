//
//  PasscodeView.swift
//  Sahl
//
//  Created by ARWA ALSALEM on 08/04/1444 AH.

import SwiftUI
struct PasscodeView: View {
   
    let code: String
   
    var body: some View {
        Rectangle()
            .fill(Color.init(UIColor.systemGray6))
            .cornerRadius(8)
            .frame(width: 60, height: 60)
            .border( code.isEmpty ? Color.gray.opacity(0.3) : Color.accentColor)
            .overlay( code.isEmpty ? Text("") : Text(code)
                .foregroundColor(Color("Navy Blue"))
                .font(.title2)
                
            )
    }
}
struct PasscodeView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            PasscodeView(code: "1")
            PasscodeView(code: "2")
            PasscodeView(code: "")
            PasscodeView(code: "")
           
        }
    }
}



