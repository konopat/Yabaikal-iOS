//
//  HeaderHomeView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 05.04.2022.
//

import SwiftUI

struct HeaderHomeView: View {
    
    @ObservedObject var authorizedUsersViewModel: AuthorizedUsersViewModel
    @ObservedObject var postListingViewModel: PostListingViewModel
    @State private var showingCurrentUserSheet = false
    
    var body: some View {
        HStack {
            // Left icons
            HStack {
//                NavigationLink {
//                    CurrentUserView(userListingViewModel: authorizedUsersViewModel)
//                } label: {
//                    Image(K.Icons.Profile.icon)
//                        .foregroundColor(Color(K.Color.text))
//                }
                
                Button {
                    goCurrentUserView()
                } label: {
                    if let currentUser = authorizedUsersViewModel.currentUser {
                        if let avatarSrcr = currentUser.avatars[0].src {
                            AvatarCircleFixSizeView(url: avatarSrcr, width: 35, height: 35)
                        }
                    } else {
                        Image(K.Icons.Profile.icon)
                            .foregroundColor(Color(K.Color.text))
                    }
                }
                .sheet(isPresented: $showingCurrentUserSheet) {
                    CurrentUserView(userListingViewModel: authorizedUsersViewModel)
                }

            }
            Spacer()
            // LogoTitle
            HStack(spacing: 0) {
                
                Group {
//                    Text("Я")
//                        .foregroundColor(Color(K.Color.primary))
//                        .bold()
                    Text("Байкал ")
                        .foregroundColor(Color(K.Color.primary))
                        .bold()
                    Text(postListingViewModel.currentCategory.title)
                        .foregroundColor(Color(K.Color.accent))
                        .bold()
                }
                
            }
            .font(.title2)
//            .font(Font.custom(K.Font.logo, size: 28))
            Spacer()
            // Right icons
            HStack {
                Button {
                    //
                } label: {
                    Image(K.Icons.Notice.icon)
                        .foregroundColor(Color(K.Color.text))
                }
            }
        }
    }
    
    // MARK: - Functions
    
    func goCurrentUserView() {
        showingCurrentUserSheet.toggle()
//        if let window = UIApplication.shared.windows.first {
//            window.rootViewController = UIHostingController(rootView: CurrentUserView(userListingViewModel: authorizedUsersViewModel))
//            window.makeKeyAndVisible()
//        }
    }
}
