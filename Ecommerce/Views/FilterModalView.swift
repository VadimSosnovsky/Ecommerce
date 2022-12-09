//
//  FilterModalView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 08.12.2022.
//

import UIKit

class FilterModalView: UIView {
    
    private let backgorundView = UIView()
    
    var onUpdate: () -> () = {}
    
    let cancelButton = UIButton(type: .system)
    let doneButton = UIButton(type: .system)
    
    private let filterLabel = UILabel(font: .markProMedium18(), textColor: .mainBlue())
    
    private let brandLabel = UILabel(font: .markProMedium18(), textColor: .mainBlue())
    private let phoneNameTextField = FilterTextField(placeholder: "Samsung", rightImageName: #imageLiteral(resourceName: "bigArrow"))
    
    private let priceLabel = UILabel(font: .markProMedium18(), textColor: .mainBlue())
    private let priceTextField = FilterTextField(placeholder: "$300-$500", rightImageName: #imageLiteral(resourceName: "bigArrow"))
    
    private let sizeLabel = UILabel(font: .markProMedium18(), textColor: .mainBlue())
    private let sizeTextField = FilterTextField(placeholder: "$4.5 to 5.5 inches", rightImageName: #imageLiteral(resourceName: "bigArrow"))
    
    private let emptyView = UIView()
    
    private var topStackView = UIStackView()
    private var bottomStackView = UIStackView()
    
    private var brandStackView = UIStackView()
    private var priceStackView = UIStackView()
    private var sizeStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        cancelButton.layer.cornerRadius = 10
        doneButton.layer.cornerRadius = 10
        
        cancelButton.backgroundColor = .mainBlue()
        doneButton.backgroundColor = .mainOrange()
        
        phoneNameTextField.isUserInteractionEnabled = false
        priceTextField.isUserInteractionEnabled = false
        sizeTextField.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        filterLabel.text = "Filter Options"
        brandLabel.text = "Brand"
        priceLabel.text = "Price"
        sizeLabel.text = "Size"
        
        let cancelImage = #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysOriginal)
        cancelButton.setImage(cancelImage, for: .normal)
        
        let donelImage = #imageLiteral(resourceName: "done").withRenderingMode(.alwaysOriginal)
        doneButton.setImage(donelImage, for: .normal)
        
        topStackView = UIStackView(arrangedSubviews: [cancelButton,
                                                      filterLabel,
                                                      doneButton],
                                   axis: .horizontal,
                                   spacing: 44,
                                   distribution: .equalCentering,
                                   alignment: .fill)
        
        brandStackView = UIStackView(arrangedSubviews: [brandLabel,
                                                        phoneNameTextField],
                                      axis: .vertical,
                                      spacing: 12,
                                      distribution: .fill,
                                      alignment: .leading)
        
        priceStackView = UIStackView(arrangedSubviews: [priceLabel,
                                                        priceTextField],
                                      axis: .vertical,
                                      spacing: 12,
                                      distribution: .fill,
                                      alignment: .leading)
        
        sizeStackView = UIStackView(arrangedSubviews: [sizeLabel,
                                                       sizeTextField],
                                      axis: .vertical,
                                      spacing: 12,
                                      distribution: .fill,
                                      alignment: .leading)
        
        
        bottomStackView = UIStackView(arrangedSubviews: [brandStackView,
                                                         priceStackView,
                                                         sizeStackView],
                                      axis: .vertical,
                                      spacing: 16,
                                      distribution: .fill,
                                      alignment: .leading)
        
        
        cancelButton.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
        
        addSubview(backgorundView)
        backgorundView.addSubview(topStackView)
        backgorundView.addSubview(bottomStackView)
    }
    
    @objc private func handleCancelButton() {
        onUpdate()
    }
    
    @objc private func handleDoneButton() {
        onUpdate()
    }
    
    private func setupConstraints() {
        backgorundView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.equalTo(414)
            make.height.equalTo(375)
        }
        
        topStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().inset(44)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(350)
            make.height.equalTo(37)
        }

        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom).offset(28)
            make.leading.equalToSuperview().inset(46)
            make.trailing.equalToSuperview().inset(31)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.width.height.equalTo(37)
        }

        doneButton.snp.makeConstraints { make in
            make.width.equalTo(86)
            make.height.equalTo(37)
        }
        
        let stackViews = [brandStackView, priceStackView, sizeStackView]
        for stackView in stackViews {
            stackView.snp.makeConstraints { make in
                make.width.equalToSuperview()
            }
        }
    
        let textFields = [phoneNameTextField, priceTextField, sizeTextField]
        for textField in textFields {
            textField.snp.makeConstraints { make in
                make.height.equalTo(37)
                make.width.equalToSuperview()
            }
        }
    }
}
