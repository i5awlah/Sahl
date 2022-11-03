//
//   VerifyView.swift
//  Sahl
//

//  VerificationView.swift
//  Sahl
//
//  Created by Arwa on 24/10/2022.
//


import SwiftUI
struct VerifyView: View {
   
    @Environment (\.presentationMode) var PresentationMode

    let phoneNumber: String = "+96655555555"
   
    @State var enteredPasscode: String = ""
    @FocusState var keyboardFocused: Bool
    @State var gotoMain = false

    var body: some View {
       
        ZStack {
            Color.white
                .ignoresSafeArea()
           
            VStack{
                Spacer()
                Text("Verification Code")
                    .font(.title)
                    .bold()
                Text("Enter the 4- digit code sent you at" + " \n \(phoneNumber)")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding()
               
                HStack {
                    ForEach(0..<4) {
                       
                        ($0 + 1) > enteredPasscode.count ?
                        PasscodeView(code: "")
                        :
                        PasscodeView(code: enteredPasscode[$0])
                    }
                
                }
               
               
                TextField("Enter your passcode", text: $enteredPasscode)
                    .opacity(0)
                    .keyboardType(.decimalPad)
                    .focused($keyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            keyboardFocused = true
                        }
                    }
                Spacer()
               
            }
            .padding()
            .onChange(of: enteredPasscode) { newValue in
                guard enteredPasscode.count == 4 else { return }
                gotoMain = true
            }
            
            NavigationLink(isActive: $gotoMain) {
                MainTabView()
                    .navigationBarBackButtonHidden()
            } label: {
                EmptyView()
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
struct VerifyView_Previews: PreviewProvider {
    static var previews: some View {
            VerifyView()
    }
}




extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}
