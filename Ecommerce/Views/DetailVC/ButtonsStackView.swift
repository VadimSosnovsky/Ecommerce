//
//  ButtonsStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

class ButtonsStackView: UIStackView {
    
    let firstColorButton = UIButton(type: .system)
    let secondColorButton = UIButton(type: .system)
    
    private var buttonsStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        firstColorButton.layer.cornerRadius = firstColorButton.frame.width / 2
        secondColorButton.layer.cornerRadius = secondColorButton.frame.width / 2
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension ButtonsStackView {
    private func setupViews() {
        buttonsStackView = UIStackView(arrangedSubviews: [firstColorButton,
                                                          secondColorButton],
                                          axis: .horizontal,
                                          spacing: 16,
                                          distribution: .fill,
                                          alignment: .fill)

        
        addArrangedSubview(buttonsStackView)
    }
}

// MARK: - Setup Constraints
extension ButtonsStackView {
    private func setupConstraints() {
        firstColorButton.snp.makeConstraints { make in
            make.width.height.equalTo(39)
        }

        secondColorButton.snp.makeConstraints { make in
            make.width.height.equalTo(39)
        }
    }
}
