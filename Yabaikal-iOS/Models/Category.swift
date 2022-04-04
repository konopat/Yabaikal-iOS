//
//  Category.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 31.03.2022.
//

import Foundation

struct Category: Identifiable, Hashable, Codable {
    let id: UUID
    let title: String
}
