//
//  User.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 31.03.2022.
//

import Foundation

struct User: Identifiable, Hashable, Codable {    
    let id: UUID
    let email: String
    let name: String
    let family: String
    let avatars: [Picture]
}

struct UserListing: Decodable {
    let result : [User]
}



