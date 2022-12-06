//
//  MainCoordinator.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = MainViewController()
        let mainViewModel = MainViewModel()
        mainViewModel.coordinator = self
        mainViewController.viewModel = mainViewModel
        navigationController.setViewControllers([mainViewController], animated: true)
    }
}

