//
//  NetworkServiceProtocol.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 14.12.2022.
//

import UIKit

protocol NetworkServiceProtocol {
    func fetchCart(completion: @escaping (Cart?) -> Void)
    func fetchPhones(completion: @escaping (Phones?) -> Void)
    func fetchCharasteristics(completion: @escaping (Characteristics?) -> Void)
    func decodeJSON<T: Decodable>(_ type: T.Type, data: Data) -> T
}
