//
//  Coordinator.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
    func childDidFinish(_ childCoordinator: Coordinator)
}

extension Coordinator {
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
