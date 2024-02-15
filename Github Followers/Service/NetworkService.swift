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
    let decoder = JSONDecoder()
    let cache = NSCache<NSString, UIImage>()
    

//    MARK: lifecycle
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
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
        
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
    
    
    private func getData(endpoint: String) async throws -> Data {
        guard let url = URL(string: endpoint) else { throw NetworkService.ServiceError.badUrl }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode == 200 else {
            throw NetworkService.ServiceError.badResponse
        }
        
        return data
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
    
    
    func getImage(from urlString: String) async -> UIImage? {
        guard let data = try? await getData(endpoint: urlString) else { return nil }
        guard let image = UIImage(data: data) else { return nil }
        
        cache.setObject(image, forKey: NSString(string: urlString))
        
        return image
    }
}
