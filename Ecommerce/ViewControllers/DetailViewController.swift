//
//  DetailViewController.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 09.12.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailsView = UIView.createView()
    private let detailsTopView = DetailsTopView()
    private let equipmentView = UIView.createView()
    
    private var priceString = Constants.priceString

    private let addtoCartButton = UIButton(type: .system)
    
    private let equipmentLabel = UILabel(font: .markProMedium18(), textColor: .mainBlue())

    private var menuStackView = UIStackView()
    private var shopStackView = ShopStackView()
    private var detailsStackView = DetailsStackView()
    private var featuresStackView = FeaturesStackView()
    
    private var hardwareStackView = UIStackView()
    private var cpuStackView = CPUStackView()
    private var cameraStackView = CameraStackView()
    private var ssdStackView = SSDStackView()
    private var sdStackView = SDStackView()
    
    private lazy var equipmentStackView = EquipmentStackView(viewModel: viewModel)
    
    
    var viewModel: DetailViewModel!
    private var characteristics: Characteristics?
    
    var detailsCollectionViewManager = DetailCollectionViewManager()
    lazy var detailsCollectionView = detailsCollectionViewManager.collectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addtoCartButton.layer.cornerRadius = 10
        detailsView.backgroundColor = .white
        
        view.backgroundColor = .mainWhite()
        characteristics = viewModel.characteristics
        
        if let images = characteristics?.images {
            detailsCollectionViewManager.detailsPhoto = images
        }
        
        if let characteristics = characteristics {
            setDetailsData(withCharacteristics: characteristics)
        }
        
        setupNavigationBar()
        setupViews()
        setupConstraints()
        
        [shopStackView.shopLineView, detailsStackView.detailsLineView, featuresStackView.featuresLineView].forEach { view in
            view.backgroundColor = .white
        }
    }
    
    override func viewDidLayoutSubviews() {
        detailsView.layer.cornerRadius = 30
        detailsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
}

// MARK: - IBActions
extension DetailViewController {
    @objc private func handleLeftBarButtonTap() {
        print(#function)
        viewModel.backButtonTapped()
    }
    
    @objc private func handleRightBarButtonTap() {
        print(#function)
    }
    
    @objc private func menuHandleTap(sender: UIButton) {
        viewModel.menuHandleTap(sender: sender,
                                shopButton: shopStackView.shopButton,
                                shopView: shopStackView.shopLineView,
                                detailsButton: detailsStackView.detailsButton,
                                detailsView: detailsStackView.detailsLineView,
                                featuresButton: featuresStackView.featuresButton,
                                featuresView: featuresStackView.featuresLineView)
    }
}

// MARK: - Setup Views
extension DetailViewController {
    private func setupViews() {
        
        equipmentLabel.text = Constants.equipmentLabel
        
        [shopStackView.shopButton, detailsStackView.detailsButton, featuresStackView.featuresButton].forEach { button in
            button.titleLabel?.font = .markProRegular20()
            button.titleLabel?.tintColor = .black.withAlphaComponent(0.5)
        }
        
        shopStackView.shopButton.addTarget(self, action: #selector(menuHandleTap), for: .touchUpInside)
        detailsStackView.detailsButton.addTarget(self, action: #selector(menuHandleTap), for: .touchUpInside)
        featuresStackView.featuresButton.addTarget(self, action: #selector(menuHandleTap), for: .touchUpInside)
        
        addtoCartButton.setTitle(priceString, for: .normal)
        addtoCartButton.titleLabel?.font = .markProBold20()
        
        addtoCartButton.backgroundColor = .mainOrange()
        addtoCartButton.tintColor = .white
        
        menuStackView = UIStackView(arrangedSubviews: [shopStackView,
                                                       detailsStackView,
                                                       featuresStackView],
                                    axis: .horizontal,
                                    spacing: 40,
                                    distribution: .fillEqually,
                                    alignment: .fill)
        
        hardwareStackView = UIStackView(arrangedSubviews: [cpuStackView,
                                                           cameraStackView,
                                                           ssdStackView,
                                                           sdStackView],
                                    axis: .horizontal,
                                    spacing: 40,
                                        distribution: .fillProportionally,
                                    alignment: .bottom)
        
        view.addSubview(detailsCollectionView)
        view.addSubview(detailsView)
        
        detailsView.addSubview(detailsTopView)
        detailsView.addSubview(menuStackView)
        detailsView.addSubview(hardwareStackView)
        detailsView.addSubview(equipmentView)
        detailsView.addSubview(addtoCartButton)
        
        equipmentView.addSubview(equipmentLabel)
        equipmentView.addSubview(equipmentStackView)
    }
    
    private func setDetailsData(withCharacteristics characteristics: Characteristics) {
        detailsTopView.phoneNameLabel.text = characteristics.title
        detailsTopView.ratingView.rating = characteristics.rating
        cpuStackView.cpuLabel.text = characteristics.cpu
        cameraStackView.cameraLabel.text = characteristics.camera
        ssdStackView.ssdLabel.text = characteristics.ssd
        sdStackView.sdLabel.text = characteristics.sd
        
        equipmentStackView.capacitySegmentedControl.items = characteristics.capacity
        
        priceString.append(String(repeating: " ", count: 10))
        priceString.append("$\(characteristics.price).00")
        
        if let firstColor = characteristics.color.first,
           let secondColor = characteristics.color.last {
            equipmentStackView.buttonsStackView.firstColorButton.backgroundColor = UIColor.hexStringToUIColor(hex: firstColor)
            equipmentStackView.buttonsStackView.secondColorButton.backgroundColor = UIColor.hexStringToUIColor(hex: secondColor)
        }
        
        var likeImage = UIImage()
        if characteristics.isFavorites {
            likeImage = #imageLiteral(resourceName: "feelLikeImage").withRenderingMode(.alwaysOriginal)
            detailsTopView.likeButton.setImage(likeImage, for: .normal)
        } else {
            likeImage = #imageLiteral(resourceName: "favoriteTab").withRenderingMode(.alwaysOriginal)
            detailsTopView.likeButton.setImage(likeImage, for: .normal)
        }
    }
    
    private func setupNavigationBar() {
        title = "Product Details"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.mainBlue(), .font: UIFont.markProMedium18() ?? UIFont.systemFont(ofSize: 18)]

        // left Bar Button Item
        
        let leftButton = UIButton(type: .system)
        let leftImage = #imageLiteral(resourceName: "bigArrow").withRenderingMode(.alwaysOriginal)
        let rotatedLeftImage = leftImage.rotate(radians: .pi/2)?.withRenderingMode(.alwaysOriginal)
        leftButton.setImage(rotatedLeftImage, for: .normal)
        leftButton.backgroundColor = .mainBlue()
        leftButton.layer.cornerRadius = 10
        leftButton.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
        leftButton.addTarget(self, action: #selector(handleLeftBarButtonTap), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        // right Bar Button Item
        
        let rightButton = UIButton(type: .system)
        let rightImage = #imageLiteral(resourceName: "cartTab").withRenderingMode(.alwaysOriginal)
        rightButton.setImage(rightImage, for: .normal)
        rightButton.backgroundColor = .mainOrange()
        rightButton.layer.cornerRadius = 10
        rightButton.frame = CGRect(x: 0, y: 0, width: 37, height: 37)
        rightButton.addTarget(self, action: #selector(handleRightBarButtonTap), for: .touchUpInside)
        let rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}

// MARK: - Setup Constraints
extension DetailViewController {
    private func setupConstraints() {
        
        // ------------------> detailsCollectionView
        
        detailsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.leading.trailing.equalToSuperview().inset(74)
            make.height.equalTo(335)
        }
        
        // ------------------> detailsView
        
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(detailsCollectionView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        detailsTopView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().inset(38)
            make.trailing.equalToSuperview().inset(37)
            make.height.equalTo(55)
        }
        
        menuStackView.snp.makeConstraints { make in
            make.top.equalTo(detailsTopView.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(27)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(33)
        }
        
        let views = [shopStackView.shopLineView, detailsStackView.detailsLineView, featuresStackView.featuresLineView]
        
        for view in views {
            view.backgroundColor = .mainOrange()
            view.layer.cornerRadius = 3
            view.snp.makeConstraints { make in
                make.height.equalTo(3)
            }
        }
        
        hardwareStackView.snp.makeConstraints { make in
            make.top.equalTo(menuStackView.snp.bottom).offset(33)
            make.leading.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(47)
        }
    
        let paramtersImageViews = [cpuStackView.cpuImageView, cameraStackView.cameraImageView, ssdStackView.ssdImageView, sdStackView.sdImageView]
        
        for paramtersImageView in paramtersImageViews {
            paramtersImageView.contentMode = .scaleAspectFit
        }
        
        equipmentView.snp.makeConstraints { make in
            make.top.equalTo(hardwareStackView.snp.bottom).offset(29)
            make.leading.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(63)
            make.height.equalTo(75)
        }
        
        equipmentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        equipmentStackView.snp.makeConstraints { make in
            make.top.equalTo(equipmentLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        addtoCartButton.snp.makeConstraints { make in
            make.top.equalTo(equipmentView.snp.bottom).offset(27)
            make.leading.equalToSuperview().inset(29)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(54)
        }
    }
}
