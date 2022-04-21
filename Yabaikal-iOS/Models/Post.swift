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
    let images: [Picture]?
    var registrations: [Registration]?
    var likers: [User]?
    let hotel: Hotel?
    let roomsForRent: [RoomForRent]?
    
    
    mutating func addLike(by user: User) {
        if likers == nil {
            likers = []
            likers!.append(user)
        } else {
            if likers!.contains(user) {
                if let choosenIndex = likers!.firstIndex(where: ({$0.id == user.id})) {
                    likers!.remove(at: choosenIndex)
                }
            } else {
                likers!.append(user)
            }
        }
    }
    
    mutating func addResponded(user: User, to registration: Registration ) {
        if let postRegistrations = registrations {
            if let registrationIndex = postRegistrations.firstIndex(where: ({$0.id == registration.id})) {
                registrations![registrationIndex].addRespondedUser(by: user)
            }
        }
    }
}

struct PostListing: Decodable {
    let result : [Post]
}
