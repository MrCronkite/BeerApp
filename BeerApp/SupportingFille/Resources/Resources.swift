//
//  Resources.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import UIKit

enum R {
    enum Colors {
        static var inactive = UIColor(hexString: "#C3C4C9")
        static var active = UIColor(hexString: "#FD3A69")
        static var backgraund = UIColor(hexString: "#F3F5F9")
        static var textColor = UIColor(hexString: "#1C222B")
        static var backAlpha02 = backgraund.withAlphaComponent(0.2)
        static var activeAlpha04 = active.withAlphaComponent(0.4)
    }
    
    enum Images {
        static var banner = UIImage(named: "advBanner")
        static var downArrow = UIImage(named: "downArrow")
        static var arreyBanners = [
            UIImage(named: "advBanner"),
            UIImage(named: "advBanner"),
            UIImage(named: "advBanner"),
            UIImage(named: "advBanner")
        ]
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .cart: return "Корзина"
                case .menu: return "Меню"
                case .contacts: return "Контакты"
                case .profile: return "Профиль"
                }
            }
        }
        
       static let categoryBeer = [
        "3.2-4.6%",
        "4.5-6.2%",
        "6.3-7.4%",
        "7-10%",
        "9-14%"
       ]
    }
    
    enum ImagesBar {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .cart: return UIImage(named: "cart")
                case .menu: return UIImage(named: "menu")
                case .contacts: return UIImage(named: "contacts")
                case .profile: return UIImage(named: "profile")
                }
            }
        }
    }
    
    enum Font {
        static func helvetica(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
