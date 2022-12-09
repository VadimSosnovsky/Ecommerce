//
//  MainViewController.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let topView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    private let hotSalesView: UIView = {
       let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    private let bestSellerView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemCyan
        return view
    }()
    
    private let headerView: UIView = {
       let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let selectCategoryView: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let hotSalesTopView: UIView = {
       let view = UIView()
        view.backgroundColor = .magenta
        return view
    }()
    
    private let bestSellerTopView: UIView = {
       let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    let filterModalViewController = FilterModalViewController()
    
    private let searchTextField = SearchTextField(placeholder: "Search",
                                                  leftImageName: #imageLiteral(resourceName: "loop"))
    private let qrCodeButton = UIButton(type: .system)
    
    private let selectCategoryLabel = UILabel(font: .markProBold25(), textColor: .mainBlue())
    private let viewAllLabel = UILabel(font: .markProRegular15(), textColor: .mainOrange())
    
    private let hotSalesLabel = UILabel(font: .markProBold25(), textColor: .mainBlue())
    private let seeMoreHotSalesLabel = UILabel(font: .markProRegular15(), textColor: .mainOrange())
    
    private let bestSellerLabel = UILabel(font: .markProBold25(), textColor: .mainBlue())
    private let seeMoreBestSellerLabel = UILabel(font: .markProRegular15(), textColor: .mainOrange())
    
    private var headerStackView = UIStackView()
    private var categoriesStackView = CategoriesStackView()
    private var searchStackView = UIStackView()
    
    private let locationLabel = UILabel(font: .markProMedium15(), textColor: .mainBlue())
    
    private let locationImage = UIImageView(image: #imageLiteral(resourceName: "location"))
    private let arrowImage = UIImageView(image: #imageLiteral(resourceName: "arrow"))
    
    private let filterButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "filter").withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()
    
    var viewModel: MainViewModel!
    
    var hotSalesCollectionViewManger = HotSalesCollectionViewManager()
    lazy var hotSalesCollectionView = hotSalesCollectionViewManger.collectionView
    
    var bestSellerCollectionViewManger = BestSellerCollectionViewManager()
    lazy var bestSellerCollectionView = bestSellerCollectionViewManger.collectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainWhite()
        
        setupViews()
        setupConstraints()
        
        viewModel.loadHotSalesPhones { phones in
            self.hotSalesCollectionViewManger.homestore = phones.homeStore
            self.bestSellerCollectionViewManger.bestseller = phones.bestSeller
        }
        
        filterModalViewController.onUpdate = {
            self.tabBarController?.tabBar.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    override func viewWillLayoutSubviews() {
        qrCodeButton.layer.cornerRadius = qrCodeButton.frame.width / 2
    }
}

// MARK: - Setup Views
extension MainViewController {
    private func setupViews() {
        
        locationLabel.text = "Zihuatanejo, Gro"
        
        selectCategoryLabel.text = "Select Category"
        viewAllLabel.text = "view all"
        
        hotSalesLabel.text = "Hot sales"
        seeMoreHotSalesLabel.text = "see more"
        
        bestSellerLabel.text = "Best Seller"
        seeMoreBestSellerLabel.text = "see more"
        
        searchStackView.backgroundColor = .purple
        
        categoriesStackView.phonesCategoryButton.addTarget(self, action: #selector(handleCategoryTap), for: .touchUpInside)
        categoriesStackView.computersCategoryButton.addTarget(self, action: #selector(handleCategoryTap), for: .touchUpInside)
        categoriesStackView.healthCategoryButton.addTarget(self, action: #selector(handleCategoryTap), for: .touchUpInside)
        categoriesStackView.booksCategoryButton.addTarget(self, action: #selector(handleCategoryTap), for: .touchUpInside)
        
        let qrCodeImage = #imageLiteral(resourceName: "qrcode")
        qrCodeButton.setImage(qrCodeImage.withRenderingMode(.alwaysOriginal), for: .normal)
        qrCodeButton.backgroundColor = .mainOrange()
        
        headerStackView = UIStackView(arrangedSubviews: [locationImage,
                                                         locationLabel,
                                                         arrowImage],
                                      axis: .horizontal,
                                      spacing: 8,
                                      distribution: .equalSpacing,
                                      alignment: .center)
        
        searchStackView = UIStackView(arrangedSubviews: [searchTextField,
                                                         qrCodeButton],
                                      axis: .horizontal,
                                      spacing: 11,
                                      distribution: .fill,
                                      alignment: .fill)
        
        filterButton.addTarget(self, action: #selector(handleFilterTap), for: .touchUpInside)
        
        view.addSubview(topView)
        view.addSubview(hotSalesView)
        view.addSubview(bestSellerView)
        
        topView.addSubview(headerView)
        topView.addSubview(selectCategoryView)
        topView.addSubview(categoriesStackView)
        topView.addSubview(searchStackView)
        
        headerView.addSubview(headerStackView)
        headerView.addSubview(filterButton)
        
        selectCategoryView.addSubview(selectCategoryLabel)
        selectCategoryView.addSubview(viewAllLabel)
        
        hotSalesView.addSubview(hotSalesTopView)
        hotSalesView.addSubview(hotSalesCollectionView)
        
        hotSalesTopView.addSubview(hotSalesLabel)
        hotSalesTopView.addSubview(seeMoreHotSalesLabel)
        
        bestSellerView.addSubview(bestSellerTopView)
        bestSellerView.addSubview(bestSellerCollectionView)
        
        bestSellerTopView.addSubview(bestSellerLabel)
        bestSellerTopView.addSubview(seeMoreBestSellerLabel)
        
    }
}

// MARK: - IBActions
extension MainViewController {
    @objc private func handleFilterTap() {
        viewModel.handleFilterTap()
        tabBarController?.tabBar.isHidden = true
        filterModalViewController.modalPresentationStyle = .overCurrentContext
        self.present(filterModalViewController, animated: false)
    }
    
    @objc private func handleCategoryTap(sender: UIButton) {
        let image = sender.currentImage
        let buttonsArray = [categoriesStackView.phonesCategoryButton,
                            categoriesStackView.computersCategoryButton,
                            categoriesStackView.healthCategoryButton,
                            categoriesStackView.booksCategoryButton]
        
        for button in buttonsArray {
            button.tintColor = #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7647058824, alpha: 1)
            button.backgroundColor = .white
            if button.currentImage == image {
                button.backgroundColor = .mainOrange()
                button.tintColor = .white
            }
        }
    }
}

// MARK: - Setup Constraints
extension MainViewController {
    private func setupConstraints() {
        
        // ------------------> topView
        
        // selectCategoryView
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().inset(17)
            make.trailing.equalToSuperview().inset(33)
            make.height.equalTo(255)
        }
        
        // headerView
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(2)
            make.height.equalTo(19)
        }
        
        headerStackView.snp.makeConstraints { make in
            make.centerX.equalTo(headerView.snp.centerX)
            make.centerY.equalTo(headerView.snp.centerY)
        }
        
        filterButton.snp.makeConstraints { make in
            make.centerY.equalTo(headerView.snp.centerY)
            make.trailing.equalToSuperview()
        }
        
        // selectCategoryView
        
        selectCategoryView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(18)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        
        selectCategoryLabel.snp.makeConstraints { make in
            make.centerY.equalTo(selectCategoryView.snp.centerY)
            make.leading.equalToSuperview()
        }
        
        viewAllLabel.snp.makeConstraints { make in
            make.centerY.equalTo(selectCategoryView.snp.centerY)
            make.trailing.equalToSuperview()
        }
        
        categoriesStackView.snp.makeConstraints { make in
            make.top.equalTo(selectCategoryView.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(2)
        }
        
        // searchStackView
        
        searchStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(4)
            make.bottom.equalToSuperview()
            make.height.equalTo(34)
        }
        
        qrCodeButton.snp.makeConstraints { make in
            make.width.equalTo(34)
            make.height.equalTo(34)
        }
        
        // ------------------> hotSalesView
        
        hotSalesView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(21)
            make.height.equalTo(222)
        }
        
        // hotSalesTopView
        
        hotSalesTopView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(2)
            make.trailing.equalToSuperview().inset(6)
            make.height.equalTo(32)
        }
        
        hotSalesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(hotSalesTopView.snp.centerY)
            make.leading.equalToSuperview()
        }
        
        seeMoreHotSalesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(hotSalesTopView.snp.centerY)
            make.trailing.equalToSuperview()
        }
        
        // hotSalesCollectionView
        
        hotSalesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(hotSalesTopView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(hotSalesView.snp.bottom)
        }
        
        // ------------------> bestSellerView
        
        bestSellerView.snp.makeConstraints { make in
            make.top.equalTo(hotSalesView.snp.bottom).offset(11)
            make.leading.equalToSuperview().inset(17)
            make.trailing.equalToSuperview().inset(21)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        bestSellerTopView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(6)
            make.height.equalTo(32)
        }
        
        bestSellerLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bestSellerTopView.snp.centerY)
            make.leading.equalToSuperview()
        }
        
        seeMoreBestSellerLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bestSellerTopView.snp.centerY)
            make.trailing.equalToSuperview()
        }
        
        bestSellerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bestSellerTopView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
