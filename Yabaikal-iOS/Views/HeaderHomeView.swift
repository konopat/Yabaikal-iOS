//
//  HeaderHomeView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 05.04.2022.
//

import SwiftUI

struct HeaderHomeView: View {
    var body: some View {
        HStack {
            // Left icons
            HStack {
                Button {
                    //
                } label: {
                    Image(K.Icons.Profile.icon)
                        .foregroundColor(Color(K.Color.text))
                }

            }
            Spacer()
            // LogoTitle
            HStack(spacing: 0) {
                Text("Я")
                    .foregroundColor(Color(K.Color.primary))
                    .bold()
                Text("Байкал")
                    .foregroundColor(Color(K.Color.accent))
            }
            .font(.title2)
//            .font(Font.custom(K.Font.logo, size: 28))
            Spacer()
            // Right icons
            HStack {
                Button {
                    //
                } label: {
                    Image(K.Icons.Notice.icon)
                        .foregroundColor(Color(K.Color.text))
                }
            }
        }
    }
}
