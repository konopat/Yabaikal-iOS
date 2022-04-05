//
//  PostView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 05.04.2022.
//

import SwiftUI

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 20) {
                HStack {
                    // MARK: - AUTOR AVATAR
                    if !post.autor.avatars.isEmpty {
                        if let urlString = URL(string: post.autor.avatars[0].src) {
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
//                                                    .shadow(radius: 1)
//                                                    .overlay(Circle().stroke(Color(K.Color.background), lineWidth: 1))
                                case .failure:
                                    Text("Не удалось загрузить картинку.")
                                        .foregroundColor(.red)
                                @unknown default:
                                    Text("Ошибка.")
                                        .foregroundColor(.red)
                                }
                            }
                            .frame(width: 50, height: 50)
                        }
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
                  
                
                // MARK: - TEXT
                Text(post.text)
                
                // MARK: - IMAGES
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
            .padding(.vertical)
        }
    }
}
