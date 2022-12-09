//
//  Categories.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

enum Categories: String, CaseIterable {
    case phones
    case computers
    case health
    case books
    
    func categoryValue() -> String {
        switch self {
        case .phones:
            return "Phones"
        case .computers:
            return "Computers"
        case .health:
            return "Health"
        case .books:
            return "Books"
        }
    }
}
