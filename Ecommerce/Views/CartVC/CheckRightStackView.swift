//
//  CheckRightStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class CheckRightStackView: UIStackView {
    
    let totalValueLabel = UILabel(font: .markProBold15(), textColor: .white)
    let deliveryValueLabel = UILabel(font: .markProBold15(), textColor: .white)
    
    private var checkRightStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    override func layoutSubviews() {
        totalValueLabel.textAlignment = .left
        deliveryValueLabel.textAlignment = .left
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension CheckRightStackView {
    private func setupViews() {
        
        checkRightStackView = UIStackView(arrangedSubviews: [totalValueLabel,
                                                            deliveryValueLabel],
                                         axis: .vertical,
                                         spacing: 12,
                                         distribution: .fill,
                                         alignment: .fill)
        
        addArrangedSubview(checkRightStackView)
    }
}

