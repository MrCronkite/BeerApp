

import UIKit

class MenuDetailViewController: BaseController {
    
    var presenter: MenuDetailViewPresenterProtocol!
    
    private let beerTitleLable: UILabel = {
        let lable = UILabel()
        lable.font = R.Font.helvetica(with: 20)
        lable.numberOfLines = 2
        lable.textAlignment = .center
        return lable
    }()
    
    private let beerDescriptionLabel: UILabel = {
        let lable = UILabel()
        lable.font = R.Font.helvetica(with: 17)
        lable.numberOfLines = 15
        lable.textAlignment = .center
        return lable
    }()
    
    private let beerImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private let backButton: UIButton = {
        let view = UIButton()
        view.setTitle("Back", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setBeerData()
    }
}

extension MenuDetailViewController {
    override func setupView() {
        super.setupView()
        [
            beerTitleLable,
            beerDescriptionLabel,
            beerImageView,
            backButton
        ].forEach { view.addViews(view: $0) }
    }
    
    override func addConstraintViews() {
        super.addConstraintViews()
        NSLayoutConstraint.activate([
            beerTitleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            beerTitleLable.widthAnchor.constraint(equalToConstant: 200),
            beerTitleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            beerImageView.topAnchor.constraint(equalTo: beerTitleLable.bottomAnchor, constant: 10),
            beerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            beerImageView.heightAnchor.constraint(equalToConstant: 280),
            beerImageView.widthAnchor.constraint(equalToConstant: 100),
            
            beerDescriptionLabel.topAnchor.constraint(equalTo: beerImageView.bottomAnchor, constant: 20),
            beerDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            beerDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.backgroundColor = R.Colors.backgraund
    }
    
    override func setupBehavior() {
        super.setupBehavior()
        backButton.addTarget(self, action: #selector(goToMenuVC), for: .touchUpInside)
    }
}

@objc extension MenuDetailViewController {
    func goToMenuVC() {
        presenter.backToRootVC()
    }
}

extension MenuDetailViewController: MenuDetailViewProtocol {
    func setBeerData(beerElement: BeerElement) {
        beerTitleLable.text = beerElement.name
        beerDescriptionLabel.text = beerElement.description
        beerImageView.image(url: beerElement.imageURL)
    }
}
