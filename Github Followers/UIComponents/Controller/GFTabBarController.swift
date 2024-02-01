//
//  GFTabBarController.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 01.02.2024.
//

import UIKit


final class GFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}


extension GFTabBarController {
    
    private func configure() {
        tabBar.tintColor = .systemGreen
        tabBar.backgroundColor = .secondarySystemBackground
        viewControllers = [createSearchNC(), createFavoritesNC()]
    }
    
    private func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return createNC(rootViewController: searchVC)
    }
    
    private func createFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesListVC()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return createNC(rootViewController: favoritesVC)
    }
    
    private func createNC(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.tintColor = .systemGreen
        return navigationController
    }
}
