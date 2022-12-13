//
//  CartViewModel.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 08.12.2022.
//

import Foundation

final class CartViewModel {
    
    var networService = NetworkService.shared
    var coordinator: CartCoordinator?
    
    func loadCartPhones(completion: @escaping (Cart) -> Void) {
        self.networService.fetchCart { cart in
            if let cart = cart {
                completion(cart)
            }
        }
    }
}
