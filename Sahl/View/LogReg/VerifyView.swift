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
   
    let phoneNumber: String
   
    @State var enteredPasscode: String = ""
    @FocusState var keyboardFocused: Bool
    
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
       
        ZStack {
            Color.white
                .ignoresSafeArea()
           
            VStack{
                Spacer()
                Text("Verification Code")
                    .font(.title)
                    .bold()
                Text("Enter the 4- digit code sent you at" + " \n +966\(phoneNumber)")
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
                userViewModel.currentUserSignedIn = true
                
            }
        }
        .navigationBarItems(leading: BackButton())
    }
}
struct VerifyView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyView(phoneNumber: "+96655555555")
    }
}




extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}
