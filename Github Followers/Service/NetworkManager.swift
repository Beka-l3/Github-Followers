//
//  NetworkManager.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import Foundation


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    let baseUrl = "https://api.github.com/users"
    let perPage = 100
    
    private init() { }
    
}


extension NetworkManager {
    
    func getFollowers(for username: String, page: Int) async throws -> [Follower] {
        return try await withCheckedThrowingContinuation { [unowned self] continuation in
            
            let endpoint = self.baseUrl + "/\(username)/followers" + "?per_page=\(self.perPage)&page=\(page)"
            
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
                    
                    let followers = try decoder.decode([Follower].self, from: data)
                    continuation.resume(returning: followers)
                    
                } catch {
                    
                    continuation.resume(throwing: error)
                    
                }
                
            }
            
            task.resume()
            
        }
    }
    
}


extension NetworkManager {
    
    enum ServiceError: String, Error {
        
        case badUrl = "Oops. Seems like gihub.com server is not responding"
        
        case badResponse = "Server could not find a data about followers of this user"
        
        case invalidData = "Server sent invalid data. Please, try again later"
        
    }
    
}
