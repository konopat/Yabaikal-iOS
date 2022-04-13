//
//  Registration.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 12.04.2022.
//

import Foundation

struct Registration: Identifiable, Hashable, Codable {
    
    let id: UUID
    let typeOfHelp: String
    var respondedUsers: [User]?
    
    mutating func addRespondedUser(by user: User) {
        if respondedUsers == nil {
            respondedUsers = []
            respondedUsers!.append(user)
        } else {
            if !respondedUsers!.contains(user) {
                respondedUsers!.append(user)
            } else {
                if let choosenIndex = respondedUsers!.firstIndex(where: ({$0.id == user.id})) {
                    respondedUsers!.remove(at: choosenIndex)
                }
            }
        }
        
    }
}
