//
//  ServicesTabView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 14.04.2022.
//

import SwiftUI

struct ServicesTabView: View {
    @ObservedObject var postListingViewModel: PostListingViewModel
    @State var searchFildValue: String = ""
    var body: some View {
        
        ScrollView {
            VStack {
                ZStack {
                    Color(K.Color.background)
                    HStack {
                        TextField("Поиск", text: $searchFildValue)
                        Image(K.Icons.Search.icon)
                    }
                    .padding()
                }
                
                LazyVGrid(columns: K.Grid.columns) {
                    ForEach(postListingViewModel.categories) { category in
                        if let categoryIcon = category.icon {
                            Button {
                                //
                            } label: {
                                VStack {
                                    Image(categoryIcon)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35, alignment: .center)
                                    Text(category.title)
                                        .font(.caption)
                                }
                                .padding()
                            }

                        }
                    }
                }
                .padding(.vertical)
                
            } // VStack
            .padding()
        } // ScrollView
        
    }
}
