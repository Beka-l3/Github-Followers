//
//  NetworkManager.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    let baseUrl = "https://api.github.com/users"
    let perPage = 100
    
    let cache = NSCache<NSString, UIImage>()
    
    
    private init() { }
    
}


extension NetworkManager {
    private func doRequest<T: Decodable>(endpoint: String) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            guard let url = URL(string: endpoint) else {
                continuation.resume(throwing: NetworkManager.ServiceError.badUrl)
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    continuation.resume(throwing: NetworkManager.ServiceError.badResponse)
                    return
                }
                
                guard let data = data else {
                    continuation.resume(throwing: NetworkManager.ServiceError.invalidData)
                    return
                }
                
                do {
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let decodedData = try decoder.decode(T.self, from: data)
                    continuation.resume(returning: decodedData)
                    
                } catch {
                    
                    continuation.resume(throwing: error)
                    
                }
                
            }
            
            task.resume()
        }
    }
}


extension NetworkManager {
    
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        let endpoint = self.baseUrl + "/\(username)/followers" + "?per_page=\(self.perPage)&page=\(page)"
        return try await doRequest(endpoint: endpoint)
    }
    
    func getUser(for username: String) async throws -> User {
        let endpoint = self.baseUrl + "/\(username)"
        return try await doRequest(endpoint: endpoint)
    }
    
}


extension NetworkManager {
    
    enum ServiceError: String, Error {
        
        case badUrl = "Oops. Seems like gihub.com server is not responding"
        
        case badResponse = "Server could not find a data about followers of this user"
        
        case invalidData = "Server sent invalid data. Please, try again later"
        
    }
    
}

