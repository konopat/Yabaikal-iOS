//
//  HotelPreviewCardView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 14.04.2022.
//

import SwiftUI

struct HotelPreviewCardView: View {
    
    let post: Post

    var body: some View {
        
        if let hotel = post.hotel {
            ZStack {
                Color(K.Color.background)
                VStack {
                    VStack(spacing: 10) {
                        Text(hotel.title)
                            .font(.title)                        
                        RatingView(rating: hotel.rating)
                        Text(hotel.shortDescription)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        

                    }
                    .padding()
                    // IMAGES
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(hotel.images ) { image in
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
                    
                    Button {
                        //
                    } label: {
                        Text("Подробнее")
                            .padding()
                    }
                    .border(Color(K.Color.accent), width: 1, cornerRadius: 10)
                    .padding()
                    
                } // VStack
                .padding()
                
            } // Zstack
            
            
        } // if let hotel = post.hotel
    } // Body

}
