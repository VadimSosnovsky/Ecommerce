//
//  CheckStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class CheckStackView: UIStackView {
    
    let checkLeftStackView = CheckLeftStackView()
    let checkRightStackView = CheckRightStackView()
    
    private var checkStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension CheckStackView {
    private func setupViews() {
        
        checkStackView = UIStackView(arrangedSubviews: [checkLeftStackView,
                                                        checkRightStackView],
                                         axis: .horizontal,
                                         spacing: 185,
                                         distribution: .fill,
                                         alignment: .fill)
        
        addArrangedSubview(checkStackView)
    }
}
