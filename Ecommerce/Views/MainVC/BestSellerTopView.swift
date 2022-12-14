//
//  BestSellerTopView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import Foundation

import UIKit

class BestSellerTopView: UIView {
    
    private let bestSellerLabel = UILabel(font: .markProBold25(), textColor: .mainBlue())
    private let seeMoreBestSellerLabel = UILabel(font: .markProRegular15(), textColor: .mainOrange())
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension BestSellerTopView {
    private func setupViews() {
        bestSellerLabel.text = Constants.bestSellerLabel
        seeMoreBestSellerLabel.text = Constants.seeMoreLabel
        
        addSubview(bestSellerLabel)
        addSubview(seeMoreBestSellerLabel)
    }
}

// MARK: - Setup Constraints
extension BestSellerTopView {
    private func setupConstraints() {
        bestSellerLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalToSuperview()
        }
        
        seeMoreBestSellerLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalToSuperview()
        }
    }
}


