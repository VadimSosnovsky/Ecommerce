//
//  DetailCoordinator.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 09.12.2022.
//

import UIKit

final class DetailCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: MainCoordinator?
    
    private let navigationController: UINavigationController
    private let characteristics: Characteristics
    
    init(navigationController: UINavigationController, characteristics: Characteristics) {
        self.navigationController = navigationController
        self.characteristics = characteristics
    }
    
    func start() {
        let detailViewController = DetailViewController()
        let detailViewModel = DetailViewModel(characteristics: characteristics)
        detailViewModel.coordinator = self
        detailViewController.viewModel = detailViewModel
        navigationController.pushViewController(detailViewController, animated: true)
        navigationController.isNavigationBarHidden = false
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishDetailScene() {
        navigationController.popViewController(animated: true)
    }
}
