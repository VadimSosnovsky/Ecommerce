//
//  DetailCollectionViewManager.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 10.12.2022.
//

import UIKit

class DetailCollectionViewManager: NSObject {
    
    lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Constants.detailCellWidth,
                                 height: Constants.detailCellHeight)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        collectionView.register(DetailCollectionViewCell.self,
                                forCellWithReuseIdentifier: DetailCollectionViewCell.reuseId)
        collectionView.backgroundColor = .mainWhite()
        collectionView.layer.cornerRadius = 10
        collectionView.clipsToBounds = true
        return collectionView
    }()
    
    var detailsPhoto = [String]() {
        didSet {
            collectionView.reloadData()
        }
    }
}

// MARK: - CollectionView Data Source

extension DetailCollectionViewManager: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailsPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.reuseId, for: indexPath) as! DetailCollectionViewCell
        let item = detailsPhoto[indexPath.row]
        cell.configure(withItem: item)
        return cell
    }
}
