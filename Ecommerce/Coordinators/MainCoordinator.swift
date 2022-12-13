//
//  MainCoordinator.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: EcommerceTabBarCoordinator?
    
    private let navigationController: UINavigationController
    private let detailViewController = DetailViewController()
    
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
    
    func startDetailScene(withCharacteristics charasteristics: Characteristics) {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController, characteristics: charasteristics)
        detailCoordinator.parentCoordinator = self
        childCoordinators.append(detailCoordinator)
        detailCoordinator.start()
    }
}

