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
    
    static var noFollowers: UIContentUnavailableConfiguration {
        var config = UIContentUnavailableConfiguration.empty()
        config.image = Images.System.personSlash
        config.text = "No Followers"
        config.secondaryText = "This user has no followers. What a shame. So, go smash the follow button on their profile 🙃"
        return config
    }
    
    static var noFollowersInSearch: UIContentUnavailableConfiguration {
        var config = UIContentUnavailableConfiguration.empty()
        config.image = Images.System.personSlash
        config.text = "No Followers"
        config.secondaryText = "This user has no followers with name you are looking for"
        return config
    }
}
