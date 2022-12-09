//
//  HotSalesCollectionViewManager.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import UIKit

class HotSalesCollectionViewManager: NSObject {
    
    lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Constants.hotSalesCellWidth,
                                 height: Constants.hotSalesCellHeight)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        collectionView.register(HotSalesCollectionViewCell.self,
                                forCellWithReuseIdentifier: HotSalesCollectionViewCell.reuseId)
        return collectionView
    }()
    
    var homestore = [HomeStore]() {
        didSet {
            collectionView.reloadData()
        }
    }
}

// MARK: - CollectionView Data Source

extension HotSalesCollectionViewManager: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homestore.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesCollectionViewCell.reuseId, for: indexPath) as! HotSalesCollectionViewCell
        let item = homestore[indexPath.row]
        cell.configure(withItem: item)
        return cell
    }
}
