//  UITableView.swift
//  Movie
//  Created by Yusuf Muhammet Yıldırım on 5/4/22.

import UIKit

extension UITableView {
    func register(cellType: UITableViewCell.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
    }
    
    func dequeCell<T: UITableViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath) as? T else { fatalError("UICollectionView Extension dequeCell Fatal Error") }
        return cell
    }
}
