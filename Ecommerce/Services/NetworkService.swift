//
//  NetworkService.swift
//  Ecommerce
//
//  Created by Вадим Сосновский on 07.12.2022.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func fetchPhones(completion: @escaping (Phones?) -> Void)
    func loadImages(from url: URL, completion: @escaping (UIImage) -> Void)
    func decodeJSON<T: Decodable>(_ type: T.Type, data: Data) -> T
    var cache: NSCache<AnyObject, UIImage> { get }
}

final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    private init() {}
    
    private(set) var cache = NSCache<AnyObject, UIImage>()
    
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
    
    func loadImages(from url: URL, completion: @escaping (UIImage) -> Void) {
        
        if let cachedImage = cache.object(forKey: url as AnyObject) {
            completion(cachedImage)
        } else {
            AF.request(url, method: .get).responseData { (dataResponse) in
                guard let data = dataResponse.data else {
                    print("Error: \(String(describing: dataResponse.error))")
                    return
                }
                
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    guard let image = image else { return }
                    completion(image)
                    self.cache.setObject(image, forKey: url as AnyObject)
                }
            }
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
