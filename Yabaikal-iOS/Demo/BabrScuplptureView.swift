//
//  BabrScuplptureView.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 28.04.2022.
//

import SwiftUI

struct BabrScuplptureView: View {
    @State var iWasHere = false
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                LocalImageView(fileName: "babr", height: 250)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Скульптура Бабра")
                            .font(.largeTitle)
                        Spacer()
                    }
                    HStack {
                        if iWasHere {
                            Image(systemName: "checkmark.seal.fill")
                                .resizable()
                                .aspectRatio(1/1, contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(K.Color.primary))
                            Text("Вы были здесь")
                                .foregroundColor(Color(K.Color.text))
                        } else {
                            Button {
                                iWasHere.toggle()
                            } label: {
                                Image(systemName: "checkmark.seal")
                                    .resizable()
                                    .aspectRatio(1/1, contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                Text("Добавить в посещенные")
                            }

                        }
                        Spacer()
                    }
                    Text("Памятник-символ в городе Иркутске. Фигура заимствована из герба Иркутска. Скульптура находится в историческом центре города, на улице Ленина в сквере, где начинается 130-м квартал. Установлена 4 октября 2012. Авторы — скульптор Наталья Бакут, архитектор Ольга Смирнова.")
                        .multilineTextAlignment(.leading)
                    HStack {
                        VStack {
                            AvatarCircleFixSizeView(url: "http://baikal-info.ru/sites/default/files/8_314.jpg", width: 80, height: 80)
                            Text("Наталья Бакут")
                                .font(.caption)
                            Text("(скульптор)")
                                .font(.caption)
                        }
                        VStack {
                            AvatarCircleFixSizeView(url: "https://vistapointe.net/images/unknown-7.jpg", width: 80, height: 80)
                            Text("Ольга Смирнова")
                                .font(.caption)
                            Text("(архитектор)")
                                .font(.caption)
                        }
                        Spacer()
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct BabrScuplptureView_Previews: PreviewProvider {
    static var previews: some View {
        BabrScuplptureView()
    }
}
