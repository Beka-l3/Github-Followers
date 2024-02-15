//
//  FollowersListVC+CollectionView.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit

extension FollowersListVC: UICollectionViewDelegate {
    
    enum Section { case main }
    
    
    func updateData(on followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        applySnapshot(snapshot)
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard !isLoading, hasMoreFollowers else { return }
            fetchFollowers()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let follower = isSearching ? filteredFollowers[indexPath.item] : followers[indexPath.item]
        presentUserInfoVC(with: follower)
    }
    
    
    private func presentUserInfoVC(with follower: Follower) {
        let userInfoVC = UserInfoVC()
        userInfoVC.follower = follower
        userInfoVC.delegate = self
        
        let navController = UINavigationController(rootViewController: userInfoVC)
        present(navController, animated: true)
    }
}
