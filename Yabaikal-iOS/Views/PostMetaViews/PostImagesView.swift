//
//  PostImagesView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 06.04.2022.
//

import SwiftUI

struct PostImagesView: View {
    let post: Post
    var body: some View {
        if !post.images.isEmpty {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(post.images) { image in
                        if let urlString = URL(string: image.src) {
                            AsyncImage(url: urlString, transaction: .init(animation: .spring(response: 1.6))) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                case .failure:
                                    Text("Не удалось загрузить картинку.")
                                        .foregroundColor(.red)
                                @unknown default:
                                    Text("Ошибка.")
                                        .foregroundColor(.red)
                                }
                            }
                            .frame(height: 240)
                        }
                    }
                }
            }
        }
    }
}
