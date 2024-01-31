//
//  FollowersListVC+UserInfoVCDelegate.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 31.01.2024.
//

import UIKit


extension FollowersListVC: UserInfoVCDelegate {
    
    func getFollowers(for username: String) {
        fetchFollowersForNewUsername(username)
    }
}
