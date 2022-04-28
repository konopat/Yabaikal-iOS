//
//  RoomPreviewCardView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 14.04.2022.
//

import SwiftUI

struct RoomPreviewCardView: View {
    
    @State private var showBookingForm = false
    
    let post: Post
    
    var body: some View {
        if let rooms = post.roomsForRent {
            
                VStack {
                    ForEach(rooms) { room in
                        ZStack {
                            Color(K.Color.background)
                            VStack {
                                Text(room.type)
                                VStack(spacing: 5) {
                                    Text("\(room.price) руб.")
                                        .bold()
                                        .font(.title)
                                    Text("(\(room.rentPeriod))")
                                        .font(.caption)
                                        .foregroundColor(Color(K.Color.text))
                                }
                                .padding(.top, 5)
                                .padding(.bottom)
                                
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(room.images ) { image in
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
                                } // Images scrollview
                                
                                
                                VStack {
                                    if let roomAddress = room.address {
                                        Button {
                                            //
                                        } label: {
                                            Text(roomAddress)
                                                .font(.caption)
                                                .padding(.top)
                                        }
                                    }
                                    
                                    Button {
                                        showBookingView()
                                    } label: {
                                        Text("Забронировать")
                                            .padding()
                                            
                                    }
                                    .border(Color(K.Color.accent), width: 1, cornerRadius: 10)
                                    .padding(.top)
                                    .sheet(isPresented: $showBookingForm) {
                                        BookingView(post: post)
                                    }
                                }
                                
                            }
                            .padding(.vertical, 30)
                            .padding(.horizontal)
                        } // Zstack
                    }
                   
                } // VStack
                
                
            
            
            
        } // if let hotel = post.hotel
    }
    
    private func showBookingView() {
        showBookingForm.toggle()
    }
}
