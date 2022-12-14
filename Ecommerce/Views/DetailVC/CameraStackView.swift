//
//  CameraStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class CameraStackView: UIStackView {
    
    let cameraImageView = UIImageView(image: #imageLiteral(resourceName: "camera").withRenderingMode(.alwaysOriginal))
    let cameraLabel = UILabel(font: .markProRegular11(), textColor: #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1))
    
    private var cameraStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension CameraStackView {
    private func setupViews() {
        cameraStackView = UIStackView(arrangedSubviews: [cameraImageView,
                                                         cameraLabel],
                                    axis: .vertical,
                                    spacing: 5,
                                    distribution: .fill,
                                    alignment: .fill)
        
        addArrangedSubview(cameraStackView)
    }
}
