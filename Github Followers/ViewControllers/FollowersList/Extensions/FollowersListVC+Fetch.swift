//
//  FollowersListVC+Fetch.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 31.01.2024.
//

import UIKit

extension FollowersListVC  {
    
    func fetchFollowers() {
        showLoadingView()
        
        Task {
            do {
                appendToFavorites(try await NetworkService.shared.getFollowers(for: username, page: page))
                
                if followers.isEmpty {
                    showEmptyStateView(with: "This user does not haveany followers. So, go follow them 🙃", in: view)
                    return
                }
                
                updateData(on: followers)
                setHasMoreFollowers(followers.count >= NetworkService.shared.perPage)
                incrementPage()
                
            } catch let networkError as NetworkService.ServiceError {
                
                presentGFAlert(title: "Got an error", message: networkError.rawValue, buttonTitle: "OK")
                
            } catch {
                
                presentDefaultErrorAlert()
            }
            
            dismissLoadingView()
        }
    }
    
    
    func fetchFollowersForNewUsername(_ username: String) {
        resetUsername(to: username)
        fetchFollowers()
    }
}
