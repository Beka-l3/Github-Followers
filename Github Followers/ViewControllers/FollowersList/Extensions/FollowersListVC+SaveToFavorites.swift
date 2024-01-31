//
//  FollowersListVC+SaveToFavorites.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 31.01.2024.
//

import Foundation


extension FollowersListVC {
    
    @objc func addToFavorites() {
        showLoadingView()
        
        Task {
            
            do {
                
                let userInfo = try await NetworkService.shared.getUser(for: username)
                let follower = Follower(login: username, avatarUrl: userInfo.avatarUrl)
                
                try await PersistenceService.updateWith(favorite: follower, action: .add)
                presentGFAlertOnMainThread(title: "Success!", message: "You have succesfully favorited this user 🎉", buttonTitle: "Hooray!")
                
            } catch {
                
                if let networkError = error as? NetworkService.ServiceError {
                    presentGFAlertOnMainThread(title: "Network error", message: networkError.rawValue, buttonTitle: "OK")
                    
                } else if let persistenceError = error as? PersistenceService.ServiceError {
                    presentGFAlertOnMainThread(title: "Storage error", message: persistenceError.rawValue, buttonTitle: "OK")
                    
                }  else {
                    presentGFAlertOnMainThread(title: "Somthing went wrong", message: error.localizedDescription, buttonTitle: "OK")
                }
            }
            
            dismissLoadingView()
        }
        
    }
}
