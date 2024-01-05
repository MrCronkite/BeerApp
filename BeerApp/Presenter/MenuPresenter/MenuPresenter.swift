

import UIKit

protocol MenuViewProtocol: AnyObject {
    func reloadViewData()
}

protocol MenuPresenterProtocol: AnyObject {
    var beerElement: [BeerElement]? { get set }
    var images: [UIImage] { get set }
    
    func getDataBeer()
    func getImagesBeer()
    func tapOnBeerElement(_ beerData: BeerElement)
}

final class MenuPresenterImpl: MenuPresenterProtocol {
    weak var view: MenuViewProtocol?
    var router: RouterProtocol?
    var storage: StorageManagerProtocol
    let networkService: NetworkServicesBeer
    var beerElement: [BeerElement]?
    var images = [UIImage] ()
    
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
    
    func getImagesBeer() {
        let dispatchGroup = DispatchGroup()
        if storage.images(forKey: .keysBeer) != nil { self.view?.reloadViewData() }
        guard let beerElement = beerElement else { return }
        for i in 0..<beerElement.count {
            
            dispatchGroup.enter()
            networkService.asyncLoadImage(imageURL: URL(string: beerElement[i].imageURL)!,
                                          runQueue: DispatchQueue.global(),
                                          completionQueue: DispatchQueue.main) { [weak self] result, error in
                guard let self = self else { return }
                guard let image = result else { return }
                self.images.append(image)
                if self.images.count == 25 {
                    self.view?.reloadViewData()
                    self.storage.setImages(self.images, forKey: .keysBeer) }
                dispatchGroup.leave()
            }
        }
    }
}

