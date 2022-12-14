//
//  HotSalesCollectionViewCell.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import UIKit
import SDWebImage

class HotSalesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = Constants.hotSalesCollectionViewCell
    
    private let phoneImageView = UIImageView()
    private let isNewImageView = UIImageView()
    private let phoneNameLabel = UILabel(font: .markProBold25(), textColor: .white)
    private let descriptionLabel = UILabel(font: .markProRegular11(), textColor: .white)
    private let buyButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
        clipsToBounds = true
        
        buyButton.backgroundColor = .white
        buyButton.layer.cornerRadius = 5
        buyButton.setTitle(Constants.buyButtonTitle, for: .normal)
        buyButton.tintColor = .mainBlue()
        
        phoneImageView.clipsToBounds = true
        phoneImageView.contentMode = .scaleAspectFill
        
        isNewImageView.image = #imageLiteral(resourceName: "isNew")
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
extension HotSalesCollectionViewCell {
    func configure(withItem item: HomeStore) {
        let url = URL(string: item.pictureUrl)
        phoneImageView.sd_setImage(with: url)
        
        if item.id != 2 {
            phoneNameLabel.text = item.title
            descriptionLabel.text = item.subtitle
            
        }
    
        if item.isNew == nil {
            isNewImageView.isHidden = true
        }
    }
}

// MARK: - Setup Views
extension HotSalesCollectionViewCell {
    private func setupViews() {
        addSubview(phoneImageView)
        addSubview(isNewImageView)
        addSubview(phoneNameLabel)
        addSubview(descriptionLabel)
        addSubview(buyButton)
    }
}


// MARK: - Setup Constraints
extension HotSalesCollectionViewCell {
    func setupConstraints() {
        
        phoneImageView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        isNewImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(25)
        }
        
        phoneNameLabel.snp.makeConstraints { make in
            make.top.equalTo(isNewImageView.snp.bottom).offset(18)
            make.leading.equalToSuperview().offset(25)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNameLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(25)
        }
        
        buyButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.bottom.equalToSuperview().inset(26)
            make.width.equalTo(98)
            make.height.equalTo(23)
        }
    }
}
