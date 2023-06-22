//
//  BannerCell.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import UIKit

final class BannerCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBannerCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureBannerCell()
    }
    
    func configureBannerCell() {
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
