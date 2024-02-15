//
//  NetworkManager.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit

final class NetworkService {
    
    static let shared = NetworkService()
    
    let baseUrl = "https://api.github.com/users"
    let perPage = 100
    
    let cache = NSCache<NSString, UIImage>()
    

//    MARK: lifecycle
    private init() { }
}


extension NetworkService {
    
    enum ServiceError: String, Error {
        case badUrl         = "Oops. Seems like gihub.com server is not responding"
        case badResponse    = "Server could not find a data about followers of this user"
        case invalidData    = "Server sent invalid data. Please, try again later"
    }
}


extension NetworkService {
    
    private func decodeData<T: Decodable>(from endpoint: String) async throws -> T {
        let data = try await getData(endpoint: endpoint)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
    
    
    private func getData(endpoint: String) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            guard let url = URL(string: endpoint) else {
                continuation.resume(throwing: NetworkService.ServiceError.badUrl)
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    continuation.resume(throwing: NetworkService.ServiceError.badResponse)
                    return
                }
                
                guard let data = data else {
                    continuation.resume(throwing: NetworkService.ServiceError.invalidData)
                    return
                }
                
                return continuation.resume(returning: data)
            }
            
            task.resume()
        }
    }
}


extension NetworkService {
    
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        let endpoint = self.baseUrl + "/\(username)/followers" + "?per_page=\(self.perPage)&page=\(page)"
        return try await decodeData(from: endpoint)
    }
    
    
    func getUser(for username: String) async throws -> User {
        let endpoint = self.baseUrl + "/\(username)"
        return try await decodeData(from: endpoint)
    }
    
    
    func getImage(from urlString: String) async throws -> UIImage {
        let data = try await getData(endpoint: urlString)
        
        guard let image = UIImage(data: data) else {
            throw ServiceError.badResponse
        }
        
        cache.setObject(image, forKey: NSString(string: urlString))
        
        return image
    }
}
