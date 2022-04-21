//
//  Room.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 14.04.2022.
//

import Foundation

struct RoomForRent: Identifiable, Hashable, Codable {
    let id: UUID
    let type: String
    let roomsNumber: Int
    let address: String?
    let price: Int
    let rentPeriod: String
    let images: [Picture]
}

struct RoomForRentListing: Decodable {
    let result : [RoomForRent]
}
