//
//  TabBarController.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case menu
    case contacts
    case profile
    case cart
}

final class TabBarController: UITabBarController{
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
    }
}

extension TabBarController {
    private func configureAppearance() {
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = R.Colors.inactive.cgColor
        
        let controllers: [NavBarControler] = Tabs.allCases.map { tab in
            let controller = NavBarControler()
            let assemblyBuilder = AssemblyModelBuilder()
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.ImagesBar.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
      
            let router = Router(navigationController: controller, assemblyBuilder: assemblyBuilder)
            
            switch tab {
            case .menu: router.startMenuViewController()
            case .contacts: router.otherViewController()
            case .profile: router.otherViewController()
            case .cart: router.otherViewController()
            }
            
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
}
