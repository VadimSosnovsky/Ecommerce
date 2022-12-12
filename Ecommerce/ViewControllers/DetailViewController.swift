//
//  DetailViewController.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 09.12.2022.
//

import UIKit
import Cosmos

class DetailViewController: UIViewController {
    
    private let detailsView = createView()
    private let detailsTopView = createView()
    private let shopLineView = createView()
    private let detailsLineView = createView()
    private let featuresLineView = createView()
    private let equipmentView = createView()
    
    private let ratingView = CosmosView()
    private let phoneNameLabel = UILabel(font: .markProMedium24(), textColor: .mainBlue())
    
    private var priceString = "Add to Cart"
    
    private let likeButton = UIButton(type: .system)
    private let firstColorButton = UIButton(type: .system)
    private let secondColorButton = UIButton(type: .system)
    private let addtoCartButton = UIButton(type: .system)
    
    var capacitySegmentedControl = HBSegmentedControl()
    
    private let equipmentLabel = UILabel(font: .markProMedium18(), textColor: .mainBlue())
    
    private let shopButton = UIButton(type: .system)
    private let detailsButton = UIButton(type: .system)
    private let featuresButton = UIButton(type: .system)
    
    private let cpuLabel = UILabel(font: .markProRegular11(), textColor: #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1))
    private let cameraLabel = UILabel(font: .markProRegular11(), textColor: #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1))
    private let ssdLabel = UILabel(font: .markProRegular11(), textColor: #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1))
    private let sdLabel = UILabel(font: .markProRegular11(), textColor: #colorLiteral(red: 0.7176470588, green: 0.7176470588, blue: 0.7176470588, alpha: 1))
    
    private let cpuImageView = UIImageView(image: #imageLiteral(resourceName: "cpu").withRenderingMode(.alwaysOriginal))
    private let cameraImageView = UIImageView(image: #imageLiteral(resourceName: "camera").withRenderingMode(.alwaysOriginal))
    private let ssdImageView = UIImageView(image: #imageLiteral(resourceName: "ssd").withRenderingMode(.alwaysOriginal))
    private let sdImageView = UIImageView(image: #imageLiteral(resourceName: "sd").withRenderingMode(.alwaysOriginal))

    private var menuStackView = UIStackView()
    private var shopStackView = UIStackView()
    private var detailsStackView = UIStackView()
    private var featuresStackView = UIStackView()
    
    private var hardwareStackView = UIStackView()
    private var cpuStackView = UIStackView()
    private var cameraStackView = UIStackView()
    private var ssdStackView = UIStackView()
    private var sdStackView = UIStackView()
    
    private var equipmentStackView = UIStackView()
    private var buttonsStackView = UIStackView()
    
    
    var viewModel: DetailViewModel!
    private var characteristics: Characteristics?
    
    var detailsCollectionViewManager = DetailCollectionViewManager()
    lazy var detailsCollectionView = detailsCollectionViewManager.collectionView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        detailsView.backgroundColor = .white
        
        [shopLineView, detailsLineView, featuresLineView].forEach { view in
            view.backgroundColor = .white
        }
        
        likeButton.backgroundColor = .mainBlue()
        likeButton.layer.cornerRadius = 10
        
        addtoCartButton.layer.cornerRadius = 10
        
        ratingView.isUserInteractionEnabled = false
        ratingView.settings.fillMode = .half
    }
    
    override func viewDidLayoutSubviews() {
        firstColorButton.layer.cornerRadius = firstColorButton.frame.width / 2
        secondColorButton.layer.cornerRadius = secondColorButton.frame.width / 2
        
        detailsView.layer.cornerRadius = 30
        detailsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
}

// MARK: - IBActions
extension DetailViewController {
    @objc private func handleLeftBarButtonTap() {
        print(#function)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleRightBarButtonTap() {
        print(#function)
    }
    
    @objc private func handleColorTap(sender: UIButton) {
        let colorButtonsArray = [firstColorButton, secondColorButton]
        viewModel.handleColorTap(sender: sender, buttons: colorButtonsArray)
    }
    
    @objc private func menuHandleTap(sender: UIButton) {
        viewModel.menuHandleTap(sender: sender,
                                shopButton: shopButton,
                                shopView: shopLineView,
                                detailsButton: detailsButton,
                                detailsView: detailsLineView,
                                featuresButton: featuresButton,
                                featuresView: featuresLineView)
    }
}

// MARK: - Setup Views
extension DetailViewController {
    private func setupViews() {
        
        let likeImage = #imageLiteral(resourceName: "likeImage").withRenderingMode(.alwaysOriginal)
        likeButton.setImage(likeImage, for: .normal)
        
        equipmentLabel.text = "Select color and capacity"
        
        [shopButton, detailsButton, featuresButton].forEach { button in
            button.titleLabel?.font = .markProRegular20()
            button.titleLabel?.tintColor = .black.withAlphaComponent(0.5)
        }
        
        shopButton.setTitle("Shop", for: .normal)
        detailsButton.setTitle("Details", for: .normal)
        featuresButton.setTitle("Features", for: .normal)
        
        firstColorButton.addTarget(self, action: #selector(handleColorTap), for: .touchUpInside)
        secondColorButton.addTarget(self, action: #selector(handleColorTap), for: .touchUpInside)
        
        shopButton.addTarget(self, action: #selector(menuHandleTap), for: .touchUpInside)
        detailsButton.addTarget(self, action: #selector(menuHandleTap), for: .touchUpInside)
        featuresButton.addTarget(self, action: #selector(menuHandleTap), for: .touchUpInside)
        
        addtoCartButton.setTitle(priceString, for: .normal)
        addtoCartButton.titleLabel?.font = .markProBold20()
        
        addtoCartButton.backgroundColor = .mainOrange()
        addtoCartButton.tintColor = .white
        
        shopStackView = UIStackView(arrangedSubviews: [shopButton,
                                                       shopLineView],
                                    axis: .vertical,
                                    spacing: 4,
                                    distribution: .fill,
                                    alignment: .fill)
        detailsStackView = UIStackView(arrangedSubviews: [detailsButton,
                                                          detailsLineView],
                                    axis: .vertical,
                                    spacing: 4,
                                    distribution: .fill,
                                    alignment: .fill)
        featuresStackView = UIStackView(arrangedSubviews: [featuresButton,
                                                           featuresLineView],
                                    axis: .vertical,
                                    spacing: 4,
                                    distribution: .fill,
                                    alignment: .fill)
        
        menuStackView = UIStackView(arrangedSubviews: [shopStackView,
                                                       detailsStackView,
                                                       featuresStackView],
                                    axis: .horizontal,
                                    spacing: 40,
                                    distribution: .fillEqually,
                                    alignment: .fill)
        
        
        cpuStackView = UIStackView(arrangedSubviews: [cpuImageView,
                                                      cpuLabel],
                                    axis: .vertical,
                                    spacing: 0,
                                    distribution: .fill,
                                    alignment: .fill)
        
        cameraStackView = UIStackView(arrangedSubviews: [cameraImageView,
                                                         cameraLabel],
                                    axis: .vertical,
                                    spacing: 5,
                                    distribution: .fill,
                                    alignment: .fill)
        
        ssdStackView = UIStackView(arrangedSubviews: [ssdImageView,
                                                      ssdLabel],
                                    axis: .vertical,
                                    spacing: 5,
                                    distribution: .fill,
                                    alignment: .fill)
        
        sdStackView = UIStackView(arrangedSubviews: [sdImageView,
                                                     sdLabel],
                                    axis: .vertical,
                                    spacing: 5,
                                    distribution: .fill,
                                    alignment: .fill)
        
        hardwareStackView = UIStackView(arrangedSubviews: [cpuStackView,
                                                           cameraStackView,
                                                           ssdStackView,
                                                           sdStackView],
                                    axis: .horizontal,
                                    spacing: 40,
                                        distribution: .fillProportionally,
                                    alignment: .bottom)
        
        buttonsStackView = UIStackView(arrangedSubviews: [firstColorButton,
                                                          secondColorButton],
                                          axis: .horizontal,
                                          spacing: 16,
                                          distribution: .fill,
                                          alignment: .fill)
        
        
        equipmentStackView = UIStackView(arrangedSubviews: [buttonsStackView,
                                                            capacitySegmentedControl],
                                         axis: .horizontal,
                                         spacing: 58,
                                         distribution: .equalSpacing,
                                         alignment: .center)
        
        view.addSubview(detailsCollectionView)
        view.addSubview(detailsView)
        
        detailsView.addSubview(detailsTopView)
        detailsView.addSubview(menuStackView)
        detailsView.addSubview(hardwareStackView)
        detailsView.addSubview(equipmentView)
        detailsView.addSubview(addtoCartButton)
        
        detailsTopView.addSubview(phoneNameLabel)
        detailsTopView.addSubview(ratingView)
        detailsTopView.addSubview(likeButton)
        
        equipmentView.addSubview(equipmentLabel)
        equipmentView.addSubview(equipmentStackView)
    }
    
    private func setDetailsData(withCharacteristics characteristics: Characteristics) {
        phoneNameLabel.text = characteristics.title
        ratingView.rating = characteristics.rating
        cpuLabel.text = characteristics.cpu
        cameraLabel.text = characteristics.camera
        ssdLabel.text = characteristics.ssd
        sdLabel.text = characteristics.sd
        
        capacitySegmentedControl.items = characteristics.capacity
        
        priceString.append(String(repeating: " ", count: 10))
        priceString.append("$\(characteristics.price).00")
        
        if let firstColor = characteristics.color.first,
           let secondColor = characteristics.color.last {
            firstColorButton.backgroundColor = UIColor.hexStringToUIColor(hex: firstColor)
            secondColorButton.backgroundColor = UIColor.hexStringToUIColor(hex: secondColor)
        }
    }
    
    private static func createView() -> UIView {
        let view = UIView()
        return view
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
        
        phoneNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        ratingView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(126)
            make.height.equalTo(18)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(37)
            make.height.equalTo(33)
        }
        
        menuStackView.snp.makeConstraints { make in
            make.top.equalTo(detailsTopView.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(27)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(33)
        }
        
        let views = [shopLineView, detailsLineView, featuresLineView]
        
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
    
        let paramtersImageViews = [cpuImageView, cameraImageView, ssdImageView, sdImageView]
        
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
        
        firstColorButton.snp.makeConstraints { make in
            make.width.height.equalTo(39)
        }
        
        secondColorButton.snp.makeConstraints { make in
            make.width.height.equalTo(39)
        }
        
        capacitySegmentedControl.snp.makeConstraints { make in
            make.width.equalTo(142)
            make.height.equalTo(30)
        }
        
        addtoCartButton.snp.makeConstraints { make in
            make.top.equalTo(equipmentView.snp.bottom).offset(27)
            make.leading.equalToSuperview().inset(29)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(54)
        }
    }
}
