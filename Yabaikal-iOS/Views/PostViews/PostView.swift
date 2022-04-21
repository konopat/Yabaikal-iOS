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
                HStack {
                    Text(post.text)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                PostImagesView(post: post)
                if post.registrations != nil {
                    ZStack {
                        Color(K.Color.background)
                        VStack(spacing: 0) {
                            VStack(spacing: 10) {
                                Text("Готовы помочь?")
                                    .font(.title)
                                Text("Выберите чем вы сможете помочь и нажмите на кнопку «Я помогу с этим». Если ваша помощь понадобится, организаторы свяжутся с вами через контакты, которые указаны в вашем профиле.")
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(30)
                            PostRegistrationsView(userListingViewModel: userListingViewModel, postListingViewModel: postListingViewModel, post: post)
                                .padding(.bottom, 30)
                        }
                    }
                }
                
                if post.roomsForRent != nil {
                    RoomPreviewCardView(post: post)
                }
                
                if post.hotel != nil {
                    HotelPreviewCardView(post: post)
                }
                
                HStack {
                    PostLikersView(userListingViewModel: userListingViewModel, postListingViewModel: postListingViewModel, post: post)
                    Spacer()
                    Image(systemName: "arrowshape.turn.up.right")
                        .foregroundColor(Color(K.Color.text))
                }
            }
            .padding(.vertical)
        }
    }
}


