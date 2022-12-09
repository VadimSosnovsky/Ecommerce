//
//  MainViewModel.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

final class MainViewModel {
    
    var networService = NetworkService.shared
    var coordinator: MainCoordinator?
    
    func loadHotSalesPhones(completion: @escaping (Phones) -> Void) {
        self.networService.fetchPhones { phones in
            if let phones = phones {
                completion(phones)
            }
        }
    }
    
    func handleFilterTap() {
            
    }
}
