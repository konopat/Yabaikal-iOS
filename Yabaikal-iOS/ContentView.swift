//
//  ContentView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 31.03.2022.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var postListingViewModel: PostListingViewModel
    @ObservedObject var authorizedUsersViewModel: AuthorizedUsersViewModel
    
    var body: some View {
        TabsView(
            postListingViewModel: postListingViewModel,
            authorizedUsersViewModel: authorizedUsersViewModel
        )
    }
}
