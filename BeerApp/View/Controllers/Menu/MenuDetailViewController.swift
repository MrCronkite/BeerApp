//
//  MenuDetailViewController.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    let lableBeer: UILabel = {
        let lable = UILabel()
        lable.font = R.Font.helvetica(with: 20)
        lable.numberOfLines = 2
        lable.textAlignment = .center
        return lable
    }()
    
    let descriptionBeerLabel: UILabel = {
        let lable = UILabel()
        lable.font = R.Font.helvetica(with: 17)
        lable.numberOfLines = 15
        lable.textAlignment = .center
        return lable
    }()
    
    let imageBeer: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    let backButton: UIButton = {
        let view = UIButton()
        view.setTitle("Back", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    var presenter: MenuDetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
        addConstraintViews()
        configureAppearance()
        presenter.setBeerData()
        backButton.addTarget(self, action: #selector(goToMenuVC), for: .touchUpInside)
    }
}

extension MenuDetailViewController {
    private func setupViews() {
        [
            lableBeer,
            descriptionBeerLabel,
            imageBeer,
            backButton
        ].forEach { view.addViews(view: $0) }
    }
    
    private func addConstraintViews() {
        NSLayoutConstraint.activate([
            lableBeer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lableBeer.widthAnchor.constraint(equalToConstant: 200),
            lableBeer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageBeer.topAnchor.constraint(equalTo: lableBeer.bottomAnchor, constant: 10),
            imageBeer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageBeer.heightAnchor.constraint(equalToConstant: 280),
            imageBeer.widthAnchor.constraint(equalToConstant: 100),
            
            descriptionBeerLabel.topAnchor.constraint(equalTo: imageBeer.bottomAnchor, constant: 20),
            descriptionBeerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            descriptionBeerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13)
        ])
    }
    
    private func configureAppearance() {
        view.backgroundColor = R.Colors.backgraund
    }
    
    @objc func goToMenuVC() {
        presenter.backToRootVC()
    }
}

extension MenuDetailViewController: MenuDetailViewProtocol {
    func setBeerData(beerElement: BeerElement?, image: UIImage) {
        lableBeer.text = beerElement?.name
        descriptionBeerLabel.text = beerElement?.description
        imageBeer.image = image
    }
}
