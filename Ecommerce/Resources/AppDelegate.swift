//
//  AppDelegate.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        
        return true
    }
}

