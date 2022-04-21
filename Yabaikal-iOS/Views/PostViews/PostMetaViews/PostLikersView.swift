//
//  PostLikersView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 06.04.2022.
//

import SwiftUI

struct PostLikersView: View {
    
    @ObservedObject var userListingViewModel: AuthorizedUsersViewModel
    @ObservedObject var postListingViewModel: PostListingViewModel
    
    var post: Post
    
    var body: some View {
        if let postLikers = post.likers {
            HStack {
                    Button {
                        addLike()
                    } label: {
                        HStack {
                            if postLikers.contains(userListingViewModel.currentUser) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(Color(K.Color.primary))
                            } else {
                                Image(systemName: "heart")
                                    .foregroundColor(Color(K.Color.text))
                            }
                            Text("\(postLikers.count)")
                                .font(.caption)
                                .foregroundColor(Color(K.Color.text))
                            
                            if postLikers.count == 1 {
                                if let firstLikerAvatarSrc = postLikers[0].avatars[0].src {
                                    AvatarCircleFixSizeView(url: firstLikerAvatarSrc, width: 20, height: 20)
                                }
                            } else if postLikers.count == 2 {
                                ZStack {
                                    if let firstLikerAvatarSrc = postLikers[0].avatars[0].src {
                                        AvatarCircleFixSizeView(url: firstLikerAvatarSrc, width: 20, height: 20)
                                    }
                                    if let secondLikerAvatarSrc = postLikers[1].avatars[0].src {
                                        AvatarCircleFixSizeView(url: secondLikerAvatarSrc, width: 20, height: 20)
                                            .padding(.trailing, 25)
                                    }
                                }
                            } else if postLikers.count > 2 {
                                ZStack {
                                    if let firstLikerAvatarSrc = postLikers[0].avatars[0].src {
                                        AvatarCircleFixSizeView(url: firstLikerAvatarSrc, width: 20, height: 20)
                                    }
                                    if let secondLikerAvatarSrc = postLikers[1].avatars[0].src {
                                        AvatarCircleFixSizeView(url: secondLikerAvatarSrc, width: 20, height: 20)
                                            .padding(.trailing, 25)
                                    }
                                    if let thirdLikerAvatarSrc = postLikers[2].avatars[0].src {
                                        AvatarCircleFixSizeView(url: thirdLikerAvatarSrc, width: 20, height: 20)
                                            .padding(.trailing, 45)
                                    }
                                }
                            }
                        }
                    }
                Spacer()
            }
        } else {
            Button {
                addLike()
            } label: {
                Image(systemName: "heart")
                    .foregroundColor(Color(K.Color.text))
            }
        }
    }
    
    private func addLike() {
        let currentUser = userListingViewModel.currentUser
        postListingViewModel.addLike(for: post, by: currentUser)
    }
}
