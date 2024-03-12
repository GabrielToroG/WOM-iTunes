//
//  UITableViewExtension.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import UIKit

extension UITableView {
    func registerCellClass(for cellClass: UITableViewCell.Type) {
        let className = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: className)
    }

    func dequeueReusableCell<Cell: UITableViewCell>(with type: Cell.Type, for indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as! Cell
    }
}
