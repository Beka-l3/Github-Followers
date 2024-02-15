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
    
    enum ActionType {
        case add, remove
    }
    
    enum ServiceError: String, Error {
        case noData                 = "No data found in storage"
        case unableToFavorite       = "There was an error favoriting this user. Please try again."
        case unableToSave           = "Could not decode into the data and asave it in storage. Please try again"
        case alreadyInFavorites     = "You've already favorited this user. You must REALLY like them 🙃"
    }
}


extension PersistenceService {
    
    static func updateWith(favorite: Follower, action: ActionType) async throws {
        var favorites = try await retrieveFavorites()
        
        switch action {
            
        case .add:
            guard !favorites.contains(favorite) else { throw ServiceError.alreadyInFavorites }
            favorites.append(favorite)
 
        case .remove:
            favorites.removeAll { $0.login == favorite.login }
            
        }
        
        try await saveFavorites(favorites)
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
