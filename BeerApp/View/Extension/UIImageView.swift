

import UIKit
import Kingfisher

extension UIImageView {
    func image(url: String) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url))
    }
}
