//
//  CustomTabBarController.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 08.12.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.layer.cornerRadius = 30
        tabBar.backgroundColor = .mainBlue()
        changeHeightOfTabBar()
    }
    
    override func viewDidLoad() {
        setUpTabBar()
        
        tabBar.itemWidth = Constants.tabBarItemWidth
        tabBar.itemSpacing = Constants.tabBarItemSpacing
        tabBar.itemPositioning = .centered
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 777)
    }
    
    private func changeHeightOfTabBar() {
        var tabFrame = tabBar.frame
        tabFrame.size.height = 72
        tabFrame.origin.y = view.frame.size.height - tabFrame.size.height
        tabBar.frame = tabFrame
    }
    
    private func annimationsWhenSelectedItem(_ item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        
        let timeInterval: TimeInterval = 0.2
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }
        
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
    
    func createTabBarItem(withImage image: UIImage?, tag: Int) -> UITabBarItem {
        tabBarItem = UITabBarItem.init(title: "title",
                                       image: image,
                                       tag: tag)
        
        tabBarItem.imageInsets = Constants.tabBarItemImageInsets
        return tabBarItem
    }
    
    private func setUpTabBar() {
        
        let layer = CAShapeLayer()
        
        let bgColor = UIColor(named: "iDoxLightColor")
        let sColor = UIColor(named: "iDoxAccentColor")
        let tColor = UIColor(named: "iDoxShadowColor")
        tabBar.backgroundColor = .systemTeal
        
        // tab bar layer
        let x: CGFloat = 10
        let y: CGFloat = 20
        let width = self.tabBar.bounds.width - x * 2
        let height = self.tabBar.bounds.height + y * 1.5
        
        layer.fillColor = bgColor?.cgColor
        layer.path = UIBezierPath(roundedRect: CGRect(x: x,
                                                      y: self.tabBar.bounds.minY - y,
                                                      width: width,
                                                      height: height),
                                  cornerRadius: height / 2).cgPath
        
        layer.shadowColor = tColor?.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.5
        
        self.tabBar.layer.addSublayer(layer)
        
        self.tabBar.itemWidth = 100
        self.tabBar.itemPositioning = .centered
        self.tabBar.unselectedItemTintColor = sColor
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.annimationsWhenSelectedItem(item)
    }
}
