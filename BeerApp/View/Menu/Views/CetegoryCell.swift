//
//  CetegoryCell.swift
//  BeerApp
//
//  Created by admin1 on 22.06.23.
//

import UIKit

final class СategoryCell: UICollectionViewCell {
    
    let lableTextCell: UILabel = {
        let lable = UILabel()
        lable.layer.borderWidth = 1
        lable.layer.borderColor = R.Colors.activeAlpha04.cgColor
        lable.backgroundColor = .white
        lable.textColor = R.Colors.textColor
        lable.textAlignment = .center
        lable.font = R.Font.helvetica(with: 15)
        lable.layer.cornerRadius = 15
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCategoryCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCategoryCell()
    }
    
    func setupCategoryCell() {
        self.contentView.addViews(view: lableTextCell)
        lableTextCell.contentMode = .scaleAspectFill
        lableTextCell.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            lableTextCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lableTextCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lableTextCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            lableTextCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
