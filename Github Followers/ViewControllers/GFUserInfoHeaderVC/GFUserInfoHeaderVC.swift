//
//  GFUserInfoHeaderVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 29.01.2024.
//

import UIKit


final class GFUserInfoHeaderVC: UIViewController {
    
    var user: User! {
        didSet {
            setData()
        }
    }
    
    var avatarUrl: String? {
        didSet {
            uiConfig.avatarImageView.imageUrl = avatarUrl
        }
    }
    
    private let uiConfig = GFUserInfoHeaderVCUIConfig()
    
    
    
    //    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}


extension GFUserInfoHeaderVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        uiConfig.configureAutoLayout()
    }
    
    private func setData() {
        uiConfig.usernameLabel.text     = user.login
        uiConfig.nameLabel.text         = user.name ?? ""
        uiConfig.locationLabel.text     = user.location ?? "No Location"
        uiConfig.bioLabel.text          = user.bio ?? ""
    }
        
}
