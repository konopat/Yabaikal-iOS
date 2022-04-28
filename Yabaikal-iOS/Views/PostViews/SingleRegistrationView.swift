//
//  SingleRegistrationView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 28.04.2022.
//

import SwiftUI

struct SingleRegistrationView: View {
    
    let registration: Registration
    
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 5) {
                    Text("\(registration.typeOfHelp) вызвались:")
                        .font(.title)
                }
                Spacer()
            }
            .padding(.horizontal)
        
            if let respondedUsers = registration.respondedUsers {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(respondedUsers) { user in
                            if !user.avatars.isEmpty {
                                let avatarSrc = user.avatars[0].src
                                
                                Spacer()
                                
                                VStack {
                                    AvatarCircleFixSizeView(
                                        url: avatarSrc,
                                        width: 100,
                                        height: 100
                                    )
                                    Text("\(user.name) \(user.family)")
                                        .font(.caption)
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            Button {
                //
            } label: {
                Text("Завершить активность")
                    .padding()
            }
            .border(Color(K.Color.accent), width: 1, cornerRadius: 10)
            .padding()
            
            
        }
        
        
        
    }
}
