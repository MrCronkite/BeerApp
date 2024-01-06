

import UIKit

extension UICollectionView {
    func register<Cell: UICollectionViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: Cell.self))")
        }
        return cell
    }
}
