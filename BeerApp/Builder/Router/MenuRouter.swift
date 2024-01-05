//
//  MenuRouter.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import UIKit

protocol MenuRouter {
    var navigationController: NavBarControler? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: MenuRouter {
    func startMenuViewController()
    func otherViewController()
    func showDetailController(_ beerDataElement: BeerElement)
    func goToMenu()
}

class Router: RouterProtocol {
    var navigationController: NavBarControler?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: NavBarControler, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func startMenuViewController() {
        if let navigationController = navigationController {
            guard let menuViewController = assemblyBuilder?.createMenuModule(router: self) else { return }
            navigationController.viewControllers = [menuViewController]
        }
    }
    
    func otherViewController() {
        if let navigationController = navigationController {
            navigationController.viewControllers = [UIViewController()]
        }
    }
    
    func showDetailController(_ beerDataElement: BeerElement) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createMenuDetailModule(
                beerElement: beerDataElement,
                router: self
            ) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func goToMenu() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
