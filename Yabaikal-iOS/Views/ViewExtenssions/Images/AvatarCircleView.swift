//
//  AvatarCircleView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 13.04.2022.
//

import SwiftUI

struct AvatarCircleView: View {
    let url: String
    
    var body: some View {
        if let urlString = URL(string: url) {
            AsyncImage(url: urlString, transaction: .init(animation: .spring(response: 1.6))) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .progressViewStyle(.circular)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                case .failure:
                    Image(K.Default.avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                @unknown default:
                    Image(K.Default.avatar)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                }
            }
        }
    }
}
