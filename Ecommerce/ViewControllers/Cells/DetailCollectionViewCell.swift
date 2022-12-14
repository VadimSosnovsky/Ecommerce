//
//  DetailCollectionViewCell.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 10.12.2022.
//

import UIKit
import SDWebImage

class DetailCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = Constants.detailCollectionViewCell
    
    private let detailImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true
        
        setupViews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        detailImageView.contentMode = .scaleAspectFill
        detailImageView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        detailImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure Cell
extension DetailCollectionViewCell {
    func configure(withItem item: String) {
        let url = URL(string: item)
        detailImageView.sd_setImage(with: url)
    }
}

// MARK: - Setup Views
extension DetailCollectionViewCell {
    private func setupViews() {
        addSubview(detailImageView)
    }
}


// MARK: - Setup Constraints
extension DetailCollectionViewCell {
    func setupConstraints() {
        detailImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}
