//
//  MainViewController.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 06.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let topView = UIView.createView()
    private let hotSalesView = UIView.createView()
    private let bestSellerView = UIView.createView()
    
    private let hotSalesTopView = HotSalesTopView()
    private let bestSellerTopView = BestSellerTopView()
    
    private lazy var headerView = HeaderView(viewModel: viewModel,
                                             tabBarController: tabBarController ?? UITabBarController(),
                                             mainVC: self)
    
    private let selectCategoryView = SelectCategoryView()
    private var categoriesStackView = CategoriesStackView()
    private var searchStackView = SearchStackView()
    
    var viewModel: MainViewModel!
    var badgeCount = 0
    
    var hotSalesCollectionViewManager = HotSalesCollectionViewManager()
    lazy var hotSalesCollectionView = hotSalesCollectionViewManager.collectionView
    
    var bestSellerCollectionViewManger = BestSellerCollectionViewManager()
    lazy var bestSellerCollectionView = bestSellerCollectionViewManger.collectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cartVC = (viewModel.coordinator?.parentCoordinator?.childCoordinators[1] as? CartCoordinator)?.cartViewController
        
        cartVC?.handleUpdatedDataDelegate = self
        
        view.backgroundColor = .mainWhite()
        setupViews()
        setTargets()
        setupConstraints()
        
        viewModel.loadHotSalesPhones { [weak self] phones in
            self?.hotSalesCollectionViewManager.homestore = phones.homeStore
            self?.bestSellerCollectionViewManger.bestseller = phones.bestSeller
        }
        
        viewModel.loadCartPhones { [weak self] cart in
            self?.badgeCount = cart.basket.count
            if let tabItem = self?.tabBarController?.tabBar.items {
                tabItem[1].badgeValue = "\(cart.basket.count)"
                tabItem[1].badgeColor = .mainOrange()
            }
        }
        
        bestSellerCollectionViewManger.completion = { [weak self] in
            self?.viewModel.getCharacteristics()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}


// MARK: - IBActions
extension MainViewController {
    @objc private func handleCategoryTap(sender: UIButton) {
        viewModel.handleCategoryTap(sender: sender, categoriesStackView: categoriesStackView)
    }
}

// MARK: - Setup Views
extension MainViewController {
    private func setupViews() {
        
        view.addSubview(topView)
        view.addSubview(hotSalesView)
        view.addSubview(bestSellerView)
        
        topView.addSubview(headerView)
        topView.addSubview(selectCategoryView)
        topView.addSubview(categoriesStackView)
        topView.addSubview(searchStackView)
        
        hotSalesView.addSubview(hotSalesTopView)
        hotSalesView.addSubview(hotSalesCollectionView)
        
        bestSellerView.addSubview(bestSellerTopView)
        bestSellerView.addSubview(bestSellerCollectionView)
    }
    
    private func setTargets() {
        [categoriesStackView.phonesCategoryButton,
         categoriesStackView.computersCategoryButton,
         categoriesStackView.healthCategoryButton,
         categoriesStackView.booksCategoryButton].forEach { button in
            button.addTarget(self, action: #selector(handleCategoryTap), for: .touchUpInside)
        }
    }
}

// MARK: - Setup Constraints
extension MainViewController {
    private func setupConstraints() {
        
        // ------------------> topView
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(2)
            make.height.equalTo(19)
        }
        
        selectCategoryView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(18)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        
        categoriesStackView.snp.makeConstraints { make in
            make.top.equalTo(selectCategoryView.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(2)
        }

        searchStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(4)
            make.bottom.equalToSuperview()
            make.height.equalTo(34)
        }
        
        // selectCategoryView
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().inset(17)
            make.trailing.equalToSuperview().inset(33)
            make.height.equalTo(255)
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
        
        bestSellerCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bestSellerTopView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension MainViewController: BadgeCountUpdateProtocol {
    func onBadgeCountUpdate(badgeCount: Int) {
        self.badgeCount = badgeCount
        
        guard let tabItem = self.tabBarController?.tabBar.items else { return }
        
        if badgeCount > 0 {
            tabItem[1].badgeValue = "\(badgeCount)"
        } else {
            tabItem[1].badgeValue = nil
        }
    }
}
