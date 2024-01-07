

import UIKit

final class LoadingView: BaseView {
    
    private var isAnimating: Bool = false
    
    private var indicator = UIActivityIndicatorView()
    private var containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.alpha = 0.0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension LoadingView {
    override func setupView() {
        super.setupView()
        self.addViews(view: containerView)
        containerView.addViews(view: indicator)
    }
    
    override func addConstraintViews() {
        super.addConstraintViews()
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            indicator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            indicator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            indicator.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            indicator.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 5
        indicator.style = .medium
        indicator.color = .black
        self.backgroundColor = .gray.withAlphaComponent(0.5)
    }
}

extension LoadingView {
    func start() {
        guard !isAnimating else { return }
        
        isAnimating = true
        indicator.startAnimating()
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1.0
        })
    }
    
    func finish() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0.0
        }, completion: { finished in
            self.indicator.stopAnimating()
            self.isAnimating = false
        })
    }
}
