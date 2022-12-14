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
    
    private let mainView = UIView.createView()
    private let separatorBoldView = UIView.createView()
    private let separatorThinView = UIView.createView()
    
    private let checkoutButton = UIButton(type: .system)
    
    var cartTableViewManager = CartTableViewManager()
    lazy var cartTableView = cartTableViewManager.tableView
    
    private var checkStackView = CheckStackView()
    
    var viewModel: CartViewModel!
    var totalPrice = 0
    var badgeCount = 0
    
    var handleUpdatedDataDelegate: BadgeCountUpdateProtocol?
    lazy var totalValueLabel = checkStackView.checkRightStackView.totalValueLabel
    lazy var deliveryValueLabel = checkStackView.checkRightStackView.deliveryValueLabel
    
    override func viewWillLayoutSubviews() {
        
        let cells = cartTableView.numberOfSections
        
        for currentCell in 0...cells {
            var cell = cartTableView.cellForRow(at: IndexPath(row: 0, section: currentCell)) as? CartTableViewCell

            cell?.closure = { [weak self] in
                var total = 0
                self?.badgeCount = 0
                for item in 0...cells {
                    cell = self?.cartTableView.cellForRow(at: IndexPath(row: 0, section: item)) as? CartTableViewCell
                    
                    guard let cell = cell,
                          let totalValue = cell.priceLabel.text?.dropLast(4),
                          let totalValueInt = Int(totalValue),
                          let badgeCount = cell.countLabel.text,
                          let badgeCountInt = Int(badgeCount)
                    else { return }
                    
                    total += totalValueInt
                    self?.badgeCount += badgeCountInt
                    self?.totalValueLabel.text = "$\(total) us"
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkoutButton.layer.cornerRadius = 10
        
        view.backgroundColor = .mainWhite()
        mainView.backgroundColor = .mainBlue()
        
        cartTableView.backgroundColor = .mainBlue()
        
        separatorBoldView.backgroundColor = .white.withAlphaComponent(0.25)
        separatorThinView.backgroundColor = .white.withAlphaComponent(0.20)
        
        viewModel.loadCartPhones { [unowned self] cart in
            self.cartTableViewManager.basket = cart.basket
            
            self.cartTableViewManager.basket.forEach { basket in
                self.totalPrice += basket.price
            }
            self.totalValueLabel.text = "$\(self.totalPrice) us"
            self.deliveryValueLabel.text = cart.delivery
        }
        
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        handleUpdatedDataDelegate?.onBadgeCountUpdate(badgeCount: badgeCount)
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
        tabBarController?.selectedIndex = 0
    }
    
    @objc private func handleRightBarButtonTap() {
        print(#function)
    }
}

// MARK: - Setup Views
extension CartViewController {
    private func setupViews() {
        
        titleLabel.text = Constants.titleLabel
        locationLabel.text = Constants.locationMarkLabel
        
        checkoutButton.setTitle(Constants.checkoutButtonTitle, for: .normal)
        checkoutButton.titleLabel?.font = .markProBold20()
        checkoutButton.backgroundColor = .mainOrange()
        checkoutButton.tintColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(mainView)
        
        mainView.addSubview(cartTableView)
        mainView.addSubview(separatorBoldView)
        mainView.addSubview(checkStackView)
        mainView.addSubview(separatorThinView)
        mainView.addSubview(checkoutButton)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.mainBlue(),
                                                                   .font: UIFont.markProMedium18() ?? UIFont.systemFont(ofSize: 18)]

        // left Bar Button Item
        
        let leftButton = UIButton(type: .system)
        let leftImage = #imageLiteral(resourceName: "bigArrow").withRenderingMode(.alwaysOriginal)
        let rotatedLeftImage = leftImage.rotate(radians: .pi/2)?.withRenderingMode(.alwaysOriginal)
        leftButton.setImage(rotatedLeftImage, for: .normal)
        leftButton.backgroundColor = .mainBlue()
        leftButton.layer.cornerRadius = 10
        leftButton.addTarget(self, action: #selector(handleLeftBarButtonTap), for: .touchUpInside)
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 180, height: 44))
    
        leftView.addSubview(leftButton)
        
        leftView.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(44)
        }
        
        leftButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.width.height.equalTo(37)
        }
        
        let leftBarButtonItem = UIBarButtonItem(customView: leftView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        // right Bar Button Item
        
        let rightButton = UIButton(type: .system)
        let rightImage = #imageLiteral(resourceName: "locationBig").withRenderingMode(.alwaysOriginal)
        rightButton.setImage(rightImage, for: .normal)
        rightButton.backgroundColor = .mainOrange()
        rightButton.layer.cornerRadius = 10
        rightButton.addTarget(self, action: #selector(handleRightBarButtonTap), for: .touchUpInside)
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 180, height: 44))
        
        locationLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 19)
        
        rightView.addSubview(locationLabel)
        rightView.addSubview(rightButton)
        
        rightView.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(44)
        }
        
        rightButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(37)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(rightButton.snp.leading).offset(-9)
        }
        
        let rightBarButtonItem = UIBarButtonItem(customView: rightView)
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}

// MARK: - Setup Constraints
extension CartViewController {
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(45)
            make.leading.equalToSuperview().inset(42)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        cartTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(81)
            make.leading.trailing.equalToSuperview().inset(33)
            make.height.equalTo(356)
        }
        
        separatorBoldView.snp.makeConstraints { make in
            make.top.equalTo(cartTableView.snp.bottom).offset(38)
            make.leading.trailing.equalToSuperview().inset(4)
            make.height.equalTo(2)
        }
        
        checkStackView.snp.makeConstraints { make in
            make.top.equalTo(separatorBoldView.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(55)
        }
        
        separatorThinView.snp.makeConstraints { make in
            make.top.equalTo(checkStackView.snp.bottom).offset(26)
            make.leading.trailing.equalToSuperview().inset(4)
            make.height.equalTo(1)
        }
        
        checkoutButton.snp.makeConstraints { make in
            make.top.equalTo(separatorThinView.snp.bottom).offset(27)
            make.leading.trailing.equalToSuperview().inset(44)
            make.height.equalTo(54)
        }
    }
}
