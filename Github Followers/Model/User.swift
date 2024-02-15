//
//  User.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import Foundation

struct User: Codable {
    let following:      Int
    let followers:      Int
    let publicRepos:    Int
    let publicGists:    Int
    
    let login:          String
    let avatarUrl:      String
    let htmlUrl:        String
    
    let createdAt:      Date
    
    let name:           String?
    let location:       String?
    let bio:            String?
}
