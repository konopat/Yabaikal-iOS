//
//  BookingView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 28.04.2022.
//

import SwiftUI

struct BookingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var arrivalDate = Date()
    @State private var departureDate = Date()
    @State private var numberOfAdultGuests = 0
    @State private var numberOfChildGuests = 0
    
    let post: Post

        var body: some View {
            VStack {
                VStack {
                    if let avatars = post.autor.avatars {
                        if let avatar = avatars[0] {
                            AvatarCircleFixSizeView(url: avatar.src, width: 150, height: 150)
                            Text("\(post.autor.name) \(post.autor.family) предлагает:")
                                .font(.caption)
                        }
                    }
                    if let rooms = post.roomsForRent {
                        if let room = rooms[0] {
                            VStack(spacing: 5) {
                                Text(room.type)
                                    .bold()
                                Text("\(room.price) руб.")
                                    .font(.title)
                            }
                            .padding()
                        }
                    }
                }
                .padding()
                
                Text("Какие даты бронируем?")
                HStack {
                    DatePicker("Дата заезда", selection: $arrivalDate, displayedComponents: .date)
                        .labelsHidden()
                

                    DatePicker("Дата выезда", selection: $departureDate, displayedComponents: .date)
                        .labelsHidden()
                }
                
                VStack(spacing: 0) {
                    
                    HStack {
                        Text("Взрослые:")
                        Picker("Количество гостей", selection: $numberOfAdultGuests) {
                            ForEach(1 ..< 7) {
                                Text("\($0) чел")
                            }
                        }
                    }
                    
                    HStack {
                        Text("Дети:")
                        Picker("Количество гостей", selection: $numberOfChildGuests) {
                            ForEach(0 ..< 7) {
                                Text("\($0) чел")
                            }
                        }
                    }
                }
                .padding()
                
              
                Button {
                    dismiss()
                } label: {
                    Text("Подтвердить")
                        .padding()
                }
                .border(Color(K.Color.accent), width: 1, cornerRadius: 10)

            }
        }
}
