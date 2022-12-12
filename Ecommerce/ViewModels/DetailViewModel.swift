//
//  DetailViewModel.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 09.12.2022.
//

import UIKit

final class DetailViewModel {
    
    var coordinator: DetailCoordinator?
    var characteristics: Characteristics
   
    init(characteristics: Characteristics) {
        self.characteristics = characteristics
    }
    
    func handleColorTap(sender: UIButton, buttons: [UIButton]) {
        let checkImage = #imageLiteral(resourceName: "check").withRenderingMode(.alwaysOriginal)
        sender.setImage(checkImage, for: .normal)
        
        if sender == buttons.first {
            sender.setImage(checkImage, for: .normal)
            buttons.last?.setImage(nil, for: .normal)
        } else {
            sender.setImage(checkImage, for: .normal)
            buttons.first?.setImage(nil, for: .normal)
        }
    }
    
    func menuHandleTap(sender: UIButton,
                       shopButton: UIButton,
                       shopView: UIView,
                       detailsButton: UIButton,
                       detailsView: UIView,
                       featuresButton: UIButton,
                       featuresView: UIView) {
        
        sender.titleLabel?.tintColor = .mainBlue()
        sender.titleLabel?.font = .markProBold20()
        [shopView, detailsView, featuresView].forEach { view in
            view.backgroundColor = .white
        }
        if sender == shopButton {
            [detailsButton, featuresButton].forEach { button in
                button.titleLabel?.font = .markProRegular20()
                button.titleLabel?.tintColor = .black.withAlphaComponent(0.5)
                shopView.backgroundColor = .mainOrange()
            }
        } else if sender == detailsButton {
            [shopButton, featuresButton].forEach { button in
                button.titleLabel?.font = .markProRegular20()
                button.titleLabel?.tintColor = .black.withAlphaComponent(0.5)
                detailsView.backgroundColor = .mainOrange()
            }
        } else {
            [shopButton, detailsButton].forEach { button in
                button.titleLabel?.font = .markProRegular20()
                button.titleLabel?.tintColor = .black.withAlphaComponent(0.5)
                featuresView.backgroundColor = .mainOrange()
            }
        }
    }
}
