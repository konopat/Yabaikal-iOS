//
//  GuidView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 21.04.2022.
//

import SwiftUI

struct GuidView: View {
    @ObservedObject var userListingViewModel: AuthorizedUsersViewModel
    @ObservedObject var postListingViewModel: PostListingViewModel
    
    @State var searchFildValue: String = ""
    var body: some View {
        NavigationView {
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
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Вы в Иркутске")
                            .font(.largeTitle)
                        Spacer()
                        


                    }
                    
                    Button {
                        //
                    } label: {
                        HStack {
                            Text("Уточнить местоположение")
                                .font(.caption)
                            Image(systemName: "location.north.fill")
                            Spacer()
                        }
                    }
                    
                    HStack {
                        Text("Это уникальный, старинный город, столица Восточной Сибири, Ворота Байкала.")
                            .multilineTextAlignment(.leading)
                            .font(.italic(.body)())
                        Spacer()
                    }
                    .padding(.top)
                    
                    ZStack {
                        Color(K.Color.background)
                        VStack {
                            HStack {
                                Text("Что посмотреть")
                                    .bold()
                                Spacer()
                            }
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(alignment: .top, spacing: 20) {
                                    
                                    NavigationLink {
                                        BabrScuplptureView()
                                    } label: {
                                        VStack(spacing: 20) {
                                            LocalImageView(fileName: "babr", height: 250)
                                                
                                            Text("Скульптура Бабра (Изображен на гербе области)")
                                        }
                                    }
                                    
                                    VStack(spacing: 20) {
                                        LocalImageView(fileName: "sloboda", height: 250)
                                        Text("130-й квартал (Иркутская слобода)")
                                    }
                                    
                                    
                                    
                                    VStack(spacing: 20) {
                                        LocalImageView(fileName: "volkonskogo", height: 250)
                                            
                                        Text("Дом-музей Волконского")
                                    }
                                    
                                    

                            
                                    
                                }
                            }
                            
                            HStack {
                                Button {
                                    //
                                } label: {
                                    HStack {
                                        Text("Показать все места")
                                            .font(.caption)
                                        Image("compass")
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        
                    }
                    .padding(.top)
                    
                    VStack {
                        HStack {
                            Text("Активисты и знатоки города")
                                .bold()
                            Spacer()
                        }
                        
                        if !userListingViewModel.users.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(userListingViewModel.users) { user in
                                        if !user.avatars.isEmpty {
                                            let avatarSrc = user.avatars[0].src
                                            
                                            Spacer()
                                            
                                            AvatarCircleFixSizeView(
                                                url: avatarSrc,
                                                width: 100,
                                                height: 100
                                            )
                                            
                                            Spacer()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    
                    VStack {
                        HStack {
                            Text("Жилье")
                                .bold()
                            Spacer()
                        }.padding()
                        
                        LazyVStack {
                            ForEach(postListingViewModel.postFilterByCategory(title: "Жилье")) { post in
                                PostView(userListingViewModel: userListingViewModel, postListingViewModel: postListingViewModel, post: post)
                            }
                            .padding(.horizontal)
                            .background(.white)
                        }
                        .background(Color(K.Color.background))
                    }
                    
                    
                    VStack {
                        HStack {
                            Text("Транспорт")
                                .bold()
                            Spacer()
                        }
                    }
                    .padding()
                        
                }
                
                
                
            }.padding()
        }
        .navigationTitle("Гид")
        .navigationViewStyle(.stack)
    }
        
    }
}

struct GuidView_Previews: PreviewProvider {
    static var previews: some View {
        GuidView(userListingViewModel: AuthorizedUsersViewModel(), postListingViewModel: PostListingViewModel())
    }
}
