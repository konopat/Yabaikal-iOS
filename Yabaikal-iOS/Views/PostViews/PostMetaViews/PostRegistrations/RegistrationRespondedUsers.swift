//
//  RegistrationRespondedUsers.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 12.04.2022.
//

import SwiftUI

struct RegistrationRespondedUsers: View {
    
    @ObservedObject var userListingViewModel: AuthorizedUsersViewModel
    var registration: Registration
    
    var body: some View {
        if let respondedUsers = registration.respondedUsers {
            HStack {
                
                if respondedUsers.count == 1 {
                    if let firstLikerAvatarSrc = respondedUsers[0].avatars[0].src {
                        AvatarCircleFixSizeView(url: firstLikerAvatarSrc, width: 20, height: 20)
                    }
                } else if respondedUsers.count == 2 {
                    ZStack {
                        if let firstLikerAvatarSrc = respondedUsers[0].avatars[0].src {
                            AvatarCircleFixSizeView(url: firstLikerAvatarSrc, width: 20, height: 20)
                        }
                        if let secondLikerAvatarSrc = respondedUsers[1].avatars[0].src {
                            AvatarCircleFixSizeView(url: secondLikerAvatarSrc, width: 20, height: 20)
                                .padding(.trailing, 25)
                        }
                    }
                } else if respondedUsers.count > 2 {
                    ZStack {
                        if let firstLikerAvatarSrc = respondedUsers[0].avatars[0].src {
                            AvatarCircleFixSizeView(url: firstLikerAvatarSrc, width: 20, height: 20)
                        }
                        if let secondLikerAvatarSrc = respondedUsers[1].avatars[0].src {
                            AvatarCircleFixSizeView(url: secondLikerAvatarSrc, width: 20, height: 20)
                                .padding(.trailing, 25)
                        }
                        if let thirdLikerAvatarSrc = respondedUsers[2].avatars[0].src {
                            AvatarCircleFixSizeView(url: thirdLikerAvatarSrc, width: 20, height: 20)
                                .padding(.trailing, 45)
                        }
                    }
                }
            }
        }
    }
}
