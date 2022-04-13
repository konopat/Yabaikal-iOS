//
//  PostRegistrationsView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 12.04.2022.
//

import SwiftUI
struct PostRegistrationsView: View {
    @ObservedObject var userListingViewModel: AuthorizedUsersViewModel
    let post: Post
    var body: some View {
        if let postRegistrations = post.registrations {
            VStack {
                ForEach(postRegistrations) { registration in
                    // Волонтеры
                    if registration.type == "volonter" {
                        ZStack {
                            Color(K.Color.background)
                            VStack(spacing: 10) {
                                Text("Регистрация волонтеров")
                                    .bold()
                                    .padding(.top)
                                Text("откликнулись: \(registration.readyNumber) / требуется еще: \(registration.needNumber - registration.readyNumber)")
                                RegistrationRespondedUsers(userListingViewModel: userListingViewModel, registration: registration)
                                Text("Нажмите на кнопку ЯВолонтер, чтобы зарегистрироваться")
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                                
                                Button {
                                    //
                                } label: {
                                    Text("ЯВолонтер")
                                        .padding()
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}
