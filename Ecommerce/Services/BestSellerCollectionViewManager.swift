//
//  BestSellerCollectionViewManager.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import UIKit

class BestSellerCollectionViewManager: NSObject {
    
    var completion: () -> () = {}
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .mainWhite()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BestSellerCollectionViewCell.self,
                                forCellWithReuseIdentifier: BestSellerCollectionViewCell.reuseId)
        
        return collectionView
    }()
    
    var bestseller = [BestSeller]() {
        didSet {
            collectionView.reloadData()
        }
    }
}

extension BestSellerCollectionViewManager: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestseller.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCollectionViewCell.reuseId, for: indexPath) as! BestSellerCollectionViewCell
        let item = bestseller[indexPath.row]
        cell.configure(withItem: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        completion()
    }
}

extension BestSellerCollectionViewManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constants.bestSellerCellSize
    }
}
