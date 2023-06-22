//
//  MenuPresenter.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import UIKit

protocol MenuViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MenuPresenterProtocol: AnyObject {
    var beerElement: [BeerElement]? { get set }
    var images: [UIImage] { get set }
    
    init(view: MenuViewProtocol, networkService: NetworkServicesBeer, router: RouterProtocol, storage: StorageManagerProtocol)
    
    func getBeer()
    func getImagesBeer()
    func tapOnTheBeerElement(beerElement: BeerElement?, image: UIImage)
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
        getBeer()
    }
    
    func tapOnTheBeerElement(beerElement: BeerElement?, image: UIImage) {
        router?.showDetail(beerElement: beerElement, image: image)
    }
    
    func getBeer() {
        networkService.getBeerData { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.beerElement = data
                    self.getImagesBeer()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func getImagesBeer() {
        let dispatchGroup = DispatchGroup()
        if storage.images(forKey: .keysBeer) != nil { self.view?.succes() }
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
                    self.view?.succes()
                    self.storage.setImages(self.images, forKey: .keysBeer) }
                dispatchGroup.leave()
            }
        }
    }
}

