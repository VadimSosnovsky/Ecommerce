//
//  SearchStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 13.12.2022.
//

import UIKit

class SearchStackView: UIStackView {
    
    private let searchTextField = SearchTextField(placeholder: Constants.searchTextFieldPlaceholder,
                                                  leftImageName: #imageLiteral(resourceName: "loop"))
    private let qrCodeButton = UIButton(type: .system)
    
    private var searchStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        qrCodeButton.layer.cornerRadius = qrCodeButton.frame.width / 2
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension SearchStackView {
    private func setupViews() {
        let qrCodeImage = #imageLiteral(resourceName: "qrcode")
        qrCodeButton.setImage(qrCodeImage.withRenderingMode(.alwaysOriginal), for: .normal)
        qrCodeButton.backgroundColor = .mainOrange()
        
        searchStackView = UIStackView(arrangedSubviews: [searchTextField,
                                                         qrCodeButton],
                                      axis: .horizontal,
                                      spacing: 11,
                                      distribution: .fill,
                                      alignment: .fill)
        
        addArrangedSubview(searchStackView)
    }
}

// MARK: - Setup Constraints
extension SearchStackView {
    private func setupConstraints() {
        
        qrCodeButton.snp.makeConstraints { make in
            make.width.equalTo(34)
            make.height.equalTo(34)
        }
    }
}
