//
//  CPUStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class CPUStackView: UIStackView {
    
    let cpuImageView = UIImageView(image: #imageLiteral(resourceName: "cpu").withRenderingMode(.alwaysOriginal))
    let cpuLabel = UILabel(font: .markProRegular11(), textColor: #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1))
    
    private var cpuStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension CPUStackView {
    private func setupViews() {
        cpuStackView = UIStackView(arrangedSubviews: [cpuImageView,
                                                      cpuLabel],
                                   axis: .vertical,
                                   spacing: 0,
                                   distribution: .fill,
                                   alignment: .fill)
        
        addArrangedSubview(cpuStackView)
    }
}
