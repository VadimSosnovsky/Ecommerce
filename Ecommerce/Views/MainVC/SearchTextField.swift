//
//  SearchTextField.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import UIKit

class SearchTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(placeholder: String, leftImageName: UIImage?) {
        self.init()
        font = .markProRegular12()
        textColor = .mainBlue()
        clipsToBounds = true
        layer.cornerRadius = 18
        backgroundColor = .white
        
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.mainBlue().withAlphaComponent(0.5)]
        )
        
        if let leftImageName = leftImageName {
            let Image = leftImageName
            let ImageView = UIImageView(image: Image)
            
            leftView = ImageView
            leftView?.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
            leftViewMode = .always
        }
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 24
        return rect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.textRect(forBounds: bounds)
        rect.origin.x += 16
        return rect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.editingRect(forBounds: bounds)
        rect.origin.x += 16
        return rect
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
