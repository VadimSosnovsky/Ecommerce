//
//  MainViewModel.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

final class MainViewModel {
    
    var networService = NetworkService.shared
    var characteristics: Characteristics?
    var coordinator: MainCoordinator?
    
    func loadCartPhones(completion: @escaping (Cart) -> Void) {
        self.networService.fetchCart { cart in
            if let cart = cart {
                completion(cart)
            }
        }
    }
    
    func loadHotSalesPhones(completion: @escaping (Phones) -> Void) {
        self.networService.fetchPhones { phones in
            if let phones = phones {
                completion(phones)
            }
        }
    }
    
    func getCharacteristics() {
        self.networService.fetchCharasteristics { characteristics in
            self.characteristics = characteristics
            guard let characteristics = characteristics else { return }
            self.coordinator?.startDetailScene(withCharacteristics: characteristics)
        }
    }
    
    func handleCategoryTap(sender: UIButton, categoriesStackView: CategoriesStackView) {
        let image = sender.currentImage
        let buttonsArray = [categoriesStackView.phonesCategoryButton,
                            categoriesStackView.computersCategoryButton,
                            categoriesStackView.healthCategoryButton,
                            categoriesStackView.booksCategoryButton]
        
        for button in buttonsArray {
            button.tintColor = #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7647058824, alpha: 1)
            button.backgroundColor = .white
            if button.currentImage == image {
                button.backgroundColor = .mainOrange()
                button.tintColor = .white
            }
        }
    }
    
    func handleFilterTap() {
            
    }
}
