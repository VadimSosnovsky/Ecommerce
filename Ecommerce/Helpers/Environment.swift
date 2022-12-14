//
//  Environment.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import Foundation

public enum Environment {
    enum Keys {
        static let searchPhonesUrl = Constants.searchPhonesUrl
        static let searchDetailsUrl = Constants.searchDetailsUrl
        static let searchCartUrl = Constants.searchCartUrl
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return dict
    }()
    
    static let searchPhonesURL: String = {
        guard let searchPhonesUrlString = Environment.infoDictionary[Keys.searchPhonesUrl] as? String else {
            fatalError("Base URL not set in plist")
        }
        return searchPhonesUrlString
    }()
    
    static let searchDetailsURL: String = {
        guard let searchDetailsUrlString = Environment.infoDictionary[Keys.searchDetailsUrl] as? String else {
            fatalError("Base URL not set in plist")
        }
        return searchDetailsUrlString
    }()
    
    static let searchCartURL: String = {
        guard let searchSearchUrlString = Environment.infoDictionary[Keys.searchCartUrl] as? String else {
            fatalError("Base URL not set in plist")
        }
        return searchSearchUrlString
    }()
}
