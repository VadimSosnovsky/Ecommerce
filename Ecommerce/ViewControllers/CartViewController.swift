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
    
    private let totalLabel = UILabel(font: .markProRegular15(), textColor: .white)
    private let deliveryLabel = UILabel(font: .markProRegular15(), textColor: .white)
    
    private let totalValueLabel = UILabel(font: .markProBold15(), textColor: .white)
    private let deliveryValueLabel = UILabel(font: .markProBold15(), textColor: .white)
    
    private let mainView = createView()
    private let separatorBoldView = createView()
    private let separatorThinView = createView()
    
    private let checkoutButton = UIButton(type: .system)
    
    var cartTableViewManager = CartTableViewManager()
    lazy var cartTableView = cartTableViewManager.tableView
    
    private var checkStackView = UIStackView()
    private var checkLeftStackView = UIStackView()
    private var checkRightStackView = UIStackView()
    
    var viewModel: CartViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainWhite()
        mainView.backgroundColor = .mainBlue()
        
        cartTableView.backgroundColor = .mainBlue()
        
        checkoutButton.layer.cornerRadius = 10
        
        separatorBoldView.backgroundColor = .white.withAlphaComponent(0.25)
        separatorThinView.backgroundColor = .white.withAlphaComponent(0.20)
        
        setupViews()
        setupConstraints()
        setupNavigationBar()
        
        [totalLabel, totalValueLabel, deliveryLabel, deliveryValueLabel].forEach { label in
            label.textAlignment = .left
        }
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
        tabBarController?.selectedIndex = 0
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
        
        totalLabel.text = "Total"
        deliveryLabel.text = "Delivery"
        
        totalValueLabel.text = "$6,000 us"
        deliveryValueLabel.text = "Free"
        
        checkoutButton.setTitle("Checkout", for: .normal)
        checkoutButton.titleLabel?.font = .markProBold20()
        
        checkoutButton.backgroundColor = .mainOrange()
        checkoutButton.tintColor = .white
        
        checkLeftStackView = UIStackView(arrangedSubviews: [totalLabel,
                                                            deliveryLabel],
                                         axis: .vertical,
                                         spacing: 12,
                                         distribution: .fill,
                                         alignment: .fill)
        
        checkRightStackView = UIStackView(arrangedSubviews: [totalValueLabel,
                                                            deliveryValueLabel],
                                         axis: .vertical,
                                         spacing: 12,
                                         distribution: .fill,
                                         alignment: .fill)
        
        checkStackView = UIStackView(arrangedSubviews: [checkLeftStackView,
                                                        checkRightStackView],
                                         axis: .horizontal,
                                         spacing: 185,
                                         distribution: .fill,
                                         alignment: .fill)
        
        view.addSubview(titleLabel)
        view.addSubview(mainView)
        
        mainView.addSubview(cartTableView)
        mainView.addSubview(separatorBoldView)
        mainView.addSubview(checkStackView)
        mainView.addSubview(separatorThinView)
        mainView.addSubview(checkoutButton)
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
