//
//  ListingPostsView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 05.04.2022.
//

import SwiftUI

struct ListingPostsView: View {
    
    @ObservedObject var postListingViewModel: PostListingViewModel
    @State var currentCategory: Category
    
    var body: some View {
        VStack {
            
            // MARK: - CATEGORIES
            ScrollView(.horizontal) {
                HStack(spacing: 30) {
                    ForEach(postListingViewModel.categories, id: \.self) { category in
                        Button {
                            change(the: category)
                        } label: {
                            if category == currentCategory {
                                Text(category.title)
                                    .foregroundColor(Color(K.Color.text))
                                    
                            } else {
                                Text(category.title)
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            .padding(.horizontal)
            
            // MARK: - FORM
            FormAddNewPostView(text: "Предложить новость")
                .padding(.horizontal)
            
            // MARK: - LISTING
            LazyVStack {
                ForEach(postListingViewModel.filteredPosts) { post in
                    PostView(post: post)
                }
                .padding(.horizontal)
                .background(.white)
            }
            .background(Color(K.Color.background))
            .padding(.vertical)
        }
    }
    
    // MARK: - FUNCTIONS
    private func change(the category: Category) {
        currentCategory = category
        postListingViewModel.change(the: currentCategory)
    }
}
