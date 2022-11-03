//
//  LightBlueModifier.swift
//  Sahl
//
//  Created by Khawlah on 03/11/2022.
//

import SwiftUI

struct LightBlueModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("MartelSans-Regular", size: 20))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 5)
            .background(Color("Light Blue"))
            .cornerRadius(16)
            .padding(.horizontal, 40)
    }
}

extension Text {
    func lightBlueStyle() -> some View {
        modifier(LightBlueModifier())
    }
}

struct LightBlueButton_Previews: PreviewProvider {
    static var previews: some View {
        Text("Sign in".uppercased())
            .lightBlueStyle()
    }
}

