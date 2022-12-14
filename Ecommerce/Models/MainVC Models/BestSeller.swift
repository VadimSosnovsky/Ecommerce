//
//  BestSeller.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import Foundation

struct BestSeller: Decodable {
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let pictureUrl: String

    enum CodingKeys: String, CodingKey {
        case title
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case pictureUrl = "picture"
    }
    
    var priceWithoutDiscountLabelString: String {
        return "$" + String(priceWithoutDiscount)
    }
    
    var priceWithDiscountLabelString: String {
        return "$" + String(discountPrice)
    }
}
