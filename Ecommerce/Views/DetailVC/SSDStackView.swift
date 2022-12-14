//
//  SSDStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class SSDStackView: UIStackView {
    
    let ssdImageView = UIImageView(image: #imageLiteral(resourceName: "ssd").withRenderingMode(.alwaysOriginal))
    let ssdLabel = UILabel(font: .markProRegular11(), textColor: #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1))
    
    private var ssdStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension SSDStackView {
    private func setupViews() {
        ssdStackView = UIStackView(arrangedSubviews: [ssdImageView,
                                                      ssdLabel],
                                    axis: .vertical,
                                    spacing: 5,
                                    distribution: .fill,
                                    alignment: .fill)
        
        addArrangedSubview(ssdStackView)
    }
}
