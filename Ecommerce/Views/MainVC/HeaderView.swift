//
//  HeaderView.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 13.12.2022.
//

import UIKit

class HeaderView: UIView {
    
    let filterModalViewController = FilterModalViewController()
    
    private var headerStackView = HeaderStackView()
    
    private let filterButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "filter").withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()
    
    var viewModel: MainViewModel!
    var tabBarController: UITabBarController!
    var mainVC: MainViewController!
    
    init(viewModel: MainViewModel, tabBarController: UITabBarController, mainVC: MainViewController) {
        super.init(frame: .zero)
        
        self.viewModel = viewModel
        self.tabBarController = tabBarController
        self.mainVC = mainVC
        
        setupViews()
        setupConstraints()
        
        filterModalViewController.onUpdate = { [weak self] in
            self?.tabBarController.tabBar.isHidden = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - IBActions
extension HeaderView {
    @objc private func handleFilterTap() {
        tabBarController.tabBar.isHidden = true
        filterModalViewController.modalPresentationStyle = .overCurrentContext
        mainVC.present(filterModalViewController, animated: false)
    }
}

// MARK: - Setup Views
extension HeaderView {
    private func setupViews() {
        
        filterButton.addTarget(self, action: #selector(handleFilterTap), for: .touchUpInside)
        
        addSubview(headerStackView)
        addSubview(filterButton)
    }
}

// MARK: - Setup Constraints
extension HeaderView {
    private func setupConstraints() {
        headerStackView.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        filterButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.trailing.equalToSuperview()
        }
    }
}

