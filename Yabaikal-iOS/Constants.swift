//
//  Constants.swift
//  Yabaikal-iOS
//
//  Created by Роман Предеин on 05.04.2022.
//

import SwiftUI

struct K {
    struct Brand {
        static let logoTitle = "ЯБайкал"
    }
    struct Color {
        static let accent = "AccentColor"
        static let primary = "PrimaryColor"
        static let text = "TextColor"
        static let background = "BackgroundColor"
    }
    struct Font {
        static let logo = "Montserrat-Bold"
        static let title1 = "Montserrat-Bold"
        static let text = "Raleway-Regular"
    }
    struct Grid {
        static let columns = [GridItem(), GridItem(), GridItem()]
        static let spacing: CGFloat = 10
    }
    struct Icons {
        struct Home {
            static let icon = "home"
            static let title = "Главная"
        }
        struct Services {
            static let icon = "apps"
            static let title = "Сервисы"
        }
        struct Guide {
            static let icon = "compass"
            static let title = "Гид"
        }
        struct Volonter {
            static let icon = "nature-people"
            static let title = "ЯВолонтер"
        }
        struct Profile {
            static let icon = "account-circle"
            static let title = "Профиль"
        }
        struct Notice {
            static let icon = "bell"
            static let title = "Уведомления"
        }
        struct Search {
            static let icon = "magnify"
            static let title = "Поиск"
        }
        struct Share {
            static let icon = "share-outline"
            static let title = "Поделиться"
        }
    }
}
