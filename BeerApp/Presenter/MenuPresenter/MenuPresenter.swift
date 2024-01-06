

import UIKit

protocol MenuViewProtocol: AnyObject {
    func reloadViewData()
}

protocol MenuPresenterProtocol: AnyObject {
    var beerElement: [BeerElement] { get set }
    
    func getDataBeer()
    func tapOnBeerElement(_ beerData: BeerElement)
}

final class MenuPresenterImpl: MenuPresenterProtocol {
    weak var view: MenuViewProtocol?
    var router: RouterProtocol?
    var storage: StorageManagerProtocol
    let networkService: NetworkServicesBeer
    var beerElement: [BeerElement] = []
    
    required init(view: MenuViewProtocol, networkService: NetworkServicesBeer, router: RouterProtocol, storage: StorageManagerProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        self.storage = storage
    }
    
    func tapOnBeerElement(_ beerData: BeerElement) {
        router?.showDetailController(beerData)
    }
    
    func getDataBeer() {
        networkService.getBeerData { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.beerElement = data
                    self.view?.reloadViewData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

