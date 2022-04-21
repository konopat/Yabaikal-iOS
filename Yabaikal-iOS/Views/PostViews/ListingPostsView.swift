//
//  ListingPostsView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 05.04.2022.
//

import SwiftUI

struct ListingPostsView: View {
    
    @ObservedObject var postListingViewModel: PostListingViewModel
    @ObservedObject var userListingViewModel: AuthorizedUsersViewModel
    @State var currentCategory: Category
    
    var body: some View {
        VStack {
            
            // MARK: - CATEGORIES
            ScrollView(.horizontal, showsIndicators: false) {
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
            FormAddNewPostView(text: newPostButtonTitle())
                .padding(.horizontal)
            
            // MARK: - LISTING
            LazyVStack {
                ForEach(postListingViewModel.filteredPosts) { post in
                    PostView(userListingViewModel: userListingViewModel, postListingViewModel: postListingViewModel, post: post)
                }
                .padding(.horizontal)
                .background(.white)
            }
            .background(Color(K.Color.background))
//            .padding(.vertical)
        }
    }
    
    // MARK: - FUNCTIONS
    private func change(the category: Category) {
        currentCategory = category
        postListingViewModel.change(the: currentCategory)
    }
    
    private func newPostButtonTitle() -> String {
        switch currentCategory.title {
        case "Новости": return "Предложить новость"
        case "Жилье": return "Предложить жилье"
        case "Транспорт": return "Предложить транспорт"
        case "Еда": return "Предложить еду"
        case "Туры": return "Предложить тур"
        case "Гиды": return "Предложить свои услуги"
        case "Переводчики": return "Предложить свои услуги"
        case "Волонтеры": return "Призвать на помощь"
        case "Мероприятия": return "Предложить мероприятие"
        case "Сувениры": return "Предложить сувениры"
        case "Работа": return "Предложить работу"
        default: return "Предложить новость"
        }
    }
}
