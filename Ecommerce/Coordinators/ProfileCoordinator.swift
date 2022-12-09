//
//  ProfileCoordinator.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 08.12.2022.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: EcommerceTabBarCoordinator?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileViewController = ProfileViewController()
        let profileViewModel = ProfileViewModel()
        profileViewModel.coordinator = self
        profileViewController.viewModel = profileViewModel
        navigationController.setViewControllers([profileViewController], animated: true)
    }
}
