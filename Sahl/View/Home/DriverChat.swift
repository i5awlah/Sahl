//
//  FirstDriverChat.swift
//  Sahl
//
//  Created by ShahadQadi on 10/04/1444 AH.
//

import SwiftUI
enum Chatt {
    case Sender
    case Reciver
}
struct DriverChat: View {
    
    let driver: Driver
    
    @State var textfield: String = ""
    @State var dataArray: [String] = []
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        VStack(spacing: 0) {
            HStack(spacing: 20){
                Image(systemName: "chevron.backward")
                    .foregroundColor(Color("Navy Blue"))
                    .font(.title)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                
                Image(driver.image)
                    .resizable()
                    .frame(width:50 ,height: 50)
                    .clipShape(Circle())
                    .background(
                        RoundedRectangle(cornerRadius: 100).stroke(Color.gray))
                    .background(
                        RoundedRectangle(cornerRadius: 100).fill(Color.white))
                
                VStack(alignment: .leading){
                    Text(driver.name)
                        .font(.title2).bold()
                        .foregroundColor(Color("Navy Blue"))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "phone.fill")
                    .foregroundColor(Color("Navy Blue"))
                    .font(.title)
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            
            ScrollView {
                VStack {
                    ForEach(dataArray, id: \.self) { item in
                        ChatView(mesaage: item, selectedChat: .Sender)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
            }
            
            
            ZStack {
                HStack{
                    TextField("Enter Your Text...", text: $textfield)
                        .foregroundColor(.gray)
                        .font(.title3)
                    
                    
                    Button {
                        disapplyText()
                    } label: {
                        Image(systemName: "arrow.up.circle")
                            .foregroundColor(Color("Navy Blue"))
                            .font(.title)
                        
                    }
                    
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                .background(Color(UIColor.systemBackground))
                .shadow(radius: 1)
                .clipShape(RoundedRectangle(cornerRadius:30))
            }
            .padding(.horizontal)
            .padding(.vertical,10)
            .background(Color(UIColor.systemGray6))
            .shadow(radius: 1)
            
            
        }
        
    }
    func disapplyText(){
        dataArray.append(textfield)
        textfield = ""
    }
    
}

struct FirstDriverChat_Previews: PreviewProvider {
    static var previews: some View {
        DriverChat(driver: Driver(name: "Saeed", image: "Saeed", carName: "Hyundai H1", carPlate: "1145 WQA", rate: 3, numberOfRate: 25))
    }
}
