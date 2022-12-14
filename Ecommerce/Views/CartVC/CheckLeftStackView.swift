//
//  CheckLeftStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class CheckLeftStackView: UIStackView {
    
    private let totalLabel = UILabel(font: .markProRegular15(), textColor: .white)
    private let deliveryLabel = UILabel(font: .markProRegular15(), textColor: .white)
    
    private var checkLeftStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    override func layoutSubviews() {
        totalLabel.textAlignment = .left
        deliveryLabel.textAlignment = .left
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension CheckLeftStackView {
    private func setupViews() {
        totalLabel.text = Constants.totalLabel
        deliveryLabel.text = Constants.deliveryLabel
        
        checkLeftStackView = UIStackView(arrangedSubviews: [totalLabel,
                                                            deliveryLabel],
                                         axis: .vertical,
                                         spacing: 12,
                                         distribution: .fill,
                                         alignment: .fill)
        
        addArrangedSubview(checkLeftStackView)
    }
}

