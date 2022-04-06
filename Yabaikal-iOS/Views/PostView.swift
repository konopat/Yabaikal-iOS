//
//  PostView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 05.04.2022.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var userListingViewModel: AuthorizedUsersViewModel
    @ObservedObject var postListingViewModel: PostListingViewModel
    
    var post: Post
    
    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 20) {
                PostAutorAvatarView(post: post)
                Text(post.text)
                PostImagesView(post: post)
                HStack {
                    PostLikersView(userListingViewModel: userListingViewModel, postListingViewModel: postListingViewModel, post: post)
                    Spacer()
                }
            }
            .padding(.vertical)
        }
    }
}


