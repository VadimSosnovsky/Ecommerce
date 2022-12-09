//
//  CartCoordinator.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 08.12.2022.
//

import UIKit

final class CartCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: EcommerceTabBarCoordinator?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let cartViewController = CartViewController()
        let cartViewModel = CartViewModel()
        cartViewModel.coordinator = self
        cartViewController.viewModel = cartViewModel
        navigationController.setViewControllers([cartViewController], animated: true)
    }
}
