//
//  FavoritesListVC+TableView.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 31.01.2024.
//

import UIKit


extension FavoritesListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseId, for: indexPath) as? FavoriteCell {
            cell.set(favorite: favorites[indexPath.item])
            return cell
        } else {
            return .init()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pushFollowersListVC(username: favorites[indexPath.item].login)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        removeFavorite(at: indexPath)
        tableView.deleteRows(at: [indexPath], with: .left)
        removeFavoriteFromStorage(favorites[indexPath.item])
    }
    
    private func removeFavoriteFromStorage(_ favorite: Follower) {
        Task {
            do {
                
                try await PersistenceService.updateWith(favorite: favorite, action: .remove)
                
            } catch {
                
                if let persistenceError = error as? PersistenceService.ServiceError {
                    presentGFAlertOnMainThread(title: "Storage error", message: persistenceError.rawValue, buttonTitle: "OK")
                    
                } else {
                    presentGFAlertOnMainThread(title: "Something went wrong", message: error.localizedDescription, buttonTitle: "OK")
                }
            }
        }
    }
}
