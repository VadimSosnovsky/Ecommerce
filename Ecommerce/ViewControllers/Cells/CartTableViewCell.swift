//
//  CartTableViewCell.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 12.12.2022.
//

import UIKit
import SDWebImage

class CartTableViewCell: UITableViewCell {
    
    static let reuseId = Constants.cartTableViewCellReuseId
    
    private let phoneImageView = UIImageView()
    private let trashImageView = UIImageView()
    private let phoneNameLabel = UILabel(font: .markProMedium20(), textColor: .white)
    let priceLabel = UILabel(font: .markProMedium20(), textColor: .mainOrange())
    
    let countLabel = UILabel(font: .markProMedium20(), textColor: .white)
    private let increaseButton = UIButton(type: .system)
    private let decreaseButton = UIButton(type: .system)
    
    private var counter: Int = 1
    
    private var stepperStackView = UIStackView()
    
    var currentItem: Basket?
    var closure: () -> () = { }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupViews()
        setupConstraints()
        
        backgroundColor = .mainBlue()
        stepperStackView.backgroundColor = .darkGrey()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        phoneImageView.layer.cornerRadius = 10
        phoneImageView.clipsToBounds = true
        phoneImageView.contentMode = .scaleAspectFill
        
        phoneNameLabel.numberOfLines = 0
        phoneNameLabel.textAlignment = .left
        phoneNameLabel.lineBreakMode = .byCharWrapping
        
        priceLabel.textAlignment = .left
        
        stepperStackView.layer.cornerRadius = 14
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        phoneImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure Cell
extension CartTableViewCell {
    func configure(withItem item: Basket) {
        let url = URL(string: item.images)
        phoneImageView.sd_setImage(with: url)
        phoneNameLabel.text = item.title
        priceLabel.text = "\(item.price).00$"
    }
}

// MARK: - IBActions
extension CartTableViewCell {
    @objc private func handleIncreaseTap() {
        counter += 1
        countLabel.text = "\(counter)"
        guard let item = currentItem?.price else { return }
        priceLabel.text = "\(item * counter).00$"
        closure()
    }
    
    @objc private func handleDecreaseTap() {
        if counter > 0 {
            counter -= 1
            countLabel.text = "\(counter)"
            guard let item = currentItem?.price else { return }
            priceLabel.text = "\(item * counter).00$"
            closure()
        }
    }
}

// MARK: - Setup Views
extension CartTableViewCell {
    private func setupViews() {
        
        countLabel.text = "1"
        
        trashImageView.image =  #imageLiteral(resourceName: "trash").withRenderingMode(.alwaysOriginal)
        
        let increaseImage = #imageLiteral(resourceName: "decrease").withRenderingMode(.alwaysOriginal)
        increaseButton.setImage(increaseImage, for: .normal)
        increaseButton.tintColor = .white
        increaseButton.titleLabel?.font = .markProMedium20()
        
        let decreaseImage = #imageLiteral(resourceName: "increase").withRenderingMode(.alwaysOriginal)
        decreaseButton.setImage(decreaseImage, for: .normal)
        decreaseButton.tintColor = .white
        decreaseButton.titleLabel?.font = .markProMedium20()
        
        increaseButton.addTarget(self, action: #selector(handleIncreaseTap), for: .touchUpInside)
        decreaseButton.addTarget(self, action: #selector(handleDecreaseTap), for: .touchUpInside)
        
        stepperStackView = UIStackView(arrangedSubviews: [decreaseButton,
                                                          countLabel,
                                                          increaseButton],
                                       axis: .vertical,
                                       spacing: 0,
                                       distribution: .fillEqually,
                                       alignment: .center)
        
        contentView.addSubview(phoneImageView)
        contentView.addSubview(phoneNameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(stepperStackView)
        contentView.addSubview(trashImageView)
    }
}


// MARK: - Setup Constraints
extension CartTableViewCell {
    func setupConstraints() {
        phoneImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(88)
            make.bottom.equalToSuperview()
        }
        
        phoneNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(phoneImageView.snp.trailing).offset(17)
            make.width.equalTo(158)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(phoneImageView.snp.trailing).offset(17)
            make.width.equalTo(158)
            make.height.equalTo(25)
            make.bottom.equalToSuperview().inset(7)
        }
        
        stepperStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(phoneNameLabel.snp.trailing).offset(28)
            make.width.equalTo(26)
            make.height.equalTo(68)
        }
        
        trashImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(34)
            make.leading.equalTo(stepperStackView.snp.trailing).offset(17)
        }
    }
}
