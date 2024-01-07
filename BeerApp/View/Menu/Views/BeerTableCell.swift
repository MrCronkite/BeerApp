

import UIKit

final class BeerTableCell: UITableViewCell {
    
    private let beerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
   private let nameBeerTextLable: UILabel = {
        let text = UILabel()
        text.font = R.Font.helvetica(with: 18)
        text.numberOfLines = 2
        text.textColor = R.Colors.textColor
        return text
    }()
    
   private let beerDescriptionLable: UILabel = {
        let lable = UILabel()
        lable.textColor = R.Colors.inactive
        lable.font = R.Font.helvetica(with: 12)
        lable.numberOfLines = 4
        return lable
    }()
    
   private let buttonPrice: UIButton = {
        let button = UIButton()
        button.setTitle("от 345 р", for: .normal)
        button.layer.borderWidth = 1
        button.buttonAnimation(button)
        button.layer.borderColor = R.Colors.active.cgColor
        button.layer.cornerRadius = 12
        button.setTitleColor(R.Colors.textColor, for: .normal)
        button.titleLabel?.font = R.Font.helvetica(with: 14)
        button.backgroundColor = .white
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedView()
        setupLayout()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        embedView()
        setupLayout()
        setupAppearance()
    }
}

private extension BeerTableCell {
    func embedView() {
        [beerImageView,
         nameBeerTextLable,
         beerDescriptionLable,
         buttonPrice].forEach {
            contentView.addViews(view: $0)
        }
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            beerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            beerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            beerImageView.widthAnchor.constraint(equalToConstant: 132),
            beerImageView.heightAnchor.constraint(equalToConstant: 132),
            
            nameBeerTextLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameBeerTextLable.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: 20),
            nameBeerTextLable.widthAnchor.constraint(equalToConstant: 180),
            
            beerDescriptionLable.topAnchor.constraint(equalTo: nameBeerTextLable.bottomAnchor, constant: 10),
            beerDescriptionLable.leadingAnchor.constraint(equalTo: beerImageView.trailingAnchor, constant: 20),
            beerDescriptionLable.heightAnchor.constraint(equalToConstant: 60),
            beerDescriptionLable.widthAnchor.constraint(equalToConstant: 170),
            
            buttonPrice.topAnchor.constraint(equalTo: beerDescriptionLable.bottomAnchor, constant: 15),
            buttonPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            buttonPrice.heightAnchor.constraint(equalToConstant: 32),
            buttonPrice.widthAnchor.constraint(equalToConstant: 87),
            buttonPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    func setupAppearance() {
        contentView.backgroundColor = .white
    }
}

extension BeerTableCell {
    func setupDataCell(_ beerData: BeerElement) {
        nameBeerTextLable.text = beerData.name
        beerDescriptionLable.text = beerData.description
        beerImageView.image(url: beerData.imageURL)
    }
}
