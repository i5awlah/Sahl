//
//  UserAccountView.swift
//  Sahl
//
//  Created by Norah on 25/10/2022.
//

import SwiftUI

struct User: Identifiable {
    var id = "Deleet"
}

struct UserAccountView: View {
    @State private var selectUser: User? = nil
    @State private var isShowDeleteAlert = false
    @State var title: String = "Alert"
    @State var select: String = "English"
    let filterOption: [String] = ["English", "Arabic"]
    @State private var isShowEditProfile = false
    
    @State var name = "Adem Abdullah"
    @State var image: Image? = Image("UserPhoto")
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 30) {
                HStack {
                    Spacer()
                    
                    VStack{
                        Text(name)
                            .font(.title)
                            .foregroundColor(Color("Navy Blue"))
                            .bold()
                        
                        Capsule()
                            .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.852))
                            .frame(width: 100, height: 40)
                            .overlay(
                                Text("★ 4.6")
                                    .font(.title3)
                            )
                        
                    }
                    Spacer()
                    image?
                        .resizable()
                        .frame(width: 105,height: 105)
                        .clipShape(Circle())
                    Spacer()
                }
                
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
                    
                    // Driver reviews
                    NavigationLink {
                        ReviewsView()
                    } label: {
                        HStack {
                            Image(systemName:"star")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color.gray)
                            Text("Driver reviews")
                                .font(.headline)
                            Spacer()
                        }
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
                                    self.title = "Your account has been deleted"
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
                            Spacer()
                        }
                    }
                }
                
                
                
                .navigationBarTitleDisplayMode(.large)
                .navigationBarItems(
                    
                    leading:
                        Button() {
                            isShowEditProfile.toggle()
                        }
                    label: {
                        Label("Edit", systemImage: "square.and.pencil")
                            .foregroundColor(Color("Navy Blue"))
                        
                    }
                        .sheet(isPresented: $isShowEditProfile) {
                            EditUserAccountView(image: $image, showSheet: $isShowEditProfile, name: $name)
                        }
                    ,
                    trailing:
                        NavigationLink(
                            destination: HelpCenterView().navigationBarBackButtonHidden(),
                            label: {
                                Image("support")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(Color("Navy Blue"))
                                    .frame(width: 25,height: 25)
                            })
                        
                )
                
            }
        }
        
    }
}


struct AppLAnguageScreen: View {
    
    @State var languages: [String] = ["English", "Arabic"]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(languages, id: \.self) {
                        languages in
                        Text(languages.capitalized)
                    }
                }
                .navigationTitle("Languages")
            }
            Spacer()
        }
        
    }
}
struct UserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountView()
    }
}
