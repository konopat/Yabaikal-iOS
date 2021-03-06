//
//  TabsView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 05.04.2022.
//

import SwiftUI

struct TabsView: View {
    
    @ObservedObject var postListingViewModel: PostListingViewModel
    @ObservedObject var authorizedUsersViewModel: AuthorizedUsersViewModel
    
    var body: some View {
        TabView {
            NavigationView {
                ScrollView {
                        VStack {
                            VStack {
                                // Header
                                HeaderHomeView(authorizedUsersViewModel: authorizedUsersViewModel, postListingViewModel: postListingViewModel)
                            }
                            .padding(.horizontal)
                            
                            // Listing
                            ListingPostsView(
                                postListingViewModel: postListingViewModel,
                                userListingViewModel: authorizedUsersViewModel,
                                currentCategory: postListingViewModel.categories[0]
                            )
                            
                            Spacer()
                        }
                    
                }
                .navigationTitle(K.Brand.logoTitle) // For back button title
                .navigationBarHidden(true) // We wrote custom header above
                .navigationBarTitleDisplayMode(.inline) // Reduces heading space
            }
            .navigationViewStyle(StackNavigationViewStyle()) // Fix problem with constraint warning
            
            // Tabs
            .tabItem {
                TabLabel(title: K.Icons.Home.title, icon: K.Icons.Home.icon)
            }
            
            ServicesTabView(postListingViewModel: postListingViewModel)
                .tabItem {
                    TabLabel(title: K.Icons.Services.title, icon: K.Icons.Services.icon)
                }
            
            GuidView(userListingViewModel: authorizedUsersViewModel, postListingViewModel: postListingViewModel)
                .tabItem {
                    TabLabel(title: K.Icons.Guide.title, icon: K.Icons.Guide.icon)
                }
            
            ListingUsersRegistrationsView(userListingViewModel: authorizedUsersViewModel)
                .tabItem {
                    TabLabel(title: K.Icons.Volonter.title, icon: K.Icons.Volonter.icon)
                }
        }
        .accentColor(Color(K.Color.accent))
    }
}

struct TabLabel: View {
    let title: String
    let icon: String
    var body: some View {
        Label(title, image: icon)
    }
}
