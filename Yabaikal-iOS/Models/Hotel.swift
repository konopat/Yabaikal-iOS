//
//  Hotel.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 13.04.2022.
//

import Foundation

struct Hotel: Identifiable, Hashable, Codable {
    let id: UUID
    let title: String
    let shortDescription: String
    let lоcation: String
    var rating: Int
    let images: [Picture]
}

struct HotelListing: Decodable {
    let result : [Category]
}
