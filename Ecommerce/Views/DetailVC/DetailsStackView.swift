//
//  DetailsStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class DetailsStackView: UIStackView {
    
    let detailsButton = UIButton(type: .system)
    let detailsLineView = UIView.createView()

    private var detailsStackView = UIStackView()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension DetailsStackView {
    private func setupViews() {
        
        detailsButton.setTitle(Constants.detailsButtonTitle, for: .normal)
        
        detailsStackView = UIStackView(arrangedSubviews: [detailsButton,
                                                          detailsLineView],
                                    axis: .vertical,
                                    spacing: 4,
                                    distribution: .fill,
                                    alignment: .fill)
        
        addArrangedSubview(detailsStackView)
    }
}
