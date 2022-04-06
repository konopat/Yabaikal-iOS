//
//  AvatarCircleView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 06.04.2022.
//

import SwiftUI

struct AvatarCircleView: View {
    
    let url: String
    let width: CGFloat
    let height: CGFloat
    
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
                    Text("Не удалось загрузить картинку.")
                        .foregroundColor(.red)
                @unknown default:
                    Text("Ошибка.")
                        .foregroundColor(.red)
                }
            }
            .frame(width: width, height: height)
        }
    }
}
