

import UIKit

class BaseController: UIViewController {
    
   private let loadingView = LoadingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createLoadingView()
        
        setupView()
        addConstraintViews()
        configureAppearance()
    }
}
 
@objc extension BaseController {
    func createLoadingView() {
        loadingView.frame = view.bounds
        loadingView.layer.zPosition = 3
        view.addSubview(loadingView)
    }
    
    func showLoading() {
        loadingView.start()
    }
    
    func hideLoading() {
        loadingView.finish()
    }
    
    func setupView() {}
    
    func addConstraintViews() {}
    
    func configureAppearance() {
        view.backgroundColor = R.Colors.backgraund
    }
}


