//
//  FavoriteCoordinator.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 08.12.2022.
//

import UIKit

final class FavoriteCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: EcommerceTabBarCoordinator?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoriteViewController = FavoriteViewController()
        let favoriteViewModel = FavoriteViewModel()
        favoriteViewModel.coordinator = self
        favoriteViewController.viewModel = favoriteViewModel
        navigationController.setViewControllers([favoriteViewController], animated: true)
    }
}
