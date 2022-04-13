//
//  PostAutorAvatarView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 06.04.2022.
//

import SwiftUI

struct PostAutorAvatarView: View {
    
    let post: Post
    
    var body: some View {
        HStack {
            if !post.autor.avatars.isEmpty {
                AvatarCircleFixSizeView(
                    url: post.autor.avatars[0].src,
                    width: 50,
                    height: 50
                )
            }
            VStack(alignment: .leading, spacing: 3) {
                Text("\(post.autor.name) \(post.autor.family)")
                    .bold()
                Text("\(post.timestamp, format: Date.FormatStyle().year().month().day().hour().minute())")
                    .font(.caption)
                    .foregroundColor(Color(K.Color.text))
            }
            Spacer()
        }
    }
}
