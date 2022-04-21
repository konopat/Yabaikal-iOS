//
//  FormAddNewPostView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 05.04.2022.
//

import SwiftUI

struct FormAddNewPostView: View {
    let text: String
    var body: some View {
        HStack {
            Button {
                //
            } label: {
                HStack {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    Text(text)
                }
            }
            Spacer()
        }
        .padding()
        .background(Color(uiColor: .systemGray6))
    }
}
