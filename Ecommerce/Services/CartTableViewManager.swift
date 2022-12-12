//
//  CartTableViewManager.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 11.12.2022.
//

import UIKit

class CartTableViewManager: NSObject {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()
    
    var detailsPhoto = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
}

// MARK: - CollectionView Data Source

extension CartTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
