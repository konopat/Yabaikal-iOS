//
//  Post.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 31.03.2022.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    var id: UUID
    let timestamp: Date
    let text: String
    let autor: User
    let category: Category
    let images: [Image]
}