//
//  PostListingViewModel.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 04.04.2022.
//

import SwiftUI

class PostListingViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    
    init() {
        importPosts()
    }
    
    private func importPosts() {
        let postListing: PostListing = importJSON("exampleImport.json")
        posts = postListing.result
    }
    
}
