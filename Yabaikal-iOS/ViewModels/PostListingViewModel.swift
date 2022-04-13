//
//  PostListingViewModel.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 04.04.2022.
//

import SwiftUI

class PostListingViewModel: ObservableObject {
    
    @Published var categories: [Category] = importCategories()
    @Published var posts: [Post] = importPosts()
    @Published var currentCategory: Category = importCategories()[0]
    
    private static func importCategories() -> [Category] {
        let categoryListing: CategoryListing = importJSON("exampleCategories.json")
        return categoryListing.result
    }
    
    private static func importPosts() -> [Post] {
        let postListing: PostListing = importJSON("examplePosts.json")
        return postListing.result
    }
    
    func postFilter(by category: Category) {
        if let choosenCategoryIndex = categories.firstIndex(where: ({$0.id == category.id})) {
            let filteredPosts: [Post] = posts.filter({ $0.category == categories[choosenCategoryIndex] })
            posts = filteredPosts
        }
    }
    
    func change(the category: Category) {
        currentCategory = category
    }
    
    var filteredPosts: [Post] {
        if currentCategory.title == "Новости" {
            return posts
        } else {
            return posts.filter({ $0.category == currentCategory })
        }
    }
    
    func addLike(for post: Post, by user: User) {
        if let choosenIndex = posts.firstIndex(where: ({$0.id == post.id})) {
            posts[choosenIndex].addLike(by: user)
        }
    }
    
    func addRespondedUser(for post: Post, registration: Registration, by user: User) {
        if let choosenIndex = posts.firstIndex(where: ({$0.id == post.id})) {
            posts[choosenIndex].addResponded(user: user, to: registration)
        }
    }
}
