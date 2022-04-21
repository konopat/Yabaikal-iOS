//
//  LocalImageView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 21.04.2022.
//

import SwiftUI

struct LocalImageView: View {
    let fileName: String
    let height: CGFloat
    var body: some View {
//        HStack {
//            Image(fileName)
//                .resizable()
//                .scaledToFill()
//                .aspectRatio(contentMode: .fill)
//                .clipShape(RoundedRectangle(cornerRadius: 0))
//        }
        Color.clear
            .frame(height: height)
            .overlay(
                Image(fileName)
                    .resizable()
                    .scaledToFill()
                    
                )
            .clipShape(Rectangle())
    }
}
