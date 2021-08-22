//
//  TableView+Extension.swift
//  YemeksepetiProject
//
//  Created by Abdullah Coban on 15.08.2021.
//

import UIKit

extension UITableView {
    func register(cellType: UITableView.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
    }
    
    func dequeCell<T: UICollectionViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T else { fatalError() }
        return cell
    }
}
