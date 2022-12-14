//
//  NetworkService.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import Foundation
import Alamofire

final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    private init() {}
    
    func fetchPhones(completion: @escaping (Phones?) -> Void) {
        let url = Environment.searchPhonesURL
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error: \(error)")
            }
            
            guard let data = dataResponse.data else { return }
            let resultData = self.decodeJSON(Phones.self, data: data)
            completion(resultData)
        }
    }
    
    func fetchCharasteristics(completion: @escaping (Characteristics?) -> Void) {
        let url = Environment.searchDetailsURL
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error: \(error)")
            }
            
            guard let data = dataResponse.data else { return }
            let resultData = self.decodeJSON(Characteristics.self, data: data)
            completion(resultData)
        }
    }
    
    func fetchCart(completion: @escaping (Cart?) -> Void) {
        let url = Environment.searchCartURL
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error: \(error)")
            }
            
            guard let data = dataResponse.data else { return }
            let resultData = self.decodeJSON(Cart.self, data: data)
            completion(resultData)
        }
    }
    
    func decodeJSON<T: Decodable>(_ type: T.Type, data: Data) -> T {
        do {
            let decoder = JSONDecoder()
            let picInfo = try decoder.decode(type.self, from: data)
            return picInfo
        } catch {
            print(error)
        }
        return Phones.init(homeStore: [HomeStore](), bestSeller: [BestSeller]()) as! T
    }
}
