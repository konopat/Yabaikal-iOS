//
//  PostRegistrationsView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 12.04.2022.
//

import SwiftUI
struct PostRegistrationsView: View {
    
    @ObservedObject var userListingViewModel: AuthorizedUsersViewModel
    @ObservedObject var postListingViewModel: PostListingViewModel
    
    let post: Post
    var body: some View {
        if let postRegistrations = post.registrations {
            VStack {
                ForEach(postRegistrations) { registration in
                    
                    VStack(spacing: 20) {
                        Text(registration.typeOfHelp)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        if let respondedUSers = registration.respondedUsers {
                            NavigationLink {
                                RespondedUsersView(userListingViewModel: userListingViewModel, registration: registration)
                            } label: {
                                HStack {
                                    Text("\(respondedUSers.count)")
                                    RegistrationRespondedUsers(userListingViewModel: userListingViewModel, registration: registration)
                                }                                
                            }
                        }
                        
                        Button {
                            addRespondedUser(for: post, registration: registration)
                        } label: {
                            if let respondendUsers = registration.respondedUsers {
                                if respondendUsers.contains(userListingViewModel.currentUser) {
                                    Text("Отменить мое участие")
                                } else {
                                    Text("Я помогу с этим")
                                }
                            } else {
                                Text("Я буду первым!")
                            }
                        }
                    }
                    .padding()
                    
                }
            }
        }
    }
    
    private func addRespondedUser(for post: Post, registration: Registration) {
        let currentUser = userListingViewModel.currentUser
        postListingViewModel.addRespondedUser(for: post, registration: registration, by: currentUser)
    }
}
