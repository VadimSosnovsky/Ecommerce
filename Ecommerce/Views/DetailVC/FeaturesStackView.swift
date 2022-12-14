//
//  FeaturesStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class FeaturesStackView: UIStackView {
    
    let featuresButton = UIButton(type: .system)
    let featuresLineView = UIView.createView()

    
    let shopLineView = UIView.createView()
    let shopButton = UIButton(type: .system)
    
    private var featuresStackView = UIStackView()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension FeaturesStackView {
    private func setupViews() {
        
        featuresButton.setTitle(Constants.featuresButtonTitle, for: .normal)
        
        shopButton.setTitle(Constants.shopButtonTitle, for: .normal)
        
        featuresStackView = UIStackView(arrangedSubviews: [featuresButton,
                                                          featuresLineView],
                                    axis: .vertical,
                                    spacing: 4,
                                    distribution: .fill,
                                    alignment: .fill)
        
        addArrangedSubview(featuresStackView)
    }
}
