//
//  BackButton.swift
//  Sahl
//
//  Created by Khawlah on 04/11/2022.
//

import SwiftUI

struct BackButton: View {
    
    @Environment (\.presentationMode) var PresentationMode

    var body: some View {
            Image(systemName: "chevron.backward")
                .foregroundColor(Color("Navy Blue"))
                .font(.title)
                .padding()
                .onTapGesture {
                    PresentationMode.wrappedValue.dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
            .previewLayout(.sizeThatFits)
    }
}
