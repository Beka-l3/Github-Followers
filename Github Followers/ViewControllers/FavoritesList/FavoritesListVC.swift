//
//  FavoritesListVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 27.01.2024.
//

import UIKit

class FavoritesListVC: UIViewController {
    
    
    private let uiConfig = FavoritesListVCUIConfig()
    private(set) var favorites: [Follower] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        getFavoritesList()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        uiConfig.configureFrames()
    }
}


extension FavoritesListVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        
        uiConfig.tableView.delegate = self
        uiConfig.tableView.dataSource = self
    }
    
    private func configureNavbar() {
        title = "Favorites"
    }
}


extension FavoritesListVC {
    
    func removeFavorite(at indexPath: IndexPath) {
        favorites.remove(at: indexPath.item)
    }
    
    func pushFollowersListVC(username: String) {
        let followersListVC = FollowersListVC()
        followersListVC.resetUsername(to: username)
        navigationController?.pushViewController(followersListVC, animated: true)
    }
}


extension FavoritesListVC {
    
    func getFavoritesList() {
        showLoadingView()
        
        Task {
            
            do {
                
                favorites = try await PersistenceService.retrieveFavorites()
                
                if favorites.isEmpty {
                    showEmptyStateView(with: "No Favorites\nAdd one on the follower screen.", in: view)
                    
                } else {
                    uiConfig.tableView.reloadData()
                    view.bringSubviewToFront(uiConfig.tableView)
                }
                
            } catch {
                
                if let persistanceError = error as? PersistenceService.ServiceError {
                    presentGFAlertOnMainThread(title: "Storage error", message: persistanceError.rawValue, buttonTitle: "OK")
                    
                } else {
                    presentGFAlertOnMainThread(title: "Somthing went wrong", message: error.localizedDescription, buttonTitle: "OK")
                }
            }
            
            dismissLoadingView()
        }
    }
}

