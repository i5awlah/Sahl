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
            //.padding(.vertical,200)
            //.padding(.leading,200)
            .fill(Color.init(UIColor.lightGray))
            .cornerRadius(8)
            //.fill(Color("customBackground"))
            .frame(width: UIScreen.main.bounds.width/8, height: UIScreen.main.bounds.width/6)
            //.border( code.isEmpty ? Color.gray.opacity(0.3) : Color.accentColor)
            .overlay( code.isEmpty ? Text("") : Text(code)
                .foregroundColor(Color.blue)
                //.foregroundColor(Color.accentColor)
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
            PasscodeView(code: "4")
           
        }
    }
}



