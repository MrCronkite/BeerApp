

import UIKit

final class NavBarMenu: BaseView {
    
    private let dropItemButton: MenuButton = {
        let button = MenuButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = R.Colors.activeAlpha04.cgColor
        button.layer.cornerRadius = 15
        return button
    }()
}

extension NavBarMenu {
    override func setupView() {
        super.setupView()
        addViews(view: dropItemButton)
    }
    
    override func addConstraintViews() {
        super.addConstraintViews()
        
        NSLayoutConstraint.activate([
            dropItemButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            dropItemButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dropItemButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            dropItemButton.heightAnchor.constraint(equalToConstant: 35),
            dropItemButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
    }
}
