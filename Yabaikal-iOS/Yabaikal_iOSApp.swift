//
//  Yabaikal_iOSApp.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 31.03.2022.
//

import SwiftUI

@main
struct Yabaikal_iOSApp: App {
    
    let postListingViewModel = PostListingViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(
                postListingViewModel: postListingViewModel
            )
        }
    }
}
