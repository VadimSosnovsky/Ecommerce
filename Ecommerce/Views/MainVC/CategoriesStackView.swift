//
//  CategoriesStackView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit
import SnapKit

class CategoriesStackView: UIStackView {
    
    static func createButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.tintColor = .lightGrey()
        button.imageView?.contentMode = .scaleAspectFill
        button.backgroundColor = .white
        return button
    }
    
    let phonesCategoryButton = createButton(image: #imageLiteral(resourceName: "phones"))
    let computersCategoryButton = createButton(image: #imageLiteral(resourceName: "computers"))
    let healthCategoryButton = createButton(image: #imageLiteral(resourceName: "health"))
    let booksCategoryButton = createButton(image: #imageLiteral(resourceName: "books"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .equalSpacing
        axis = .horizontal
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension CategoriesStackView {
    private func setupViews() {

        let subviews = [phonesCategoryButton,
                        computersCategoryButton,
                        healthCategoryButton,
                        booksCategoryButton]
        
        let categories = Categories.allCases.map { category -> UIView in
            let label = UILabel(font: .markProMedium12(), textColor: .mainBlue())
            label.text = category.categoryValue()
            return label
        }
        
        subviews.enumerated().forEach { (index, item) in
            let button = item
            let label = categories[index]
            let stackView = UIStackView(arrangedSubviews: [button, label])
            stackView.axis = .vertical
            
        
            stackView.snp.makeConstraints { make in
                make.width.equalTo(Constants.categoriesViewsHeight)
            }
            
            addArrangedSubview(stackView)
            
            button.snp.makeConstraints { make in
                make.width.equalTo(Constants.categoriesViewsHeight)
                make.height.equalTo(Constants.categoriesViewsHeight)
            }
            
            button.layer.cornerRadius = Constants.categoriesViewsHeight / 2
        }
    }
}
