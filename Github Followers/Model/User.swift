//
//  User.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import Foundation


struct User: Codable {
    
    let login: String
    let avatarUrl: String
    
    let name: String?
    let location: String?
    let bio: String?
    
    let publicRepos: Int
    let publicGists: Int
    
    let following: Int
    let followers: Int
    
    let htmlUrl: String
    
    let createdAt: String
    
}
