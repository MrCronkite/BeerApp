

import UIKit

extension UITableView {
    func register<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: Cell.self))")
        }
        return cell
    }
}

