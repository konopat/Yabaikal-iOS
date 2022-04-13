//
//  Registration.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 12.04.2022.
//

import Foundation

struct Registration: Identifiable, Hashable, Codable {
    let id: UUID
    let type: String
    let needNumber: Int
    let readyNumber: Int
    let respondedUsers: [User]?
}
