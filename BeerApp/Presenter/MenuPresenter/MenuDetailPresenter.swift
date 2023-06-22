//
//  MenuDetailPresenter.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import UIKit

protocol MenuDetailViewProtocol: AnyObject {
    func setBeerData(beerElement: BeerElement?, image: UIImage)
}

protocol MenuDetailViewPresenterProtocol: AnyObject {
    init(view: MenuDetailViewProtocol,
         networkService: NetworkServicesBeer,
         beerElement: BeerElement?, image: UIImage,
         router: RouterProtocol)
    
    func setBeerData()
    func backToRootVC()
}

class MenuDetailPresenter: MenuDetailViewPresenterProtocol {
    weak var view: MenuDetailViewProtocol?
    let networkService: NetworkServicesBeer
    var router: RouterProtocol?
    var image: UIImage
    var beerElement: BeerElement?
    
    required init(view: MenuDetailViewProtocol,
                  networkService: NetworkServicesBeer,
                  beerElement: BeerElement?,
                  image: UIImage,
                  router: RouterProtocol) {
        
        self.view = view
        self.networkService = networkService
        self.beerElement = beerElement
        self.image = image
        self.router = router
    }
    
    func backToRootVC() {
        router?.goToMenu()
    }
    
    public func setBeerData() {
        self.view?.setBeerData(beerElement: beerElement, image: image)
    }
}

