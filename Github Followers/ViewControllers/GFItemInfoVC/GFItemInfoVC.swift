//
//  GFItemInfoVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 30.01.2024.
//

import UIKit


final class GFItemInfoVC: UIViewController {
    
    enum InfoType {
        case projects(repos: Int, gists: Int)
        case people(following: Int, followers: Int)
        case none
    }
    
    private(set) var type: InfoType = .none
    private let uiConfig = GFItemInfoVCUIConfig()
    
    
//    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}


extension GFItemInfoVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        uiConfig.configureAutoLayout()
    }
}


extension GFItemInfoVC {
    
    func setType(_ type: InfoType) {
        self.type = type
        uiConfig.configureInfoType(type: type)
    }
}
