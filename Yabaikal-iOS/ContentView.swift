//
//  ContentView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 31.03.2022.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var postListingViewModel: PostListingViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(postListingViewModel.posts) { post in
                    VStack {
                        Text(post.text)
                    } 

                }
            }
        }

    }

}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
