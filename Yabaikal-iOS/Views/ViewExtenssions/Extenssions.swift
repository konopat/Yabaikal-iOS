//
//  Extenssions.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 14.04.2022.
//

import SwiftUI

extension View {
    func border(_ color: Color, width: CGFloat, cornerRadius: CGFloat) -> some View {
        overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(color, lineWidth: width)
        )
    }
}
