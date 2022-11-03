//
//  TabItems.swift
//  Sahl
//
//  Created by Khawlah on 03/11/2022.
//

import SwiftUI

enum TabItem: Int, CaseIterable, Identifiable {
    
    case home
    case list
    case profile
    
    var id: Int { self.rawValue }
    
    var imageName: String {
        switch (self) {
        case .home: return "house.fill"
        case .list: return "list.dash"
        case .profile: return "person.fill"
        }
    }
    
    var title: String {
        switch (self) {
        case .home: return "HOME"
        case .list: return "TRIPS"
        case .profile: return "PROFILE"
        }
    }
    
    func iconView(_ foregroundColor: Color) -> some View { Image(systemName: imageName).font(.system(size: 24)).foregroundColor(foregroundColor) }
    func labelView(_ foregroundColor: Color) -> some View { Text(title).font(.system(size: 9, weight: .bold)).foregroundColor(foregroundColor) }
}
