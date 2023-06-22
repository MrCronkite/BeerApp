//
//  NavBarController.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import UIKit

final class NavBarControler: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isHidden = true
    }
}
