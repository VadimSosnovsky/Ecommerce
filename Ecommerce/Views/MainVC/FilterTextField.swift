//
//  FilterTextField.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 08.12.2022.
//

import UIKit

class FilterTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(placeholder: String, rightImageName: UIImage?) {
        self.init()
        font = .markProRegular18()
        textColor = .mainBlue()
        clipsToBounds = true
        layer.cornerRadius = 5
        backgroundColor = .white
        layer.borderColor = UIColor.lightGrey().cgColor
        layer.borderWidth = 1
        
        if let rightImageName = rightImageName {
            let Image = rightImageName
            let ImageView = UIImageView(image: Image)
            
            rightView = ImageView
            rightView?.frame = CGRect(x: 0, y: 0, width: 16, height: 8)
            rightViewMode = .always
        }
        
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.mainBlue()]
        )
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= 14
        return rect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.textRect(forBounds: bounds)
        rect.origin.x += 14
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
