//
//  DetailsTopView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit
import Cosmos

class DetailsTopView: UIView {
    
    let ratingView = CosmosView()
    let phoneNameLabel = UILabel(font: .markProMedium24(), textColor: .mainBlue())
    
    let likeButton = UIButton(type: .system)
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        likeButton.backgroundColor = .mainBlue()
        likeButton.layer.cornerRadius = 10
        
        ratingView.isUserInteractionEnabled = false
        ratingView.settings.fillMode = .half
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension DetailsTopView {
    private func setupViews() {        
        addSubview(phoneNameLabel)
        addSubview(ratingView)
        addSubview(likeButton)
    }
}

// MARK: - Setup Constraints
extension DetailsTopView {
    private func setupConstraints() {
        phoneNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        ratingView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(126)
            make.height.equalTo(18)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(37)
            make.height.equalTo(33)
        }
    }
}


