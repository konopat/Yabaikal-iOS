//
//  ListingUsersRegistrationsView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 14.04.2022.
//

import SwiftUI

struct ListingUsersRegistrationsView: View {
    
    @ObservedObject var userListingViewModel: AuthorizedUsersViewModel
    
    var body: some View {
        ScrollView {
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
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Активности:")
                            .font(.title3)
                        Spacer()
                    }
                    HStack {
                        Text("Вы заявили о готовности помочь. Организаторы активностей должны связаться с вами, используя контакты в профиле. Вы можете в любой момент отозвать свою готовность.")
                            .font(.caption)
                        Spacer()
                    }
                }
                
                
                if let currentUserRegistrations = userListingViewModel.currentUser.registrations {
                    ForEach(currentUserRegistrations) { registration in
                        ZStack {
                            Color(K.Color.background)
                            HStack {
                                Text(registration.typeOfHelp)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .padding()
                            }
                            .padding()
                        }
                    }
                }
            }
            .padding()
        }
    }
}
