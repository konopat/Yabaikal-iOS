//
//  RespondedUsersView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 13.04.2022.
//

import SwiftUI

struct RespondedUsersView: View {
    
    @ObservedObject var userListingViewModel: AuthorizedUsersViewModel
    var registration: Registration
    
    var body: some View {
        if let respondedUsers = registration.respondedUsers {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Text("Зарегистрированные пользователи")
                            .font(.title)
                        
                        Spacer()
                    }
                    HStack {
                        Text(registration.typeOfHelp)
                            .font(.caption)
                        
                        Spacer()
                    }
                    LazyVGrid(columns: K.Grid.columns, spacing: K.Grid.spacing) {
                        ForEach(respondedUsers) { user in
                            NavigationLink {
                                SelectedUserView(user: user)
                            } label: {
                                VStack {
                                    AvatarCircleView(url: user.avatars[0].src)
                                        .padding(.horizontal)
                                    Text("\(user.name) \(user.family)")
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                }
                            }

                        }
                    }
                    .padding(.top)
                }
                .padding()
            }

        }
    }
}
