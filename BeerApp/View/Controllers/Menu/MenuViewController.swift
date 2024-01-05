

import UIKit

final class MenuViewController: BaseController {
    
    let banners: [Photo] = Banner.allBanners()
    let categoryBeer = ["3.2-4.6%", "4.5-6.2%", "6.3-7.4%", "7-10%", "9-14%"]
    
    var presenter: MenuPresenterProtocol?
    
    private let navBarMenu = NavBarMenu()
    
    let mainTableView: UITableView = {
        var tableView = UITableView()
        tableView = .init(frame: .zero, style: .plain)
        tableView.layer.cornerRadius = 25
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = R.Colors.inactive
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    let collectionViewBanner: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 300, height: 112)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = R.Colors.backgraund
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let collectionViewCategories: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 88, height: 32)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = R.Colors.backgraund
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDataBeer()
        showLoading()
        
        setupView()
        addConstraintViews()
        configureAppearance()
    }
}

extension MenuViewController {
    override func setupView() {
        super.setupView()
        [
         navBarMenu,
         collectionViewBanner,
         collectionViewCategories,
         mainTableView,
        ].forEach {
            view.addViews(view: $0)
        }
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        view.backgroundColor = R.Colors.backgraund
        
        collectionViewBanner.register(BannerCell.self, forCellWithReuseIdentifier: "\(BannerCell.self)")
        collectionViewCategories.register(СategoryCell.self, forCellWithReuseIdentifier: "\(СategoryCell.self)")
        mainTableView.register(BeerTableCell.self)
        
        collectionViewCategories.dataSource = self
        collectionViewCategories.delegate = self
        collectionViewBanner.dataSource = self
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
    override func addConstraintViews() {
        super.addConstraintViews()
        NSLayoutConstraint.activate([
            navBarMenu.topAnchor.constraint(equalTo: view.topAnchor),
            navBarMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBarMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionViewBanner.topAnchor.constraint(equalTo: navBarMenu.bottomAnchor, constant: 10),
            collectionViewBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionViewBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionViewBanner.heightAnchor.constraint(equalToConstant: 122),
            
            collectionViewCategories.topAnchor.constraint(equalTo: collectionViewBanner.bottomAnchor, constant: 18),
            collectionViewCategories.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionViewCategories.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionViewCategories.heightAnchor.constraint(equalToConstant: 40),
            
            mainTableView.topAnchor.constraint(equalTo: collectionViewCategories.bottomAnchor, constant: 21),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

//MARK: - CollectionDataSource
extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionViewCategories: return categoryBeer.count
        case collectionViewBanner: return banners.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case collectionViewBanner:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(BannerCell.self)",
                                                                for: indexPath) as? BannerCell
            else { return UICollectionViewCell() }
            cell.imageView.image = UIImage(named: banners[indexPath.item].imageName)
            return cell
        case collectionViewCategories:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(СategoryCell.self)",
                                                                for: indexPath) as? СategoryCell
            else { return UICollectionViewCell() }
            cell.lableTextCell.text = categoryBeer[indexPath.row]
            return cell
        default: return UICollectionViewCell()
        }
    }
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            switch indexPath.row {
            case 0: self.mainTableView.scrollToRow(at: IndexPath(row: 24, section: 0), at: .top, animated: true)
            case 1: self.mainTableView.scrollToRow(at: IndexPath(row: 19, section: 0), at: .top, animated: true)
            case 2: self.mainTableView.scrollToRow(at: IndexPath(row: 14, section: 0), at: .top, animated: true)
            case 3: self.mainTableView.scrollToRow(at: IndexPath(row: 9, section: 0), at: .top, animated: true)
            case 4: self.mainTableView.scrollToRow(at: IndexPath(row: 4, section: 0), at: .top, animated: true)
            default: return
            }
        }
    }
}

//MARK: - TableDataSource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.beerElement?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let beerData = presenter?.beerElement?[indexPath.row] else { return UITableViewCell() }
        
        let cell: BeerTableCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setupDataCell(beerData)
        return cell
    }
}

//MARK: - TableDelegate
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let beerData = presenter?.beerElement?[indexPath.row] else { return }
        presenter?.tapOnBeerElement(beerData)
    }
}

//MARK: - MenuViewProtocol
extension MenuViewController: MenuViewProtocol {
    func reloadViewData() {
        mainTableView.reloadData()
        hideLoading()
    }
}


