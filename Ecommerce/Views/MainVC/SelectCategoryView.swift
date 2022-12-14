//
//  SelectCategoryView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 13.12.2022.
//

import UIKit

class SelectCategoryView: UIStackView {
    
    private let selectCategoryLabel = UILabel(font: .markProBold25(), textColor: .mainBlue())
    private let viewAllLabel = UILabel(font: .markProRegular15(), textColor: .mainOrange())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .equalSpacing
        axis = .horizontal
        
        setupViews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension SelectCategoryView {
    private func setupViews() {
        addSubview(selectCategoryLabel)
        addSubview(viewAllLabel)
        
        selectCategoryLabel.text = Constants.selectCategoryLabel
        viewAllLabel.text = Constants.viewAllLabel
    }
}

// MARK: - Setup Constraints
extension SelectCategoryView {
    private func setupConstraints() {
        selectCategoryLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalToSuperview()
        }

        viewAllLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalToSuperview()
        }

    }
}
