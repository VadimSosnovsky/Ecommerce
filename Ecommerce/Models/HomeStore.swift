//
//  HomeStore.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import Foundation

struct HomeStore: Decodable {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let pictureUrl: String
    let isBuy: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title
        case subtitle
        case pictureUrl = "picture"
        case isBuy = "is_buy"
    }
}
