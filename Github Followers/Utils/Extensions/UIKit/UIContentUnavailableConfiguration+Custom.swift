//
//  UIContentUnavailableConfiguration+Custom.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 15.02.2024.
//

import UIKit


extension UIContentUnavailableConfiguration {
    
    static var noFavorites: UIContentUnavailableConfiguration {
        var config = UIContentUnavailableConfiguration.empty()
        config.image = Images.System.star
        config.text = "No Favorites"
        config.secondaryText = "Add a favorite on the follower list screen"
        return config
    }
}
