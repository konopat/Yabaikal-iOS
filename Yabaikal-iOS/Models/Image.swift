//
//  Image.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 31.03.2022.
//

import Foundation

struct Image: Identifiable, Hashable, Codable {
    let id: UUID
    let src: String
    let title: String
}


