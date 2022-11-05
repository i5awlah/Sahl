//
//  UserViewModel.swift
//  Sahl
//
//  Created by Khawlah on 05/11/2022.
//

enum UserType {
    case user
    case driver
}

import Foundation
class UserViewModel: ObservableObject {
    @Published var currentUserSignedIn: Bool = false
    @Published var currentUserType: UserType = .user
}
