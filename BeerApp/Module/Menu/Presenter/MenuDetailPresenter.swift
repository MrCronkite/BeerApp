//
//  MenuDetailPresenter.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import UIKit

protocol MenuDetailViewProtocol: AnyObject {
    func setBeerData(beerElement: BeerElement)
}

protocol MenuDetailViewPresenterProtocol: AnyObject {
    var beerElement: BeerElement { get set }
    
    func setBeerData()
    func backToRootVC()
}

class MenuDetailPresenter: MenuDetailViewPresenterProtocol {
    weak var view: MenuDetailViewProtocol?
    let networkService: NetworkServicesBeer
    var router: RouterProtocol?
    var beerElement: BeerElement
    
    init(view: MenuDetailViewProtocol,
                  networkService: NetworkServicesBeer,
                  beerElement: BeerElement,
                
                  router: RouterProtocol) {
        
        self.view = view
        self.networkService = networkService
        self.beerElement = beerElement
        self.router = router
    }
    
    func backToRootVC() {
        router?.goToMenu()
    }
    
    public func setBeerData() {
        self.view?.setBeerData(beerElement: beerElement)
    }
}

