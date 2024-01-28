//
//  FollowersListVC+Search.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


extension FollowersListVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            noSearchValue()
            return
        }
        
        setIsSearching(true)
        setFilteredFollowers(followers.filter { $0.login.lowercased().contains(filter.lowercased()) })
        updateData(on: filteredFollowers)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        noSearchValue()
    }
    
    private func noSearchValue() {
        setIsSearching(false)
        updateData(on: followers)
    }
    
}
