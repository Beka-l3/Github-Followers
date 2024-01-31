//
//  PersistenceService.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 31.01.2024.
//

import Foundation


enum PersistenceService {
    
    static let defaults = UserDefaults.standard
}


extension PersistenceService {
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    
    static func retrieveFavorites() async throws -> [Follower] {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            return []
        }
        
        do {
            
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            
            return favorites
            
        } catch {
            
            throw ServiceError.unableToFavorite
            
        }
    }
    
    static func saveFavorites(_ favorites: [Follower]) async throws {
        
        do {
            
            let encoder = JSONEncoder()
            let favoritesData = try encoder.encode(favorites)
            
            defaults.setValue(favoritesData, forKey: Keys.favorites)
            
        } catch {
            
            throw ServiceError.unableToSave
            
        }
    }
}


extension PersistenceService {
    
    enum ServiceError: String, Error {
        
        case noData             = "No data found in storage"
        case unableToFavorite   = "There was an error favoriting this user. Please try again."
        case unableToSave       = "Could not decode into the data and asave it in storage. Please try again"
    }
}
