//
//  SDStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class SDStackView: UIStackView {
    
    let sdLabel = UILabel(font: .markProRegular11(), textColor: #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1))
    let sdImageView = UIImageView(image: #imageLiteral(resourceName: "sd").withRenderingMode(.alwaysOriginal))
    
    private var sdStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension SDStackView {
    private func setupViews() {
        sdStackView = UIStackView(arrangedSubviews: [sdImageView,
                                                      sdLabel],
                                    axis: .vertical,
                                    spacing: 5,
                                    distribution: .fill,
                                    alignment: .fill)
        
        addArrangedSubview(sdStackView)
    }
}
