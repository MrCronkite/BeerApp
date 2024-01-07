

import UIKit

final class NavBarControler: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

extension NavBarControler {
    private func configureAppearance() {
        view.backgroundColor = .white
        navigationBar.isHidden = true
    }
}
 
