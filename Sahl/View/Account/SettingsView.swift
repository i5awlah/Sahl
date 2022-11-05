//
//  SettingsView.swift
//  Sahl
//
//  Created by Sarah on 25/10/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment (\.presentationMode) var PresentationMode
    
    @State var select: String = "English"
    let filterOption: [String] = ["English", "Arabic"]
    @State private var isShowDeleteAlert = false
    @State private var selectUser: User? = nil
    
    @State private var isShowHelpCenter = false
    
    var body: some View {
        List {
            // App Language
            HStack {
                Image(systemName:"globe")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.gray)
                
                Text("App language")
                    .font(.headline)
                
                Spacer()
                
                Picker(
                    selection: $select,
                    label: Text("App language"),
                    content: {
                        ForEach(filterOption.indices) {
                            index in Text(filterOption[index])
                                .tag(filterOption[index])
                        }
                    })
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 130, height: 20)
                
            }
            
            // Delete Account
            HStack {
                Image(systemName:"minus.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.gray)
                Text("Delete account")
                    .font(.headline)
                    .onTapGesture {
                        selectUser = User()
                        isShowDeleteAlert = true
                    }
                    .alert( isPresented: $isShowDeleteAlert,content: {
                        Alert(title: Text("Delete account"),
                              message: Text("Are you sure to delete account"),
                              primaryButton: .destructive(Text("Delete"), action: {
                            withAnimation {
                                userViewModel.currentUserSignedIn = false
                            }
                        }),
                              
                              secondaryButton: .cancel())
                    })
            }
            
            // Sign out
            Button {
                withAnimation {
                    userViewModel.currentUserSignedIn = false
                }
            } label: {
                HStack {
                    Image(systemName:"person.crop.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.gray)
                    Text("Sign out")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            
            leading:
                Button() {
                    PresentationMode.wrappedValue.dismiss()
                }
            label: {
                Label("Edit", systemImage: "chevron.backward")
                    .foregroundColor(Color("Navy Blue"))
                
            }
            ,
            trailing:
                Button(action: {
                    isShowHelpCenter.toggle()
                }, label: {
                    Image("support")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color("Navy Blue"))
                        .frame(width: 25,height: 25)
                })
                .fullScreenCover(isPresented: $isShowHelpCenter) {
                    HelpCenterView()
                }
            
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
