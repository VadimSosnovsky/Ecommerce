//
//  UILabel + Extensions.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

extension UILabel {
    
    convenience init(font: UIFont?, textColor: UIColor) {
        self.init()
        self.font = font
        self.textColor = textColor
        self.textAlignment = .center
    }
}

