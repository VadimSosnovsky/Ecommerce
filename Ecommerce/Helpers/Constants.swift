//
//  Constants.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import UIKit

struct Constants {
    
    // CustomTabBarController
    
    static let tabBarItemWidth: CGFloat = 50
    static let tabBarItemSpacing: CGFloat = 40
    static let tabBarItemImageInsets = UIEdgeInsets.init(top: 20, left: 0, bottom: -20, right: 0)
    
    // MainViewController
    
    static let locationLabel = "Zihuatanejo, Gro"
    static let selectCategoryLabel = "Select Category"
    static let viewAllLabel = "view all"
    static let hotSalesLabel = "Hot sales"
    static let seeMoreLabel = "see more"
    static let bestSellerLabel = "Best Seller"
    static let searchTextFieldPlaceholder = "Search"
    static let buyButtonTitle = "Buy now!"
    
    static let hotSalesCollectionViewCell = "HotSalesCollectionViewCell"
    static let bestSellerCollectionViewCell = "BestSellerCollectionViewCell"
    
    static let categoriesViewsHeight: CGFloat = 71
    
    static let hotSalesCellWidth = 378
    static let hotSalesCellHeight = 182
    
    static let bestSellerCellSize: CGSize = CGSize(width: 181, height: 227)
    
    // FilterModalViewController
    
    static let phoneNameTextFieldPlaceholder = "Samsung"
    static let priceTextFieldPlacholder = "$300-$500"
    static let sizeTextFieldPlaceholder = "$4.5 to 5.5 inches"
    
    static let filterLabel = "Filter Options"
    static let brandLabel = "Brand"
    static let priceLabel = "Price"
    static let sizeLabel = "Size"
    
    static let defaultHeight: CGFloat = 375
    static let currentContainerHeight: CGFloat = 375
    static let dismissibleHeight: CGFloat = 200
    static let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    
    // DetailViewController
    
    static let equipmentLabel = "Select color and capacity"
    static let shopButtonTitle = "Shop"
    static let detailsButtonTitle = "Details"
    static let featuresButtonTitle = "Features"
    static let priceString = "Add to Cart"
    
    static let detailCollectionViewCell = "DetailCollectionViewCell"
    
    static let detailCellWidth = 266
    static let detailCellHeight = 335
    
    
    // CartViewController
    
    static let titleLabel = "My Cart"
    static let tableViewHeaderTitle = "Title"
    static let tableViewEmptyHeaderTitle = ""
    static let locationMarkLabel = "Add address"
    static let totalLabel = "Total"
    static let deliveryLabel = "Delivery"
    static let checkoutButtonTitle = "Checkout"
    
    static let cartTableViewCellReuseId = "CartTableViewCell"
    
    static let heightForHeaderInSection: CGFloat = 26
    static let heightForRowAt: CGFloat = 88
    
    // PagingCollectionViewLayout
    
    static let velocityThresholdPerPage: CGFloat = 2
    static let numberOfItemsPerPage: CGFloat = 1
    
    // Environment
    
    static let searchPhonesUrl = "SEARCH_PHONES_URL"
    static let searchDetailsUrl = "SEARCH_DETAILS_URL"
    static let searchCartUrl = "SEARCH_CART_URL"
}
