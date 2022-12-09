//
//  BestSellerCollectionViewCell.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import UIKit
import SDWebImage

class BestSellerCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "BestSellerCollectionViewCell"
    
    private let phoneImageView = UIImageView()
    private let priceWithoutDiscountLabel = UILabel(font: .markProBold16(), textColor: .mainBlue())
    private let priceWithDiscountLabel = UILabel(font: .markProRegular11(), textColor: .mainGrey())
    private let phoneNameLabel = UILabel(font: .markProRegular10(), textColor: .mainBlue())
    private let pricesView = UIView()
    private let favoriteButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        phoneImageView.clipsToBounds = true
        phoneImageView.layer.cornerRadius = 10
        phoneImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        favoriteButton.backgroundColor = .white
        favoriteButton.layer.cornerRadius = favoriteButton.frame.width / 2
        
        let image = #imageLiteral(resourceName: "like")
        favoriteButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        favoriteButton.tintColor = .mainBlue()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getStrikethroughStyle(withText text: String, label: UILabel) {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        label.attributedText = attributeString
    }
}

// MARK: - Configure Cell
extension BestSellerCollectionViewCell {
    func configure(withItem item: BestSeller) {
        let url = URL(string: item.pictureUrl)
        phoneImageView.sd_setImage(with: url)
        priceWithoutDiscountLabel.text = item.priceWithoutDiscountLabelString
        getStrikethroughStyle(withText: item.priceWithDiscountLabelString, label: priceWithDiscountLabel)
        phoneNameLabel.text = item.title
    }
}

// MARK: - Setup Views
extension BestSellerCollectionViewCell {
    private func setupViews() {
        addSubview(phoneImageView)
        addSubview(favoriteButton)
        addSubview(pricesView)
        pricesView.addSubview(priceWithoutDiscountLabel)
        pricesView.addSubview(priceWithDiscountLabel)
        addSubview(phoneNameLabel)
    }
}


// MARK: - Setup Constraints
extension BestSellerCollectionViewCell {
    func setupConstraints() {
        phoneImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(177)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11)
            make.trailing.equalToSuperview().inset(12)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        pricesView.snp.makeConstraints { make in
            make.top.equalTo(phoneImageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        priceWithoutDiscountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(21)
        }
        
        priceWithDiscountLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(priceWithoutDiscountLabel.snp.trailing).offset(7)
            make.centerY.equalToSuperview()
        }
        
        phoneNameLabel.snp.makeConstraints { make in
            make.top.equalTo(pricesView.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(21)
        }
    }
}
