//
//  ShopStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class ShopStackView: UIStackView {
    
    let shopLineView = UIView.createView()
    let shopButton = UIButton(type: .system)
    
    private var shopStackView = UIStackView()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension ShopStackView {
    private func setupViews() {
        shopButton.setTitle(Constants.shopButtonTitle, for: .normal)
        
        shopStackView = UIStackView(arrangedSubviews: [shopButton,
                                                       shopLineView],
                                    axis: .vertical,
                                    spacing: 4,
                                    distribution: .fill,
                                    alignment: .fill)
        
        addArrangedSubview(shopStackView)
    }
}
