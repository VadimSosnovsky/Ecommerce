//
//  CartViewController.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 08.12.2022.
//

import UIKit

class CartViewController: UIViewController {
    
    private let titleLabel = UILabel(font: .markProBold35(), textColor: .mainBlue())
    private let locationLabel = UILabel(font: .markProMedium15(), textColor: .mainBlue())
    private let mainView = createView()
    
    var viewModel: CartViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainWhite()
        mainView.backgroundColor = .mainBlue()
        
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        mainView.layer.cornerRadius = 30
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

// MARK: - IBActions
extension CartViewController {
    @objc private func handleLeftBarButtonTap() {
        print(#function)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleRightBarButtonTap() {
        print(#function)
    }
}

// MARK: - Setup Views
extension CartViewController {
    private func setupViews() {
        
        titleLabel.text = "My Cart"
        locationLabel.text = "Add address"
        
        view.addSubview(titleLabel)
        view.addSubview(mainView)
    }
    
    private func setDetailsData(withCharacteristics characteristics: Characteristics) {

    }
    
    private static func createView() -> UIView {
        let view = UIView()
        return view
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.mainBlue(), .font: UIFont.markProMedium18() ?? UIFont.systemFont(ofSize: 18)]

        // left Bar Button Item
        
        let leftButton = UIButton(type: .system)
        let leftImage = #imageLiteral(resourceName: "bigArrow").withRenderingMode(.alwaysOriginal)
        let rotatedLeftImage = leftImage.rotate(radians: .pi/2)?.withRenderingMode(.alwaysOriginal)
        leftButton.setImage(rotatedLeftImage, for: .normal)
        leftButton.backgroundColor = .mainBlue()
        leftButton.layer.cornerRadius = 10
        leftButton.frame = CGRect(x: 20, y: 0, width: 37, height: 37)
        leftButton.addTarget(self, action: #selector(handleLeftBarButtonTap), for: .touchUpInside)
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 180, height: 44))
    
        leftView.addSubview(leftButton)
        
        let leftBarButtonItem = UIBarButtonItem(customView: leftView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        // right Bar Button Item
        
        let rightButton = UIButton(type: .system)
        let rightImage = #imageLiteral(resourceName: "locationBig").withRenderingMode(.alwaysOriginal)
        rightButton.setImage(rightImage, for: .normal)
        rightButton.backgroundColor = .mainOrange()
        rightButton.layer.cornerRadius = 10
        rightButton.frame = CGRect(x: 123, y: 0, width: 37, height: 37)
        rightButton.addTarget(self, action: #selector(handleRightBarButtonTap), for: .touchUpInside)
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 180, height: 44))
        
        locationLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 19)
        
        rightView.addSubview(locationLabel)
        rightView.addSubview(rightButton)
        
//        rightButton.snp.makeConstraints { make in
//            make.trailing.equalTo(rightView.snp.trailing)
//        }
        
        let rightBarButtonItem = UIBarButtonItem(customView: rightView)
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}

// MARK: - Setup Constraints
extension CartViewController {
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().inset(42)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
