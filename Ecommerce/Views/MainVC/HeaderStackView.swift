//
//  HeaderStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 13.12.2022.
//

import UIKit

class HeaderStackView: UIStackView {
    
    private let locationLabel = UILabel(font: .markProMedium15(), textColor: .mainBlue())
    private let locationImage = UIImageView(image: #imageLiteral(resourceName: "location"))
    private let arrowImage = UIImageView(image: #imageLiteral(resourceName: "arrow"))
    
    private var headerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension HeaderStackView {
    private func setupViews() {
        locationLabel.text = Constants.locationLabel
        
        headerStackView = UIStackView(arrangedSubviews: [locationImage,
                                                         locationLabel,
                                                         arrowImage],
                                      axis: .horizontal,
                                      spacing: 8,
                                      distribution: .equalSpacing,
                                      alignment: .center)
        
        addArrangedSubview(headerStackView)
    }
}
