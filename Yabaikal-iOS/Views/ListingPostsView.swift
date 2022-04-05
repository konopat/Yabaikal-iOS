//
//  ListingPostsView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 05.04.2022.
//

import SwiftUI

struct ListingPostsView: View {
    
    @ObservedObject var viewModel: PostListingViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.posts) { post in
                PostView(post: post)
                
            }
            .padding(.horizontal)
            .background(.white)
            
        }
        .background(Color(K.Color.background))
    }
}

struct ListingPostsView_Previews: PreviewProvider {
    static var previews: some View {
        ListingPostsView()
    }
}
