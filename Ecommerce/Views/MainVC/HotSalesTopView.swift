//
//  HotSalesTopView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class HotSalesTopView: UIView {
    
    private let hotSalesLabel = UILabel(font: .markProBold25(), textColor: .mainBlue())
    private let seeMoreHotSalesLabel = UILabel(font: .markProRegular15(), textColor: .mainOrange())
   
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
extension HotSalesTopView {
    private func setupViews() {
        hotSalesLabel.text = Constants.hotSalesLabel
        seeMoreHotSalesLabel.text = Constants.seeMoreLabel
        
        addSubview(hotSalesLabel)
        addSubview(seeMoreHotSalesLabel)
    }
}

// MARK: - Setup Constraints
extension HotSalesTopView {
    private func setupConstraints() {
        hotSalesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalToSuperview()
        }
        
        seeMoreHotSalesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalToSuperview()
        }
    }
}


