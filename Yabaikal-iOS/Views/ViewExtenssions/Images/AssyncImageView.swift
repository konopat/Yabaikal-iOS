//
//  AssyncImageView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 21.04.2022.
//

import SwiftUI

struct AssyncImageView: View {
    let src: String
    var body: some View {
        if let urlString = URL(string: src) {
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
                    Image(K.Default.errorImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                @unknown default:
                    Image(K.Default.errorImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                }
            }
            .frame(height: 240)
        }
    }
}
