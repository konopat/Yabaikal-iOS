//
//  SelectedUserView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 13.04.2022.
//

import SwiftUI

struct SelectedUserView: View {
    let user: User
    var body: some View {
        ScrollView {
            VStack {
                AvatarCircleFixSizeView(url: user.avatars[0].src, width: 100, height: 100)
                Text("\(user.name) \(user.family)")
                    .bold()
                Text(user.email)
                    .font(.caption)
            }
        }
    }
}
