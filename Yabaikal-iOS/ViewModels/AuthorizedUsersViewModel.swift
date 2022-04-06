//
//  AuthorizedUsersViewModel.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 06.04.2022.
//

import Foundation

class AuthorizedUsersViewModel: ObservableObject {
    
    @Published var users: [User] = importUsers()
    @Published var currentUser: User = importUsers()[0]
    
    let userDefaults = UserDefaults.standard
    
    private static func importUsers() -> [User] {
        let userListing: UserListing = importJSON("exampleUsers.json")
        return userListing.result
    }
    
    func changeCurrentUser(to user: User) {
        currentUser = user
    }
    
}
