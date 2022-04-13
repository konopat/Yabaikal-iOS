//
//  CurrentUserView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 06.04.2022.
//

import SwiftUI

struct CurrentUserView: View {
    
    @ObservedObject var userListingViewModel: AuthorizedUsersViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                
                // Curent User
                if let currentUser = userListingViewModel.currentUser {
                    if let currentUserAvatarSrc = currentUser.avatars[0].src {
                        VStack {
                            AvatarCircleFixSizeView(url: currentUserAvatarSrc, width: 150, height: 150)
                            Text("\(currentUser.name) \(currentUser.family)")
                                .font(.title2)
                            Text(currentUser.email)
                                .font(.caption)
                                .foregroundColor(Color(K.Color.text))
                        }
                        .padding(50)
                    }
                }
                
                VStack(alignment: .center) {
                    
                    if !userListingViewModel.users.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(userListingViewModel.users) { user in
                                    if !user.avatars.isEmpty {
                                        let avatarSrc = user.avatars[0].src
                                        
                                        Spacer()
                                        Button {
                                            setCurrentUser(like: user)
                                        } label: {
                                            AvatarCircleFixSizeView(
                                                url: avatarSrc,
                                                width: geometry.size.width / 4,
                                                height: geometry.size.width / 4
                                            )
                                        }
                                        Spacer()
                                    }
                                }
                            }
                            .frame(width: geometry.size.width)
                        }
                    }
                }
                
                Button("Готово") {
                   dismiss()
                }
                .padding(30)
                
            }
        }
        
        
    }
    
    // MARK: - Functions
    
    private func setCurrentUser(like user: User) {
        userListingViewModel.changeCurrentUser(to: user)
    }
}
