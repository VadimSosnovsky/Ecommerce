//
//  UISegmentedControl + Extensions.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 11.12.2022.
//

import UIKit

extension UISegmentedControl {
    public func replaceSegments<T: Sequence>(withTitles: T) where T.Iterator.Element == String {
        removeAllSegments()
        for title in withTitles {
            insertSegment(withTitle: "\(title) GB", at: numberOfSegments, animated: false)
        }
    }
}
