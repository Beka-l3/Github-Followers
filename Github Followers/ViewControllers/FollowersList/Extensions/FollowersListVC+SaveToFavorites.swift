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
                presentGFAlert(title: "Success!", message: "You have succesfully favorited this user 🎉", buttonTitle: "Hooray!")
                
            } catch let networkError as NetworkService.ServiceError {
                
                presentGFAlert(title: "Network error", message: networkError.rawValue, buttonTitle: "OK")
                
            } catch let persistenceError as PersistenceService.ServiceError {
                
                presentGFAlert(title: "Storage error", message: persistenceError.rawValue, buttonTitle: "OK")
                
            } catch {
                
                presentDefaultErrorAlert()
            }
            
            dismissLoadingView()
        }
    }
}
