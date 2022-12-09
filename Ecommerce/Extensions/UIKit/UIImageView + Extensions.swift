//
//  UIImageView + Extensions.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?) {
        self.init()
        self.image = image?.withRenderingMode(.alwaysOriginal)
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
