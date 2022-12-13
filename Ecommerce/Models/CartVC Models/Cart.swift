//
//  Cart.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 13.12.2022.
//

import Foundation

struct Cart: Decodable {
    let basket: [Basket]
    let delivery: String
    let total: Int
}
