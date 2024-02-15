//
//  FavoritesListVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 27.01.2024.
//

import UIKit

final class FavoritesListVC: GFDataLoadingVC {
    
    private let uiConfig = FavoritesListVCUIConfig()
    private(set) var favorites: [Follower] = []
    

//    MARK: lifecycle
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
    
    override func updateContentUnavailableConfiguration(using state: UIContentUnavailableConfigurationState) {
        contentUnavailableConfiguration = favorites.isEmpty ? UIContentUnavailableConfiguration.noFavorites : nil
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
        navigationController?.pushViewController(FollowersListVC(username: username), animated: true)
    }
    
    func showEmptyState() {
        showEmptyStateView(with: "No Favorites\nAdd one on the follower screen.", in: view)
    }
}


extension FavoritesListVC {
    
    func getFavoritesList() {
        showLoadingView()
        
        Task {
            do {
                favorites = try await PersistenceService.retrieveFavorites()
                setNeedsUpdateContentUnavailableConfiguration()
                
                uiConfig.tableView.reloadData()
                view.bringSubviewToFront(uiConfig.tableView)
                
            } catch let persistanceError as PersistenceService.ServiceError {
                
                presentGFAlert(title: "Storage error", message: persistanceError.rawValue, buttonTitle: "OK")
                
            } catch {
                    
                presentDefaultErrorAlert()
            }
            
            dismissLoadingView()
        }
    }
}

